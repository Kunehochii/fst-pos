import 'dart:convert';

import 'package:drift/drift.dart';

import '../../../../core/database/app_database.dart';
import '../../../../core/utils/logger.dart';
import '../../../product/domain/entities/product.dart';
import '../../../sales/data/models/sale_model.dart';
import '../../../sales/domain/entities/payment_method.dart';
import '../../../sales/domain/entities/sale.dart';
import '../../../sales_check/domain/entities/sales_check_filter.dart';
import '../../domain/entities/grouped_profit.dart';
import '../../domain/entities/profit_filter.dart';
import '../../domain/entities/profit_summary.dart';

/// Local data source for profit using cached sales data.
///
/// Processes local sales from [CachedSales] table to provide
/// grouped profit data when offline.
class ProfitLocalDataSource {
  final AppDatabase _db;

  ProfitLocalDataSource(this._db);

  /// Get all cached sales for a cashier within filter criteria.
  Future<List<Sale>> getCachedSales(
    String cashierId,
    ProfitFilter filter,
  ) async {
    AppLogger.debug('Fetching cached sales for profit', {
      'cashierId': cashierId,
      'filter': filter.toQueryParams(),
    });

    var query = _db.select(_db.cachedSales)
      ..where((t) => t.cashierId.equals(cashierId))
      ..where((t) => t.isVoid.equals(false))
      ..orderBy([(t) => OrderingTerm.desc(t.createdAt)]);

    // Apply date filters
    if (filter.startDate != null) {
      query = query
        ..where((t) => t.createdAt.isBiggerOrEqualValue(filter.startDate!));
    }
    if (filter.endDate != null) {
      query = query
        ..where((t) => t.createdAt.isSmallerOrEqualValue(filter.endDate!));
    }

    final rows = await query.get();

    final sales = rows.map((row) {
      final json = jsonDecode(row.data) as Map<String, dynamic>;
      return SaleModel.fromJson(json).toEntity(
        isSynced: row.isSynced,
        localId: row.localId,
      );
    }).toList();

    AppLogger.debug('Found ${sales.length} cached sales');
    return sales;
  }

  /// Process local sales into grouped profit format based on filter criteria.
  ///
  /// This method replicates the backend grouping logic for offline use.
  Future<List<GroupedProfit>> getGroupedProfits(
    String cashierId,
    ProfitFilter filter,
  ) async {
    final sales = await getCachedSales(cashierId, filter);

    // Flatten sale items and apply filters
    final filteredItems = <_LocalProfitItem>[];

    for (final sale in sales) {
      for (final item in sale.saleItems) {
        if (_shouldIncludeItem(item, filter)) {
          filteredItems.add(_LocalProfitItem(
            saleItem: item,
            paymentMethod: sale.paymentMethod,
            saleDate: sale.createdAt,
          ));
        }
      }
    }

    // Group by product name and price type
    final groupedMap = <String, _ProfitGroupBuilder>{};

    for (final item in filteredItems) {
      final productName = item.saleItem.product?.name ?? 'Unknown Product';
      final priceType = _getPriceTypeDisplay(item.saleItem);
      final groupKey = '$productName $priceType';

      groupedMap.putIfAbsent(
        groupKey,
        () => _ProfitGroupBuilder(
          productName: productName,
          priceType: priceType,
        ),
      );

      groupedMap[groupKey]!.addItem(item);
    }

    return groupedMap.values.map((builder) => builder.build()).toList();
  }

  /// Calculate total profit summary from local data.
  Future<ProfitSummary> getTotalProfit(
    String cashierId,
    ProfitFilter filter,
  ) async {
    final sales = await getCachedSales(cashierId, filter);

    double totalQuantity = 0;
    double totalProfit = 0;
    double cashTotal = 0;
    double checkTotal = 0;
    double bankTransferTotal = 0;
    int transactionCount = 0;

    for (final sale in sales) {
      for (final item in sale.saleItems) {
        if (_shouldIncludeItem(item, filter)) {
          totalQuantity += item.quantity;

          // Calculate profit for this item
          final profit = _calculateItemProfit(item);
          totalProfit += profit;
          transactionCount++;

          switch (sale.paymentMethod) {
            case PaymentMethod.cash:
              cashTotal += profit;
            case PaymentMethod.check:
              checkTotal += profit;
            case PaymentMethod.bankTransfer:
              bankTransferTotal += profit;
          }
        }
      }
    }

    return ProfitSummary(
      totalQuantity: totalQuantity,
      totalProfit: totalProfit,
      paymentTotals: ProfitPaymentTotals(
        cash: cashTotal,
        check: checkTotal,
        bankTransfer: bankTransferTotal,
      ),
      transactionCount: transactionCount,
      startDate: filter.startDate,
      endDate: filter.endDate,
    );
  }

