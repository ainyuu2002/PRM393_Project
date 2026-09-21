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
}
