import 'package:flutter/material.dart';
import 'package:prm393_project/Widgets/productHome/productColors.dart';

class ProductBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int>? onTap;

  const ProductBottomNav({this.currentIndex = 0, this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      backgroundColor: ProductColors.card,
      selectedItemColor: ProductColors.primary,
      unselectedItemColor: ProductColors.textPrimary,
      selectedFontSize: 12,
      unselectedFontSize: 12,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
          icon: Icon(Icons.article_outlined),
          label: 'Product Detail',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
      ],
    );
  }
}
