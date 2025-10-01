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

  static ShadDatePickerTheme lerp(
    ShadDatePickerTheme? a,
    ShadDatePickerTheme? b,
    double t,
  ) {
    if (a == null && b == null) {
      throw ArgumentError('Both a and b cannot be null');
    }

    return ShadDatePickerTheme(
      formatDate: t < 0.5 ? a?.formatDate : b?.formatDate,
      formatDateRange: t < 0.5 ? a?.formatDateRange : b?.formatDateRange,
      iconData: t < 0.5 ? a?.iconData : b?.iconData,
      hideNavigation: t < 0.5 ? a?.hideNavigation : b?.hideNavigation,
      yearSelectorMinWidth: lerpDouble$(
        a?.yearSelectorMinWidth,
        b?.yearSelectorMinWidth,
        t,
      ),
      monthSelectorMinWidth: lerpDouble$(
        a?.monthSelectorMinWidth,
        b?.monthSelectorMinWidth,
        t,
      ),
      yearSelectorPadding: EdgeInsetsGeometry.lerp(
        a?.yearSelectorPadding,
        b?.yearSelectorPadding,
        t,
      ),
      monthSelectorPadding: EdgeInsetsGeometry.lerp(
        a?.monthSelectorPadding,
        b?.monthSelectorPadding,
        t,
      ),
      navigationButtonSize: lerpDouble$(
        a?.navigationButtonSize,
        b?.navigationButtonSize,
        t,
      ),
      navigationButtonIconSize: lerpDouble$(
        a?.navigationButtonIconSize,
        b?.navigationButtonIconSize,
        t,
      ),
      backNavigationButtonIconData: t < 0.5
          ? a?.backNavigationButtonIconData
          : b?.backNavigationButtonIconData,
      forwardNavigationButtonIconData: t < 0.5
          ? a?.forwardNavigationButtonIconData
          : b?.forwardNavigationButtonIconData,
      navigationButtonPadding: EdgeInsetsGeometry.lerp(
        a?.navigationButtonPadding,
        b?.navigationButtonPadding,
        t,
      ),
      navigationButtonDisabledOpacity: lerpDouble$(
        a?.navigationButtonDisabledOpacity,
        b?.navigationButtonDisabledOpacity,
        t,
      ),
      calendarDecoration: ShadDecoration.lerp(
        a?.calendarDecoration,
        b?.calendarDecoration,
        t,
      ),
      spacingBetweenMonths: lerpDouble$(
        a?.spacingBetweenMonths,
        b?.spacingBetweenMonths,
        t,
      ),
      runSpacingBetweenMonths: lerpDouble$(
        a?.runSpacingBetweenMonths,
        b?.runSpacingBetweenMonths,
        t,
      ),
      monthConstraints: BoxConstraints.lerp(
        a?.monthConstraints,
        b?.monthConstraints,
        t,
      ),
      calendarHeaderHeight: lerpDouble$(
        a?.calendarHeaderHeight,
        b?.calendarHeaderHeight,
        t,
      ),
      calendarHeaderPadding: EdgeInsetsGeometry.lerp(
        a?.calendarHeaderPadding,
        b?.calendarHeaderPadding,
        t,
      ),
      captionLayoutGap: lerpDouble$(
        a?.captionLayoutGap,
        b?.captionLayoutGap,
        t,
      ),
      calendarHeaderTextStyle: TextStyle.lerp(
        a?.calendarHeaderTextStyle,
        b?.calendarHeaderTextStyle,
        t,
      ),
      weekdaysPadding: EdgeInsetsGeometry.lerp(
        a?.weekdaysPadding,
        b?.weekdaysPadding,
        t,
      ),
      weekdaysTextStyle: TextStyle.lerp(
        a?.weekdaysTextStyle,
        b?.weekdaysTextStyle,
        t,
      ),
      weekdaysTextAlign: t < 0.5 ? a?.weekdaysTextAlign : b?.weekdaysTextAlign,
      weekNumbersHeaderText:
          t < 0.5 ? a?.weekNumbersHeaderText : b?.weekNumbersHeaderText,
      weekNumbersHeaderTextStyle: TextStyle.lerp(
        a?.weekNumbersHeaderTextStyle,
        b?.weekNumbersHeaderTextStyle,
        t,
      ),
      weekNumbersTextStyle: TextStyle.lerp(
        a?.weekNumbersTextStyle,
        b?.weekNumbersTextStyle,
        t,
      ),
      weekNumbersTextAlign:
          t < 0.5 ? a?.weekNumbersTextAlign : b?.weekNumbersTextAlign,
      dayButtonSize: lerpDouble$(a?.dayButtonSize, b?.dayButtonSize, t),
      dayButtonOutsideMonthOpacity: lerpDouble$(
        a?.dayButtonOutsideMonthOpacity,
        b?.dayButtonOutsideMonthOpacity,
        t,
      ),
      dayButtonPadding: EdgeInsetsGeometry.lerp(
        a?.dayButtonPadding,
        b?.dayButtonPadding,
        t,
      ),
      dayButtonDecoration: ShadDecoration.lerp(
        a?.dayButtonDecoration,
        b?.dayButtonDecoration,
        t,
      ),
      selectedDayButtonTextStyle: TextStyle.lerp(
        a?.selectedDayButtonTextStyle,
        b?.selectedDayButtonTextStyle,
        t,
      ),
      insideRangeDayButtonTextStyle: TextStyle.lerp(
        a?.insideRangeDayButtonTextStyle,
        b?.insideRangeDayButtonTextStyle,
        t,
      ),
      dayButtonTextStyle: TextStyle.lerp(
        a?.dayButtonTextStyle,
        b?.dayButtonTextStyle,
        t,
      ),
      dayButtonVariant: t < 0.5 ? a?.dayButtonVariant : b?.dayButtonVariant,
      selectedDayButtonVariant:
          t < 0.5 ? a?.selectedDayButtonVariant : b?.selectedDayButtonVariant,
      insideRangeDayButtonVariant: t < 0.5
          ? a?.insideRangeDayButtonVariant
          : b?.insideRangeDayButtonVariant,
      todayButtonVariant:
          t < 0.5 ? a?.todayButtonVariant : b?.todayButtonVariant,
      gridMainAxisSpacing: lerpDouble$(
        a?.gridMainAxisSpacing,
        b?.gridMainAxisSpacing,
        t,
      ),
      gridCrossAxisSpacing: lerpDouble$(
        a?.gridCrossAxisSpacing,
        b?.gridCrossAxisSpacing,
        t,
      ),
      dayButtonOutsideMonthTextStyle: TextStyle.lerp(
        a?.dayButtonOutsideMonthTextStyle,
        b?.dayButtonOutsideMonthTextStyle,
        t,
      ),
      dayButtonOutsideMonthVariant: t < 0.5
          ? a?.dayButtonOutsideMonthVariant
          : b?.dayButtonOutsideMonthVariant,
      selectedDayButtonOusideMonthVariant: t < 0.5
          ? a?.selectedDayButtonOusideMonthVariant
          : b?.selectedDayButtonOusideMonthVariant,
      captionLayout: t < 0.5 ? a?.captionLayout : b?.captionLayout,
      hideWeekdayNames: t < 0.5 ? a?.hideWeekdayNames : b?.hideWeekdayNames,
      showOutsideDays: t < 0.5 ? a?.showOutsideDays : b?.showOutsideDays,
      formatMonthYear: t < 0.5 ? a?.formatMonthYear : b?.formatMonthYear,
      formatMonth: t < 0.5 ? a?.formatMonth : b?.formatMonth,
      formatYear: t < 0.5 ? a?.formatYear : b?.formatYear,
      formatWeekday: t < 0.5 ? a?.formatWeekday : b?.formatWeekday,
      showWeekNumbers: t < 0.5 ? a?.showWeekNumbers : b?.showWeekNumbers,
      weekStartsOn: t < 0.5 ? a?.weekStartsOn : b?.weekStartsOn,
      fixedWeeks: t < 0.5 ? a?.fixedWeeks : b?.fixedWeeks,
      allowDeselection: t < 0.5 ? a?.allowDeselection : b?.allowDeselection,
      effects: t < 0.5 ? a?.effects : b?.effects,
      shadows: t < 0.5 ? a?.shadows : b?.shadows,
      popoverPadding: EdgeInsetsGeometry.lerp(
        a?.popoverPadding,
        b?.popoverPadding,
        t,
      ),
      popoverDecoration: ShadDecoration.lerp(
        a?.popoverDecoration,
        b?.popoverDecoration,
        t,
      ),
      anchor: t < 0.5 ? a?.anchor : b?.anchor,
      filter: t < 0.5 ? a?.filter : b?.filter,
      popoverReverseDuration: lerpDuration$(
        a?.popoverReverseDuration,
        b?.popoverReverseDuration,
        t,
      ),
      cursor: t < 0.5 ? a?.cursor : b?.cursor,
      size: t < 0.5 ? a?.size : b?.size,
      sizesTheme: ShadButtonSizesTheme.lerp(a?.sizesTheme, b?.sizesTheme, t),
      buttonVariant: t < 0.5 ? a?.buttonVariant : b?.buttonVariant,
      backgroundColor: Color.lerp(a?.backgroundColor, b?.backgroundColor, t),
      hoverBackgroundColor: Color.lerp(
        a?.hoverBackgroundColor,
        b?.hoverBackgroundColor,
        t,
      ),
      foregroundColor: Color.lerp(a?.foregroundColor, b?.foregroundColor, t),
      hoverForegroundColor: Color.lerp(
        a?.hoverForegroundColor,
        b?.hoverForegroundColor,
        t,
      ),
      pressedBackgroundColor: Color.lerp(
        a?.pressedBackgroundColor,
        b?.pressedBackgroundColor,
        t,
      ),
      pressedForegroundColor: Color.lerp(
        a?.pressedForegroundColor,
        b?.pressedForegroundColor,
        t,
      ),
      disabledBackgroundColor: Color.lerp(
        a?.disabledBackgroundColor,
        b?.disabledBackgroundColor,
        t,
      ),
      buttonShadows: t < 0.5 ? a?.buttonShadows : b?.buttonShadows,
      gradient: Gradient.lerp(a?.gradient, b?.gradient, t),
      textDecoration: t < 0.5 ? a?.textDecoration : b?.textDecoration,
      hoverTextDecoration:
          t < 0.5 ? a?.hoverTextDecoration : b?.hoverTextDecoration,
      buttonDecoration: ShadDecoration.lerp(
        a?.buttonDecoration,
        b?.buttonDecoration,
        t,
      ),
      width: lerpDouble$(a?.width, b?.width, t),
      height: lerpDouble$(a?.height, b?.height, t),
      longPressDuration: lerpDuration$(
        a?.longPressDuration,
        b?.longPressDuration,
        t,
      ),
      hoverStrategies: t < 0.5 ? a?.hoverStrategies : b?.hoverStrategies,
      mainAxisAlignment: t < 0.5 ? a?.mainAxisAlignment : b?.mainAxisAlignment,
      crossAxisAlignment:
          t < 0.5 ? a?.crossAxisAlignment : b?.crossAxisAlignment,
      textDirection: t < 0.5 ? a?.textDirection : b?.textDirection,
      gap: lerpDouble$(a?.gap, b?.gap, t),
      buttonPadding: EdgeInsetsGeometry.lerp(
        a?.buttonPadding,
        b?.buttonPadding,
        t,
      ),
      expands: t < 0.5 ? a?.expands : b?.expands,
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
  }) {
    final a = (this as ShadDatePickerTheme);

    return ShadDatePickerTheme(
      formatDate: formatDate ?? a.formatDate,
      formatDateRange: formatDateRange ?? a.formatDateRange,
      iconData: iconData ?? a.iconData,
      hideNavigation: hideNavigation ?? a.hideNavigation,
      yearSelectorMinWidth: yearSelectorMinWidth ?? a.yearSelectorMinWidth,
      monthSelectorMinWidth: monthSelectorMinWidth ?? a.monthSelectorMinWidth,
      yearSelectorPadding: yearSelectorPadding ?? a.yearSelectorPadding,
      monthSelectorPadding: monthSelectorPadding ?? a.monthSelectorPadding,
      navigationButtonSize: navigationButtonSize ?? a.navigationButtonSize,
      navigationButtonIconSize:
          navigationButtonIconSize ?? a.navigationButtonIconSize,
      backNavigationButtonIconData:
          backNavigationButtonIconData ?? a.backNavigationButtonIconData,
      forwardNavigationButtonIconData:
          forwardNavigationButtonIconData ?? a.forwardNavigationButtonIconData,
      navigationButtonPadding:
          navigationButtonPadding ?? a.navigationButtonPadding,
      navigationButtonDisabledOpacity:
          navigationButtonDisabledOpacity ?? a.navigationButtonDisabledOpacity,
      calendarDecoration: calendarDecoration ?? a.calendarDecoration,
      spacingBetweenMonths: spacingBetweenMonths ?? a.spacingBetweenMonths,
      runSpacingBetweenMonths:
          runSpacingBetweenMonths ?? a.runSpacingBetweenMonths,
      monthConstraints: monthConstraints ?? a.monthConstraints,
      calendarHeaderHeight: calendarHeaderHeight ?? a.calendarHeaderHeight,
      calendarHeaderPadding: calendarHeaderPadding ?? a.calendarHeaderPadding,
      captionLayoutGap: captionLayoutGap ?? a.captionLayoutGap,
      calendarHeaderTextStyle:
          calendarHeaderTextStyle ?? a.calendarHeaderTextStyle,
      weekdaysPadding: weekdaysPadding ?? a.weekdaysPadding,
      weekdaysTextStyle: weekdaysTextStyle ?? a.weekdaysTextStyle,
      weekdaysTextAlign: weekdaysTextAlign ?? a.weekdaysTextAlign,
      weekNumbersHeaderText: weekNumbersHeaderText ?? a.weekNumbersHeaderText,
      weekNumbersHeaderTextStyle:
          weekNumbersHeaderTextStyle ?? a.weekNumbersHeaderTextStyle,
      weekNumbersTextStyle: weekNumbersTextStyle ?? a.weekNumbersTextStyle,
      weekNumbersTextAlign: weekNumbersTextAlign ?? a.weekNumbersTextAlign,
      dayButtonSize: dayButtonSize ?? a.dayButtonSize,
      dayButtonOutsideMonthOpacity:
          dayButtonOutsideMonthOpacity ?? a.dayButtonOutsideMonthOpacity,
      dayButtonPadding: dayButtonPadding ?? a.dayButtonPadding,
      dayButtonDecoration: dayButtonDecoration ?? a.dayButtonDecoration,
      selectedDayButtonTextStyle:
          selectedDayButtonTextStyle ?? a.selectedDayButtonTextStyle,
      insideRangeDayButtonTextStyle:
          insideRangeDayButtonTextStyle ?? a.insideRangeDayButtonTextStyle,
      dayButtonTextStyle: dayButtonTextStyle ?? a.dayButtonTextStyle,
      dayButtonVariant: dayButtonVariant ?? a.dayButtonVariant,
      selectedDayButtonVariant:
          selectedDayButtonVariant ?? a.selectedDayButtonVariant,
      insideRangeDayButtonVariant:
          insideRangeDayButtonVariant ?? a.insideRangeDayButtonVariant,
      todayButtonVariant: todayButtonVariant ?? a.todayButtonVariant,
      gridMainAxisSpacing: gridMainAxisSpacing ?? a.gridMainAxisSpacing,
      gridCrossAxisSpacing: gridCrossAxisSpacing ?? a.gridCrossAxisSpacing,
      dayButtonOutsideMonthTextStyle:
          dayButtonOutsideMonthTextStyle ?? a.dayButtonOutsideMonthTextStyle,
      dayButtonOutsideMonthVariant:
          dayButtonOutsideMonthVariant ?? a.dayButtonOutsideMonthVariant,
      selectedDayButtonOusideMonthVariant:
          selectedDayButtonOusideMonthVariant ??
              a.selectedDayButtonOusideMonthVariant,
      captionLayout: captionLayout ?? a.captionLayout,
      hideWeekdayNames: hideWeekdayNames ?? a.hideWeekdayNames,
      showOutsideDays: showOutsideDays ?? a.showOutsideDays,
      formatMonthYear: formatMonthYear ?? a.formatMonthYear,
      formatMonth: formatMonth ?? a.formatMonth,
      formatYear: formatYear ?? a.formatYear,
      formatWeekday: formatWeekday ?? a.formatWeekday,
      showWeekNumbers: showWeekNumbers ?? a.showWeekNumbers,
      weekStartsOn: weekStartsOn ?? a.weekStartsOn,
      fixedWeeks: fixedWeeks ?? a.fixedWeeks,
      allowDeselection: allowDeselection ?? a.allowDeselection,
      effects: effects ?? a.effects,
      shadows: shadows ?? a.shadows,
      popoverPadding: popoverPadding ?? a.popoverPadding,
      popoverDecoration: popoverDecoration ?? a.popoverDecoration,
      anchor: anchor ?? a.anchor,
      filter: filter ?? a.filter,
      popoverReverseDuration:
          popoverReverseDuration ?? a.popoverReverseDuration,
      cursor: cursor ?? a.cursor,
      size: size ?? a.size,
      sizesTheme: sizesTheme ?? a.sizesTheme,
      buttonVariant: buttonVariant ?? a.buttonVariant,
      backgroundColor: backgroundColor ?? a.backgroundColor,
      hoverBackgroundColor: hoverBackgroundColor ?? a.hoverBackgroundColor,
      foregroundColor: foregroundColor ?? a.foregroundColor,
      hoverForegroundColor: hoverForegroundColor ?? a.hoverForegroundColor,
      pressedBackgroundColor:
          pressedBackgroundColor ?? a.pressedBackgroundColor,
      pressedForegroundColor:
          pressedForegroundColor ?? a.pressedForegroundColor,
      disabledBackgroundColor:
          disabledBackgroundColor ?? a.disabledBackgroundColor,
      buttonShadows: buttonShadows ?? a.buttonShadows,
      gradient: gradient ?? a.gradient,
      textDecoration: textDecoration ?? a.textDecoration,
      hoverTextDecoration: hoverTextDecoration ?? a.hoverTextDecoration,
      buttonDecoration: buttonDecoration ?? a.buttonDecoration,
      width: width ?? a.width,
      height: height ?? a.height,
      longPressDuration: longPressDuration ?? a.longPressDuration,
      hoverStrategies: hoverStrategies ?? a.hoverStrategies,
      mainAxisAlignment: mainAxisAlignment ?? a.mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment ?? a.crossAxisAlignment,
      textDirection: textDirection ?? a.textDirection,
      gap: gap ?? a.gap,
      buttonPadding: buttonPadding ?? a.buttonPadding,
      expands: expands ?? a.expands,
    );
  }

  ShadDatePickerTheme merge(ShadDatePickerTheme? other) {
    final current = (this as ShadDatePickerTheme);

    if (other == null) {
      return current;
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
      calendarDecoration: other.calendarDecoration,
      spacingBetweenMonths: other.spacingBetweenMonths,
      runSpacingBetweenMonths: other.runSpacingBetweenMonths,
      monthConstraints: other.monthConstraints,
      calendarHeaderHeight: other.calendarHeaderHeight,
      calendarHeaderPadding: other.calendarHeaderPadding,
      captionLayoutGap: other.captionLayoutGap,
      calendarHeaderTextStyle: current.calendarHeaderTextStyle?.merge(
            other.calendarHeaderTextStyle,
          ) ??
          other.calendarHeaderTextStyle,
      weekdaysPadding: other.weekdaysPadding,
      weekdaysTextStyle:
          current.weekdaysTextStyle?.merge(other.weekdaysTextStyle) ??
              other.weekdaysTextStyle,
      weekdaysTextAlign: other.weekdaysTextAlign,
      weekNumbersHeaderText: other.weekNumbersHeaderText,
      weekNumbersHeaderTextStyle: current.weekNumbersHeaderTextStyle?.merge(
            other.weekNumbersHeaderTextStyle,
          ) ??
          other.weekNumbersHeaderTextStyle,
      weekNumbersTextStyle:
          current.weekNumbersTextStyle?.merge(other.weekNumbersTextStyle) ??
              other.weekNumbersTextStyle,
      weekNumbersTextAlign: other.weekNumbersTextAlign,
      dayButtonSize: other.dayButtonSize,
      dayButtonOutsideMonthOpacity: other.dayButtonOutsideMonthOpacity,
      dayButtonPadding: other.dayButtonPadding,
      dayButtonDecoration: other.dayButtonDecoration,
      selectedDayButtonTextStyle: current.selectedDayButtonTextStyle?.merge(
            other.selectedDayButtonTextStyle,
          ) ??
          other.selectedDayButtonTextStyle,
      insideRangeDayButtonTextStyle:
          current.insideRangeDayButtonTextStyle?.merge(
                other.insideRangeDayButtonTextStyle,
              ) ??
              other.insideRangeDayButtonTextStyle,
      dayButtonTextStyle:
          current.dayButtonTextStyle?.merge(other.dayButtonTextStyle) ??
              other.dayButtonTextStyle,
      dayButtonVariant: other.dayButtonVariant,
      selectedDayButtonVariant: other.selectedDayButtonVariant,
      insideRangeDayButtonVariant: other.insideRangeDayButtonVariant,
      todayButtonVariant: other.todayButtonVariant,
      gridMainAxisSpacing: other.gridMainAxisSpacing,
      gridCrossAxisSpacing: other.gridCrossAxisSpacing,
      dayButtonOutsideMonthTextStyle:
          current.dayButtonOutsideMonthTextStyle?.merge(
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
      popoverDecoration: other.popoverDecoration,
      anchor: other.anchor,
      filter: other.filter,
      popoverReverseDuration: other.popoverReverseDuration,
      cursor: other.cursor,
      size: other.size,
      sizesTheme: other.sizesTheme,
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
      buttonDecoration: other.buttonDecoration,
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

    final value = (this as ShadDatePickerTheme);

    return other is ShadDatePickerTheme &&
        other.formatDate == value.formatDate &&
        other.formatDateRange == value.formatDateRange &&
        other.iconData == value.iconData &&
        other.hideNavigation == value.hideNavigation &&
        other.yearSelectorMinWidth == value.yearSelectorMinWidth &&
        other.monthSelectorMinWidth == value.monthSelectorMinWidth &&
        other.yearSelectorPadding == value.yearSelectorPadding &&
        other.monthSelectorPadding == value.monthSelectorPadding &&
        other.navigationButtonSize == value.navigationButtonSize &&
        other.navigationButtonIconSize == value.navigationButtonIconSize &&
        other.backNavigationButtonIconData ==
            value.backNavigationButtonIconData &&
        other.forwardNavigationButtonIconData ==
            value.forwardNavigationButtonIconData &&
        other.navigationButtonPadding == value.navigationButtonPadding &&
        other.navigationButtonDisabledOpacity ==
            value.navigationButtonDisabledOpacity &&
        other.calendarDecoration == value.calendarDecoration &&
        other.spacingBetweenMonths == value.spacingBetweenMonths &&
        other.runSpacingBetweenMonths == value.runSpacingBetweenMonths &&
        other.monthConstraints == value.monthConstraints &&
        other.calendarHeaderHeight == value.calendarHeaderHeight &&
        other.calendarHeaderPadding == value.calendarHeaderPadding &&
        other.captionLayoutGap == value.captionLayoutGap &&
        other.calendarHeaderTextStyle == value.calendarHeaderTextStyle &&
        other.weekdaysPadding == value.weekdaysPadding &&
        other.weekdaysTextStyle == value.weekdaysTextStyle &&
        other.weekdaysTextAlign == value.weekdaysTextAlign &&
        other.weekNumbersHeaderText == value.weekNumbersHeaderText &&
        other.weekNumbersHeaderTextStyle == value.weekNumbersHeaderTextStyle &&
        other.weekNumbersTextStyle == value.weekNumbersTextStyle &&
        other.weekNumbersTextAlign == value.weekNumbersTextAlign &&
        other.dayButtonSize == value.dayButtonSize &&
        other.dayButtonOutsideMonthOpacity ==
            value.dayButtonOutsideMonthOpacity &&
        other.dayButtonPadding == value.dayButtonPadding &&
        other.dayButtonDecoration == value.dayButtonDecoration &&
        other.selectedDayButtonTextStyle == value.selectedDayButtonTextStyle &&
        other.insideRangeDayButtonTextStyle ==
            value.insideRangeDayButtonTextStyle &&
        other.dayButtonTextStyle == value.dayButtonTextStyle &&
        other.dayButtonVariant == value.dayButtonVariant &&
        other.selectedDayButtonVariant == value.selectedDayButtonVariant &&
        other.insideRangeDayButtonVariant ==
            value.insideRangeDayButtonVariant &&
        other.todayButtonVariant == value.todayButtonVariant &&
        other.gridMainAxisSpacing == value.gridMainAxisSpacing &&
        other.gridCrossAxisSpacing == value.gridCrossAxisSpacing &&
        other.dayButtonOutsideMonthTextStyle ==
            value.dayButtonOutsideMonthTextStyle &&
        other.dayButtonOutsideMonthVariant ==
            value.dayButtonOutsideMonthVariant &&
        other.selectedDayButtonOusideMonthVariant ==
            value.selectedDayButtonOusideMonthVariant &&
        other.captionLayout == value.captionLayout &&
        other.hideWeekdayNames == value.hideWeekdayNames &&
        other.showOutsideDays == value.showOutsideDays &&
        other.formatMonthYear == value.formatMonthYear &&
        other.formatMonth == value.formatMonth &&
        other.formatYear == value.formatYear &&
        other.formatWeekday == value.formatWeekday &&
        other.showWeekNumbers == value.showWeekNumbers &&
        other.weekStartsOn == value.weekStartsOn &&
        other.fixedWeeks == value.fixedWeeks &&
        other.allowDeselection == value.allowDeselection &&
        other.effects == value.effects &&
        other.shadows == value.shadows &&
        other.popoverPadding == value.popoverPadding &&
        other.popoverDecoration == value.popoverDecoration &&
        other.anchor == value.anchor &&
        other.filter == value.filter &&
        other.popoverReverseDuration == value.popoverReverseDuration &&
        other.cursor == value.cursor &&
        other.size == value.size &&
        other.sizesTheme == value.sizesTheme &&
        other.buttonVariant == value.buttonVariant &&
        other.backgroundColor == value.backgroundColor &&
        other.hoverBackgroundColor == value.hoverBackgroundColor &&
        other.foregroundColor == value.foregroundColor &&
        other.hoverForegroundColor == value.hoverForegroundColor &&
        other.pressedBackgroundColor == value.pressedBackgroundColor &&
        other.pressedForegroundColor == value.pressedForegroundColor &&
        other.disabledBackgroundColor == value.disabledBackgroundColor &&
        other.buttonShadows == value.buttonShadows &&
        other.gradient == value.gradient &&
        other.textDecoration == value.textDecoration &&
        other.hoverTextDecoration == value.hoverTextDecoration &&
        other.buttonDecoration == value.buttonDecoration &&
        other.width == value.width &&
        other.height == value.height &&
        other.longPressDuration == value.longPressDuration &&
        other.hoverStrategies == value.hoverStrategies &&
        other.mainAxisAlignment == value.mainAxisAlignment &&
        other.crossAxisAlignment == value.crossAxisAlignment &&
        other.textDirection == value.textDirection &&
        other.gap == value.gap &&
        other.buttonPadding == value.buttonPadding &&
        other.expands == value.expands;
  }

  @override
  int get hashCode {
    final value = (this as ShadDatePickerTheme);

    return Object.hashAll([
      runtimeType,
      value.formatDate,
      value.formatDateRange,
      value.iconData,
      value.hideNavigation,
      value.yearSelectorMinWidth,
      value.monthSelectorMinWidth,
      value.yearSelectorPadding,
      value.monthSelectorPadding,
      value.navigationButtonSize,
      value.navigationButtonIconSize,
      value.backNavigationButtonIconData,
      value.forwardNavigationButtonIconData,
      value.navigationButtonPadding,
      value.navigationButtonDisabledOpacity,
      value.calendarDecoration,
      value.spacingBetweenMonths,
      value.runSpacingBetweenMonths,
      value.monthConstraints,
      value.calendarHeaderHeight,
      value.calendarHeaderPadding,
      value.captionLayoutGap,
      value.calendarHeaderTextStyle,
      value.weekdaysPadding,
      value.weekdaysTextStyle,
      value.weekdaysTextAlign,
      value.weekNumbersHeaderText,
      value.weekNumbersHeaderTextStyle,
      value.weekNumbersTextStyle,
      value.weekNumbersTextAlign,
      value.dayButtonSize,
      value.dayButtonOutsideMonthOpacity,
      value.dayButtonPadding,
      value.dayButtonDecoration,
      value.selectedDayButtonTextStyle,
      value.insideRangeDayButtonTextStyle,
      value.dayButtonTextStyle,
      value.dayButtonVariant,
      value.selectedDayButtonVariant,
      value.insideRangeDayButtonVariant,
      value.todayButtonVariant,
      value.gridMainAxisSpacing,
      value.gridCrossAxisSpacing,
      value.dayButtonOutsideMonthTextStyle,
      value.dayButtonOutsideMonthVariant,
      value.selectedDayButtonOusideMonthVariant,
      value.captionLayout,
      value.hideWeekdayNames,
      value.showOutsideDays,
      value.formatMonthYear,
      value.formatMonth,
      value.formatYear,
      value.formatWeekday,
      value.showWeekNumbers,
      value.weekStartsOn,
      value.fixedWeeks,
      value.allowDeselection,
      value.effects,
      value.shadows,
      value.popoverPadding,
      value.popoverDecoration,
      value.anchor,
      value.filter,
      value.popoverReverseDuration,
      value.cursor,
      value.size,
      value.sizesTheme,
      value.buttonVariant,
      value.backgroundColor,
      value.hoverBackgroundColor,
      value.foregroundColor,
      value.hoverForegroundColor,
      value.pressedBackgroundColor,
      value.pressedForegroundColor,
      value.disabledBackgroundColor,
      value.buttonShadows,
      value.gradient,
      value.textDecoration,
      value.hoverTextDecoration,
      value.buttonDecoration,
      value.width,
      value.height,
      value.longPressDuration,
      value.hoverStrategies,
      value.mainAxisAlignment,
      value.crossAxisAlignment,
      value.textDirection,
      value.gap,
      value.buttonPadding,
      value.expands,
    ]);
  }
}
