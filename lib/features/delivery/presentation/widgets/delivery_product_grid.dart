import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../product/domain/entities/product.dart';
import '../providers/delivery_provider.dart';

/// Grid of products for delivery selection.
///
/// Uses "Aura Daybreak" design with white cards, subtle borders,
/// and soft shadows for a clean, modern appearance.
class DeliveryProductGrid extends ConsumerWidget {
  final List<Product> products;
  final Function(Product) onProductTap;

  const DeliveryProductGrid({
    super.key,
    required this.products,
    required this.onProductTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GridView.builder(
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 0.75,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return DeliveryProductCard(
          product: product,
          onTap: () => onProductTap(product),
        );
      },
    );
  }
}

/// Individual product card in the grid for delivery.
///
/// "Aura Daybreak" style:
/// - White tile with rounded corners
/// - Subtle border and soft shadow
/// - Primary border ring when selected (in cart)
class DeliveryProductCard extends ConsumerWidget {
  final Product product;
  final VoidCallback onTap;

  const DeliveryProductCard({
    super.key,
    required this.product,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartState = ref.watch(deliveryCartNotifierProvider);

    // Check if product is in cart
    final cartItemsForProduct =
        cartState.items.where((item) => item.product.id == product.id).toList();
    final isInCart = cartItemsForProduct.isNotEmpty;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(AppColors.radiusLg),
        border: Border.all(
          color: isInCart ? AppColors.primary : AppColors.border,
          width: isInCart ? 2 : 1,
        ),
        // Soft diffused shadow
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 6,
            offset: const Offset(0, 4),
            spreadRadius: -1,
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppColors.radiusLg),
          hoverColor: AppColors.accent,
          splashColor: AppColors.accent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Product image
              Expanded(
                flex: 3,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(
                      product.picture,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        color: AppColors.muted,
                        child: Icon(
                          Icons.rice_bowl,
                          size: 48,
                          color: AppColors.mutedForeground,
                        ),
                      ),
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Container(
                          color: AppColors.muted,
                          child: Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: AppColors.primary,
                            ),
                          ),
                        );
                      },
                    ),
                    // Cart indicator badge
                    if (isInCart)
                      Positioned(
                        top: 8,
                        right: 8,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius:
                                BorderRadius.circular(AppColors.radiusSm),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.primary.withValues(alpha: 0.3),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Text(
                            '${cartItemsForProduct.length}',
                            style: const TextStyle(
                              color: AppColors.primaryForeground,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    // Delivery indicator
                    Positioned(
                      top: 8,
                      left: 8,
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: AppColors.card.withValues(alpha: 0.9),
                          borderRadius:
                              BorderRadius.circular(AppColors.radiusSm),
                        ),
                        child: Icon(
                          Icons.local_shipping,
                          size: 16,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Product info
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Product name
                      Text(
                        product.name,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppColors.foreground,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      // Price info
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (product.perKiloPrice != null)
                            Text(
                              '₱${product.perKiloPrice!.price.toStringAsFixed(0)}/kg',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primary,
                              ),
                            ),
                          if (product.sackPrices.isNotEmpty)
                            Text(
                              product.sackPrices.length == 1
                                  ? '₱${product.sackPrices.first.price.toStringAsFixed(0)}/${product.sackPrices.first.type.displayName}'
                                  : '${product.sackPrices.length} sack types',
                              style: TextStyle(
                                fontSize: 11,
                                color: AppColors.mutedForeground,
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
