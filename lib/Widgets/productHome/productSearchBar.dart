import 'package:flutter/material.dart';
import 'package:prm393_project/Widgets/productHome/productColors.dart';

class ProductSearchBar extends StatelessWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  const ProductSearchBar({this.controller, this.onChanged, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ProductColors.card,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: ProductColors.border),
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        decoration: const InputDecoration(
          hintText: 'Search products...',
          hintStyle: TextStyle(color: ProductColors.oldPrice, fontSize: 14),
          prefixIcon: Icon(Icons.search, color: ProductColors.oldPrice),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 12),
        ),
      ),
    );
  }
}
