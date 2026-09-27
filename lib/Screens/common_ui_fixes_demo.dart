import 'package:flutter/material.dart';
import 'package:prm393_project/Widgets/common_ui_fixes_content.dart';

class CommonUiFixesDemo extends StatelessWidget {
  const CommonUiFixesDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exercise 5 - Common UI Fixes')),
      body: const CommonUiFixesContent(),
    );
  }
}
