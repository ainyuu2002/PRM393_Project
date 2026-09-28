import 'package:flutter/material.dart';
import 'package:prm393_project/Widgets/productHome/productColors.dart';

class ProductEmptyView extends StatelessWidget {
  final IconData icon;
  final String message;

  const ProductEmptyView({required this.icon, required this.message, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 72, color: ProductColors.oldPrice),
          const SizedBox(height: 12),
          Text(
            message,
            style: const TextStyle(
              color: ProductColors.oldPrice,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
