import 'package:flutter/material.dart';

class productWidget extends StatelessWidget {
  const productWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
        width: 300,
        height: 600,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 8,
              child: Center(
                child: Container(
                  width: 200,
                  height: 200,
                  child: Image.asset(
                      fit:BoxFit.fill,
                      'assets/images/images.jpg'
                  ),
                ),
              ),
            ),
            Expanded(flex: 1, child: Text('Name: Chikawa')),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(flex: 3, child: Text('Price: ')),
                  Flexible(flex: 1, child: Text('30\$ ', style: TextStyle(decoration: TextDecoration.lineThrough))),
                  Flexible(flex: 1, child: Text('20\$'))
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                  textAlign: TextAlign.justify,
                  'Chikawa is Chiwawa, sdfsdkfdkshfkdshfjksdfhsdjkfhsdkjfhsdkfjhsdkjfhsdjkfhsdjkfhdskjfhdskjf'
                      'dsfkdskfjdshjfkdsjfkdsjfkdslfjsdlkfjsldfjlsdfj'
                      'dfksdfffffffffffffffffffffsdfse sdfsdfsdf'
                      'ds dfjsflsejfesilfjsldfkd sdfsdfs'),
            )
          ],
        ),
            ),
      )
    );
  }
}
