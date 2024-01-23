import 'package:example/common/app_bar.dart';
import 'package:example/pages/avatar.dart';
import 'package:example/pages/badge.dart';
import 'package:example/pages/button.dart';
import 'package:example/pages/image.dart';
import 'package:example/pages/input.dart';
import 'package:example/pages/popover.dart';
import 'package:example/pages/tooltip.dart';
import 'package:example/pages/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_solidart/flutter_solidart.dart';

import 'package:shadcn_ui/shadcn_ui.dart';

void main() {
  runApp(const App());
}

// Maps the routes to the specific widget page.
final routes = <String, WidgetBuilder>{
  '/typography': (_) => const TypographyPage(),
  '/button': (_) => const ButtonPage(),
  '/badge': (_) => const BadgePage(),
  '/avatar': (_) => const AvatarPage(),
  '/image': (_) => const ImagePage(),
  '/tooltip': (_) => const TooltipPage(),
  '/popover': (_) => const PopoverPage(),
  '/input': (_) => const InputPage(),
};
final routeToNameRegex = RegExp('(?:^/|-)([a-z])');

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Solid(
      providers: [
        Provider<Signal<ThemeMode>>(create: () => Signal(ThemeMode.dark)),
      ],
      builder: (context) {
        final themeMode = context.observe<ThemeMode>();
        return ShadcnApp(
          debugShowCheckedModeBanner: false,
          themeMode: themeMode,
          routes: routes,
          theme: ShadcnThemeData(
            brightness: Brightness.light,
            colorScheme: const ShadcnSlateColorScheme.light(),
          ),
          darkTheme: ShadcnThemeData(
            brightness: Brightness.dark,
            colorScheme: const ShadcnSlateColorScheme.dark(),
          ),
          home: const MainPage(),
        );
      },
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: 'Shadcn UI'),
      body: ListView.builder(
        itemCount: routes.length,
        itemBuilder: (BuildContext context, int index) {
          final route = routes.keys.elementAt(index);

          final name = route.replaceAllMapped(
            routeToNameRegex,
            (match) => match.group(0)!.substring(1).toUpperCase(),
          );

          return Material(
            child: ListTile(
              title: Text(name),
              onTap: () {
                Navigator.of(context).pushNamed(route);
              },
            ),
          );
        },
      ),
    );
  }
}
