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
