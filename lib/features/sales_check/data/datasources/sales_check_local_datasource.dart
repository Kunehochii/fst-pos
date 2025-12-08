import 'dart:convert';

import 'package:drift/drift.dart';

import '../../../../core/database/app_database.dart';
import '../../../../core/utils/logger.dart';
import '../../../product/domain/entities/product.dart';
import '../../../sales/data/models/sale_model.dart';
import '../../../sales/domain/entities/payment_method.dart';
import '../../../sales/domain/entities/sale.dart';
import '../../domain/entities/grouped_sale.dart';
import '../../domain/entities/sales_check_filter.dart';
import '../../domain/entities/sales_summary.dart';

/// Local data source for sales check using cached sales data.
///
/// Processes local sales from [CachedSales] table to provide
/// grouped sales data when offline.
class SalesCheckLocalDataSource {
  final AppDatabase _db;

  SalesCheckLocalDataSource(this._db);

  /// Get all cached sales for a cashier within filter criteria.
  Future<List<Sale>> getCachedSales(
    String cashierId,
    SalesCheckFilter filter,
  ) async {
    AppLogger.debug('Fetching cached sales for sales check', {
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

  /// Process local sales into grouped format based on filter criteria.
  ///
  /// This method replicates the backend grouping logic for offline use.
  Future<List<GroupedSale>> getGroupedSales(
    String cashierId,
    SalesCheckFilter filter,
  ) async {
    final sales = await getCachedSales(cashierId, filter);

    // Flatten sale items and apply filters
    final filteredItems = <_LocalSaleItem>[];

    for (final sale in sales) {
      for (final item in sale.saleItems) {
        if (_shouldIncludeItem(item, filter)) {
          filteredItems.add(_LocalSaleItem(
            saleItem: item,
            paymentMethod: sale.paymentMethod,
            saleDate: sale.createdAt,
          ));
        }
      }
    }

    // Group by product name and price type
    final groupedMap = <String, _GroupBuilder>{};

    for (final item in filteredItems) {
      final productName = item.saleItem.product?.name ?? 'Unknown Product';
      final priceType = _getPriceTypeDisplay(item.saleItem);
      final groupKey = '$productName $priceType';

      groupedMap.putIfAbsent(
        groupKey,
        () => _GroupBuilder(productName: groupKey),
      );

      groupedMap[groupKey]!.addItem(item);
    }

    return groupedMap.values.map((builder) => builder.build()).toList();
  }

  /// Calculate total sales summary from local data.
  Future<SalesSummary> getTotalSales(
    String cashierId,
    SalesCheckFilter filter,
  ) async {
    final sales = await getCachedSales(cashierId, filter);

    double totalQuantity = 0;
    double totalAmount = 0;
    double cashTotal = 0;
    double checkTotal = 0;
    double bankTransferTotal = 0;
    int transactionCount = 0;

    for (final sale in sales) {
      for (final item in sale.saleItems) {
        if (_shouldIncludeItem(item, filter)) {
          totalQuantity += item.quantity;
          totalAmount += item.totalPrice;
          transactionCount++;

          switch (sale.paymentMethod) {
            case PaymentMethod.cash:
              cashTotal += item.totalPrice;
            case PaymentMethod.check:
              checkTotal += item.totalPrice;
            case PaymentMethod.bankTransfer:
              bankTransferTotal += item.totalPrice;
          }
        }
      }
    }

    return SalesSummary(
      totalQuantity: totalQuantity,
      totalAmount: totalAmount,
      paymentTotals: PaymentTotals(
        cash: cashTotal,
        check: checkTotal,
        bankTransfer: bankTransferTotal,
      ),
      transactionCount: transactionCount,
      startDate: filter.startDate,
      endDate: filter.endDate,
    );
  }

  /// Check if a sale item should be included based on filters.
  bool _shouldIncludeItem(SaleItem item, SalesCheckFilter filter) {
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

    // Filter by discounted
    if (filter.isDiscounted != null) {
      if (item.isDiscounted != filter.isDiscounted) {
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

/// Helper class for building grouped sale items locally.
class _LocalSaleItem {
  final SaleItem saleItem;
  final PaymentMethod paymentMethod;
  final DateTime saleDate;

  _LocalSaleItem({
    required this.saleItem,
    required this.paymentMethod,
    required this.saleDate,
  });
}

/// Builder for accumulating grouped sale data.
class _GroupBuilder {
  final String productName;
  final List<GroupedSaleItem> items = [];
  double totalQuantity = 0;
  double totalAmount = 0;
  double cashTotal = 0;
  double checkTotal = 0;
  double bankTransferTotal = 0;

  _GroupBuilder({required this.productName});

  void addItem(_LocalSaleItem localItem) {
    final item = localItem.saleItem;
    final itemTotal = item.totalPrice;

    items.add(GroupedSaleItem(
      quantity: item.quantity,
      unitPrice: item.price,
      totalAmount: itemTotal,
      paymentMethod: localItem.paymentMethod,
      isSpecialPrice: item.isSpecialPrice,
      isDiscounted: item.isDiscounted,
      discountedPrice: item.discountedPrice,
      saleDate: localItem.saleDate,
      formattedSale: _formatSaleString(item, localItem.paymentMethod),
    ));

    totalQuantity += item.quantity;
    totalAmount += itemTotal;

    switch (localItem.paymentMethod) {
      case PaymentMethod.cash:
        cashTotal += itemTotal;
      case PaymentMethod.check:
        checkTotal += itemTotal;
      case PaymentMethod.bankTransfer:
        bankTransferTotal += itemTotal;
    }
  }

  GroupedSale build() => GroupedSale(
        productName: productName,
        items: items,
        totalQuantity: totalQuantity,
        totalAmount: totalAmount,
        paymentTotals: PaymentTotals(
          cash: cashTotal,
          check: checkTotal,
          bankTransfer: bankTransferTotal,
        ),
      );

  String _formatSaleString(SaleItem item, PaymentMethod method) {
    final parts = <String>[];

    // Quantity
    if (item.perKiloPriceId != null) {
      parts.add('${item.quantity.toStringAsFixed(2)} kg');
    } else {
      parts.add('${item.quantity.toInt()} sack${item.quantity > 1 ? 's' : ''}');
    }

    // Amount
    parts.add('₱${item.totalPrice.toStringAsFixed(2)}');

    // Payment method
    parts.add('(${method.displayName})');

    // Special indicators
    if (item.isSpecialPrice) {
      parts.add('[SP]');
    }
    if (item.isDiscounted) {
      parts.add('[D]');
    }

    return parts.join(' ');
  }
}
