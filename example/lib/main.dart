import 'package:example/common/app_bar.dart';
import 'package:example/pages/badge.dart';
import 'package:example/pages/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_solidart/flutter_solidart.dart';

import 'package:shadcn_ui/shadcn_ui.dart';

void main() {
  runApp(const App());
}

// Maps the routes to the specific widget page.
final routes = <String, WidgetBuilder>{
  '/button': (_) => const ButtonPage(),
  '/badge': (_) => const BadgePage(),
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
          theme: ShadcnSlateTheme.light(),
          darkTheme: ShadcnSlateTheme.dark(),
          themeMode: themeMode,
          routes: routes,
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
