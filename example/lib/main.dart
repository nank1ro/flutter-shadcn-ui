import 'package:disco/disco.dart';
import 'package:example/common/app_bar.dart';
import 'package:example/common/extensions.dart';
import 'package:example/pages/accordion.dart';
import 'package:example/pages/alert.dart';
import 'package:example/pages/avatar.dart';
import 'package:example/pages/badge.dart';
import 'package:example/pages/breadcrumb.dart';
import 'package:example/pages/button.dart';
import 'package:example/pages/calendar.dart';
import 'package:example/pages/card.dart';
import 'package:example/pages/carousel.dart';
import 'package:example/pages/checkbox.dart';
import 'package:example/pages/checkbox_form_field.dart';
import 'package:example/pages/context_menu.dart';
import 'package:example/pages/date_picker.dart';
import 'package:example/pages/date_picker_form_field.dart';
import 'package:example/pages/dialog.dart';
import 'package:example/pages/keyboard_toolbar.dart';
import 'package:example/pages/separator.dart';
import 'package:example/pages/icon_button.dart';
import 'package:example/pages/input.dart';
import 'package:example/pages/input_form_field.dart';
import 'package:example/pages/input_otp.dart';
import 'package:example/pages/input_otp_form_field.dart';
import 'package:example/pages/menubar.dart';
import 'package:example/pages/popover.dart';
import 'package:example/pages/progress.dart';
import 'package:example/pages/radio_group.dart';
import 'package:example/pages/radio_group_form_field.dart';
import 'package:example/pages/resizable.dart';
import 'package:example/pages/select.dart';
import 'package:example/pages/select_form_field.dart';
import 'package:example/pages/sheet.dart';
import 'package:example/pages/slider.dart';
import 'package:example/pages/sonner.dart';
import 'package:example/pages/switch.dart';
import 'package:example/pages/switch_form_field.dart';
import 'package:example/pages/table.dart';
import 'package:example/pages/tabs.dart';
import 'package:example/pages/portal.dart';
import 'package:example/pages/textarea.dart';
import 'package:example/pages/textarea_form_field.dart';
import 'package:example/pages/time_picker.dart';
import 'package:example/pages/time_picker_form_field.dart';
import 'package:example/pages/toast.dart';
import 'package:example/pages/tooltip.dart';
import 'package:example/pages/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_solidart/flutter_solidart.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

void main() {
  SolidartConfig.devToolsEnabled = false;
  runApp(const App());
}

// Maps the routes to the specific widget page.
final routes = <String, WidgetBuilder>{
  '/accordion': (_) => const AccordionPage(),
  '/alert': (_) => const AlertPage(),
  '/avatar': (_) => const AvatarPage(),
  '/badge': (_) => const BadgePage(),
  '/breadcrumb': (_) => const BreadcrumbPage(),
  '/button': (_) => const ButtonPage(),
  '/calendar': (_) => const CalendarPage(),
  '/card': (_) => const CardPage(),
  '/carousel': (_) => const CarouselPage(),
  '/checkbox': (_) => const CheckboxPage(),
  '/checkbox-form-field': (_) => const CheckboxFormFieldPage(),
  '/context-menu': (_) => const ContextMenuPage(),
  '/date-picker': (_) => const DatePickerPage(),
  '/date-picker-form-field': (_) => const DatePickerFormFieldPage(),
  '/dialog': (_) => const DialogPage(),
  '/divider': (_) => const SeparatorPage(),
  '/icon-button': (_) => const IconButtonPage(),
  '/input': (_) => const InputPage(),
  '/input-OTP': (_) => const InputOTPPage(),
  '/input-OTP-form-field': (_) => const InputOTPFormFieldPage(),
  '/input-form-field': (_) => const InputFormFieldPage(),
  '/keyboard-toolbar': (_) => const KeyboardToolbarPage(),
  '/menubar': (_) => const MenubarPage(),
  '/popover': (_) => const PopoverPage(),
  '/portal': (_) => const ShadPortalPage(),
  '/progress': (_) => const ProgressPage(),
  '/radio-group': (_) => const RadioPage(),
  '/radio-group-form-field': (_) => const RadioGroupFormFieldPage(),
  '/resizable': (_) => const ResizablePage(),
  '/select': (_) => const SelectPage(),
  '/select-form-field': (_) => const SelectFormFieldPage(),
  '/sheet': (_) => const SheetPage(),
  '/slider': (_) => const SliderPage(),
  '/sonner': (_) => const SonnerPage(),
  '/switch': (_) => const SwitchPage(),
  '/switch-form-field': (_) => const SwitchFormFieldPage(),
  '/table': (_) => const TablePage(),
  '/tabs': (_) => const TabsPage(),
  '/textarea': (_) => const TextareaPage(),
  '/textarea-form-field': (_) => const TextareaFormFieldPage(),
  '/time-picker': (_) => const TimePickerPage(),
  '/time-picker-form-field': (_) => const TimePickerFormFieldPage(),
  '/toast': (_) => const ToastPage(),
  '/tooltip': (_) => const TooltipPage(),
  '/typography': (_) => const TypographyPage(),
};
final routeToNameRegex = RegExp('(?:^/|-)([a-zA-Z])');

