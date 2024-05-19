import 'package:flutter/material.dart';
import 'package:shadcn_ui/src/theme/color_scheme/base.dart';
import 'package:shadcn_ui/src/theme/components/accordion.dart';
import 'package:shadcn_ui/src/theme/components/alert.dart';
import 'package:shadcn_ui/src/theme/components/avatar.dart';
import 'package:shadcn_ui/src/theme/components/badge.dart';
import 'package:shadcn_ui/src/theme/components/button.dart';
import 'package:shadcn_ui/src/theme/components/card.dart';
import 'package:shadcn_ui/src/theme/components/checkbox.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/theme/components/dialog.dart';
import 'package:shadcn_ui/src/theme/components/input.dart';
import 'package:shadcn_ui/src/theme/components/option.dart';
import 'package:shadcn_ui/src/theme/components/popover.dart';
import 'package:shadcn_ui/src/theme/components/progress.dart';
import 'package:shadcn_ui/src/theme/components/radio.dart';
import 'package:shadcn_ui/src/theme/components/resizable.dart';
import 'package:shadcn_ui/src/theme/components/select.dart';
import 'package:shadcn_ui/src/theme/components/sheet.dart';
import 'package:shadcn_ui/src/theme/components/slider.dart';
import 'package:shadcn_ui/src/theme/components/switch.dart';
import 'package:shadcn_ui/src/theme/components/table.dart';
import 'package:shadcn_ui/src/theme/components/toast.dart';
import 'package:shadcn_ui/src/theme/components/tooltip.dart';
import 'package:shadcn_ui/src/theme/text_theme/theme.dart';
import 'package:shadcn_ui/src/utils/gesture_detector.dart';
import 'package:shadcn_ui/src/utils/responsive.dart';

@immutable
abstract class ShadBaseTheme {
  const ShadBaseTheme({
    required this.colorScheme,
    required this.brightness,
    required this.extensions,
    required this.primaryButtonTheme,
    required this.secondaryButtonTheme,
    required this.destructiveButtonTheme,
    required this.outlineButtonTheme,
    required this.ghostButtonTheme,
    required this.linkButtonTheme,
    required this.primaryBadgeTheme,
    required this.secondaryBadgeTheme,
    required this.destructiveBadgeTheme,
    required this.outlineBadgeTheme,
    required this.radius,
    required this.avatarTheme,
    required this.buttonSizesTheme,
    required this.tooltipTheme,
    required this.popoverTheme,
    required this.decoration,
    required this.textTheme,
    required this.disabledOpacity,
    required this.selectTheme,
    required this.optionTheme,
    required this.cardTheme,
    required this.switchTheme,
    required this.checkboxTheme,
    required this.inputTheme,
    required this.radioTheme,
    required this.primaryToastTheme,
    required this.destructiveToastTheme,
    required this.breakpoints,
    required this.primaryAlertTheme,
    required this.destructiveAlertTheme,
    required this.primaryDialogTheme,
    required this.alertDialogTheme,
    required this.sliderTheme,
    required this.sheetTheme,
    required this.progressTheme,
    required this.accordionTheme,
    required this.tableTheme,
    required this.resizableTheme,
    required this.hoverStrategies,
    required this.disableSecondaryBorder,
  });

  final ShadColorScheme colorScheme;
  final Brightness brightness;
  final Iterable<ThemeExtension<dynamic>>? extensions;
  final ShadButtonTheme primaryButtonTheme;
  final ShadButtonTheme secondaryButtonTheme;
  final ShadButtonTheme destructiveButtonTheme;
  final ShadButtonTheme outlineButtonTheme;
  final ShadButtonTheme ghostButtonTheme;
  final ShadButtonTheme linkButtonTheme;
  final ShadBadgeTheme primaryBadgeTheme;
  final ShadBadgeTheme secondaryBadgeTheme;
  final ShadBadgeTheme destructiveBadgeTheme;
  final ShadBadgeTheme outlineBadgeTheme;
  final BorderRadius radius;
  final ShadAvatarTheme avatarTheme;
  final ShadButtonSizesTheme buttonSizesTheme;
  final ShadTooltipTheme tooltipTheme;
  final ShadPopoverTheme popoverTheme;
  final ShadDecoration decoration;
  final ShadTextTheme textTheme;
  final double disabledOpacity;
  final ShadSelectTheme selectTheme;
  final ShadOptionTheme optionTheme;
  final ShadCardTheme cardTheme;
  final ShadSwitchTheme switchTheme;
  final ShadCheckboxTheme checkboxTheme;
  final ShadInputTheme inputTheme;
  final ShadRadioTheme radioTheme;
  final ShadToastTheme primaryToastTheme;
  final ShadToastTheme destructiveToastTheme;
  final ShadBreakpoints breakpoints;
  final ShadAlertTheme primaryAlertTheme;
  final ShadAlertTheme destructiveAlertTheme;
  final ShadDialogTheme primaryDialogTheme;
  final ShadDialogTheme alertDialogTheme;
  final ShadSliderTheme sliderTheme;
  final ShadSheetTheme sheetTheme;
  final ShadProgressTheme progressTheme;
  final ShadAccordionTheme accordionTheme;
  final ShadTableTheme tableTheme;
  final ShadResizableTheme resizableTheme;
  final ShadHoverStrategies hoverStrategies;
  final bool disableSecondaryBorder;
}
