// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'date_picker.dart';

// **************************************************************************
// ThemeGenGenerator
// **************************************************************************

mixin _$ShadDatePickerTheme {
  bool get canMerge => true;

  static ShadDatePickerTheme? lerp(
    ShadDatePickerTheme? a,
    ShadDatePickerTheme? b,
    double t,
  ) {
    if (identical(a, b)) {
      return a;
    }

    if (a == null) {
      return t == 1.0 ? b : null;
    }

    if (b == null) {
      return t == 0.0 ? a : null;
    }

    return ShadDatePickerTheme(
      formatDate: t < 0.5 ? a.formatDate : b.formatDate,
      formatDateRange: t < 0.5 ? a.formatDateRange : b.formatDateRange,
      iconData: t < 0.5 ? a.iconData : b.iconData,
      hideNavigation: t < 0.5 ? a.hideNavigation : b.hideNavigation,
      yearSelectorMinWidth: lerpDouble$(
        a.yearSelectorMinWidth,
        b.yearSelectorMinWidth,
        t,
      ),
      monthSelectorMinWidth: lerpDouble$(
        a.monthSelectorMinWidth,
        b.monthSelectorMinWidth,
        t,
      ),
      yearSelectorPadding: EdgeInsetsGeometry.lerp(
        a.yearSelectorPadding,
        b.yearSelectorPadding,
        t,
      ),
      monthSelectorPadding: EdgeInsetsGeometry.lerp(
        a.monthSelectorPadding,
        b.monthSelectorPadding,
        t,
      ),
      navigationButtonSize: lerpDouble$(
        a.navigationButtonSize,
        b.navigationButtonSize,
        t,
      ),
      navigationButtonIconSize: lerpDouble$(
        a.navigationButtonIconSize,
        b.navigationButtonIconSize,
        t,
      ),
      backNavigationButtonIconData: t < 0.5
          ? a.backNavigationButtonIconData
          : b.backNavigationButtonIconData,
      forwardNavigationButtonIconData: t < 0.5
          ? a.forwardNavigationButtonIconData
          : b.forwardNavigationButtonIconData,
      navigationButtonPadding: EdgeInsetsGeometry.lerp(
        a.navigationButtonPadding,
        b.navigationButtonPadding,
        t,
      ),
      navigationButtonDisabledOpacity: lerpDouble$(
        a.navigationButtonDisabledOpacity,
        b.navigationButtonDisabledOpacity,
        t,
      ),
      calendarDecoration: ShadDecoration.lerp(
        a.calendarDecoration,
        b.calendarDecoration,
        t,
      ),
      spacingBetweenMonths: lerpDouble$(
        a.spacingBetweenMonths,
        b.spacingBetweenMonths,
        t,
      ),
      runSpacingBetweenMonths: lerpDouble$(
        a.runSpacingBetweenMonths,
        b.runSpacingBetweenMonths,
        t,
      ),
      monthConstraints: BoxConstraints.lerp(
        a.monthConstraints,
        b.monthConstraints,
        t,
      ),
      calendarHeaderHeight: lerpDouble$(
        a.calendarHeaderHeight,
        b.calendarHeaderHeight,
        t,
      ),
      calendarHeaderPadding: EdgeInsetsGeometry.lerp(
        a.calendarHeaderPadding,
        b.calendarHeaderPadding,
        t,
      ),
      captionLayoutGap: lerpDouble$(a.captionLayoutGap, b.captionLayoutGap, t),
      calendarHeaderTextStyle: TextStyle.lerp(
        a.calendarHeaderTextStyle,
        b.calendarHeaderTextStyle,
        t,
      ),
      weekdaysPadding: EdgeInsetsGeometry.lerp(
        a.weekdaysPadding,
        b.weekdaysPadding,
        t,
      ),
      weekdaysTextStyle: TextStyle.lerp(
        a.weekdaysTextStyle,
        b.weekdaysTextStyle,
        t,
      ),
      weekdaysTextAlign: t < 0.5 ? a.weekdaysTextAlign : b.weekdaysTextAlign,
      weekNumbersHeaderText: t < 0.5
          ? a.weekNumbersHeaderText
          : b.weekNumbersHeaderText,
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
      weekNumbersTextAlign: t < 0.5
          ? a.weekNumbersTextAlign
          : b.weekNumbersTextAlign,
      dayButtonSize: lerpDouble$(a.dayButtonSize, b.dayButtonSize, t),
      dayButtonOutsideMonthOpacity: lerpDouble$(
        a.dayButtonOutsideMonthOpacity,
        b.dayButtonOutsideMonthOpacity,
        t,
      ),
      dayButtonPadding: EdgeInsetsGeometry.lerp(
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
      dayButtonVariant: t < 0.5 ? a.dayButtonVariant : b.dayButtonVariant,
      selectedDayButtonVariant: t < 0.5
          ? a.selectedDayButtonVariant
          : b.selectedDayButtonVariant,
      insideRangeDayButtonVariant: t < 0.5
          ? a.insideRangeDayButtonVariant
          : b.insideRangeDayButtonVariant,
      todayButtonVariant: t < 0.5 ? a.todayButtonVariant : b.todayButtonVariant,
      gridMainAxisSpacing: lerpDouble$(
        a.gridMainAxisSpacing,
        b.gridMainAxisSpacing,
        t,
      ),
      gridCrossAxisSpacing: lerpDouble$(
        a.gridCrossAxisSpacing,
        b.gridCrossAxisSpacing,
        t,
      ),
      dayButtonOutsideMonthTextStyle: TextStyle.lerp(
        a.dayButtonOutsideMonthTextStyle,
        b.dayButtonOutsideMonthTextStyle,
        t,
      ),
      dayButtonOutsideMonthVariant: t < 0.5
          ? a.dayButtonOutsideMonthVariant
          : b.dayButtonOutsideMonthVariant,
      selectedDayButtonOusideMonthVariant: t < 0.5
          ? a.selectedDayButtonOusideMonthVariant
          : b.selectedDayButtonOusideMonthVariant,
      captionLayout: t < 0.5 ? a.captionLayout : b.captionLayout,
      hideWeekdayNames: t < 0.5 ? a.hideWeekdayNames : b.hideWeekdayNames,
      showOutsideDays: t < 0.5 ? a.showOutsideDays : b.showOutsideDays,
      formatMonthYear: t < 0.5 ? a.formatMonthYear : b.formatMonthYear,
      formatMonth: t < 0.5 ? a.formatMonth : b.formatMonth,
      formatYear: t < 0.5 ? a.formatYear : b.formatYear,
      formatWeekday: t < 0.5 ? a.formatWeekday : b.formatWeekday,
      showWeekNumbers: t < 0.5 ? a.showWeekNumbers : b.showWeekNumbers,
      weekStartsOn: t < 0.5 ? a.weekStartsOn : b.weekStartsOn,
      fixedWeeks: t < 0.5 ? a.fixedWeeks : b.fixedWeeks,
      allowDeselection: t < 0.5 ? a.allowDeselection : b.allowDeselection,
      effects: t < 0.5 ? a.effects : b.effects,
      shadows: t < 0.5 ? a.shadows : b.shadows,
      popoverPadding: EdgeInsetsGeometry.lerp(
        a.popoverPadding,
        b.popoverPadding,
        t,
      ),
      popoverDecoration: ShadDecoration.lerp(
        a.popoverDecoration,
        b.popoverDecoration,
        t,
      ),
      anchor: t < 0.5 ? a.anchor : b.anchor,
      filter: t < 0.5 ? a.filter : b.filter,
      popoverReverseDuration: lerpDuration$(
        a.popoverReverseDuration,
        b.popoverReverseDuration,
        t,
      ),
      cursor: t < 0.5 ? a.cursor : b.cursor,
      size: t < 0.5 ? a.size : b.size,
      sizesTheme: ShadButtonSizesTheme.lerp(a.sizesTheme, b.sizesTheme, t),
      buttonVariant: t < 0.5 ? a.buttonVariant : b.buttonVariant,
      backgroundColor: Color.lerp(a.backgroundColor, b.backgroundColor, t),
      hoverBackgroundColor: Color.lerp(
        a.hoverBackgroundColor,
        b.hoverBackgroundColor,
        t,
      ),
      foregroundColor: Color.lerp(a.foregroundColor, b.foregroundColor, t),
      hoverForegroundColor: Color.lerp(
        a.hoverForegroundColor,
        b.hoverForegroundColor,
        t,
      ),
      pressedBackgroundColor: Color.lerp(
        a.pressedBackgroundColor,
        b.pressedBackgroundColor,
        t,
      ),
      pressedForegroundColor: Color.lerp(
        a.pressedForegroundColor,
        b.pressedForegroundColor,
        t,
      ),
      disabledBackgroundColor: Color.lerp(
        a.disabledBackgroundColor,
        b.disabledBackgroundColor,
        t,
      ),
      buttonShadows: t < 0.5 ? a.buttonShadows : b.buttonShadows,
      gradient: Gradient.lerp(a.gradient, b.gradient, t),
      textDecoration: t < 0.5 ? a.textDecoration : b.textDecoration,
      hoverTextDecoration: t < 0.5
          ? a.hoverTextDecoration
          : b.hoverTextDecoration,
      buttonDecoration: ShadDecoration.lerp(
        a.buttonDecoration,
        b.buttonDecoration,
        t,
      ),
      width: lerpDouble$(a.width, b.width, t),
      height: lerpDouble$(a.height, b.height, t),
      longPressDuration: lerpDuration$(
        a.longPressDuration,
        b.longPressDuration,
        t,
      ),
      hoverStrategies: t < 0.5 ? a.hoverStrategies : b.hoverStrategies,
      mainAxisAlignment: t < 0.5 ? a.mainAxisAlignment : b.mainAxisAlignment,
      crossAxisAlignment: t < 0.5 ? a.crossAxisAlignment : b.crossAxisAlignment,
      textDirection: t < 0.5 ? a.textDirection : b.textDirection,
      gap: lerpDouble$(a.gap, b.gap, t),
      buttonPadding: EdgeInsetsGeometry.lerp(
        a.buttonPadding,
        b.buttonPadding,
        t,
      ),
      expands: t < 0.5 ? a.expands : b.expands,
      buttonTextStyle: TextStyle.lerp(a.buttonTextStyle, b.buttonTextStyle, t),
    );
  }

  ShadDatePickerTheme copyWith({
    String Function(DateTime)? formatDate,
    String Function(ShadDateTimeRange)? formatDateRange,
    IconData? iconData,
    bool? hideNavigation,
    double? yearSelectorMinWidth,
    double? monthSelectorMinWidth,
    EdgeInsetsGeometry? yearSelectorPadding,
    EdgeInsetsGeometry? monthSelectorPadding,
    double? navigationButtonSize,
    double? navigationButtonIconSize,
    IconData? backNavigationButtonIconData,
    IconData? forwardNavigationButtonIconData,
    EdgeInsetsGeometry? navigationButtonPadding,
    double? navigationButtonDisabledOpacity,
    ShadDecoration? calendarDecoration,
    double? spacingBetweenMonths,
    double? runSpacingBetweenMonths,
    BoxConstraints? monthConstraints,
    double? calendarHeaderHeight,
    EdgeInsetsGeometry? calendarHeaderPadding,
    double? captionLayoutGap,
    TextStyle? calendarHeaderTextStyle,
    EdgeInsetsGeometry? weekdaysPadding,
    TextStyle? weekdaysTextStyle,
    TextAlign? weekdaysTextAlign,
    String? weekNumbersHeaderText,
    TextStyle? weekNumbersHeaderTextStyle,
    TextStyle? weekNumbersTextStyle,
    TextAlign? weekNumbersTextAlign,
    double? dayButtonSize,
    double? dayButtonOutsideMonthOpacity,
    EdgeInsetsGeometry? dayButtonPadding,
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
    String Function(DateTime)? formatMonthYear,
    String Function(DateTime)? formatMonth,
    String Function(DateTime)? formatYear,
    String Function(DateTime)? formatWeekday,
    bool? showWeekNumbers,
    int? weekStartsOn,
    bool? fixedWeeks,
    bool? allowDeselection,
    List<Effect<dynamic>>? effects,
    List<BoxShadow>? shadows,
    EdgeInsetsGeometry? popoverPadding,
    ShadDecoration? popoverDecoration,
    ShadAnchorBase? anchor,
    ImageFilter? filter,
    Duration? popoverReverseDuration,
    MouseCursor? cursor,
    ShadButtonSize? size,
    ShadButtonSizesTheme? sizesTheme,
    ShadButtonVariant? buttonVariant,
    Color? backgroundColor,
    Color? hoverBackgroundColor,
    Color? foregroundColor,
    Color? hoverForegroundColor,
    Color? pressedBackgroundColor,
    Color? pressedForegroundColor,
    Color? disabledBackgroundColor,
    List<BoxShadow>? buttonShadows,
    Gradient? gradient,
    TextDecoration? textDecoration,
    TextDecoration? hoverTextDecoration,
    ShadDecoration? buttonDecoration,
    double? width,
    double? height,
    Duration? longPressDuration,
    ShadHoverStrategies? hoverStrategies,
    MainAxisAlignment? mainAxisAlignment,
    CrossAxisAlignment? crossAxisAlignment,
    TextDirection? textDirection,
    double? gap,
    EdgeInsetsGeometry? buttonPadding,
    bool? expands,
    TextStyle? buttonTextStyle,
  }) {
    final _this = (this as ShadDatePickerTheme);

    return ShadDatePickerTheme(
      formatDate: formatDate ?? _this.formatDate,
      formatDateRange: formatDateRange ?? _this.formatDateRange,
      iconData: iconData ?? _this.iconData,
      hideNavigation: hideNavigation ?? _this.hideNavigation,
      yearSelectorMinWidth: yearSelectorMinWidth ?? _this.yearSelectorMinWidth,
      monthSelectorMinWidth:
          monthSelectorMinWidth ?? _this.monthSelectorMinWidth,
      yearSelectorPadding: yearSelectorPadding ?? _this.yearSelectorPadding,
      monthSelectorPadding: monthSelectorPadding ?? _this.monthSelectorPadding,
      navigationButtonSize: navigationButtonSize ?? _this.navigationButtonSize,
      navigationButtonIconSize:
          navigationButtonIconSize ?? _this.navigationButtonIconSize,
      backNavigationButtonIconData:
          backNavigationButtonIconData ?? _this.backNavigationButtonIconData,
      forwardNavigationButtonIconData:
          forwardNavigationButtonIconData ??
          _this.forwardNavigationButtonIconData,
      navigationButtonPadding:
          navigationButtonPadding ?? _this.navigationButtonPadding,
      navigationButtonDisabledOpacity:
          navigationButtonDisabledOpacity ??
          _this.navigationButtonDisabledOpacity,
      calendarDecoration: calendarDecoration ?? _this.calendarDecoration,
      spacingBetweenMonths: spacingBetweenMonths ?? _this.spacingBetweenMonths,
      runSpacingBetweenMonths:
          runSpacingBetweenMonths ?? _this.runSpacingBetweenMonths,
      monthConstraints: monthConstraints ?? _this.monthConstraints,
      calendarHeaderHeight: calendarHeaderHeight ?? _this.calendarHeaderHeight,
      calendarHeaderPadding:
          calendarHeaderPadding ?? _this.calendarHeaderPadding,
      captionLayoutGap: captionLayoutGap ?? _this.captionLayoutGap,
      calendarHeaderTextStyle:
          calendarHeaderTextStyle ?? _this.calendarHeaderTextStyle,
      weekdaysPadding: weekdaysPadding ?? _this.weekdaysPadding,
      weekdaysTextStyle: weekdaysTextStyle ?? _this.weekdaysTextStyle,
      weekdaysTextAlign: weekdaysTextAlign ?? _this.weekdaysTextAlign,
      weekNumbersHeaderText:
          weekNumbersHeaderText ?? _this.weekNumbersHeaderText,
      weekNumbersHeaderTextStyle:
          weekNumbersHeaderTextStyle ?? _this.weekNumbersHeaderTextStyle,
      weekNumbersTextStyle: weekNumbersTextStyle ?? _this.weekNumbersTextStyle,
      weekNumbersTextAlign: weekNumbersTextAlign ?? _this.weekNumbersTextAlign,
      dayButtonSize: dayButtonSize ?? _this.dayButtonSize,
      dayButtonOutsideMonthOpacity:
          dayButtonOutsideMonthOpacity ?? _this.dayButtonOutsideMonthOpacity,
      dayButtonPadding: dayButtonPadding ?? _this.dayButtonPadding,
      dayButtonDecoration: dayButtonDecoration ?? _this.dayButtonDecoration,
      selectedDayButtonTextStyle:
          selectedDayButtonTextStyle ?? _this.selectedDayButtonTextStyle,
      insideRangeDayButtonTextStyle:
          insideRangeDayButtonTextStyle ?? _this.insideRangeDayButtonTextStyle,
      dayButtonTextStyle: dayButtonTextStyle ?? _this.dayButtonTextStyle,
      dayButtonVariant: dayButtonVariant ?? _this.dayButtonVariant,
      selectedDayButtonVariant:
          selectedDayButtonVariant ?? _this.selectedDayButtonVariant,
      insideRangeDayButtonVariant:
          insideRangeDayButtonVariant ?? _this.insideRangeDayButtonVariant,
      todayButtonVariant: todayButtonVariant ?? _this.todayButtonVariant,
      gridMainAxisSpacing: gridMainAxisSpacing ?? _this.gridMainAxisSpacing,
      gridCrossAxisSpacing: gridCrossAxisSpacing ?? _this.gridCrossAxisSpacing,
      dayButtonOutsideMonthTextStyle:
          dayButtonOutsideMonthTextStyle ??
          _this.dayButtonOutsideMonthTextStyle,
      dayButtonOutsideMonthVariant:
          dayButtonOutsideMonthVariant ?? _this.dayButtonOutsideMonthVariant,
      selectedDayButtonOusideMonthVariant:
          selectedDayButtonOusideMonthVariant ??
          _this.selectedDayButtonOusideMonthVariant,
      captionLayout: captionLayout ?? _this.captionLayout,
      hideWeekdayNames: hideWeekdayNames ?? _this.hideWeekdayNames,
      showOutsideDays: showOutsideDays ?? _this.showOutsideDays,
      formatMonthYear: formatMonthYear ?? _this.formatMonthYear,
      formatMonth: formatMonth ?? _this.formatMonth,
      formatYear: formatYear ?? _this.formatYear,
      formatWeekday: formatWeekday ?? _this.formatWeekday,
      showWeekNumbers: showWeekNumbers ?? _this.showWeekNumbers,
      weekStartsOn: weekStartsOn ?? _this.weekStartsOn,
      fixedWeeks: fixedWeeks ?? _this.fixedWeeks,
      allowDeselection: allowDeselection ?? _this.allowDeselection,
      effects: effects ?? _this.effects,
      shadows: shadows ?? _this.shadows,
      popoverPadding: popoverPadding ?? _this.popoverPadding,
      popoverDecoration: popoverDecoration ?? _this.popoverDecoration,
      anchor: anchor ?? _this.anchor,
      filter: filter ?? _this.filter,
      popoverReverseDuration:
          popoverReverseDuration ?? _this.popoverReverseDuration,
      cursor: cursor ?? _this.cursor,
      size: size ?? _this.size,
      sizesTheme: sizesTheme ?? _this.sizesTheme,
      buttonVariant: buttonVariant ?? _this.buttonVariant,
      backgroundColor: backgroundColor ?? _this.backgroundColor,
      hoverBackgroundColor: hoverBackgroundColor ?? _this.hoverBackgroundColor,
      foregroundColor: foregroundColor ?? _this.foregroundColor,
      hoverForegroundColor: hoverForegroundColor ?? _this.hoverForegroundColor,
      pressedBackgroundColor:
          pressedBackgroundColor ?? _this.pressedBackgroundColor,
      pressedForegroundColor:
          pressedForegroundColor ?? _this.pressedForegroundColor,
      disabledBackgroundColor:
          disabledBackgroundColor ?? _this.disabledBackgroundColor,
      buttonShadows: buttonShadows ?? _this.buttonShadows,
      gradient: gradient ?? _this.gradient,
      textDecoration: textDecoration ?? _this.textDecoration,
      hoverTextDecoration: hoverTextDecoration ?? _this.hoverTextDecoration,
      buttonDecoration: buttonDecoration ?? _this.buttonDecoration,
      width: width ?? _this.width,
      height: height ?? _this.height,
      longPressDuration: longPressDuration ?? _this.longPressDuration,
      hoverStrategies: hoverStrategies ?? _this.hoverStrategies,
      mainAxisAlignment: mainAxisAlignment ?? _this.mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment ?? _this.crossAxisAlignment,
      textDirection: textDirection ?? _this.textDirection,
      gap: gap ?? _this.gap,
      buttonPadding: buttonPadding ?? _this.buttonPadding,
      expands: expands ?? _this.expands,
      buttonTextStyle: buttonTextStyle ?? _this.buttonTextStyle,
    );
  }

  ShadDatePickerTheme merge(ShadDatePickerTheme? other) {
    final _this = (this as ShadDatePickerTheme);

    if (other == null || identical(_this, other)) {
      return _this;
    }

    if (!other.canMerge) {
      return other;
    }

    return copyWith(
      formatDate: other.formatDate,
      formatDateRange: other.formatDateRange,
      iconData: other.iconData,
      hideNavigation: other.hideNavigation,
      yearSelectorMinWidth: other.yearSelectorMinWidth,
      monthSelectorMinWidth: other.monthSelectorMinWidth,
      yearSelectorPadding: other.yearSelectorPadding,
      monthSelectorPadding: other.monthSelectorPadding,
      navigationButtonSize: other.navigationButtonSize,
      navigationButtonIconSize: other.navigationButtonIconSize,
      backNavigationButtonIconData: other.backNavigationButtonIconData,
      forwardNavigationButtonIconData: other.forwardNavigationButtonIconData,
      navigationButtonPadding: other.navigationButtonPadding,
      navigationButtonDisabledOpacity: other.navigationButtonDisabledOpacity,
      calendarDecoration:
          _this.calendarDecoration?.merge(other.calendarDecoration) ??
          other.calendarDecoration,
      spacingBetweenMonths: other.spacingBetweenMonths,
      runSpacingBetweenMonths: other.runSpacingBetweenMonths,
      monthConstraints: other.monthConstraints,
      calendarHeaderHeight: other.calendarHeaderHeight,
      calendarHeaderPadding: other.calendarHeaderPadding,
      captionLayoutGap: other.captionLayoutGap,
      calendarHeaderTextStyle:
          _this.calendarHeaderTextStyle?.merge(other.calendarHeaderTextStyle) ??
          other.calendarHeaderTextStyle,
      weekdaysPadding: other.weekdaysPadding,
      weekdaysTextStyle:
          _this.weekdaysTextStyle?.merge(other.weekdaysTextStyle) ??
          other.weekdaysTextStyle,
      weekdaysTextAlign: other.weekdaysTextAlign,
      weekNumbersHeaderText: other.weekNumbersHeaderText,
      weekNumbersHeaderTextStyle:
          _this.weekNumbersHeaderTextStyle?.merge(
            other.weekNumbersHeaderTextStyle,
          ) ??
          other.weekNumbersHeaderTextStyle,
      weekNumbersTextStyle:
          _this.weekNumbersTextStyle?.merge(other.weekNumbersTextStyle) ??
          other.weekNumbersTextStyle,
      weekNumbersTextAlign: other.weekNumbersTextAlign,
      dayButtonSize: other.dayButtonSize,
      dayButtonOutsideMonthOpacity: other.dayButtonOutsideMonthOpacity,
      dayButtonPadding: other.dayButtonPadding,
      dayButtonDecoration:
          _this.dayButtonDecoration?.merge(other.dayButtonDecoration) ??
          other.dayButtonDecoration,
      selectedDayButtonTextStyle:
          _this.selectedDayButtonTextStyle?.merge(
            other.selectedDayButtonTextStyle,
          ) ??
          other.selectedDayButtonTextStyle,
      insideRangeDayButtonTextStyle:
          _this.insideRangeDayButtonTextStyle?.merge(
            other.insideRangeDayButtonTextStyle,
          ) ??
          other.insideRangeDayButtonTextStyle,
      dayButtonTextStyle:
          _this.dayButtonTextStyle?.merge(other.dayButtonTextStyle) ??
          other.dayButtonTextStyle,
      dayButtonVariant: other.dayButtonVariant,
      selectedDayButtonVariant: other.selectedDayButtonVariant,
      insideRangeDayButtonVariant: other.insideRangeDayButtonVariant,
      todayButtonVariant: other.todayButtonVariant,
      gridMainAxisSpacing: other.gridMainAxisSpacing,
      gridCrossAxisSpacing: other.gridCrossAxisSpacing,
      dayButtonOutsideMonthTextStyle:
          _this.dayButtonOutsideMonthTextStyle?.merge(
            other.dayButtonOutsideMonthTextStyle,
          ) ??
          other.dayButtonOutsideMonthTextStyle,
      dayButtonOutsideMonthVariant: other.dayButtonOutsideMonthVariant,
      selectedDayButtonOusideMonthVariant:
          other.selectedDayButtonOusideMonthVariant,
      captionLayout: other.captionLayout,
      hideWeekdayNames: other.hideWeekdayNames,
      showOutsideDays: other.showOutsideDays,
      formatMonthYear: other.formatMonthYear,
      formatMonth: other.formatMonth,
      formatYear: other.formatYear,
      formatWeekday: other.formatWeekday,
      showWeekNumbers: other.showWeekNumbers,
      weekStartsOn: other.weekStartsOn,
      fixedWeeks: other.fixedWeeks,
      allowDeselection: other.allowDeselection,
      effects: other.effects,
      shadows: other.shadows,
      popoverPadding: other.popoverPadding,
      popoverDecoration:
          _this.popoverDecoration?.merge(other.popoverDecoration) ??
          other.popoverDecoration,
      anchor: other.anchor,
      filter: other.filter,
      popoverReverseDuration: other.popoverReverseDuration,
      cursor: other.cursor,
      size: other.size,
      sizesTheme: _this.sizesTheme?.merge(other.sizesTheme) ?? other.sizesTheme,
      buttonVariant: other.buttonVariant,
      backgroundColor: other.backgroundColor,
      hoverBackgroundColor: other.hoverBackgroundColor,
      foregroundColor: other.foregroundColor,
      hoverForegroundColor: other.hoverForegroundColor,
      pressedBackgroundColor: other.pressedBackgroundColor,
      pressedForegroundColor: other.pressedForegroundColor,
      disabledBackgroundColor: other.disabledBackgroundColor,
      buttonShadows: other.buttonShadows,
      gradient: other.gradient,
      textDecoration: other.textDecoration,
      hoverTextDecoration: other.hoverTextDecoration,
      buttonDecoration:
          _this.buttonDecoration?.merge(other.buttonDecoration) ??
          other.buttonDecoration,
      width: other.width,
      height: other.height,
      longPressDuration: other.longPressDuration,
      hoverStrategies: other.hoverStrategies,
      mainAxisAlignment: other.mainAxisAlignment,
      crossAxisAlignment: other.crossAxisAlignment,
      textDirection: other.textDirection,
      gap: other.gap,
      buttonPadding: other.buttonPadding,
      expands: other.expands,
      buttonTextStyle:
          _this.buttonTextStyle?.merge(other.buttonTextStyle) ??
          other.buttonTextStyle,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    if (other.runtimeType != runtimeType) {
      return false;
    }

    final _this = (this as ShadDatePickerTheme);
    final _other = (other as ShadDatePickerTheme);

    return _other.formatDate == _this.formatDate &&
        _other.formatDateRange == _this.formatDateRange &&
        _other.iconData == _this.iconData &&
        _other.hideNavigation == _this.hideNavigation &&
        _other.yearSelectorMinWidth == _this.yearSelectorMinWidth &&
        _other.monthSelectorMinWidth == _this.monthSelectorMinWidth &&
        _other.yearSelectorPadding == _this.yearSelectorPadding &&
        _other.monthSelectorPadding == _this.monthSelectorPadding &&
        _other.navigationButtonSize == _this.navigationButtonSize &&
        _other.navigationButtonIconSize == _this.navigationButtonIconSize &&
        _other.backNavigationButtonIconData ==
            _this.backNavigationButtonIconData &&
        _other.forwardNavigationButtonIconData ==
            _this.forwardNavigationButtonIconData &&
        _other.navigationButtonPadding == _this.navigationButtonPadding &&
        _other.navigationButtonDisabledOpacity ==
            _this.navigationButtonDisabledOpacity &&
        _other.calendarDecoration == _this.calendarDecoration &&
        _other.spacingBetweenMonths == _this.spacingBetweenMonths &&
        _other.runSpacingBetweenMonths == _this.runSpacingBetweenMonths &&
        _other.monthConstraints == _this.monthConstraints &&
        _other.calendarHeaderHeight == _this.calendarHeaderHeight &&
        _other.calendarHeaderPadding == _this.calendarHeaderPadding &&
        _other.captionLayoutGap == _this.captionLayoutGap &&
        _other.calendarHeaderTextStyle == _this.calendarHeaderTextStyle &&
        _other.weekdaysPadding == _this.weekdaysPadding &&
        _other.weekdaysTextStyle == _this.weekdaysTextStyle &&
        _other.weekdaysTextAlign == _this.weekdaysTextAlign &&
        _other.weekNumbersHeaderText == _this.weekNumbersHeaderText &&
        _other.weekNumbersHeaderTextStyle == _this.weekNumbersHeaderTextStyle &&
        _other.weekNumbersTextStyle == _this.weekNumbersTextStyle &&
        _other.weekNumbersTextAlign == _this.weekNumbersTextAlign &&
        _other.dayButtonSize == _this.dayButtonSize &&
        _other.dayButtonOutsideMonthOpacity ==
            _this.dayButtonOutsideMonthOpacity &&
        _other.dayButtonPadding == _this.dayButtonPadding &&
        _other.dayButtonDecoration == _this.dayButtonDecoration &&
        _other.selectedDayButtonTextStyle == _this.selectedDayButtonTextStyle &&
        _other.insideRangeDayButtonTextStyle ==
            _this.insideRangeDayButtonTextStyle &&
        _other.dayButtonTextStyle == _this.dayButtonTextStyle &&
        _other.dayButtonVariant == _this.dayButtonVariant &&
        _other.selectedDayButtonVariant == _this.selectedDayButtonVariant &&
        _other.insideRangeDayButtonVariant ==
            _this.insideRangeDayButtonVariant &&
        _other.todayButtonVariant == _this.todayButtonVariant &&
        _other.gridMainAxisSpacing == _this.gridMainAxisSpacing &&
        _other.gridCrossAxisSpacing == _this.gridCrossAxisSpacing &&
        _other.dayButtonOutsideMonthTextStyle ==
            _this.dayButtonOutsideMonthTextStyle &&
        _other.dayButtonOutsideMonthVariant ==
            _this.dayButtonOutsideMonthVariant &&
        _other.selectedDayButtonOusideMonthVariant ==
            _this.selectedDayButtonOusideMonthVariant &&
        _other.captionLayout == _this.captionLayout &&
        _other.hideWeekdayNames == _this.hideWeekdayNames &&
        _other.showOutsideDays == _this.showOutsideDays &&
        _other.formatMonthYear == _this.formatMonthYear &&
        _other.formatMonth == _this.formatMonth &&
        _other.formatYear == _this.formatYear &&
        _other.formatWeekday == _this.formatWeekday &&
        _other.showWeekNumbers == _this.showWeekNumbers &&
        _other.weekStartsOn == _this.weekStartsOn &&
        _other.fixedWeeks == _this.fixedWeeks &&
        _other.allowDeselection == _this.allowDeselection &&
        _other.effects == _this.effects &&
        _other.shadows == _this.shadows &&
        _other.popoverPadding == _this.popoverPadding &&
        _other.popoverDecoration == _this.popoverDecoration &&
        _other.anchor == _this.anchor &&
        _other.filter == _this.filter &&
        _other.popoverReverseDuration == _this.popoverReverseDuration &&
        _other.cursor == _this.cursor &&
        _other.size == _this.size &&
        _other.sizesTheme == _this.sizesTheme &&
        _other.buttonVariant == _this.buttonVariant &&
        _other.backgroundColor == _this.backgroundColor &&
        _other.hoverBackgroundColor == _this.hoverBackgroundColor &&
        _other.foregroundColor == _this.foregroundColor &&
        _other.hoverForegroundColor == _this.hoverForegroundColor &&
        _other.pressedBackgroundColor == _this.pressedBackgroundColor &&
        _other.pressedForegroundColor == _this.pressedForegroundColor &&
        _other.disabledBackgroundColor == _this.disabledBackgroundColor &&
        _other.buttonShadows == _this.buttonShadows &&
        _other.gradient == _this.gradient &&
        _other.textDecoration == _this.textDecoration &&
        _other.hoverTextDecoration == _this.hoverTextDecoration &&
        _other.buttonDecoration == _this.buttonDecoration &&
        _other.width == _this.width &&
        _other.height == _this.height &&
        _other.longPressDuration == _this.longPressDuration &&
        _other.hoverStrategies == _this.hoverStrategies &&
        _other.mainAxisAlignment == _this.mainAxisAlignment &&
        _other.crossAxisAlignment == _this.crossAxisAlignment &&
        _other.textDirection == _this.textDirection &&
        _other.gap == _this.gap &&
        _other.buttonPadding == _this.buttonPadding &&
        _other.expands == _this.expands &&
        _other.buttonTextStyle == _this.buttonTextStyle;
  }

  @override
  int get hashCode {
    final _this = (this as ShadDatePickerTheme);

    return Object.hashAll([
      runtimeType,
      _this.formatDate,
      _this.formatDateRange,
      _this.iconData,
      _this.hideNavigation,
      _this.yearSelectorMinWidth,
      _this.monthSelectorMinWidth,
      _this.yearSelectorPadding,
      _this.monthSelectorPadding,
      _this.navigationButtonSize,
      _this.navigationButtonIconSize,
      _this.backNavigationButtonIconData,
      _this.forwardNavigationButtonIconData,
      _this.navigationButtonPadding,
      _this.navigationButtonDisabledOpacity,
      _this.calendarDecoration,
      _this.spacingBetweenMonths,
      _this.runSpacingBetweenMonths,
      _this.monthConstraints,
      _this.calendarHeaderHeight,
      _this.calendarHeaderPadding,
      _this.captionLayoutGap,
      _this.calendarHeaderTextStyle,
      _this.weekdaysPadding,
      _this.weekdaysTextStyle,
      _this.weekdaysTextAlign,
      _this.weekNumbersHeaderText,
      _this.weekNumbersHeaderTextStyle,
      _this.weekNumbersTextStyle,
      _this.weekNumbersTextAlign,
      _this.dayButtonSize,
      _this.dayButtonOutsideMonthOpacity,
      _this.dayButtonPadding,
      _this.dayButtonDecoration,
      _this.selectedDayButtonTextStyle,
      _this.insideRangeDayButtonTextStyle,
      _this.dayButtonTextStyle,
      _this.dayButtonVariant,
      _this.selectedDayButtonVariant,
      _this.insideRangeDayButtonVariant,
      _this.todayButtonVariant,
      _this.gridMainAxisSpacing,
      _this.gridCrossAxisSpacing,
      _this.dayButtonOutsideMonthTextStyle,
      _this.dayButtonOutsideMonthVariant,
      _this.selectedDayButtonOusideMonthVariant,
      _this.captionLayout,
      _this.hideWeekdayNames,
      _this.showOutsideDays,
      _this.formatMonthYear,
      _this.formatMonth,
      _this.formatYear,
      _this.formatWeekday,
      _this.showWeekNumbers,
      _this.weekStartsOn,
      _this.fixedWeeks,
      _this.allowDeselection,
      _this.effects,
      _this.shadows,
      _this.popoverPadding,
      _this.popoverDecoration,
      _this.anchor,
      _this.filter,
      _this.popoverReverseDuration,
      _this.cursor,
      _this.size,
      _this.sizesTheme,
      _this.buttonVariant,
      _this.backgroundColor,
      _this.hoverBackgroundColor,
      _this.foregroundColor,
      _this.hoverForegroundColor,
      _this.pressedBackgroundColor,
      _this.pressedForegroundColor,
      _this.disabledBackgroundColor,
      _this.buttonShadows,
      _this.gradient,
      _this.textDecoration,
      _this.hoverTextDecoration,
      _this.buttonDecoration,
      _this.width,
      _this.height,
      _this.longPressDuration,
      _this.hoverStrategies,
      _this.mainAxisAlignment,
      _this.crossAxisAlignment,
      _this.textDirection,
      _this.gap,
      _this.buttonPadding,
      _this.expands,
      _this.buttonTextStyle,
    ]);
  }
}
