import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class likeStarButton extends StatefulWidget {
  const likeStarButton({super.key});

  @override
  State<likeStarButton> createState() => _likeStarButtonState();
}

class _likeStarButtonState extends State<likeStarButton> {
  bool color = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: (){
       setState(() {
         color=!color;
       });
    }, icon: Icon(Icons.star),
    color: color?Colors.yellow:Colors.grey);
  }
}
