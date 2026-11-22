# Interoperability

## Shadcn + Material

We are the first Flutter UI library to allow shadcn components to be used simultaneously with Material components.
The setup is simple. First add the `material_ui` package with `flutter pub add material_ui`, then:

```diff lang="dart"
import 'package:shadcn_ui/shadcn_ui.dart';
+ import 'package:material_ui/material_ui.dart';

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
+          localizationsDelegates: const [
+            GlobalShadLocalizations.delegate,
+            ...GlobalMaterialLocalizations.delegates,
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

If you need to use shadcn components with Cupertino components, use `CupertinoApp` instead of `MaterialApp`, like you are already used to. Add the `cupertino_ui` and `material_ui` packages with `flutter pub add cupertino_ui material_ui` (`ShadApp` uses `ThemeMode` from `material_ui`).

```diff lang="dart"
import 'package:shadcn_ui/shadcn_ui.dart';
+ import 'package:cupertino_ui/cupertino_ui.dart';
+ import 'package:material_ui/material_ui.dart';

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
+            GlobalShadLocalizations.delegate,
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