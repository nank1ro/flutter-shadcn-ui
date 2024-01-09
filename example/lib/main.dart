import 'package:example/common/app_bar.dart';
import 'package:example/pages/badge.dart';
import 'package:example/pages/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_solidart/flutter_solidart.dart';

import 'package:shadcn_ui/shadcn_ui.dart';

const useMaterial = bool.fromEnvironment('MATERIAL', defaultValue: false);

void main() {
  runApp(useMaterial ? const AppWithMaterial() : const AppWithoutMaterial());
}

// Maps the routes to the specific widget page.
final routes = <String, WidgetBuilder>{
  '/button': (_) => const ButtonPage(),
  '/badge': (_) => const BadgePage(),
};
final routeToNameRegex = RegExp('(?:^/|-)([a-z])');

class AppWithoutMaterial extends StatelessWidget {
  const AppWithoutMaterial({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Localizations(
        locale: const Locale('en'),
        delegates: const [
          DefaultMaterialLocalizations.delegate,
          DefaultWidgetsLocalizations.delegate,
        ],
        child: BrightnessProvider(
          builder: (context) {
            final brightness = context.observe<Brightness>();
            return Shadcn(
              themeData: brightness == Brightness.dark
                  ? ShadcnSlateTheme.dark()
                  : ShadcnSlateTheme.light(),
              child: Navigator(
                onPopPage: (route, result) {
                  return true;
                },
                onGenerateRoute: (settings) {
                  return MaterialPageRoute(
                    settings: settings,
                    builder: (context) =>
                        routes[settings.name]?.call(context) ??
                        const MainPage(),
                  );
                },
                reportsRouteUpdateToEngine: true,
                clipBehavior: Clip.antiAlias,
              ),
            );
          },
        ),
      ),
    );
  }
}

class AppWithMaterial extends StatelessWidget {
  const AppWithMaterial({super.key});

  @override
  Widget build(BuildContext context) {
    return BrightnessProvider(builder: (context) {
      final brightness = context.observe<Brightness>();
      return Shadcn(
        themeData: brightness == Brightness.dark
            ? ShadcnSlateTheme.dark()
            : ShadcnSlateTheme.light(),
        builder: (context) {
          final theme = Theme.of(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: theme,
            home: const MainPage(),
            routes: routes,
          );
        },
      );
    });
  }
}

class BrightnessProvider extends StatelessWidget {
  const BrightnessProvider({
    super.key,
    required this.builder,
  });

  final WidgetBuilder builder;
  @override
  Widget build(BuildContext context) {
    return Solid(
      providers: [
        Provider<Signal<Brightness>>(create: () => Signal(Brightness.light)),
      ],
      builder: builder,
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
