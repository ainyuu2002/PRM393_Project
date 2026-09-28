import 'package:flutter/material.dart';
import 'package:prm393_project/Widgets/productHome/productColors.dart';

class DiscountBadge extends StatelessWidget {
  final int percent;

  const DiscountBadge({required this.percent, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: ProductColors.salePrice,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        '-$percent%',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 11,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
