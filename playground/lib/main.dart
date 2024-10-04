import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:playground/routes.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

void main() {
  usePathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Uri.base.queryParameters['theme'] ?? 'light';

    return ShadApp.router(
      title: 'shadcn-ui Flutter Playground',
      routerConfig: _router,
      themeMode: theme == 'dark' ? ThemeMode.dark : ThemeMode.light,
      debugShowCheckedModeBanner: false,
      theme: ShadThemeData(
        colorScheme: const ShadZincColorScheme.light(),
        brightness: Brightness.light,
      ),
      darkTheme: ShadThemeData(
        colorScheme: const ShadZincColorScheme.dark(),
        brightness: Brightness.dark,
      ),
    );
  }
}

// GoRouter configuration
final _router = GoRouter(
  debugLogDiagnostics: true,
  routes: routes,
);
