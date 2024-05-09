import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:playground/pages/accordion.dart';
import 'package:playground/pages/alert.dart';
import 'package:playground/pages/avatar.dart';
import 'package:playground/pages/badge.dart';
import 'package:playground/pages/button.dart';
import 'package:playground/pages/card.dart';
import 'package:playground/pages/checkbox.dart';
import 'package:playground/pages/dialog.dart';
import 'package:playground/pages/form.dart';
import 'package:playground/pages/image.dart';
import 'package:playground/pages/input.dart';
import 'package:playground/pages/popover.dart';
import 'package:playground/pages/progress.dart';
import 'package:playground/pages/radio_group.dart';
import 'package:playground/pages/resizable.dart';
import 'package:playground/pages/select.dart';
import 'package:playground/pages/sheet.dart';
import 'package:playground/pages/slider.dart';
import 'package:playground/pages/switch.dart';
import 'package:playground/pages/table.dart';
import 'package:playground/pages/toast.dart';
import 'package:playground/pages/tooltip.dart';
import 'package:playground/pages/typography.dart';
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
          variant: ShadBadgeVariant.values.byName(style),
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
    GoRoute(
      path: '/input',
      builder: (context, state) {
        final style =
            state.uri.queryParameters['style'] ?? InputStyle.email.name;
        return InputPage(
          style: InputStyle.values.byName(style),
        );
      },
    ),
    GoRoute(
      path: '/popover',
      builder: (context, state) => const PopoverPage(),
    ),
    GoRoute(
      path: '/typography',
      builder: (context, state) {
        final style = state.uri.queryParameters['style'] ?? 'h1Large';
        return TypographyPage(
          style: TypographyStyle.values.byName(style),
        );
      },
    ),
    GoRoute(
      path: '/select',
      builder: (context, state) {
        final style = state.uri.queryParameters['style'] ?? 'fruits';
        return SelectPage(
          variant: SelectVariant.values.byName(style),
        );
      },
    ),
    GoRoute(
      path: '/card',
      builder: (context, state) {
        final style =
            state.uri.queryParameters['style'] ?? CardStyle.project.name;
        return CardPage(style: CardStyle.values.byName(style));
      },
    ),
    GoRoute(
      path: '/switch',
      builder: (context, state) => const SwitchPage(),
    ),
    GoRoute(
      path: '/checkbox',
      builder: (context, state) => const CheckboxPage(),
    ),
    GoRoute(
      path: '/form',
      builder: (context, state) {
        final style =
            state.uri.queryParameters['style'] ?? FormStyle.inputField.name;
        return FormPage(style: FormStyle.values.byName(style));
      },
    ),
    GoRoute(
      path: '/radio-group',
      builder: (context, state) => const RadioGroupPage(),
    ),
    GoRoute(
      path: '/toast',
      builder: (context, state) {
        final style =
            state.uri.queryParameters['style'] ?? ToastStyle.schedule.name;
        return ToastPage(
          style: ToastStyle.values.byName(style),
        );
      },
    ),
    GoRoute(
      path: '/alert',
      builder: (context, state) {
        final style =
            state.uri.queryParameters['style'] ?? ShadAlertVariant.primary.name;
        return AlertPage(
          style: ShadAlertVariant.values.byName(style),
        );
      },
    ),
    GoRoute(
      path: '/dialog',
      builder: (context, state) {
        final style = state.uri.queryParameters['style'] ??
            ShadDialogVariant.primary.name;
        return DialogPage(
          style: ShadDialogVariant.values.byName(style),
        );
      },
    ),
    GoRoute(
      path: '/slider',
      builder: (context, state) => const SliderPage(),
    ),
    GoRoute(
      path: '/sheet',
      builder: (context, state) {
        final style =
            state.uri.queryParameters['style'] ?? SheetStyle.primary.name;
        return SheetPage(
          style: SheetStyle.values.byName(style),
        );
      },
    ),
    GoRoute(
      path: '/progress',
      builder: (context, state) {
        final style = state.uri.queryParameters['style'] ??
            ProgressStyle.determinate.name;
        return ProgressPage(style: ProgressStyle.values.byName(style));
      },
    ),
    GoRoute(
      path: '/accordion',
      builder: (context, state) {
        final style =
            state.uri.queryParameters['style'] ?? ShadAccordionType.single.name;
        return AccordionPage(
          style: ShadAccordionType.values.byName(style),
        );
      },
    ),
    GoRoute(
      path: '/table',
      builder: (context, state) => const TablePage(),
    ),
    GoRoute(
      path: '/resizable',
      builder: (context, state) {
        final style =
            state.uri.queryParameters['style'] ?? ShadResizableStyle.basic.name;
        return ResizablePage(
          style: ShadResizableStyle.values.byName(style),
        );
      },
    ),
  ],
);
