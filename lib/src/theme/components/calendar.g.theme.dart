// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'calendar.dart';

// **************************************************************************
// ThemeGenGenerator
// **************************************************************************

mixin _$ShadCalendarTheme {
  bool get canMerge => true;

  static ShadCalendarTheme? lerp(
    ShadCalendarTheme? a,
    ShadCalendarTheme? b,
    double t,
  ) {
    if (a == null && b == null) {
      return null;
    }

    return ShadCalendarTheme(
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
      decoration: ShadDecoration.lerp(a?.decoration, b?.decoration, t),
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
      headerHeight: lerpDouble$(a?.headerHeight, b?.headerHeight, t),
      headerPadding: EdgeInsetsGeometry.lerp(
        a?.headerPadding,
        b?.headerPadding,
        t,
      ),
      captionLayoutGap: lerpDouble$(
        a?.captionLayoutGap,
        b?.captionLayoutGap,
        t,
      ),
      headerTextStyle: TextStyle.lerp(
        a?.headerTextStyle,
        b?.headerTextStyle,
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
      weekNumbersHeaderText: t < 0.5
          ? a?.weekNumbersHeaderText
          : b?.weekNumbersHeaderText,
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
      weekNumbersTextAlign: t < 0.5
          ? a?.weekNumbersTextAlign
          : b?.weekNumbersTextAlign,
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
      selectedDayButtonVariant: t < 0.5
          ? a?.selectedDayButtonVariant
          : b?.selectedDayButtonVariant,
      insideRangeDayButtonVariant: t < 0.5
          ? a?.insideRangeDayButtonVariant
          : b?.insideRangeDayButtonVariant,
      todayButtonVariant: t < 0.5
          ? a?.todayButtonVariant
          : b?.todayButtonVariant,
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
      dropdownFormatMonth: t < 0.5
          ? a?.dropdownFormatMonth
          : b?.dropdownFormatMonth,
      dropdownFormatYear: t < 0.5
          ? a?.dropdownFormatYear
          : b?.dropdownFormatYear,
      showWeekNumbers: t < 0.5 ? a?.showWeekNumbers : b?.showWeekNumbers,
      weekStartsOn: t < 0.5 ? a?.weekStartsOn : b?.weekStartsOn,
      fixedWeeks: t < 0.5 ? a?.fixedWeeks : b?.fixedWeeks,
      allowDeselection: t < 0.5 ? a?.allowDeselection : b?.allowDeselection,
    );
  }

  ShadCalendarTheme copyWith({
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
    ShadDecoration? decoration,
    double? spacingBetweenMonths,
    double? runSpacingBetweenMonths,
    BoxConstraints? monthConstraints,
    double? headerHeight,
    EdgeInsetsGeometry? headerPadding,
    double? captionLayoutGap,
    TextStyle? headerTextStyle,
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
    String Function(DateTime)? dropdownFormatMonth,
    String Function(DateTime)? dropdownFormatYear,
    bool? showWeekNumbers,
    int? weekStartsOn,
    bool? fixedWeeks,
    bool? allowDeselection,
  }) {
    final a = (this as ShadCalendarTheme);

    return ShadCalendarTheme(
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
      decoration: decoration ?? a.decoration,
      spacingBetweenMonths: spacingBetweenMonths ?? a.spacingBetweenMonths,
      runSpacingBetweenMonths:
          runSpacingBetweenMonths ?? a.runSpacingBetweenMonths,
      monthConstraints: monthConstraints ?? a.monthConstraints,
      headerHeight: headerHeight ?? a.headerHeight,
      headerPadding: headerPadding ?? a.headerPadding,
      captionLayoutGap: captionLayoutGap ?? a.captionLayoutGap,
      headerTextStyle: headerTextStyle ?? a.headerTextStyle,
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
      dropdownFormatMonth: dropdownFormatMonth ?? a.dropdownFormatMonth,
      dropdownFormatYear: dropdownFormatYear ?? a.dropdownFormatYear,
      showWeekNumbers: showWeekNumbers ?? a.showWeekNumbers,
      weekStartsOn: weekStartsOn ?? a.weekStartsOn,
      fixedWeeks: fixedWeeks ?? a.fixedWeeks,
      allowDeselection: allowDeselection ?? a.allowDeselection,
    );
  }

  ShadCalendarTheme merge(ShadCalendarTheme? other) {
    final current = (this as ShadCalendarTheme);

    if (other == null) {
      return current;
    }

    if (!other.canMerge) {
      return other;
    }

    return copyWith(
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
      decoration: other.decoration,
      spacingBetweenMonths: other.spacingBetweenMonths,
      runSpacingBetweenMonths: other.runSpacingBetweenMonths,
      monthConstraints: other.monthConstraints,
      headerHeight: other.headerHeight,
      headerPadding: other.headerPadding,
      captionLayoutGap: other.captionLayoutGap,
      headerTextStyle:
          current.headerTextStyle?.merge(other.headerTextStyle) ??
          other.headerTextStyle,
      weekdaysPadding: other.weekdaysPadding,
      weekdaysTextStyle:
          current.weekdaysTextStyle?.merge(other.weekdaysTextStyle) ??
          other.weekdaysTextStyle,
      weekdaysTextAlign: other.weekdaysTextAlign,
      weekNumbersHeaderText: other.weekNumbersHeaderText,
      weekNumbersHeaderTextStyle:
          current.weekNumbersHeaderTextStyle?.merge(
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
      selectedDayButtonTextStyle:
          current.selectedDayButtonTextStyle?.merge(
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
      dropdownFormatMonth: other.dropdownFormatMonth,
      dropdownFormatYear: other.dropdownFormatYear,
      showWeekNumbers: other.showWeekNumbers,
      weekStartsOn: other.weekStartsOn,
      fixedWeeks: other.fixedWeeks,
      allowDeselection: other.allowDeselection,
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

    final value = (this as ShadCalendarTheme);

    return other is ShadCalendarTheme &&
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
        other.decoration == value.decoration &&
        other.spacingBetweenMonths == value.spacingBetweenMonths &&
        other.runSpacingBetweenMonths == value.runSpacingBetweenMonths &&
        other.monthConstraints == value.monthConstraints &&
        other.headerHeight == value.headerHeight &&
        other.headerPadding == value.headerPadding &&
        other.captionLayoutGap == value.captionLayoutGap &&
        other.headerTextStyle == value.headerTextStyle &&
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
        other.dropdownFormatMonth == value.dropdownFormatMonth &&
        other.dropdownFormatYear == value.dropdownFormatYear &&
        other.showWeekNumbers == value.showWeekNumbers &&
        other.weekStartsOn == value.weekStartsOn &&
        other.fixedWeeks == value.fixedWeeks &&
        other.allowDeselection == value.allowDeselection;
  }

  @override
  int get hashCode {
    final value = (this as ShadCalendarTheme);

    return Object.hashAll([
      runtimeType,
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
      value.decoration,
      value.spacingBetweenMonths,
      value.runSpacingBetweenMonths,
      value.monthConstraints,
      value.headerHeight,
      value.headerPadding,
      value.captionLayoutGap,
      value.headerTextStyle,
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
      value.dropdownFormatMonth,
      value.dropdownFormatYear,
      value.showWeekNumbers,
      value.weekStartsOn,
      value.fixedWeeks,
      value.allowDeselection,
    ]);
  }
}
