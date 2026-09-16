import 'package:flutter/material.dart';
import 'package:prm393_project/Widgets/productWidget.dart';

class Homepage extends StatelessWidget {
  const Homepage ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellowAccent,
          title: Center(child: const Text('Homepage')),
          leading: Icon(Icons.menu),
          actions: [
            TextButton(
                style: ButtonStyle(),
                onPressed: (){}, child: Text('Login'))
          ],
        ),
        // body: Center(
        //   child: RichText(
        //     text: TextSpan(
        //         text:'Hello',
        //         style: TextStyle(fontSize: 15, color: Colors.greenAccent),
        //         children: [
        //           TextSpan(
        //               text:'every',
        //               style: TextStyle(fontSize: 30, color: Colors.redAccent)),
        //           TextSpan(
        //               text:'one',
        //               style: TextStyle(fontSize: 15, color: Colors.greenAccent))
        //         ]
        //     ),
        //   ),
        // )
      body: Row(
        children: [
          productWidget(),
          productWidget(),
        ],
      )
    );
  }
}
