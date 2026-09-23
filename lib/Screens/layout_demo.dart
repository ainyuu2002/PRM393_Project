import 'package:flutter/material.dart';
import 'package:prm393_project/Widgets/layout_demo_content.dart';

class LayoutDemo extends StatelessWidget {
  const LayoutDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellowAccent,
        title: const Text('Exercise 3 - Layout Demo'),
      ),
      body: const LayoutDemoContent(),
    );
  }
}
