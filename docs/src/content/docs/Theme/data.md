---
title: Theme Data
sidebar:
  order: 2
---

Defines the theme and color scheme for the app.

The supported color schemes are:

- blue
- gray
- green
- neutral
- orange
- red
- rose
- slate
- stone
- violet
- yellow
- zinc

## Usage

```diff lang="dart"
import 'package:shadcn_ui/shadcn_ui.dart';

@override
Widget build(BuildContext context) {
  return ShadApp(
+    darkTheme: ShadThemeData(
+      brightness: Brightness.dark,
+      colorScheme: const ShadSlateColorScheme.dark(),
+    ),
    child: ...
  );
}
```

You can override specific properties of the selected theme/color scheme:

```diff lang="dart"
import 'package:shadcn_ui/shadcn_ui.dart';

@override
Widget build(BuildContext context) {
  return ShadApp(
    darkTheme: ShadThemeData(
        brightness: Brightness.dark,
        colorScheme: const ShadSlateColorScheme.dark(
+          background: Colors.blue,
        ),
+        primaryButtonTheme: const ShadButtonTheme(
+          backgroundColor: Colors.cyan,
+        ),
      ),
    ),
    child: ...
  );
}
```

:::tip
You can also create your custom color scheme, just extend the `ShadColorScheme` class and pass all the properties.
:::

## ShadColorScheme.fromName

If you want to allow the user to change the default shadcn themes, I suggest using `ShadColorScheme.fromName`.

```dart
// available color scheme names
final shadThemeColors = [
  'blue',
  'gray',
  'green',
  'neutral',
  'orange',
  'red',
  'rose',
  'slate',
  'stone',
  'violet',
  'yellow',
  'zinc',
];

final lightColorScheme = ShadColorScheme.fromName('blue');
final darkColorScheme = ShadColorScheme.fromName('slate', brightness: Brightness.dark);
```

In this way you can easily create a select to change the color scheme, for example:

```dart
import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

// Somewhere in your app
ShadSelect<String>(
  initialValue: 'slate',
  maxHeight: 200,
  options: shadThemeColors.map(
    (option) => ShadOption(
      value: option,
      child: Text(
        option.capitalizeFirst(),
      ),
    ),
  ),
  selectedOptionBuilder: (context, value) {
    return Text(value.capitalizeFirst());
  },
  onChanged: (value) {
    // rebuild the app using your state management solution
  },
),
```

For example I'm using solidart as state management, here it is the example code used to rebuild the app widget when the user changes the theme mode.
<https://docs.page/nank1ro/solidart/examples/toggle-theme>

The same can be done for the color scheme, using a `Signal<String>()`
