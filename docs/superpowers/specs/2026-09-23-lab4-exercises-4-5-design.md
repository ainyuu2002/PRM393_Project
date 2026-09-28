# Lab 4 Exercises 4–5 Design

## Scope

Complete Exercise 4 (Scaffold, AppBar, FAB, and application theme) and
Exercise 5 (four common Flutter UI fixes), then expose both screens from the
existing Homepage.

## Exercise 4

`MyApp` becomes stateful and owns the application's dark-mode boolean. Its
`MaterialApp` defines a light theme, a dark theme, and selects `ThemeMode.dark`
or `ThemeMode.light` from that boolean.

`Homepage` receives the current theme value and a `ValueChanged<bool>` callback,
then forwards them when opening `AppStructureDemo`. The Exercise 4 AppBar
contains a `Dark` label and Switch. Changing the Switch invokes the callback so
the complete application rebuilds under the selected theme.

`AppStructureDemo` contains:

- An AppBar with the theme Switch.
- A centered body message matching the lab reference.
- A FloatingActionButton that shows a SnackBar, proving that the FAB is wired.

The screen remains a thin Screen widget; reusable body content is placed under
`lib/Widgets/`.

## Exercise 5

`CommonUiFixesDemo` is the Screen wrapper and `CommonUiFixesContent` owns the
interactive demo state.

The content uses an outer `SingleChildScrollView` so all sections remain
reachable on small screens. It demonstrates:

1. A bounded `Column` whose movie `ListView` is wrapped in `Expanded`.
2. Overflow prevention through the outer `SingleChildScrollView`.
3. A counter whose button updates the visible value through `setState()`.
4. A DatePicker opened from the State's valid `BuildContext`, with the chosen
   date displayed afterward.

The movie list contains Movie A, Movie B, Movie C, and Movie D and follows the
reference image.

## Navigation

Homepage adds buttons named:

- `Exercise 4 - App Structure & Theme`
- `Exercise 5 - Common UI Fixes`

The current Exercise 1–3 navigation remains unchanged.

## Files

- Modify `lib/main.dart`
- Modify `lib/Screens/homepage.dart`
- Add `lib/Screens/app_structure_demo.dart`
- Add `lib/Screens/common_ui_fixes_demo.dart`
- Add `lib/Widgets/app_structure_content.dart`
- Add `lib/Widgets/common_ui_fixes_content.dart`
- Modify `test/widget_test.dart`

## Verification

Widget tests will cover navigation, global theme changes, FAB feedback, the
four-item movie list, state updates, and DatePicker behavior. Final verification
will run formatting, the full Flutter test suite, and static analysis. Existing
analyzer findings outside the changed files will be reported separately.
