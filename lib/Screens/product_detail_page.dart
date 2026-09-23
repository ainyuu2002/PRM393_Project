import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prm393_project/Widgets/productWidget.dart';
import 'package:prm393_project/models/product.dart';

class productDetailPage extends StatelessWidget {
  Product product;
  productDetailPage({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(onPressed: (){
          Navigator.pop(context);
        },
            icon: Icon(Icons.home))
      ],),
      body: productWidget(product: product)
    );
  }
}
