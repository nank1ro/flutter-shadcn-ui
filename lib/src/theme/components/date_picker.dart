import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:shadcn_ui/src/components/button.dart';
import 'package:shadcn_ui/src/components/calendar.dart';
import 'package:shadcn_ui/src/raw_components/portal.dart';
import 'package:shadcn_ui/src/theme/components/button_sizes.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/utils/gesture_detector.dart';
import 'package:theme_extensions_builder_annotation/theme_extensions_builder_annotation.dart';

part 'date_picker.g.theme.dart';

@themeGen
@immutable
class ShadDatePickerTheme with _$ShadDatePickerTheme {
  const ShadDatePickerTheme({
    bool canMerge = true,
    this.hideNavigation,
    this.yearSelectorMinWidth,
    this.monthSelectorMinWidth,
    this.yearSelectorPadding,
    this.monthSelectorPadding,
    this.navigationButtonSize,
    this.navigationButtonIconSize,
    this.backNavigationButtonIconData,
    this.forwardNavigationButtonIconData,
    this.navigationButtonPadding,
    this.navigationButtonDisabledOpacity,
    this.calendarDecoration,
    this.spacingBetweenMonths,
    this.runSpacingBetweenMonths,
    this.monthConstraints,
    this.calendarHeaderHeight,
    this.calendarHeaderPadding,
    this.captionLayoutGap,
    this.calendarHeaderTextStyle,
    this.weekdaysPadding,
    this.weekNumbersHeaderText,
    this.weekNumbersHeaderTextStyle,
    this.weekNumbersTextStyle,
    this.weekNumbersTextAlign,
    this.dayButtonSize,
    this.dayButtonOutsideMonthOpacity,
    this.dayButtonPadding,
    this.dayButtonDecoration,
    this.selectedDayButtonTextStyle,
    this.insideRangeDayButtonTextStyle,
    this.dayButtonOutsideMonthTextStyle,
    this.dayButtonOutsideMonthVariant,
    this.dayButtonTextStyle,
    this.dayButtonVariant,
    this.selectedDayButtonVariant,
    this.insideRangeDayButtonVariant,
    this.todayButtonVariant,
    this.weekdaysTextStyle,
    this.weekdaysTextAlign,
    this.gridMainAxisSpacing,
    this.gridCrossAxisSpacing,
    this.selectedDayButtonOusideMonthVariant,
    this.captionLayout,
    this.hideWeekdayNames,
    this.showOutsideDays,
    this.formatMonthYear,
    this.formatMonth,
    this.formatYear,
    this.formatWeekday,
    this.showWeekNumbers,
    this.weekStartsOn,
    this.fixedWeeks,
    this.allowDeselection,
    this.effects,
    this.shadows,
    this.popoverPadding,
    this.popoverDecoration,
    this.anchor,
    this.filter,
    this.cursor,
    this.size,
    this.sizesTheme,
    this.buttonVariant,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.foregroundColor,
    this.hoverForegroundColor,
    this.pressedBackgroundColor,
    this.pressedForegroundColor,
    this.disabledBackgroundColor,
    this.buttonShadows,
    this.gradient,
    this.textDecoration,
    this.hoverTextDecoration,
    this.buttonDecoration,
    this.width,
    this.height,
    this.longPressDuration,
    this.hoverStrategies,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.textDirection,
    this.gap,
    this.formatDate,
    this.formatDateRange,
    this.buttonPadding,
    this.iconData,
    this.expands,
    this.popoverReverseDuration,
  }) : _canMerge = canMerge;

  @ignore
  final bool _canMerge;

  @override
  bool get canMerge => _canMerge;

  /// {@macro ShadDatePicker.formatDate}
  final String Function(DateTime)? formatDate;

  /// {@macro ShadDatePicker.formatDateRange}
  final String Function(ShadDateTimeRange)? formatDateRange;

  /// {@macro ShadDatePicker.iconData}
  final IconData? iconData;

  // ---
  // CALENDAR
  // ---

  /// {@macro ShadCalendar.hideNavigation}
  final bool? hideNavigation;

  /// {@macro ShadCalendar.yearSelectorMinWidth}
  final double? yearSelectorMinWidth;

  /// {@macro ShadCalendar.monthSelectorMinWidth}
  final double? monthSelectorMinWidth;

  /// {@macro ShadCalendar.yearSelectorPadding}
  final EdgeInsetsGeometry? yearSelectorPadding;

  /// {@macro ShadCalendar.monthSelectorPadding}
  final EdgeInsetsGeometry? monthSelectorPadding;

