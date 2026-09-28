import 'package:flutter/material.dart';
import 'package:prm393_project/Widgets/productHome/discountBadge.dart';
import 'package:prm393_project/Widgets/productHome/productColors.dart';
import 'package:prm393_project/Widgets/productHome/productEmptyView.dart';
import 'package:prm393_project/Widgets/productHome/productPriceRow.dart';
import 'package:prm393_project/models/product.dart';

class ProductDetailView extends StatelessWidget {
  final Product? product;

  const ProductDetailView({this.product, super.key});

  @override
  Widget build(BuildContext context) {
    final p = product;
    if (p == null) {
      return const ProductEmptyView(
        icon: Icons.search_off,
        message: 'No product found',
      );
    }

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 260,
            color: ProductColors.card,
            child: (p.image == null || p.image!.isEmpty)
                ? const Icon(Icons.image_outlined,
                    size: 72, color: ProductColors.oldPrice)
                : Image.asset(p.image!, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  p.name,
                  style: const TextStyle(
                    color: ProductColors.textPrimary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    ProductPriceRow(
                      price: p.price,
                      discountPercent: p.discountPercent,
                    ),
                    const SizedBox(width: 8),
                    if ((p.discountPercent ?? 0) > 0)
                      DiscountBadge(percent: p.discountPercent!),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  p.description ?? '',
                  style: const TextStyle(
                    color: ProductColors.textPrimary,
                    fontSize: 14,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 46,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.shopping_cart),
                    label: const Text(
                      'Add to Cart',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ProductColors.primary,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
