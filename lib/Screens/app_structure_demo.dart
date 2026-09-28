import 'package:flutter/material.dart';
import 'package:prm393_project/Widgets/app_structure_content.dart';

class AppStructureDemo extends StatelessWidget {
  const AppStructureDemo({
    super.key,
    required this.isDarkMode,
    required this.onThemeChanged,
  });

  final bool isDarkMode;
  final ValueChanged<bool> onThemeChanged;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 4 - App Structure & Theme'),
        actions: [
          const Text('Dark'),
          Switch(
            value: Theme.of(context).brightness == Brightness.dark,
            onChanged: onThemeChanged,
          ),
        ],
      ),
      body: const AppStructureContent(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Theme changed with the app structure demo.'),
            ),
          );
        },
        child: const Icon(Icons.palette),
      ),
    );
  }
}
