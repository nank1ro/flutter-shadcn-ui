---
title: Getting started
description: Shadcn UI - The famous UI library ported in Flutter.
prev: false
sidebar:
  order: 1
---

Welcome to Shadcn UI for Flutter.
This is the official documentation for Shadcn UI for Flutter.

![Shadcn UI](/flutter-shadcn-ui/shadcn-banner.png)

> The work is still in progress.

:::tip[AI Editor Integration]
If you want to consume the docs in a LLM that accepts markdown, you can use this link:
<https://mariuti.com/flutter-shadcn-ui/llms.txt>
:::

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
+ import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
-    return ShadApp();
+    return ShadApp.custom(
+      themeMode: ThemeMode.dark,
+      darkTheme: ShadThemeData(
+        brightness: Brightness.dark,
+        colorScheme: const ShadSlateColorScheme.dark(),
+      ),
+      appBuilder: (context) {
+        return MaterialApp(
+          theme: Theme.of(context),
+          builder: (context, child) {
+            return ShadAppBuilder(child: child!);
+          },
+        );
+      },
+    );
  }
```

:::tip
If you need to use the `Router` instead of the `Navigator`, use `MaterialApp.router`.
:::

---

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
  scrollbarTheme: ScrollbarThemeData(
    crossAxisMargin: 1,
    mainAxisMargin: 1,
    thickness: const WidgetStatePropertyAll(8),
    radius: const Radius.circular(999),
    thumbColor: WidgetStatePropertyAll(themeData.colorScheme.border),
  ),
),
```

:::note
Use `Theme.of(context).copyWith(...)` to override the default theme, without losing the default values provided by shadcn_ui.
:::

## Shadcn + Cupertino

If you need to use shadcn components with Cupertino components, use `CupertinoApp` instead of `MaterialApp`, like you are already used to.

```diff lang="dart"
import 'package:shadcn_ui/shadcn_ui.dart';
+ import 'package:flutter/cupertino.dart';
+ import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
-    return ShadApp();
+    return ShadApp.custom(
+      themeMode: ThemeMode.dark,
+      darkTheme: ShadThemeData(
+        brightness: Brightness.dark,
+        colorScheme: const ShadSlateColorScheme.dark(),
+      ),
+      appBuilder: (context) {
+        return CupertinoApp(
+          theme: CupertinoTheme.of(context),
+          localizationsDelegates: const [
+            DefaultMaterialLocalizations.delegate,
+            DefaultCupertinoLocalizations.delegate,
+            DefaultWidgetsLocalizations.delegate,
+          ],
+          builder: (context, child) {
+            return ShadAppBuilder(child: child!);
+          },
+        );
+      },
+    );
  }
```

:::tip
If you need to use the `Router` instead of the `Navigator`, use `CupertinoApp.router`.
:::

---

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

:::note
Use `CupertinoTheme.of(context).copyWith(...)` to override the default theme, without losing the default values provided by shadcn_ui.
:::
