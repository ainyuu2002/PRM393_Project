import 'package:flutter/material.dart';
import 'package:prm393_project/Screens/app_structure_demo.dart';
import 'package:prm393_project/Screens/common_ui_fixes_demo.dart';
import 'package:prm393_project/Screens/core_widgets_demo.dart';
import 'package:prm393_project/Screens/input_controls_demo.dart';
import 'package:prm393_project/Screens/layout_demo.dart';

class Homepage extends StatelessWidget {
  const Homepage({
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
        title: const Center(child: Text('Homepage')),
        leading: const Icon(Icons.menu),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CoreWidgetsDemo(),
                  ),
                );
              },
              child: const Text('Exercise 1 - Core Widgets Demo'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const InputControlsDemo(),
                  ),
                );
              },
              child: const Text('Exercise 2 - Input Controls Demo'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LayoutDemo()),
                );
              },
              child: const Text('Exercise 3 - Layout Demo'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AppStructureDemo(
                      isDarkMode: isDarkMode,
                      onThemeChanged: onThemeChanged,
                    ),
                  ),
                );
              },
              child: const Text('Exercise 4 - App Structure & Theme'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CommonUiFixesDemo(),
                  ),
                );
              },
              child: const Text('Exercise 5 - Common UI Fixes'),
            ),
          ],
        ),
      ),
    );
  }
}
