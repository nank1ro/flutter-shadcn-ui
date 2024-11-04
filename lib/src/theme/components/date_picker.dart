import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:shadcn_ui/shadcn_ui.dart';

@immutable
class ShadDatePickerTheme {
  const ShadDatePickerTheme({
    this.merge = true,
    this.hideNavigation,
    this.yearSelectorMinWidth,
    this.monthSelectorMinWidth,
    this.yearSelectorPadding,
    this.monthSelectorPadding,
    this.navigationButtonSize,
    this.navigationButtonIconSize,
    this.backNavigationButtonSrc,
    this.forwardNavigationButtonSrc,
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
    this.applyIconColorFilter,
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
    this.iconSrc,
  });

  final bool merge;

  /// {@macro ShadDatePicker.formatDate}
  final String Function(DateTime)? formatDate;

  /// {@macro ShadDatePicker.formatDateRange}
  final String Function(ShadDateTimeRange)? formatDateRange;

  /// {@macro ShadDatePicker.iconSrc}
  final ShadImageSrc? iconSrc;

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
  final EdgeInsets? yearSelectorPadding;

  /// {@macro ShadCalendar.monthSelectorPadding}
  final EdgeInsets? monthSelectorPadding;

  /// {@macro ShadCalendar.navigationButtonSize}
  final double? navigationButtonSize;

  /// {@macro ShadCalendar.navigationButtonIconSize}
  final double? navigationButtonIconSize;

  /// {@macro ShadCalendar.backNavigationButtonSrc}
  final ShadImageSrc? backNavigationButtonSrc;

  /// {@macro ShadCalendar.forwardNavigationButtonSrc}
  final ShadImageSrc? forwardNavigationButtonSrc;

  /// {@macro ShadCalendar.navigationButtonPadding}
  final EdgeInsets? navigationButtonPadding;

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
  final EdgeInsets? calendarHeaderPadding;

  /// {@macro ShadCalendar.captionLayoutGap}
  final double? captionLayoutGap;

  /// {@macro ShadCalendar.headerTextStyle}
  final TextStyle? calendarHeaderTextStyle;

  /// {@macro ShadCalendar.weekdaysPadding}
  final EdgeInsets? weekdaysPadding;

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
  final EdgeInsets? dayButtonPadding;

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

  // ---
  // BUTTON
  // ---

  /// {@macro ShadButton.applyIconColorFilter}
  final bool? applyIconColorFilter;

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