  /// Calculate profit for a sale item.
  ///
  /// Profit is stored in sackPrice.profit or perKiloPrice.profit.
  /// For special price items, use specialPrice.profit.
  double _calculateItemProfit(SaleItem item) {
    double profitPerUnit = 0;

    if (item.sackPriceId != null) {
      // Sack price - check if special price
      if (item.isSpecialPrice && item.sackPrice?.specialPrice?.profit != null) {
        profitPerUnit = item.sackPrice!.specialPrice!.profit!;
      } else if (item.sackPrice?.profit != null) {
        profitPerUnit = item.sackPrice!.profit!;
      }
    } else if (item.perKiloPriceId != null) {
      // Per kilo price
      if (item.perKiloPrice?.profit != null) {
        profitPerUnit = item.perKiloPrice!.profit!;
      }
    }

    return profitPerUnit * item.quantity;
  }

  /// Check if a sale item should be included based on filters.
  bool _shouldIncludeItem(SaleItem item, ProfitFilter filter) {
    // Filter by product ID
    if (filter.productId != null && item.productId != filter.productId) {
      return false;
    }

    // Filter by product search (name)
    if (filter.productSearch != null && filter.productSearch!.isNotEmpty) {
      final searchLower = filter.productSearch!.toLowerCase();
      final productName = item.product?.name.toLowerCase() ?? '';
      if (!productName.contains(searchLower)) {
        return false;
      }
    }

    // Filter by category
    if (filter.category != null) {
      final itemCategory = item.product?.category ?? ProductCategory.normal;
      if (itemCategory != filter.category) {
        return false;
      }
    }

    // Filter by price type
    if (filter.priceType != null) {
      final isKilo = item.perKiloPriceId != null;
      if (filter.priceType == PriceTypeFilter.kilo && !isKilo) {
        return false;
      }
      if (filter.priceType == PriceTypeFilter.sack && isKilo) {
        return false;
      }
    }

    // Filter by sack type
    if (filter.sackType != null) {
      if (item.sackType != filter.sackType) {
        return false;
      }
    }

    return true;
  }

  /// Get display string for price type.
  String _getPriceTypeDisplay(SaleItem item) {
    if (item.perKiloPriceId != null) {
      return item.isGantang ? 'Per Kilo (Gantang)' : 'Per Kilo';
    }
    if (item.sackType != null) {
      return item.sackType!.displayName;
    }
    return '';
  }
}

/// Helper class for building grouped profit items locally.
class _LocalProfitItem {
  final SaleItem saleItem;
  final PaymentMethod paymentMethod;
  final DateTime saleDate;

  _LocalProfitItem({
    required this.saleItem,
    required this.paymentMethod,
    required this.saleDate,
  });
}

/// Builder for accumulating grouped profit data.
class _ProfitGroupBuilder {
  final String productName;
  final String priceType;
  double totalQuantity = 0;
  double totalProfit = 0;
  int orderCount = 0;
  double _profitPerUnit = 0;

  _ProfitGroupBuilder({
    required this.productName,
    required this.priceType,
  });

  void addItem(_LocalProfitItem localItem) {
    final item = localItem.saleItem;
    double profitPerUnit = 0;

    // Calculate profit per unit
    if (item.sackPriceId != null) {
      if (item.isSpecialPrice && item.sackPrice?.specialPrice?.profit != null) {
        profitPerUnit = item.sackPrice!.specialPrice!.profit!;
      } else if (item.sackPrice?.profit != null) {
        profitPerUnit = item.sackPrice!.profit!;
      }
    } else if (item.perKiloPriceId != null) {
      if (item.perKiloPrice?.profit != null) {
        profitPerUnit = item.perKiloPrice!.profit!;
      }
    }

    final itemProfit = profitPerUnit * item.quantity;

    totalQuantity += item.quantity;
    totalProfit += itemProfit;
    orderCount++;

    // Track profit per unit (use last one as representative)
    if (profitPerUnit > 0) {
      _profitPerUnit = profitPerUnit;
    }
  }

  GroupedProfit build() => GroupedProfit(
        productName: productName,
        priceType: priceType,
        profitPerUnit: _profitPerUnit,
        totalQuantity: totalQuantity,
        totalProfit: totalProfit,
        orderCount: orderCount,
      );
}
