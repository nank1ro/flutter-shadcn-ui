---
title: Getting started
description: Shadcn UI - The famous UI library ported in Flutter.
prev: false
sidebar:
  order: 1
---

Welcome to Shadcn UI for Flutter.
This is the official documentation for Shadcn UI for Flutter.

![Shadcn UI](/shadcn-banner.png)

> The work is still in progress.

## Installation

Run this command in your terminal from your project root directory:

```bash
flutter pub add shadcn_ui
```

or manually adding to your `pubspec.yaml`:

```diff lang="yaml"
dependencies:
+    shadcn_ui: ^0.2.4 # replace with the latest version
```

## Shadcn (pure)

Use the `ShadApp` widget if you want to use just the ShadcnUI components, without Material or Cupertino.

```diff lang="dart"
+ import 'package:shadcn_ui/shadcn_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
+    return ShadApp();
  }
```

:::tip
If you need to use the `Router` instead of the `Navigator`, use `ShadApp.router`.
:::

## Shadcn + Material

We are the first Flutter UI library to allow shadcn components to be used simultaneously with Material components.
The setup is simple:

```diff lang="dart"
import 'package:shadcn_ui/shadcn_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
-    return ShadApp();
+    return ShadApp.material();
  }
```

:::tip
If you need to use the `Router` instead of the `Navigator`, use `ShadApp.materialRouter`.
:::

---

The `ShadApp` widget automatically creates a Material `ThemeData`.
If you need to customize the Material theme use `materialThemeBuilder`:

```diff lang="dart"
import 'package:shadcn_ui/shadcn_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadApp.material(
+      materialThemeBuilder: (context, theme) {
+        return theme.copyWith(
+          appBarTheme: const AppBarTheme(toolbarHeight: 52),
+        );
+      },
    );
  }
```

The default Material `ThemeData` created by `ShadApp` is:

```dart
ThemeData(
  fontFamily: themeData.textTheme.family,
  extensions: themeData.extensions,
  colorScheme: ColorScheme(
    brightness: themeData.brightness,
    primary: themeData.colorScheme.primary,
    onPrimary: themeData.colorScheme.primaryForeground,
    secondary: themeData.colorScheme.secondary,
    onSecondary: themeData.colorScheme.secondaryForeground,
    error: themeData.colorScheme.destructive,
    onError: themeData.colorScheme.destructiveForeground,
    surface: themeData.colorScheme.background,
    onSurface: themeData.colorScheme.foreground,
  ),
  scaffoldBackgroundColor: themeData.colorScheme.background,
  brightness: themeData.brightness,
  dividerTheme: DividerThemeData(
    color: themeData.colorScheme.border,
    thickness: 1,
  ),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: themeData.colorScheme.primary,
    selectionColor: themeData.colorScheme.selection,
    selectionHandleColor: themeData.colorScheme.primary,
  ),
  iconTheme: IconThemeData(
    size: 16,
    color: themeData.colorScheme.foreground,
  ),
),
```

## Shadcn + Cupertino

If you need to use shadcn components with Cupertino components, use `ShadApp.cupertino`.

```diff lang="dart"
import 'package:shadcn_ui/shadcn_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
-    return ShadApp();
+    return ShadApp.cupertino();
  }
```

:::tip
If you need to use the `Router` instead of the `Navigator`, use `ShadApp.cupertinoRouter`.
:::

---

The `ShadApp` widget automatically creates a `CupertinoThemeData` and a Material `ThemeData`.
If you need to customize the Material theme use `materialThemeBuilder`, and `cupertinoThemeBuilder` to customize the Cupertino theme:

```diff lang="dart"
import 'package:shadcn_ui/shadcn_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadApp.cupertino(
+      cupertinoThemeBuilder: (context, theme) {
+        return theme.copyWith(applyThemeToAll: true);
+      },
+      materialThemeBuilder: (context, theme) {
+        return theme.copyWith(
+          appBarTheme: const AppBarTheme(toolbarHeight: 52),
+        );
+      },
    );
  }
```

The default `CupertinoThemeData` created by `ShadApp` is:

```dart
CupertinoThemeData(
  primaryColor: themeData.colorScheme.primary,
  primaryContrastingColor: themeData.colorScheme.primaryForeground,
  scaffoldBackgroundColor: themeData.colorScheme.background,
  barBackgroundColor: themeData.colorScheme.primary,
  brightness: themeData.brightness,
),
```

## Shadcn + Custom App

If you want to integrate Shadcn with a custom WidgetsApp integration, like GetX (GetMaterialApp) you can use `ShadApp.custom`

```diff lang="dart"
import 'package:shadcn_ui/shadcn_ui.dart';
+ import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
-    return ShadApp();
+    return ShadApp.custom(
+      appBuilder: (context, theme) => GetMaterialApp(
+        theme: theme,
+        builder: (context, child) {
+          return ShadToaster(child: child!);
+        },
+      ),
+    );
  }
```