  static ShadDatePickerTheme lerp(
    ShadDatePickerTheme a,
    ShadDatePickerTheme b,
    double t,
  ) {
    if (identical(a, b)) return a;
    return ShadDatePickerTheme(
      merge: b.merge,
      hideNavigation: t < .5 ? a.hideNavigation : b.hideNavigation,
      yearSelectorMinWidth:
          lerpDouble(a.yearSelectorMinWidth, b.yearSelectorMinWidth, t),
      monthSelectorMinWidth:
          lerpDouble(a.monthSelectorMinWidth, b.monthSelectorMinWidth, t),
      yearSelectorPadding: EdgeInsets.lerp(
        a.yearSelectorPadding,
        b.yearSelectorPadding,
        t,
      ),
      monthSelectorPadding: EdgeInsets.lerp(
        a.monthSelectorPadding,
        b.monthSelectorPadding,
        t,
      ),
      navigationButtonSize:
          lerpDouble(a.navigationButtonSize, b.navigationButtonSize, t),
      navigationButtonIconSize: lerpDouble(
        a.navigationButtonIconSize,
        b.navigationButtonIconSize,
        t,
      ),
      backNavigationButtonSrc:
          t < .5 ? a.backNavigationButtonSrc : b.backNavigationButtonSrc,
      forwardNavigationButtonSrc:
          t < .5 ? a.forwardNavigationButtonSrc : b.forwardNavigationButtonSrc,
      navigationButtonPadding: EdgeInsets.lerp(
        a.navigationButtonPadding,
        b.navigationButtonPadding,
        t,
      ),
      navigationButtonDisabledOpacity: lerpDouble(
        a.navigationButtonDisabledOpacity,
        b.navigationButtonDisabledOpacity,
        t,
      ),
      calendarDecoration:
          ShadDecoration.lerp(a.calendarDecoration, b.calendarDecoration, t),
      spacingBetweenMonths:
          lerpDouble(a.spacingBetweenMonths, b.spacingBetweenMonths, t),
      runSpacingBetweenMonths: lerpDouble(
        a.runSpacingBetweenMonths,
        b.runSpacingBetweenMonths,
        t,
      ),
      monthConstraints: BoxConstraints.lerp(
        a.monthConstraints,
        b.monthConstraints,
        t,
      ),
      calendarHeaderHeight:
          lerpDouble(a.calendarHeaderHeight, b.calendarHeaderHeight, t),
      calendarHeaderPadding: EdgeInsets.lerp(
        a.calendarHeaderPadding,
        b.calendarHeaderPadding,
        t,
      ),
      captionLayoutGap: lerpDouble(a.captionLayoutGap, b.captionLayoutGap, t),
      calendarHeaderTextStyle: TextStyle.lerp(
        a.calendarHeaderTextStyle,
        b.calendarHeaderTextStyle,
        t,
      ),
      weekdaysPadding: EdgeInsets.lerp(
        a.weekdaysPadding,
        b.weekdaysPadding,
        t,
      ),
      weekNumbersHeaderText:
          t < .5 ? a.weekNumbersHeaderText : b.weekNumbersHeaderText,
      weekNumbersHeaderTextStyle: TextStyle.lerp(
        a.weekNumbersHeaderTextStyle,
        b.weekNumbersHeaderTextStyle,
        t,
      ),
      weekNumbersTextStyle: TextStyle.lerp(
        a.weekNumbersTextStyle,
        b.weekNumbersTextStyle,
        t,
      ),
      weekNumbersTextAlign:
          t < .5 ? a.weekNumbersTextAlign : b.weekNumbersTextAlign,
      dayButtonSize: lerpDouble(a.dayButtonSize, b.dayButtonSize, t),
      dayButtonOutsideMonthOpacity: lerpDouble(
        a.dayButtonOutsideMonthOpacity,
        b.dayButtonOutsideMonthOpacity,
        t,
      ),
      dayButtonPadding: EdgeInsets.lerp(
        a.dayButtonPadding,
        b.dayButtonPadding,
        t,
      ),
      dayButtonDecoration: ShadDecoration.lerp(
        a.dayButtonDecoration,
        b.dayButtonDecoration,
        t,
      ),
      selectedDayButtonTextStyle: TextStyle.lerp(
        a.selectedDayButtonTextStyle,
        b.selectedDayButtonTextStyle,
        t,
      ),
      insideRangeDayButtonTextStyle: TextStyle.lerp(
        a.insideRangeDayButtonTextStyle,
        b.insideRangeDayButtonTextStyle,
        t,
      ),
      dayButtonTextStyle: TextStyle.lerp(
        a.dayButtonTextStyle,
        b.dayButtonTextStyle,
        t,
      ),
      dayButtonVariant: t < .5 ? a.dayButtonVariant : b.dayButtonVariant,
      selectedDayButtonVariant:
          t < .5 ? a.selectedDayButtonVariant : b.selectedDayButtonVariant,
      insideRangeDayButtonVariant: t < .5
          ? a.insideRangeDayButtonVariant
          : b.insideRangeDayButtonVariant,
      todayButtonVariant: t < .5 ? a.todayButtonVariant : b.todayButtonVariant,
      weekdaysTextStyle: TextStyle.lerp(
        a.weekdaysTextStyle,
        b.weekdaysTextStyle,
        t,
      ),
      weekdaysTextAlign: t < .5 ? a.weekdaysTextAlign : b.weekdaysTextAlign,
      gridMainAxisSpacing:
          lerpDouble(a.gridMainAxisSpacing, b.gridMainAxisSpacing, t),
      gridCrossAxisSpacing:
          lerpDouble(a.gridCrossAxisSpacing, b.gridCrossAxisSpacing, t),
      dayButtonOutsideMonthTextStyle: TextStyle.lerp(
        a.dayButtonOutsideMonthTextStyle,
        b.dayButtonOutsideMonthTextStyle,
        t,
      ),
      dayButtonOutsideMonthVariant: t < .5
          ? a.dayButtonOutsideMonthVariant
          : b.dayButtonOutsideMonthVariant,
      selectedDayButtonOusideMonthVariant: t < .5
          ? a.selectedDayButtonOusideMonthVariant
          : b.selectedDayButtonOusideMonthVariant,
      captionLayout: t < .5 ? a.captionLayout : b.captionLayout,
      hideWeekdayNames: t < .5 ? a.hideWeekdayNames : b.hideWeekdayNames,
      showOutsideDays: t < .5 ? a.showOutsideDays : b.showOutsideDays,
      formatMonthYear: t < .5 ? a.formatMonthYear : b.formatMonthYear,
      formatMonth: t < .5 ? a.formatMonth : b.formatMonth,
      formatYear: t < .5 ? a.formatYear : b.formatYear,
      formatWeekday: t < .5 ? a.formatWeekday : b.formatWeekday,
      showWeekNumbers: t < .5 ? a.showWeekNumbers : b.showWeekNumbers,
      weekStartsOn: t < .5 ? a.weekStartsOn : b.weekStartsOn,
      fixedWeeks: t < .5 ? a.fixedWeeks : b.fixedWeeks,
      allowDeselection: t < .5 ? a.allowDeselection : b.allowDeselection,
      effects: t < 0.5 ? a.effects : b.effects,
      shadows: t < 0.5 ? a.shadows : b.shadows,
      popoverPadding:
          EdgeInsetsGeometry.lerp(a.popoverPadding, b.popoverPadding, t),
      popoverDecoration:
          ShadDecoration.lerp(a.calendarDecoration, b.calendarDecoration, t),
      anchor: t < 0.5 ? a.anchor : b.anchor,
      filter: t < 0.5 ? a.filter : b.filter,
      applyIconColorFilter:
          t < 0.5 ? a.applyIconColorFilter : b.applyIconColorFilter,
      sizesTheme: ShadButtonSizesTheme.lerp(
        a.sizesTheme,
        b.sizesTheme,
        t,
      ),
      backgroundColor: Color.lerp(a.backgroundColor, b.backgroundColor, t),
      hoverBackgroundColor:
          Color.lerp(a.hoverBackgroundColor, b.hoverBackgroundColor, t),
      foregroundColor: Color.lerp(a.foregroundColor, b.foregroundColor, t),
      hoverForegroundColor:
          Color.lerp(a.hoverForegroundColor, b.hoverForegroundColor, t),
      pressedBackgroundColor:
          Color.lerp(a.pressedBackgroundColor, b.pressedBackgroundColor, t),
      pressedForegroundColor:
          Color.lerp(a.pressedForegroundColor, b.pressedForegroundColor, t),
      buttonShadows: t < 0.5 ? a.shadows : b.shadows,
      gradient: t < 0.5 ? a.gradient : b.gradient,
      textDecoration: t < 0.5 ? a.textDecoration : b.textDecoration,
      hoverTextDecoration:
          t < 0.5 ? a.hoverTextDecoration : b.hoverTextDecoration,
      cursor: t < 0.5 ? a.cursor : b.cursor,
      size: t < 0.5 ? a.size : b.size,
      buttonDecoration:
          ShadDecoration.lerp(a.calendarDecoration, b.calendarDecoration, t),
      width: lerpDouble(a.width, b.width, t),
      height: lerpDouble(a.height, b.height, t),
      mainAxisAlignment: t < 0.5 ? a.mainAxisAlignment : b.mainAxisAlignment,
      crossAxisAlignment: t < 0.5 ? a.crossAxisAlignment : b.crossAxisAlignment,
      longPressDuration:
          a.longPressDuration != null && b.longPressDuration != null
              ? lerpDuration(a.longPressDuration!, b.longPressDuration!, t)
              : b.longPressDuration,
      hoverStrategies: t < 0.5 ? a.hoverStrategies : b.hoverStrategies,
      textDirection: t < 0.5 ? a.textDirection : b.textDirection,
      gap: t < 0.5 ? a.gap : b.gap,
      formatDate: t < 0.5 ? a.formatDate : b.formatDate,
      formatDateRange: t < 0.5 ? a.formatDateRange : b.formatDateRange,
      buttonVariant: t < 0.5 ? a.buttonVariant : b.buttonVariant,
      buttonPadding:
          EdgeInsetsGeometry.lerp(a.buttonPadding, b.buttonPadding, t),
      iconSrc: t < 0.5 ? a.iconSrc : b.iconSrc,
    );
  }