final themeModeProvider = Provider((_) => Signal(ThemeMode.light));

final directionalityProvider = Provider((context) => Signal(TextDirection.ltr));

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      providers: [themeModeProvider, directionalityProvider],
      child: SignalBuilder(
        builder: (context, _) {
          final themeMode = themeModeProvider.of(context).value;
          final directionality = directionalityProvider.of(context).value;
          // Custom App example
          // return ShadApp.custom(
          //   themeMode: themeMode,
          //   darkTheme: ShadThemeData(
          //     brightness: Brightness.dark,
          //     colorScheme: const ShadSlateColorScheme.dark(),
          //   ),
          //   appBuilder: (context) {
          //     return MaterialApp(
          //       routes: routes,
          //       theme: Theme.of(context),
          //       home: const MainPage(),
          //       builder: (context, child) {
          //         return Directionality(
          //           textDirection: directionality,
          //           child: ShadAppBuilder(child: child!),
          //         );
          //       },
          //     );
          //   },
          // );
          return ShadApp(
            debugShowCheckedModeBanner: false,
            themeMode: themeMode,
            routes: routes,
            theme: ShadThemeData(
              brightness: Brightness.light,
              colorScheme: const ShadZincColorScheme.light(
                // Example of adding a custom color to the color scheme
                /* 
                  custom: {
                     'myCustomColor': Color.fromARGB(255, 177, 4, 196),
                   },
                  */
              ),
              // Example with google fonts
              // textTheme: ShadTextTheme.fromGoogleFont(GoogleFonts.poppins),

              // Example of custom font family
              // textTheme: ShadTextTheme(family: 'UbuntuMono'),

              // Example to disable the secondary border
              // disableSecondaryBorder: true,

              // Example of extending the ShadTextTheme with a new custom style and name (see `/typography` page for usage example).
              textTheme: ShadTextTheme(
                custom: {
                  'myCustomStyle': const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.blue,
                  ),
                },
              ),
            ),
            darkTheme: ShadThemeData(
              brightness: Brightness.dark,
              colorScheme: const ShadZincColorScheme.dark(),
              // Example of custom font family
              // textTheme: ShadTextTheme(family: 'UbuntuMono'),

              // Example of extending the ShadTextTheme with a new custom style and name (see `/typography` page for usage example).
              textTheme: ShadTextTheme(
                custom: {
                  'myCustomStyle': const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.green,
                  ),
                },
              ),
            ),
            home: const MainPage(),
            builder: (context, child) {
              return Directionality(
                textDirection: directionality,
                child: child!,
              );
            },
          );
        },
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final search = Signal('');

  @override
  void dispose() {
    search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        titleWidget: ShadInput(
          placeholder: const Text('Search ShadcnUI component'),
          onChanged: search.set,
        ),
      ),
      body: SignalBuilder(
        builder: (context, child) {
          final filteredRoutes = {
            for (final k in routes.keys.where(
              (k) => k.toLowerCase().contains(search().toLowerCase()),
            ))
              k: routes[k]!,
          };

          return ListView.builder(
            itemCount: filteredRoutes.length,
            itemBuilder: (BuildContext context, int index) {
              final route = filteredRoutes.keys.elementAt(index);

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
          );
        },
      ),
    );
  }
}
