import 'package:example/common/app_bar.dart';
import 'package:example/pages/avatar.dart';
import 'package:example/pages/badge.dart';
import 'package:example/pages/button.dart';
import 'package:example/pages/card.dart';
import 'package:example/pages/checkbox.dart';
import 'package:example/pages/checkbox_form_field.dart';
import 'package:example/pages/image.dart';
import 'package:example/pages/input.dart';
import 'package:example/pages/input_form_field.dart';
import 'package:example/pages/popover.dart';
import 'package:example/pages/radio_group.dart';
import 'package:example/pages/radio_group_form_field.dart';
import 'package:example/pages/select.dart';
import 'package:example/pages/select_form_field.dart';
import 'package:example/pages/switch.dart';
import 'package:example/pages/switch_form_field.dart';
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
  '/avatar': (_) => const AvatarPage(),
  '/badge': (_) => const BadgePage(),
  '/button': (_) => const ButtonPage(),
  '/card': (_) => const CardPage(),
  '/checkbox': (_) => const CheckboxPage(),
  '/checkbox-form-field': (_) => const CheckboxFormFieldPage(),
  '/image': (_) => const ImagePage(),
  '/input': (_) => const InputPage(),
  '/input-form-field': (_) => const InputFormFieldPage(),
  '/popover': (_) => const PopoverPage(),
  '/radio-group': (_) => const RadioPage(),
  '/radio-group-form-field': (_) => const RadioGroupFormFieldPage(),
  '/select': (_) => const SelectPage(),
  '/select-form-field': (_) => const SelectFormFieldPage(),
  '/switch': (_) => const SwitchPage(),
  '/switch-form-field': (_) => const SwitchFormFieldPage(),
  '/tooltip': (_) => const TooltipPage(),
  '/typography': (_) => const TypographyPage(),
};
final routeToNameRegex = RegExp('(?:^/|-)([a-z])');

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Solid(
      providers: [
        Provider<Signal<ThemeMode>>(create: () => Signal(ThemeMode.light)),
      ],
      builder: (context) {
        final themeMode = context.observe<ThemeMode>();
        return ShadApp(
          debugShowCheckedModeBanner: false,
          themeMode: themeMode,
          routes: routes,
          theme: ShadThemeData(
            brightness: Brightness.light,
            colorScheme: const ShadZincColorScheme.light(),
          ),
          darkTheme: ShadThemeData(
            brightness: Brightness.dark,
            colorScheme: const ShadZincColorScheme.dark(),
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