  ShadDatePickerTheme mergeWith(ShadDatePickerTheme? other) {
    if (other == null) return this;
    if (!other.merge) return other;
    return copyWith(
      hideNavigation: other.hideNavigation ?? hideNavigation,
      yearSelectorMinWidth: other.yearSelectorMinWidth ?? yearSelectorMinWidth,
      monthSelectorMinWidth:
          other.monthSelectorMinWidth ?? monthSelectorMinWidth,
      yearSelectorPadding: other.yearSelectorPadding ?? yearSelectorPadding,
      monthSelectorPadding: other.monthSelectorPadding ?? monthSelectorPadding,
      navigationButtonSize: other.navigationButtonSize ?? navigationButtonSize,
      navigationButtonIconSize:
          other.navigationButtonIconSize ?? navigationButtonIconSize,
      backNavigationButtonSrc:
          other.backNavigationButtonSrc ?? backNavigationButtonSrc,
      forwardNavigationButtonSrc:
          other.forwardNavigationButtonSrc ?? forwardNavigationButtonSrc,
      navigationButtonPadding:
          other.navigationButtonPadding ?? navigationButtonPadding,
      navigationButtonDisabledOpacity: other.navigationButtonDisabledOpacity ??
          navigationButtonDisabledOpacity,
      calendarDecoration: other.calendarDecoration ?? calendarDecoration,
      spacingBetweenMonths: other.spacingBetweenMonths ?? spacingBetweenMonths,
      runSpacingBetweenMonths:
          other.runSpacingBetweenMonths ?? runSpacingBetweenMonths,
      monthConstraints: other.monthConstraints ?? monthConstraints,
      calendarHeaderHeight: other.calendarHeaderHeight ?? calendarHeaderHeight,
      calendarHeaderPadding:
          other.calendarHeaderPadding ?? calendarHeaderPadding,
      captionLayoutGap: other.captionLayoutGap ?? captionLayoutGap,
      calendarHeaderTextStyle:
          other.calendarHeaderTextStyle ?? calendarHeaderTextStyle,
      weekdaysPadding: other.weekdaysPadding ?? weekdaysPadding,
      weekNumbersHeaderText:
          other.weekNumbersHeaderText ?? weekNumbersHeaderText,
      weekNumbersHeaderTextStyle:
          other.weekNumbersHeaderTextStyle ?? weekNumbersHeaderTextStyle,
      weekNumbersTextStyle: other.weekNumbersTextStyle ?? weekNumbersTextStyle,
      weekNumbersTextAlign: other.weekNumbersTextAlign ?? weekNumbersTextAlign,
      dayButtonSize: other.dayButtonSize ?? dayButtonSize,
      dayButtonOutsideMonthOpacity:
          other.dayButtonOutsideMonthOpacity ?? dayButtonOutsideMonthOpacity,
      dayButtonPadding: other.dayButtonPadding ?? dayButtonPadding,
      dayButtonDecoration: other.dayButtonDecoration ?? dayButtonDecoration,
      selectedDayButtonTextStyle:
          other.selectedDayButtonTextStyle ?? selectedDayButtonTextStyle,
      insideRangeDayButtonTextStyle:
          other.insideRangeDayButtonTextStyle ?? insideRangeDayButtonTextStyle,
      dayButtonTextStyle: other.dayButtonTextStyle ?? dayButtonTextStyle,
      dayButtonVariant: other.dayButtonVariant ?? dayButtonVariant,
      selectedDayButtonVariant:
          other.selectedDayButtonVariant ?? selectedDayButtonVariant,
      insideRangeDayButtonVariant:
          other.insideRangeDayButtonVariant ?? insideRangeDayButtonVariant,
      todayButtonVariant: other.todayButtonVariant ?? todayButtonVariant,
      weekdaysTextStyle: other.weekdaysTextStyle ?? weekdaysTextStyle,
      weekdaysTextAlign: other.weekdaysTextAlign ?? weekdaysTextAlign,
      gridMainAxisSpacing: other.gridMainAxisSpacing ?? gridMainAxisSpacing,
      gridCrossAxisSpacing: other.gridCrossAxisSpacing ?? gridCrossAxisSpacing,
      dayButtonOutsideMonthTextStyle: other.dayButtonOutsideMonthTextStyle ??
          dayButtonOutsideMonthTextStyle,
      dayButtonOutsideMonthVariant:
          other.dayButtonOutsideMonthVariant ?? dayButtonOutsideMonthVariant,
      selectedDayButtonOusideMonthVariant:
          other.selectedDayButtonOusideMonthVariant ??
              selectedDayButtonOusideMonthVariant,
      captionLayout: other.captionLayout ?? captionLayout,
      hideWeekdayNames: other.hideWeekdayNames ?? hideWeekdayNames,
      showOutsideDays: other.showOutsideDays ?? showOutsideDays,
      formatMonthYear: other.formatMonthYear ?? formatMonthYear,
      formatMonth: other.formatMonth ?? formatMonth,
      formatYear: other.formatYear ?? formatYear,
      formatWeekday: other.formatWeekday ?? formatWeekday,
      showWeekNumbers: other.showWeekNumbers ?? showWeekNumbers,
      weekStartsOn: other.weekStartsOn ?? weekStartsOn,
      fixedWeeks: other.fixedWeeks ?? fixedWeeks,
      allowDeselection: other.allowDeselection ?? allowDeselection,
      effects: other.effects,
      shadows: other.shadows,
      popoverPadding: other.popoverPadding,
      popoverDecoration:
          popoverDecoration?.mergeWith(other.popoverDecoration) ??
              other.popoverDecoration,
      anchor: other.anchor,
      filter: other.filter,
      applyIconColorFilter: other.applyIconColorFilter,
      cursor: other.cursor,
      size: other.size,
      backgroundColor: other.backgroundColor,
      hoverBackgroundColor: other.hoverBackgroundColor,
      foregroundColor: other.foregroundColor,
      hoverForegroundColor: other.hoverForegroundColor,
      pressedBackgroundColor: other.pressedBackgroundColor,
      pressedForegroundColor: other.pressedForegroundColor,
      buttonShadows: other.buttonShadows,
      gradient: other.gradient,
      textDecoration: other.textDecoration,
      hoverTextDecoration: other.hoverTextDecoration,
      buttonDecoration: buttonDecoration?.mergeWith(other.buttonDecoration) ??
          other.buttonDecoration,
      width: other.width,
      height: other.height,
      mainAxisAlignment: other.mainAxisAlignment,
      crossAxisAlignment: other.crossAxisAlignment,
      longPressDuration: other.longPressDuration,
      hoverStrategies: other.hoverStrategies,
      textDirection: other.textDirection,
      gap: other.gap,
      formatDate: other.formatDate,
      formatDateRange: other.formatDateRange,
      buttonVariant: other.buttonVariant,
      buttonPadding: other.buttonPadding,
      iconSrc: other.iconSrc,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShadDatePickerTheme &&
        other.merge == merge &&
        other.hideNavigation == hideNavigation &&
        other.yearSelectorMinWidth == yearSelectorMinWidth &&
        other.monthSelectorMinWidth == monthSelectorMinWidth &&
        other.yearSelectorPadding == yearSelectorPadding &&
        other.monthSelectorPadding == monthSelectorPadding &&
        other.navigationButtonSize == navigationButtonSize &&
        other.navigationButtonIconSize == navigationButtonIconSize &&
        other.backNavigationButtonSrc == backNavigationButtonSrc &&
        other.forwardNavigationButtonSrc == forwardNavigationButtonSrc &&
        other.navigationButtonPadding == navigationButtonPadding &&
        other.navigationButtonDisabledOpacity ==
            navigationButtonDisabledOpacity &&
        other.calendarDecoration == calendarDecoration &&
        other.spacingBetweenMonths == spacingBetweenMonths &&
        other.runSpacingBetweenMonths == runSpacingBetweenMonths &&
        other.monthConstraints == monthConstraints &&
        other.calendarHeaderHeight == calendarHeaderHeight &&
        other.calendarHeaderPadding == calendarHeaderPadding &&
        other.captionLayoutGap == captionLayoutGap &&
        other.calendarHeaderTextStyle == calendarHeaderTextStyle &&
        other.weekdaysPadding == weekdaysPadding &&
        other.weekdaysTextStyle == weekdaysTextStyle &&
        other.weekdaysTextAlign == weekdaysTextAlign &&
        other.weekNumbersHeaderText == weekNumbersHeaderText &&
        other.weekNumbersHeaderTextStyle == weekNumbersHeaderTextStyle &&
        other.weekNumbersTextStyle == weekNumbersTextStyle &&
        other.weekNumbersTextAlign == weekNumbersTextAlign &&
        other.dayButtonSize == dayButtonSize &&
        other.dayButtonOutsideMonthOpacity == dayButtonOutsideMonthOpacity &&
        other.dayButtonPadding == dayButtonPadding &&
        other.dayButtonDecoration == dayButtonDecoration &&
        other.selectedDayButtonTextStyle == selectedDayButtonTextStyle &&
        other.insideRangeDayButtonTextStyle == insideRangeDayButtonTextStyle &&
        other.dayButtonTextStyle == dayButtonTextStyle &&
        other.dayButtonVariant == dayButtonVariant &&
        other.selectedDayButtonVariant == selectedDayButtonVariant &&
        other.insideRangeDayButtonVariant == insideRangeDayButtonVariant &&
        other.todayButtonVariant == todayButtonVariant &&
        other.gridMainAxisSpacing == gridMainAxisSpacing &&
        other.gridCrossAxisSpacing == gridCrossAxisSpacing &&
        other.dayButtonOutsideMonthTextStyle ==
            dayButtonOutsideMonthTextStyle &&
        other.dayButtonOutsideMonthVariant == dayButtonOutsideMonthVariant &&
        other.selectedDayButtonOusideMonthVariant ==
            selectedDayButtonOusideMonthVariant &&
        other.captionLayout == captionLayout &&
        other.hideWeekdayNames == hideWeekdayNames &&
        other.showOutsideDays == showOutsideDays &&
        other.formatMonthYear == formatMonthYear &&
        other.formatMonth == formatMonth &&
        other.formatYear == formatYear &&
        other.formatWeekday == formatWeekday &&
        other.showWeekNumbers == showWeekNumbers &&
        other.weekStartsOn == weekStartsOn &&
        other.fixedWeeks == fixedWeeks &&
        other.allowDeselection == allowDeselection &&
        listEquals(other.effects, effects) &&
        listEquals(other.shadows, shadows) &&
        other.popoverPadding == popoverPadding &&
        other.calendarDecoration == calendarDecoration &&
        other.anchor == anchor &&
        other.filter == filter &&
        other.applyIconColorFilter == applyIconColorFilter &&
        other.cursor == cursor &&
        other.size == size &&
        other.sizesTheme == sizesTheme &&
        other.backgroundColor == backgroundColor &&
        other.hoverBackgroundColor == hoverBackgroundColor &&
        other.foregroundColor == foregroundColor &&
        other.hoverForegroundColor == hoverForegroundColor &&
        other.pressedBackgroundColor == pressedBackgroundColor &&
        other.pressedForegroundColor == pressedForegroundColor &&
        listEquals(other.shadows, shadows) &&
        other.gradient == gradient &&
        other.textDecoration == textDecoration &&
        other.hoverTextDecoration == hoverTextDecoration &&
        other.calendarDecoration == calendarDecoration &&
        other.width == width &&
        other.height == height &&
        other.mainAxisAlignment == mainAxisAlignment &&
        other.crossAxisAlignment == crossAxisAlignment &&
        other.longPressDuration == longPressDuration &&
        other.hoverStrategies == hoverStrategies &&
        other.textDirection == textDirection &&
        other.gap == gap &&
        other.formatDate == formatDate &&
        other.formatDateRange == formatDateRange &&
        other.buttonVariant == buttonVariant &&
        other.buttonPadding == buttonPadding &&
        other.iconSrc == iconSrc;
  }

  @override
  int get hashCode {
    return merge.hashCode ^
        hideNavigation.hashCode ^
        yearSelectorMinWidth.hashCode ^
        monthSelectorMinWidth.hashCode ^
        yearSelectorPadding.hashCode ^
        monthSelectorPadding.hashCode ^
        navigationButtonSize.hashCode ^
        navigationButtonIconSize.hashCode ^
        backNavigationButtonSrc.hashCode ^
        forwardNavigationButtonSrc.hashCode ^
        navigationButtonPadding.hashCode ^
        navigationButtonDisabledOpacity.hashCode ^
        calendarDecoration.hashCode ^
        spacingBetweenMonths.hashCode ^
        runSpacingBetweenMonths.hashCode ^
        monthConstraints.hashCode ^
        calendarHeaderHeight.hashCode ^
        calendarHeaderPadding.hashCode ^
        captionLayoutGap.hashCode ^
        calendarHeaderTextStyle.hashCode ^
        weekdaysPadding.hashCode ^
        weekdaysTextStyle.hashCode ^
        weekdaysTextAlign.hashCode ^
        weekNumbersHeaderText.hashCode ^
        weekNumbersHeaderTextStyle.hashCode ^
        weekNumbersTextStyle.hashCode ^
        weekNumbersTextAlign.hashCode ^
        dayButtonSize.hashCode ^
        dayButtonOutsideMonthOpacity.hashCode ^
        dayButtonPadding.hashCode ^
        dayButtonDecoration.hashCode ^
        selectedDayButtonTextStyle.hashCode ^
        insideRangeDayButtonTextStyle.hashCode ^
        dayButtonTextStyle.hashCode ^
        dayButtonVariant.hashCode ^
        selectedDayButtonVariant.hashCode ^
        insideRangeDayButtonVariant.hashCode ^
        todayButtonVariant.hashCode ^
        gridMainAxisSpacing.hashCode ^
        gridCrossAxisSpacing.hashCode ^
        dayButtonOutsideMonthTextStyle.hashCode ^
        dayButtonOutsideMonthVariant.hashCode ^
        selectedDayButtonOusideMonthVariant.hashCode ^
        captionLayout.hashCode ^
        hideWeekdayNames.hashCode ^
        showOutsideDays.hashCode ^
        formatMonthYear.hashCode ^
        formatMonth.hashCode ^
        formatYear.hashCode ^
        formatWeekday.hashCode ^
        showWeekNumbers.hashCode ^
        weekStartsOn.hashCode ^
        fixedWeeks.hashCode ^
        allowDeselection.hashCode ^
        effects.hashCode ^
        shadows.hashCode ^
        popoverPadding.hashCode ^
        calendarDecoration.hashCode ^
        anchor.hashCode ^
        filter.hashCode ^
        applyIconColorFilter.hashCode ^
        cursor.hashCode ^
        size.hashCode ^
        sizesTheme.hashCode ^
        backgroundColor.hashCode ^
        hoverBackgroundColor.hashCode ^
        foregroundColor.hashCode ^
        hoverForegroundColor.hashCode ^
        pressedBackgroundColor.hashCode ^
        pressedForegroundColor.hashCode ^
        shadows.hashCode ^
        gradient.hashCode ^
        textDecoration.hashCode ^
        hoverTextDecoration.hashCode ^
        calendarDecoration.hashCode ^
        width.hashCode ^
        height.hashCode ^
        mainAxisAlignment.hashCode ^
        crossAxisAlignment.hashCode ^
        longPressDuration.hashCode ^
        hoverStrategies.hashCode ^
        textDirection.hashCode ^
        gap.hashCode ^
        formatDate.hashCode ^
        formatDateRange.hashCode ^
        buttonVariant.hashCode ^
        buttonPadding.hashCode ^
        iconSrc.hashCode;
  }

  ShadDatePickerTheme copyWith({
    bool? merge,
    bool? hideNavigation,
    double? yearSelectorMinWidth,
    double? monthSelectorMinWidth,
    EdgeInsets? yearSelectorPadding,
    EdgeInsets? monthSelectorPadding,
    double? navigationButtonSize,
    double? navigationButtonIconSize,
    ShadImageSrc? backNavigationButtonSrc,
    ShadImageSrc? forwardNavigationButtonSrc,
    EdgeInsets? navigationButtonPadding,
    double? navigationButtonDisabledOpacity,
    ShadDecoration? calendarDecoration,
    double? spacingBetweenMonths,
    double? runSpacingBetweenMonths,
    BoxConstraints? monthConstraints,
    double? calendarHeaderHeight,
    EdgeInsets? calendarHeaderPadding,
    double? captionLayoutGap,
    TextStyle? calendarHeaderTextStyle,
    EdgeInsets? weekdaysPadding,
    TextStyle? weekdaysTextStyle,
    TextAlign? weekdaysTextAlign,
    String? weekNumbersHeaderText,
    TextStyle? weekNumbersHeaderTextStyle,
    TextStyle? weekNumbersTextStyle,
    TextAlign? weekNumbersTextAlign,
    double? dayButtonSize,
    double? dayButtonOutsideMonthOpacity,
    EdgeInsets? dayButtonPadding,
    ShadDecoration? dayButtonDecoration,
    TextStyle? selectedDayButtonTextStyle,
    TextStyle? insideRangeDayButtonTextStyle,
    TextStyle? dayButtonTextStyle,
    ShadButtonVariant? dayButtonVariant,
    ShadButtonVariant? selectedDayButtonVariant,
    ShadButtonVariant? insideRangeDayButtonVariant,
    ShadButtonVariant? todayButtonVariant,
    double? gridMainAxisSpacing,
    double? gridCrossAxisSpacing,
    TextStyle? dayButtonOutsideMonthTextStyle,
    ShadButtonVariant? dayButtonOutsideMonthVariant,
    ShadButtonVariant? selectedDayButtonOusideMonthVariant,
    ShadCalendarCaptionLayout? captionLayout,
    bool? hideWeekdayNames,
    bool? showOutsideDays,
    String Function(DateTime date)? formatMonthYear,
    String Function(DateTime date)? formatMonth,
    String Function(DateTime date)? formatYear,
    String Function(DateTime date)? formatWeekday,
    bool? showWeekNumbers,
    int? weekStartsOn,
    bool? fixedWeeks,
    bool? allowDeselection,
    Duration? waitDuration,
    Duration? showDuration,
    List<Effect<dynamic>>? effects,
    List<BoxShadow>? shadows,
    EdgeInsetsGeometry? popoverPadding,
    ShadDecoration? popoverDecoration,
    ShadAnchorBase? anchor,
    ImageFilter? filter,
    bool? applyIconColorFilter,
    MouseCursor? cursor,
    MouseCursor? disabledCursor,
    ShadButtonSize? size,
    ShadButtonSizesTheme? sizesTheme,
    Color? backgroundColor,
    Color? hoverBackgroundColor,
    Color? foregroundColor,
    Color? hoverForegroundColor,
    Color? pressedBackgroundColor,
    Color? pressedForegroundColor,
    List<BoxShadow>? buttonShadows,
    Gradient? gradient,
    TextDecoration? textDecoration,
    TextDecoration? hoverTextDecoration,
    ShadDecoration? buttonDecoration,
    double? width,
    double? height,
    MainAxisAlignment? mainAxisAlignment,
    CrossAxisAlignment? crossAxisAlignment,
    Duration? longPressDuration,
    ShadHoverStrategies? hoverStrategies,
    TextDirection? textDirection,
    double? gap,
    String Function(DateTime date)? formatDate,
    String Function(ShadDateTimeRange range)? formatDateRange,
    ShadButtonVariant? buttonVariant,
    EdgeInsetsGeometry? buttonPadding,
    ShadImageSrc? iconSrc,
  }) {
    return ShadDatePickerTheme(
      merge: merge ?? this.merge,
      hideNavigation: hideNavigation ?? this.hideNavigation,
      yearSelectorMinWidth: yearSelectorMinWidth ?? this.yearSelectorMinWidth,
      monthSelectorMinWidth:
          monthSelectorMinWidth ?? this.monthSelectorMinWidth,
      yearSelectorPadding: yearSelectorPadding ?? this.yearSelectorPadding,
      monthSelectorPadding: monthSelectorPadding ?? this.monthSelectorPadding,
      navigationButtonSize: navigationButtonSize ?? this.navigationButtonSize,
      navigationButtonIconSize:
          navigationButtonIconSize ?? this.navigationButtonIconSize,
      backNavigationButtonSrc:
          backNavigationButtonSrc ?? this.backNavigationButtonSrc,
      forwardNavigationButtonSrc:
          forwardNavigationButtonSrc ?? this.forwardNavigationButtonSrc,
      navigationButtonPadding:
          navigationButtonPadding ?? this.navigationButtonPadding,
      navigationButtonDisabledOpacity: navigationButtonDisabledOpacity ??
          this.navigationButtonDisabledOpacity,
      calendarDecoration: calendarDecoration ?? this.calendarDecoration,
      spacingBetweenMonths: spacingBetweenMonths ?? this.spacingBetweenMonths,
      runSpacingBetweenMonths:
          runSpacingBetweenMonths ?? this.runSpacingBetweenMonths,
      monthConstraints: monthConstraints ?? this.monthConstraints,
      calendarHeaderHeight: calendarHeaderHeight ?? this.calendarHeaderHeight,
      calendarHeaderPadding:
          calendarHeaderPadding ?? this.calendarHeaderPadding,
      captionLayoutGap: captionLayoutGap ?? this.captionLayoutGap,
      calendarHeaderTextStyle:
          calendarHeaderTextStyle ?? this.calendarHeaderTextStyle,
      weekdaysPadding: weekdaysPadding ?? this.weekdaysPadding,
      weekdaysTextStyle: weekdaysTextStyle ?? this.weekdaysTextStyle,
      weekdaysTextAlign: weekdaysTextAlign ?? this.weekdaysTextAlign,
      weekNumbersHeaderText:
          weekNumbersHeaderText ?? this.weekNumbersHeaderText,
      weekNumbersHeaderTextStyle:
          weekNumbersHeaderTextStyle ?? this.weekNumbersHeaderTextStyle,
      weekNumbersTextStyle: weekNumbersTextStyle ?? this.weekNumbersTextStyle,
      weekNumbersTextAlign: weekNumbersTextAlign ?? this.weekNumbersTextAlign,
      dayButtonSize: dayButtonSize ?? this.dayButtonSize,
      dayButtonOutsideMonthOpacity:
          dayButtonOutsideMonthOpacity ?? this.dayButtonOutsideMonthOpacity,
      dayButtonPadding: dayButtonPadding ?? this.dayButtonPadding,
      dayButtonDecoration: dayButtonDecoration ?? this.dayButtonDecoration,
      selectedDayButtonTextStyle:
          selectedDayButtonTextStyle ?? this.selectedDayButtonTextStyle,
      insideRangeDayButtonTextStyle:
          insideRangeDayButtonTextStyle ?? this.insideRangeDayButtonTextStyle,
      dayButtonTextStyle: dayButtonTextStyle ?? this.dayButtonTextStyle,
      dayButtonVariant: dayButtonVariant ?? this.dayButtonVariant,
      selectedDayButtonVariant:
          selectedDayButtonVariant ?? this.selectedDayButtonVariant,
      insideRangeDayButtonVariant:
          insideRangeDayButtonVariant ?? this.insideRangeDayButtonVariant,
      todayButtonVariant: todayButtonVariant ?? this.todayButtonVariant,
      gridMainAxisSpacing: gridMainAxisSpacing ?? this.gridMainAxisSpacing,
      gridCrossAxisSpacing: gridCrossAxisSpacing ?? this.gridCrossAxisSpacing,
      dayButtonOutsideMonthTextStyle:
          dayButtonOutsideMonthTextStyle ?? this.dayButtonOutsideMonthTextStyle,
      dayButtonOutsideMonthVariant:
          dayButtonOutsideMonthVariant ?? this.dayButtonOutsideMonthVariant,
      selectedDayButtonOusideMonthVariant:
          selectedDayButtonOusideMonthVariant ??
              this.selectedDayButtonOusideMonthVariant,
      captionLayout: captionLayout ?? this.captionLayout,
      hideWeekdayNames: hideWeekdayNames ?? this.hideWeekdayNames,
      showOutsideDays: showOutsideDays ?? this.showOutsideDays,
      formatMonthYear: formatMonthYear ?? this.formatMonthYear,
      formatMonth: formatMonth ?? this.formatMonth,
      formatYear: formatYear ?? this.formatYear,
      formatWeekday: formatWeekday ?? this.formatWeekday,
      showWeekNumbers: showWeekNumbers ?? this.showWeekNumbers,
      weekStartsOn: weekStartsOn ?? this.weekStartsOn,
      fixedWeeks: fixedWeeks ?? this.fixedWeeks,
      allowDeselection: allowDeselection ?? this.allowDeselection,
      effects: effects ?? this.effects,
      shadows: shadows ?? this.shadows,
      popoverPadding: popoverPadding ?? this.popoverPadding,
      popoverDecoration: popoverDecoration ?? this.popoverDecoration,
      anchor: anchor ?? this.anchor,
      filter: filter ?? this.filter,
      applyIconColorFilter: applyIconColorFilter ?? this.applyIconColorFilter,
      cursor: cursor ?? this.cursor,
      size: size ?? this.size,
      sizesTheme: sizesTheme ?? this.sizesTheme,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      hoverBackgroundColor: hoverBackgroundColor ?? this.hoverBackgroundColor,
      foregroundColor: foregroundColor ?? this.foregroundColor,
      hoverForegroundColor: hoverForegroundColor ?? this.hoverForegroundColor,
      pressedBackgroundColor:
          pressedBackgroundColor ?? this.pressedBackgroundColor,
      pressedForegroundColor:
          pressedForegroundColor ?? this.pressedForegroundColor,
      buttonShadows: buttonShadows ?? this.buttonShadows,
      gradient: gradient ?? this.gradient,
      textDecoration: textDecoration ?? this.textDecoration,
      hoverTextDecoration: hoverTextDecoration ?? this.hoverTextDecoration,
      buttonDecoration: buttonDecoration ?? this.buttonDecoration,
      width: width ?? this.width,
      height: height ?? this.height,
      mainAxisAlignment: mainAxisAlignment ?? this.mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment ?? this.crossAxisAlignment,
      longPressDuration: longPressDuration ?? this.longPressDuration,
      hoverStrategies: hoverStrategies ?? this.hoverStrategies,
      textDirection: textDirection ?? this.textDirection,
      gap: gap ?? this.gap,
      formatDate: formatDate ?? this.formatDate,
      formatDateRange: formatDateRange ?? this.formatDateRange,
      buttonVariant: buttonVariant ?? this.buttonVariant,
      buttonPadding: buttonPadding ?? this.buttonPadding,
      iconSrc: iconSrc ?? this.iconSrc,
    );
  }
}