  /// {@macro ShadCalendar.navigationButtonSize}
  final double? navigationButtonSize;

  /// {@macro ShadCalendar.navigationButtonIconSize}
  final double? navigationButtonIconSize;

  /// {@macro ShadCalendar.backNavigationButtonIconData}
  final IconData? backNavigationButtonIconData;

  /// {@macro ShadCalendar.forwardNavigationButtonIconData}
  final IconData? forwardNavigationButtonIconData;

  /// {@macro ShadCalendar.navigationButtonPadding}
  final EdgeInsetsGeometry? navigationButtonPadding;

  /// {@macro ShadCalendar.navigationButtonDisabledOpacity}
  final double? navigationButtonDisabledOpacity;

  /// {@macro ShadCalendar.decoration}
  final ShadDecoration? calendarDecoration;

  /// {@macro ShadCalendar.spacingBetweenMonths}
  final double? spacingBetweenMonths;

  /// {@macro ShadCalendar.runSpacingBetweenMonths}
  final double? runSpacingBetweenMonths;

  /// {@macro ShadCalendar.monthConstraints}
  final BoxConstraints? monthConstraints;

  /// {@macro ShadCalendar.headerHeight}
  final double? calendarHeaderHeight;

  /// {@macro ShadCalendar.headerPadding}
  final EdgeInsetsGeometry? calendarHeaderPadding;

  /// {@macro ShadCalendar.captionLayoutGap}
  final double? captionLayoutGap;

  /// {@macro ShadCalendar.headerTextStyle}
  final TextStyle? calendarHeaderTextStyle;

  /// {@macro ShadCalendar.weekdaysPadding}
  final EdgeInsetsGeometry? weekdaysPadding;

  /// {@macro ShadCalendar.weekdaysTextStyle}
  final TextStyle? weekdaysTextStyle;

  /// {@macro ShadCalendar.weekdaysTextAlign}
  final TextAlign? weekdaysTextAlign;

  /// {@macro ShadCalendar.weekNumbersHeaderText}
  final String? weekNumbersHeaderText;

  /// {@macro ShadCalendar.weekNumbersHeaderTextStyle}
  final TextStyle? weekNumbersHeaderTextStyle;

  /// {@macro ShadCalendar.weekNumbersTextStyle}
  final TextStyle? weekNumbersTextStyle;

  /// {@macro ShadCalendar.weekNumbersTextAlign}
  final TextAlign? weekNumbersTextAlign;

  /// {@macro ShadCalendar.dayButtonSize}
  final double? dayButtonSize;

  /// {@macro ShadCalendar.dayButtonOutsideMonthOpacity}
  final double? dayButtonOutsideMonthOpacity;

  /// {@macro ShadCalendar.dayButtonPadding}
  final EdgeInsetsGeometry? dayButtonPadding;

  /// {@macro ShadCalendar.dayButtonDecoration}
  final ShadDecoration? dayButtonDecoration;

  /// {@macro ShadCalendar.selectedDayButtonTextStyle}
  final TextStyle? selectedDayButtonTextStyle;

  /// {@macro ShadCalendar.insideRangeDayButtonTextStyle}
  final TextStyle? insideRangeDayButtonTextStyle;

  /// {@macro ShadCalendar.dayButtonTextStyle}
  final TextStyle? dayButtonTextStyle;

  /// {@macro ShadCalendar.dayButtonVariant}
  final ShadButtonVariant? dayButtonVariant;

  /// {@macro ShadCalendar.selectedDayButtonVariant}
  final ShadButtonVariant? selectedDayButtonVariant;

  /// {@macro ShadCalendar.insideRangeDayButtonVariant}
  final ShadButtonVariant? insideRangeDayButtonVariant;

  /// {@macro ShadCalendar.todayButtonVariant}
  final ShadButtonVariant? todayButtonVariant;

  /// {@macro ShadCalendar.gridMainAxisSpacing}
  final double? gridMainAxisSpacing;

  /// {@macro ShadCalendar.gridCrossAxisSpacing}
  final double? gridCrossAxisSpacing;

  /// {@macro ShadCalendar.dayButtonOutsideMonthTextStyle}
  final TextStyle? dayButtonOutsideMonthTextStyle;

  /// {@macro ShadCalendar.dayButtonOutsideMonthVariant}
  final ShadButtonVariant? dayButtonOutsideMonthVariant;

  /// {@macro ShadCalendar.selectedDayButtonOusideMonthVariant}
  final ShadButtonVariant? selectedDayButtonOusideMonthVariant;

