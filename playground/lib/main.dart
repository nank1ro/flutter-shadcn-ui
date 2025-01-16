import 'dart:js_interop';
import 'package:flutter/material.dart';
import 'package:playground/router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:web/web.dart';



void main() {
  usePathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Workaround for https://github.com/flutter/flutter/issues/155265
  void onBlur(Event e) {
    (document.activeElement as HTMLElement?)?.blur();
  }

  @override
  void initState() {
    super.initState();
    window.addEventListener('blur', onBlur.toJS);
  }

  @override
  void dispose() {
    window.removeEventListener('blur', onBlur.toJS);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Uri.base.queryParameters['theme'] ?? 'light';
    final themeColor = Uri.base.queryParameters['themeColor'] ?? 'zinc'; // default theme color is zinc

    return ShadApp.router(
      title: 'shadcn-ui Flutter Playground',
      routerConfig: router,
      themeMode: theme == 'dark' ? ThemeMode.dark : ThemeMode.light,
      debugShowCheckedModeBanner: false,
      theme: ShadThemeData(
        colorScheme: getShadColorScheme(themeColor, false),
        brightness: Brightness.light,
      ),
      darkTheme: ShadThemeData(
        colorScheme: getShadColorScheme(themeColor, true),
        brightness: Brightness.dark,
      ),
    );
  }
}


ShadColorScheme getShadColorScheme(String themeColor, bool isDarkMode) {
  switch (themeColor.toLowerCase()) {
    case 'blue':
      return isDarkMode ? const ShadBlueColorScheme.dark() : const ShadBlueColorScheme.light();
    case 'gray':
      return isDarkMode ? const ShadGrayColorScheme.dark() : const ShadGrayColorScheme.light();
    case 'green':
      return isDarkMode ? const ShadGreenColorScheme.dark() : const ShadGreenColorScheme.light();
    case 'neutral':
      return isDarkMode ? const ShadNeutralColorScheme.dark() : const ShadNeutralColorScheme.light();
    case 'orange':
      return isDarkMode ? const ShadOrangeColorScheme.dark() : const ShadOrangeColorScheme.light();
    case 'red':
      return isDarkMode ? const ShadRedColorScheme.dark() : const ShadRedColorScheme.light();
    case 'rose':
      return isDarkMode ? const ShadRoseColorScheme.dark() : const ShadRoseColorScheme.light();
    case 'slate':
      return isDarkMode ? const ShadSlateColorScheme.dark() : const ShadSlateColorScheme.light();
    case 'stone':
      return isDarkMode ? const ShadStoneColorScheme.dark() : const ShadStoneColorScheme.light();
    case 'violet':
      return isDarkMode ? const ShadVioletColorScheme.dark() : const ShadVioletColorScheme.light();
    case 'yellow':
      return isDarkMode ? const ShadYellowColorScheme.dark() : const ShadYellowColorScheme.light();
    case 'zinc':
      return isDarkMode ? const ShadZincColorScheme.dark() : const ShadZincColorScheme.light();
    default:
      return isDarkMode ? const ShadZincColorScheme.dark() : const ShadZincColorScheme.light();
  }
}