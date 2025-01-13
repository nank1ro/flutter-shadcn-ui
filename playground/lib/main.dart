import 'dart:js_interop';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:playground/pages/accordion.dart';
import 'package:playground/pages/alert.dart';
import 'package:playground/pages/avatar.dart';
import 'package:playground/pages/badge.dart';
import 'package:playground/pages/button.dart';
import 'package:playground/pages/calendar.dart';
import 'package:playground/pages/card.dart';
import 'package:playground/pages/checkbox.dart';
import 'package:playground/pages/context_menu.dart';
import 'package:playground/pages/date_picker.dart';
import 'package:playground/pages/dialog.dart';
import 'package:playground/pages/form.dart';
import 'package:playground/pages/input.dart';
import 'package:playground/pages/input_otp.dart';
import 'package:playground/pages/popover.dart';
import 'package:playground/pages/progress.dart';
import 'package:playground/pages/radio_group.dart';
import 'package:playground/pages/resizable.dart';
import 'package:playground/pages/select.dart';
import 'package:playground/pages/sheet.dart';
import 'package:playground/pages/slider.dart';
import 'package:playground/pages/switch.dart';
import 'package:playground/pages/table.dart';
import 'package:playground/pages/tabs.dart';
import 'package:playground/pages/time_picker.dart';
import 'package:playground/pages/toast.dart';
import 'package:playground/pages/tooltip.dart';
import 'package:playground/pages/typography.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:web/web.dart';

extension on GoRouterState {
  bool? getBoolFromArg(String name) {
    if (uri.queryParameters.containsKey(name)) {
      final arg = uri.queryParameters[name];
      if (arg == 'false' || arg == '0') return false;
      // Return true because the argument is present
      return true;
    }
    return null;
  }
}

void main() {
  usePathUrlStrategy();
  runApp(const MyApp());
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
    final theme = Uri.base.queryParameters['theme'] ?? 'light';
    final themeColor = Uri.base.queryParameters['themeColor'] ?? 'zinc'; // default theme color is zinc

    return ShadApp.router(
      title: 'shadcn-ui Flutter Playground',
      routerConfig: _router,
      themeMode: theme == 'dark' ? ThemeMode.dark : ThemeMode.light,
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
    GoRoute(
      path: '/tabs',
      builder: (context, state) => const TabsPage(),
    ),
    GoRoute(
      path: '/context-menu',
      builder: (context, state) => const ContextMenuPage(),
    ),
    GoRoute(
      path: '/calendar',
      builder: (context, state) {
        final style = state.uri.queryParameters['style'] ??
            ShadCalendarVariant.single.name;
        final hideNavigation = state.getBoolFromArg('hideNavigation');
        final showWeekNumbers = state.getBoolFromArg('showWeekNumbers');
        final showOutsideDays = state.getBoolFromArg('showOutsideDays');
        final fixedWeeks = state.getBoolFromArg('fixedWeeks');
        final hideWeekdayNames = state.getBoolFromArg('hideWeekdayNames');
        final reverseMonths = state.getBoolFromArg('reverseMonths');

        final captionLayout = state.uri.queryParameters['captionLayout'] ??
            ShadCalendarCaptionLayout.label.name;

        return CalendarPage(
          style: ShadCalendarVariant.values.byName(style),
          captionLayout: ShadCalendarCaptionLayout.values.byName(captionLayout),
          hideNavigation: hideNavigation,
          showWeekNumbers: showWeekNumbers,
          showOutsideDays: showOutsideDays,
          fixedWeeks: fixedWeeks,
          hideWeekdayNames: hideWeekdayNames,
          reverseMonths: reverseMonths,
        );
      },
    ),
    GoRoute(
      path: '/date-picker',
      builder: (context, state) {
        final style = state.uri.queryParameters['style'] ??
            ShadDatePickerVariantPlayground.single.name;
        return DatePickerPage(
          style: ShadDatePickerVariantPlayground.values.byName(style),
        );
      },
    ),
    GoRoute(
      path: '/time-picker',
      builder: (context, state) {
        final style = state.uri.queryParameters['style'] ??
            ShadTimePickerVariant.primary.name;
        return TimePickerPage(
          style: ShadTimePickerVariant.values.byName(style),
        );
      },
    ),
    GoRoute(
      path: '/input-otp',
      builder: (context, state) {
        final style = state.uri.queryParameters['style'] ?? 'primary';
        return InputOTPPage(
          style: ShadInputOTPVariant.values.byName(style),
        );
      },
    ),
  ],
);


ShadColorScheme getShadColorScheme(String themeColor, bool isDarkMode) {
  switch (themeColor.toLowerCase()) {
    case 'blue':
      return isDarkMode ? const ShadBlueColorScheme.dark() : const ShadBlueColorScheme.light();
    case 'gray':
      return isDarkMode ? const ShadGrayColorScheme.dark() : const ShadGrayColorScheme.light();
    case 'green':
      return isDarkMode ? const ShadGreenColorScheme.dark() : const ShadGreenColorScheme.light();
    case 'neutral':
      return isDarkMode ? const ShadNeutralColorScheme.dark() : const ShadNeutralColorScheme.light();
    case 'orange':
      return isDarkMode ? const ShadOrangeColorScheme.dark() : const ShadOrangeColorScheme.light();
    case 'red':
      return isDarkMode ? const ShadRedColorScheme.dark() : const ShadRedColorScheme.light();
    case 'rose':
      return isDarkMode ? const ShadRoseColorScheme.dark() : const ShadRoseColorScheme.light();
    case 'slate':
      return isDarkMode ? const ShadSlateColorScheme.dark() : const ShadSlateColorScheme.light();
    case 'stone':
      return isDarkMode ? const ShadStoneColorScheme.dark() : const ShadStoneColorScheme.light();
    case 'violet':
      return isDarkMode ? const ShadVioletColorScheme.dark() : const ShadVioletColorScheme.light();
    case 'yellow':
      return isDarkMode ? const ShadYellowColorScheme.dark() : const ShadYellowColorScheme.light();
    case 'zinc':
      return isDarkMode ? const ShadZincColorScheme.dark() : const ShadZincColorScheme.light();
    default:
      return isDarkMode ? const ShadZincColorScheme.dark() : const ShadZincColorScheme.light();
  }
}