  /// {@macro ShadCalendar.captionLayout}
  final ShadCalendarCaptionLayout? captionLayout;

  /// {@macro ShadCalendar.hideWeekdayNames}
  final bool? hideWeekdayNames;

  /// {@macro ShadCalendar.showOutsideDays}
  final bool? showOutsideDays;

  /// {@macro ShadCalendar.formatMonthYear}
  final String Function(DateTime date)? formatMonthYear;

  /// {@macro ShadCalendar.formatMonth}
  final String Function(DateTime date)? formatMonth;

  /// {@macro ShadCalendar.formatYear}
  final String Function(DateTime date)? formatYear;

  /// {@macro ShadCalendar.formatWeekday}
  final String Function(DateTime date)? formatWeekday;

  /// {@macro ShadCalendar.showWeekNumbers}
  final bool? showWeekNumbers;

  /// {@macro ShadCalendar.weekStartsOn}
  final int? weekStartsOn;

  /// {@macro ShadCalendar.fixedWeeks}
  final bool? fixedWeeks;

  /// {@macro ShadCalendar.allowDeselection}
  final bool? allowDeselection;

  // ---
  // POPOVER
  // ---

  /// {@macro popover.effects}
  final List<Effect<dynamic>>? effects;

  /// {@macro popover.shadows}
  final List<BoxShadow>? shadows;

  /// {@macro popover.padding}
  final EdgeInsetsGeometry? popoverPadding;

  /// {@macro popover.decoration}
  final ShadDecoration? popoverDecoration;

  /// {@macro popover.anchor}
  final ShadAnchorBase? anchor;

  /// {@macro popover.filter}
  final ImageFilter? filter;

  /// {@macro ShadPopover.reverseDuration}
  final Duration? popoverReverseDuration;

  // ---
  // BUTTON
  // ---

  /// {@macro ShadButton.cursor}
  final MouseCursor? cursor;

  /// {@macro ShadButton.size}
  final ShadButtonSize? size;

  /// {@macro ShadButton.sizesTheme}
  final ShadButtonSizesTheme? sizesTheme;

  /// {@macro ShadButton.variant}
  final ShadButtonVariant? buttonVariant;

  /// {@macro ShadButton.bakcgroundColor}
  final Color? backgroundColor;

  /// {@macro ShadButton.hoverBackgroundColor}
  final Color? hoverBackgroundColor;

  /// {@macro ShadButton.foregroundColor}
  final Color? foregroundColor;

  /// {@macro ShadButton.hoverForegroundColor}
  final Color? hoverForegroundColor;

  /// {@macro ShadButton.pressedBackgroundColor}
  final Color? pressedBackgroundColor;

  /// {@macro ShadButton.pressedForegroundColor}
  final Color? pressedForegroundColor;

  /// {@macro ShadButton.disabledBackgroundColor}
  final Color? disabledBackgroundColor;

  /// {@macro ShadButton.shadows}
  final List<BoxShadow>? buttonShadows;

  /// {@macro ShadButton.gradient}
  final Gradient? gradient;

  /// {@macro ShadButton.textDecoration}
  final TextDecoration? textDecoration;

  /// {@macro ShadButton.hoverTextDecoration}
  final TextDecoration? hoverTextDecoration;

  /// {@macro ShadButton.decoration}
  final ShadDecoration? buttonDecoration;

  /// {@macro ShadButton.width}
  final double? width;

  /// {@macro ShadowButton.height}
  final double? height;

  /// {@macro ShadButton.longPressDuration}
  final Duration? longPressDuration;

  /// {@macro ShadButton.hoverStrategies}
  final ShadHoverStrategies? hoverStrategies;

  /// {@macro ShadButton.mainAxisAlignment}
  final MainAxisAlignment? mainAxisAlignment;

  /// {@macro ShadButton.crossAxisAlignment}
  final CrossAxisAlignment? crossAxisAlignment;

  /// {@macro ShadButton.textDirection}
  final TextDirection? textDirection;

  /// {@macro ShadButton.gap}
  final double? gap;

  /// {@macro ShadButton.padding}
  final EdgeInsetsGeometry? buttonPadding;

  /// {@macro ShadButton.expands}
  final bool? expands;

  static ShadDatePickerTheme? lerp(
    ShadDatePickerTheme? a,
    ShadDatePickerTheme? b,
    double t,
  ) => _$ShadDatePickerTheme.lerp(a, b, t);
}
