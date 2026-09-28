import 'package:flutter/material.dart';
import 'package:prm393_project/Widgets/productHome/productBottomNav.dart';
import 'package:prm393_project/Widgets/productHome/productColors.dart';
import 'package:prm393_project/Widgets/productHome/productDetailView.dart';
import 'package:prm393_project/Widgets/productHome/productEmptyView.dart';
import 'package:prm393_project/Widgets/productHome/productListView.dart';
import 'package:prm393_project/models/product.dart';

class productHomepage extends StatefulWidget {
  const productHomepage({super.key});

  @override
  State<productHomepage> createState() => _productHomepageState();
}

class _productHomepageState extends State<productHomepage> {
  int _currentTab = 0;
  Product? _selectedProduct;

  final List<Product> _products = [
    Product(
      id: '1',
      name: 'iPhone 15',
      image: 'assets/images/iphone15.jpg',
      price: 1099,
      discountPercent: 9,
      description:
          'Experience the latest technology with the new iPhone 15. Stunning design, powerful performance.',
    ),
    Product(
      id: '2',
      name: 'Samsung S24',
      image: 'assets/images/samsung_s24.jpg',
      price: 999,
      discountPercent: 10,
      description: 'Galaxy AI is here. Brilliant display, pro-grade camera.',
    ),
    Product(
      id: '3',
      name: 'MacBook Air',
      image: 'assets/images/macbook_air.jpg',
      price: 1299,
      discountPercent: 7,
      description: 'Strikingly thin and fast with the M2 chip.',
    ),
  ];

  final List<String> _titles = ['Products', 'Product Detail', 'Cart'];

  void _onTabTapped(int index) {
    setState(() {
      _currentTab = index;
      if (index == 1) _selectedProduct = null;
    });
  }

  void _onProductTapped(Product product) {
    setState(() {
      _selectedProduct = product;
      _currentTab = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      ProductListView(products: _products, onProductTap: _onProductTapped),
      ProductDetailView(product: _selectedProduct),
      const ProductEmptyView(
        icon: Icons.shopping_cart_outlined,
        message: 'Your cart is empty',
      ),
    ];

    return Scaffold(
      backgroundColor: ProductColors.background,
      appBar: AppBar(
        title: Text(
          _titles[_currentTab],
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: ProductColors.primary,
        foregroundColor: Colors.white,
        leading: _currentTab == 0
            ? null
            : IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => _onTabTapped(0),
              ),
      ),
      body: pages[_currentTab],
      bottomNavigationBar: ProductBottomNav(
        currentIndex: _currentTab,
        onTap: _onTabTapped,
      ),
    );
  }
}
