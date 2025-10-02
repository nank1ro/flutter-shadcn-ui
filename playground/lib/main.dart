import 'dart:js_interop';

import 'package:web/web.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:flutter_solidart/flutter_solidart.dart';

import 'package:playground/router.dart';

final themeSignal = Signal<ThemeMode>(ThemeMode.light);
final themeColorSignal = Signal<String>('zinc');

// For Dev ONLY: use your local Astro dev server
// const kParentOrigin = "http://localhost:4321";
const kParentOrigin = "https://shadcn-ui-playground.pages.dev";

void main() {
  usePathUrlStrategy();

  // Read theme from URL query parameters then update the signals.
  setupInitialThemeFromURL();

  // Listen for messages from the parent window (the Astro docs site).
  setupWindowMessagesListener();

  runApp(const MyApp());
}

void setupInitialThemeFromURL() {
  final uri = Uri.base;

  final themeModeParam = uri.queryParameters['themeMode'];
  if (themeModeParam != null) {
    themeSignal.value =
        themeModeParam == 'dark' ? ThemeMode.dark : ThemeMode.light;
  }

  final themeColorParam = uri.queryParameters['themeColor'];
  if (themeColorParam != null) {
    themeColorSignal.value = themeColorParam;
  }
}

void setupWindowMessagesListener() {
  window.onMessage.listen((event) {
    // IMPORTANT: For security, always verify the origin of the message.
    print('event.origin: ${event.origin}');
    if (event.origin != kParentOrigin) {
      return;
    }

    try {
      final data = event.data.dartify();
      if (data is! Map) return;
      final type = data['type'];

      // Check the type of the message.
      if (type == 'theme-change') {
        handleThemeEvent(data);
      } else if (type == 'navigate') {
        if (data['route'] case String route) {
          router.push(route);
        }
      }
    } catch (e) {
      print('Error processing message from docs site: $e');
    }
  });
}

void handleThemeEvent(Map data) {
  final themeMode =
      data['themeMode'] == 'dark' ? ThemeMode.dark : ThemeMode.light;
  final String? themeColor = data['themeColor'];

  themeSignal.value = themeMode;

  if (themeColor != null) {
    themeColorSignal.value = themeColor;
  }
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
    return SignalBuilder(
      builder: (context, _) {
        final themeMode = themeSignal.value;
        final themeColor = themeColorSignal.value;
        return ShadApp.router(
          title: 'shadcn-ui Flutter Playground',
          routerConfig: router,
          themeMode: themeMode,
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
      },
    );
  }
}

ShadColorScheme getShadColorScheme(String themeColor, bool isDarkMode) {
  switch (themeColor.toLowerCase()) {
    case 'blue':
      return isDarkMode
          ? const ShadBlueColorScheme.dark()
          : const ShadBlueColorScheme.light();
    case 'gray':
      return isDarkMode
          ? const ShadGrayColorScheme.dark()
          : const ShadGrayColorScheme.light();
    case 'green':
      return isDarkMode
          ? const ShadGreenColorScheme.dark()
          : const ShadGreenColorScheme.light();
    case 'neutral':
      return isDarkMode
          ? const ShadNeutralColorScheme.dark()
          : const ShadNeutralColorScheme.light();
    case 'orange':
      return isDarkMode
          ? const ShadOrangeColorScheme.dark()
          : const ShadOrangeColorScheme.light();
    case 'red':
      return isDarkMode
          ? const ShadRedColorScheme.dark()
          : const ShadRedColorScheme.light();
    case 'rose':
      return isDarkMode
          ? const ShadRoseColorScheme.dark()
          : const ShadRoseColorScheme.light();
    case 'slate':
      return isDarkMode
          ? const ShadSlateColorScheme.dark()
          : const ShadSlateColorScheme.light();
    case 'stone':
      return isDarkMode
          ? const ShadStoneColorScheme.dark()
          : const ShadStoneColorScheme.light();
    case 'violet':
      return isDarkMode
          ? const ShadVioletColorScheme.dark()
          : const ShadVioletColorScheme.light();
    case 'yellow':
      return isDarkMode
          ? const ShadYellowColorScheme.dark()
          : const ShadYellowColorScheme.light();
    case 'zinc':
      return isDarkMode
          ? const ShadZincColorScheme.dark()
          : const ShadZincColorScheme.light();
    default:
      return isDarkMode
          ? const ShadZincColorScheme.dark()
          : const ShadZincColorScheme.light();
  }
}
