import 'package:flutter/material.dart';
import 'package:prm393_project/models/product.dart';

class productWidget extends StatelessWidget {
  final Product product;
  const productWidget({required this.product,super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(border: Border.all(style: BorderStyle.solid, color: Colors.redAccent),
              color: Colors.greenAccent),
        width: 300,
        height: 600,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                width: 300,
                child: Stack(
                  children: [
                      Container( //Anh san pham
                        width: 200,
                        height: 200,
                        child: Image.asset(
                            fit:BoxFit.fill,
                            '${product.image}'
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: IconButton(onPressed: (){},
                          hoverColor: Colors.amber,
                          icon: Icon(Icons.add_shopping_cart),
                          color: Colors.white,
                          style: ButtonStyle(backgroundColor: WidgetStateProperty.all(Colors.blueAccent)),),
                      ),
                    Container(child: Column(
                      children: [
                        Text("Name: ${product.name}"),
                        Text("Price: ${product.price}"),
                        Text("Description: ${product.description??""}")
                      ],
                    ),)
                    ],
                ),
              ),
            )
          ],
        ),
            ),
      )
    );
  }
}
