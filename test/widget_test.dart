// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prm393_project/main.dart';

void main() {
  testWidgets('opens Exercise 1 and displays all core widgets', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('Exercise 1 - Core Widgets Demo'));
    await tester.pumpAndSettle();

    expect(find.text('Exercise 1 - Core Widgets Demo'), findsOneWidget);
    expect(find.byType(Icon), findsWidgets);
    expect(find.byType(Image), findsOneWidget);
    expect(find.byIcon(Icons.play_arrow), findsOneWidget);
    expect(
      find.ancestor(
        of: find.byIcon(Icons.play_arrow),
        matching: find.byType(Stack),
      ),
      findsOneWidget,
    );
    expect(find.byType(Card), findsOneWidget);
    expect(find.byType(ListTile), findsOneWidget);
  });

  testWidgets('opens Exercise 2 and displays all input controls', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('Exercise 2 - Input Controls Demo'));
    await tester.pumpAndSettle();

    expect(find.text('Exercise 2 - Input Controls Demo'), findsOneWidget);
    expect(find.byType(Slider), findsOneWidget);
    expect(find.byType(Switch), findsOneWidget);
    expect(find.text('Current value: 50'), findsOneWidget);
    expect(find.text('Is movie active?'), findsOneWidget);
    expect(find.byType(RadioListTile<String>), findsNWidgets(2));
    expect(find.text('Selected genre: None'), findsOneWidget);
    expect(find.text('Open Date Picker'), findsOneWidget);
  });

  testWidgets('updates values when input controls change', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());
    await tester.tap(find.text('Exercise 2 - Input Controls Demo'));
    await tester.pumpAndSettle();

    await tester.tap(find.byType(Switch));
    await tester.pump();
    expect(tester.widget<Switch>(find.byType(Switch)).value, isTrue);

    await tester.tap(find.text('Comedy'));
    await tester.pump();
    expect(find.text('Selected genre: Comedy'), findsOneWidget);

    final Slider slider = tester.widget(find.byType(Slider));
    slider.onChanged!(75);
    await tester.pump();
    expect(find.text('Current value: 75'), findsOneWidget);
  });

  testWidgets('opens DatePicker when the button is tapped', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());
    await tester.tap(find.text('Exercise 2 - Input Controls Demo'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Open Date Picker'));
    await tester.pumpAndSettle();
    expect(find.byType(DatePickerDialog), findsOneWidget);

    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();
    expect(find.byType(DatePickerDialog), findsNothing);
  });

  testWidgets('opens Exercise 3 and displays the movie layout', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('Exercise 3 - Layout Demo'));
    await tester.pumpAndSettle();

    expect(find.text('Exercise 3 - Layout Demo'), findsOneWidget);
    expect(find.text('Now Playing'), findsOneWidget);
    expect(find.byType(ListView), findsOneWidget);
    expect(find.byType(Card), findsNWidgets(4));
    expect(find.byType(CircleAvatar), findsNWidgets(4));
    expect(find.text('Avatar'), findsOneWidget);
    expect(find.text('Inception'), findsOneWidget);
    expect(find.text('Interstellar'), findsOneWidget);
    expect(find.text('Joker'), findsOneWidget);
    expect(find.text('Sample description'), findsNWidgets(4));
  });

  testWidgets('opens Exercise 4 and changes the application theme', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('Exercise 4 - App Structure & Theme'));
    await tester.pumpAndSettle();

    expect(find.text('Exercise 4 - App Structure & Theme'), findsOneWidget);
    expect(
      find.text('This is a simple screen with theme toggle.'),
      findsOneWidget,
    );
    expect(find.text('Dark'), findsOneWidget);
    expect(find.byType(Switch), findsOneWidget);
    expect(find.byType(FloatingActionButton), findsOneWidget);

    await tester.tap(find.byType(Switch));
    await tester.pumpAndSettle();

    final MaterialApp darkApp = tester.widget(find.byType(MaterialApp));
    expect(darkApp.themeMode, ThemeMode.dark);
    expect(tester.widget<Switch>(find.byType(Switch)).value, isTrue);

    await tester.tap(find.byType(Switch));
    await tester.pumpAndSettle();

    final MaterialApp lightApp = tester.widget(find.byType(MaterialApp));
    expect(lightApp.themeMode, ThemeMode.light);
    expect(tester.widget<Switch>(find.byType(Switch)).value, isFalse);

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pump();

    expect(
      find.text('Theme changed with the app structure demo.'),
      findsOneWidget,
    );
  });

  testWidgets('Exercise 5 displays the corrected scrollable layout', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('Exercise 5 - Common UI Fixes'));
    await tester.pumpAndSettle();

    expect(
      find.text('Correct ListView inside Column using Expanded'),
      findsOneWidget,
    );
    expect(find.byType(SingleChildScrollView), findsOneWidget);
    expect(find.byType(ListView), findsOneWidget);
    expect(
      find.ancestor(of: find.byType(ListView), matching: find.byType(Expanded)),
      findsOneWidget,
    );
    expect(find.text('Movie A'), findsOneWidget);
    expect(find.text('Movie B'), findsOneWidget);
    expect(find.text('Movie C'), findsOneWidget);
    expect(find.text('Movie D'), findsOneWidget);
  });

  testWidgets('Exercise 5 updates state and selects a date', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('Exercise 5 - Common UI Fixes'));
    await tester.pumpAndSettle();

    expect(find.text('State value: 0'), findsOneWidget);
    await tester.tap(find.text('Update state'));
    await tester.pump();
    expect(find.text('State value: 1'), findsOneWidget);

    await tester.tap(find.text('Open Date Picker'));
    await tester.pumpAndSettle();
    expect(find.byType(DatePickerDialog), findsOneWidget);

    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();
    expect(find.text('Selected date: Not selected'), findsNothing);
    expect(find.textContaining('Selected date:'), findsOneWidget);
  });
}
