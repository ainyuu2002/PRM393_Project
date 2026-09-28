# Lab 4 Exercises 4–5 Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Add runnable Exercise 4 and Exercise 5 demos, including global light/dark theming and demonstrations of all four common Flutter UI fixes.

**Architecture:** `MyApp` owns application theme state and passes it through `Homepage` to Exercise 4 using typed callbacks. Exercise 4 and Exercise 5 follow the existing thin-Screen plus reusable-Widget pattern, while Exercise 5 keeps its interactive state inside its content widget.

**Tech Stack:** Flutter Material, Dart, `flutter_test`; no additional packages.

**Spec:** `docs/superpowers/specs/2026-09-23-lab4-exercises-4-5-design.md`

## Global Constraints

- Preserve Exercise 1–3 behavior and navigation.
- Use `lib/Screens/` for Scaffold wrappers and `lib/Widgets/` for reusable content.
- Do not add dependencies.
- Do not commit unless the user explicitly requests a commit.
- Keep visible labels identical to the approved design.

---

### Task 1: Exercise 4 global theme and app structure

**Files:**
- Create: `lib/Screens/app_structure_demo.dart`
- Create: `lib/Widgets/app_structure_content.dart`
- Modify: `lib/main.dart`
- Modify: `lib/Screens/homepage.dart`
- Test: `test/widget_test.dart`

**Interfaces:**
- `MyApp` owns `bool isDarkMode` and `void changeTheme(bool value)`.
- `Homepage` consumes `bool isDarkMode` and `ValueChanged<bool> onThemeChanged`.
- `AppStructureDemo` consumes the same two constructor parameters.
- `AppStructureContent` renders the centered body message.

- [ ] **Step 1: Add a failing widget test for Exercise 4**

Add a test that pumps `MyApp`, taps `Exercise 4 - App Structure & Theme`,
checks the AppBar, body text, Switch, and FAB, then toggles the Switch and
asserts:

```dart
final MaterialApp app = tester.widget(find.byType(MaterialApp));
expect(app.themeMode, ThemeMode.dark);
```

Tap the FAB and assert `Theme changed with the app structure demo.` appears in
a SnackBar.

- [ ] **Step 2: Run the targeted test and verify RED**

Run:

```powershell
flutter test test/widget_test.dart --plain-name "opens Exercise 4 and changes the application theme"
```

Expected: FAIL because the Exercise 4 Homepage button does not exist.

- [ ] **Step 3: Make `MyApp` own ThemeMode**

Convert `MyApp` to a `StatefulWidget`. Build `MaterialApp` with:

```dart
theme: ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
  useMaterial3: true,
),
darkTheme: ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.indigo,
    brightness: Brightness.dark,
  ),
  useMaterial3: true,
),
themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
home: Homepage(
  isDarkMode: isDarkMode,
  onThemeChanged: changeTheme,
),
```

Remove the unused `product_detail_page.dart` import while modifying this file.

- [ ] **Step 4: Add Exercise 4 Screen and Widget**

`AppStructureContent` returns:

```dart
const Center(
  child: Text('This is a simple screen with theme toggle.'),
)
```

`AppStructureDemo` builds a Scaffold whose AppBar action contains the `Dark`
label and Switch, whose body is `AppStructureContent`, and whose
FloatingActionButton uses `ScaffoldMessenger.of(context).showSnackBar(...)`.

- [ ] **Step 5: Add Exercise 4 Homepage navigation**

Update `Homepage` to require:

```dart
final bool isDarkMode;
final ValueChanged<bool> onThemeChanged;
```

Remove its local AppBar color Switch. Add a button named
`Exercise 4 - App Structure & Theme` that opens `AppStructureDemo` with the
received theme value and callback.

- [ ] **Step 6: Run the targeted test and verify GREEN**

Run the same `--plain-name` command. Expected: PASS.

---

### Task 2: Exercise 5 common UI fixes

**Files:**
- Create: `lib/Screens/common_ui_fixes_demo.dart`
- Create: `lib/Widgets/common_ui_fixes_content.dart`
- Modify: `lib/Screens/homepage.dart`
- Test: `test/widget_test.dart`

**Interfaces:**
- `CommonUiFixesDemo` is a parameterless StatelessWidget.
- `CommonUiFixesContent` is a StatefulWidget that owns `counter` and
  `selectedDate`.
- The movie source is the constant list `Movie A` through `Movie D`.

- [ ] **Step 1: Add failing tests for the four fixes**

Add one layout test that opens Exercise 5 and verifies:

```dart
expect(
  find.text('Correct ListView inside Column using Expanded'),
  findsOneWidget,
);
expect(find.byType(SingleChildScrollView), findsOneWidget);
expect(find.byType(ListView), findsOneWidget);
expect(find.text('Movie A'), findsOneWidget);
expect(find.text('Movie D'), findsOneWidget);
```

Add an interaction test that taps `Update state`, changes `State value: 0` to
`State value: 1`, opens the DatePicker through `Open Date Picker`, confirms with
`OK`, and finds a `Selected date:` label.

- [ ] **Step 2: Run both Exercise 5 tests and verify RED**

Run:

```powershell
flutter test test/widget_test.dart --plain-name "Exercise 5"
```

Expected: FAIL because the Exercise 5 Homepage button does not exist.

- [ ] **Step 3: Implement the Exercise 5 content widget**

Build an outer `SingleChildScrollView` containing a `Column`. Demonstrate the
ListView fix inside:

```dart
SizedBox(
  height: 300,
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text('Correct ListView inside Column using Expanded'),
      Expanded(
        child: ListView.builder(
          itemCount: movieTitles.length,
          itemBuilder: (context, index) => ListTile(
            leading: const Icon(Icons.movie),
            title: Text(movieTitles[index]),
          ),
        ),
      ),
    ],
  ),
)
```

Below it, render an overflow explanation, `State value: $counter`, an
`Update state` button calling `setState`, an `Open Date Picker` button calling
`showDatePicker(context: context, ...)`, and
`Selected date: ${formattedDate()}`.

- [ ] **Step 4: Add the Screen and Homepage navigation**

`CommonUiFixesDemo` provides the AppBar title
`Exercise 5 - Common UI Fixes` and uses `CommonUiFixesContent` as its body.
Homepage adds a matching button and opens the screen with `Navigator.push`.

- [ ] **Step 5: Run the Exercise 5 tests and verify GREEN**

Run the same `--plain-name "Exercise 5"` command. Expected: both tests PASS.

---

### Task 3: Regression verification and cleanup

**Files:**
- Modify only files from Tasks 1–2 if verification reveals an issue.

**Interfaces:**
- Consumes all Task 1 and Task 2 widgets and navigation.
- Produces a formatted, tested implementation with no new analyzer findings.

- [ ] **Step 1: Format all changed Dart files**

Run:

```powershell
dart format lib/main.dart lib/Screens/homepage.dart lib/Screens/app_structure_demo.dart lib/Screens/common_ui_fixes_demo.dart lib/Widgets/app_structure_content.dart lib/Widgets/common_ui_fixes_content.dart test/widget_test.dart
```

- [ ] **Step 2: Run the full test suite**

Run:

```powershell
flutter test
```

Expected: all Exercise 1–5 widget tests pass.

- [ ] **Step 3: Run static analysis**

Run:

```powershell
flutter analyze
```

Expected: no findings in files added or modified by this plan. Report unrelated
pre-existing findings separately.

- [ ] **Step 4: Check the final diff**

Run:

```powershell
git diff --check
git status --short
```

Expected: no whitespace errors; only intended project changes are present.
