import 'package:flutter/material.dart';
import 'package:prm393_project/Widgets/productHome/productColors.dart';

class ProductPriceRow extends StatelessWidget {
  final double price;
  final int? discountPercent;

  const ProductPriceRow({required this.price, this.discountPercent, super.key});

  @override
  Widget build(BuildContext context) {
    final hasDiscount = (discountPercent ?? 0) > 0;
    final salePrice =
        hasDiscount ? price * (100 - discountPercent!) / 100 : price;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (hasDiscount) ...[
          Text(
            '\$${price.toStringAsFixed(0)}',
            style: const TextStyle(
              color: ProductColors.oldPrice,
              fontSize: 13,
              decoration: TextDecoration.lineThrough,
            ),
          ),
          const SizedBox(width: 6),
        ],
        Text(
          '\$${salePrice.toStringAsFixed(0)}',
          style: const TextStyle(
            color: ProductColors.salePrice,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
