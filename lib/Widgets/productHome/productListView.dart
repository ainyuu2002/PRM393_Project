import 'package:flutter/material.dart';
import 'package:prm393_project/Widgets/productHome/productCard.dart';
import 'package:prm393_project/Widgets/productHome/productSearchBar.dart';
import 'package:prm393_project/models/product.dart';

class ProductListView extends StatelessWidget {
  final List<Product> products;
  final ValueChanged<Product>? onProductTap;

  const ProductListView({required this.products, this.onProductTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
      child: Column(
        children: [
          const ProductSearchBar(),
          const SizedBox(height: 12),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.only(bottom: 12),
              itemCount: products.length,
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemBuilder: (context, index) => ProductCard(
                product: products[index],
                onTap: () => onProductTap?.call(products[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
