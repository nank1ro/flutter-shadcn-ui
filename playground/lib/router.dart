import 'package:go_router/go_router.dart';
import 'package:playground/pages/accordion.dart';
import 'package:playground/pages/alert.dart';
import 'package:playground/pages/avatar.dart';
import 'package:playground/pages/badge.dart';
import 'package:playground/pages/breadcrumb.dart';
import 'package:playground/pages/button.dart';
import 'package:playground/pages/calendar.dart';
import 'package:playground/pages/card.dart';
import 'package:playground/pages/carousel.dart';
import 'package:playground/pages/checkbox.dart';
import 'package:playground/pages/context_menu.dart';
import 'package:playground/pages/date_picker.dart';
import 'package:playground/pages/dialog.dart';
import 'package:playground/pages/divider.dart';
import 'package:playground/pages/form.dart';
import 'package:playground/pages/icon_button.dart';
import 'package:playground/pages/input.dart';
import 'package:playground/pages/input_otp.dart';
import 'package:playground/pages/menubar.dart';
import 'package:playground/pages/popover.dart';
import 'package:playground/pages/progress.dart';
import 'package:playground/pages/radio_group.dart';
import 'package:playground/pages/resizable.dart';
import 'package:playground/pages/select.dart';
import 'package:playground/pages/sheet.dart';
import 'package:playground/pages/slider.dart';
import 'package:playground/pages/sonner.dart';
import 'package:playground/pages/switch.dart';
import 'package:playground/pages/table.dart';
import 'package:playground/pages/tabs.dart';
import 'package:playground/pages/textarea.dart';
import 'package:playground/pages/time_picker.dart';
import 'package:playground/pages/toast.dart';
import 'package:playground/pages/tooltip.dart';
import 'package:playground/pages/typography.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

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

final router = GoRouter(
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/button',
      builder: (context, state) {
        final style = state.uri.queryParameters['style'] ?? 'primary';
        return ButtonPage(style: PlagroundButtonStyle.values.byName(style));
      },
    ),
    GoRoute(
      path: '/icon-button',
      builder: (context, state) {
        final style = state.uri.queryParameters['style'] ?? 'primary';
        return IconButtonPage(
          style: PlagroundIconButtonStyle.values.byName(style),
        );
      },
    ),
    GoRoute(
      path: '/badge',
      builder: (context, state) {
        final style = state.uri.queryParameters['style'] ?? 'primary';
        return BadgePage(variant: ShadBadgeVariant.values.byName(style));
      },
    ),
    GoRoute(
      path: '/breadcrumb',
      builder: (context, state) {
        final style = state.uri.queryParameters['style'] ?? 'primary';
        return BreadcrumbPage(style: ShadBreadcrumbStyle.values.byName(style));
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
        return InputPage(style: InputStyle.values.byName(style));
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
        return TypographyPage(style: TypographyStyle.values.byName(style));
      },
    ),
    GoRoute(
      path: '/select',
      builder: (context, state) {
        final style = state.uri.queryParameters['style'] ?? 'fruits';
        return SelectPage(variant: SelectVariant.values.byName(style));
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
        return AlertPage(style: ShadAlertVariant.values.byName(style));
      },
    ),
    GoRoute(
      path: '/dialog',
      builder: (context, state) {
        final style =
            state.uri.queryParameters['style'] ??
            ShadDialogVariant.primary.name;
        return DialogPage(style: ShadDialogVariant.values.byName(style));
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
        return SheetPage(style: SheetStyle.values.byName(style));
      },
    ),
    GoRoute(
      path: '/progress',
      builder: (context, state) {
        final style =
            state.uri.queryParameters['style'] ??
            ProgressStyle.determinate.name;
        return ProgressPage(style: ProgressStyle.values.byName(style));
      },
    ),
    GoRoute(
      path: '/accordion',
      builder: (context, state) {
        final style =
            state.uri.queryParameters['style'] ??
            ShadAccordionVariant.single.name;
        return AccordionPage(style: ShadAccordionVariant.values.byName(style));
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
        return ResizablePage(style: ShadResizableStyle.values.byName(style));
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
        final style =
            state.uri.queryParameters['style'] ??
            ShadCalendarVariant.single.name;
        final hideNavigation = state.getBoolFromArg('hideNavigation');
        final showWeekNumbers = state.getBoolFromArg('showWeekNumbers');
        final showOutsideDays = state.getBoolFromArg('showOutsideDays');
        final fixedWeeks = state.getBoolFromArg('fixedWeeks');
        final hideWeekdayNames = state.getBoolFromArg('hideWeekdayNames');
        final reverseMonths = state.getBoolFromArg('reverseMonths');

        final captionLayout =
            state.uri.queryParameters['captionLayout'] ??
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
        final style =
            state.uri.queryParameters['style'] ??
            ShadDatePickerVariantPlayground.single.name;
        return DatePickerPage(
          style: ShadDatePickerVariantPlayground.values.byName(style),
        );
      },
    ),
    GoRoute(
      path: '/time-picker',
      builder: (context, state) {
        final style =
            state.uri.queryParameters['style'] ??
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
        return InputOTPPage(style: ShadInputOTPVariant.values.byName(style));
      },
    ),
    GoRoute(
      path: '/separator',
      builder: (context, state) {
        final style = state.uri.queryParameters['style'] ?? 'horizontal';
        return SeparatorPage(style: ShadSeparatorVariant.values.byName(style));
      },
    ),
    GoRoute(
      path: '/menubar',
      builder: (context, state) {
        return const MenubarPage();
      },
    ),
    GoRoute(
      path: '/sonner',
      builder: (context, state) {
        return const SonnerPage();
      },
    ),
    GoRoute(
      path: '/textarea',
      builder: (context, state) {
        return const TextareaPage();
      },
    ),
    GoRoute(
      path: '/carousel',
      builder: (context, state) {
        return const CarouselPage();
      },
    ),
  ],
);
