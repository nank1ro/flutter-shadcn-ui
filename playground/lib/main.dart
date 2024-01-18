import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:playground/pages/avatar.dart';
import 'package:playground/pages/badge.dart';
import 'package:playground/pages/button.dart';
import 'package:playground/pages/image.dart';
import 'package:playground/pages/tooltip.dart';
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
    final theme = Uri.base.queryParameters['theme'] ?? 'dark';

    return ShadcnApp.router(
      title: 'shadcn-ui Flutter Playground',
      routerConfig: _router,
      themeMode: theme == 'dark' ? ThemeMode.dark : ThemeMode.light,
      theme: ShadcnThemeData(
        colorScheme: const ShadcnSlateColorScheme.light(),
        brightness: Brightness.light,
      ),
      darkTheme: ShadcnThemeData(
        colorScheme: const ShadcnSlateColorScheme.dark(),
        brightness: Brightness.dark,
      ),
    );
  }
}

// GoRouter configuration
final _router = GoRouter(
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/button',
      builder: (context, state) {
        final style = state.uri.queryParameters['style'] ?? 'primary';
        return ButtonPage(
          style: PlagroundButtonStyle.values.byName(style),
        );
      },
    ),
    GoRoute(
      path: '/badge',
      builder: (context, state) {
        final style = state.uri.queryParameters['style'] ?? 'primary';
        return BadgePage(
          variant: ShadcnBadgeVariant.values.byName(style),
        );
      },
    ),
    GoRoute(
      path: '/avatar',
      builder: (context, state) => const AvatarPage(),
    ),
    GoRoute(
      path: '/image',
      builder: (context, state) {
        final style = state.uri.queryParameters['style'] ?? 'local';
        return ImagePage(
          style: ImageStyle.values.byName(style),
        );
      },
    ),
    GoRoute(
      path: '/tooltip',
      builder: (context, state) => const TooltipPage(),
    ),
  ],
);
