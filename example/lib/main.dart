import 'package:example/common/app_bar.dart';
import 'package:example/pages/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_solidart/flutter_solidart.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

void main() {
  runApp(const MyApp());
}

// Maps the routes to the specific widget page.
final routes = <String, WidgetBuilder>{
  '/buttons': (_) => const ButtonsPage(),
};
final routeToNameRegex = RegExp('(?:^/|-)([a-z])');

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Localizations(
      locale: const Locale('en'),
      delegates: const [
        DefaultMaterialLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      child: Solid(
        providers: [
          Provider<Signal<Brightness>>(create: () => Signal(Brightness.light)),
        ],
        builder: (context) {
          final brightness = context.observe<Brightness>();
          return Shadcn(
            themeData: brightness == Brightness.dark
                ? ShadcnZincTheme.dark()
                : ShadcnZincTheme.light(),
            child: Navigator(
              onPopPage: (route, result) {
                return true;
              },
              onGenerateRoute: (settings) {
                return MaterialPageRoute(
                  builder: (context) =>
                      routes[settings.name]?.call(context) ?? const MainPage(),
                );
              },
              clipBehavior: Clip.antiAlias,
            ),
          );
        },
      ),
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
