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
    if (identical(a, b)) {
      return a;
    }

    if (a == null) {
      return t == 1.0 ? b : null;
    }

    if (b == null) {
      return t == 0.0 ? a : null;
    }

    return ShadCalendarTheme(
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
      decoration: ShadDecoration.lerp(a.decoration, b.decoration, t),
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
      headerHeight: lerpDouble$(a.headerHeight, b.headerHeight, t),
      headerPadding: EdgeInsetsGeometry.lerp(
        a.headerPadding,
        b.headerPadding,
        t,
      ),
      captionLayoutGap: lerpDouble$(a.captionLayoutGap, b.captionLayoutGap, t),
      headerTextStyle: TextStyle.lerp(a.headerTextStyle, b.headerTextStyle, t),
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
      dropdownFormatMonth: t < 0.5
          ? a.dropdownFormatMonth
          : b.dropdownFormatMonth,
      dropdownFormatYear: t < 0.5 ? a.dropdownFormatYear : b.dropdownFormatYear,
      showWeekNumbers: t < 0.5 ? a.showWeekNumbers : b.showWeekNumbers,
      weekStartsOn: t < 0.5 ? a.weekStartsOn : b.weekStartsOn,
      fixedWeeks: t < 0.5 ? a.fixedWeeks : b.fixedWeeks,
      allowDeselection: t < 0.5 ? a.allowDeselection : b.allowDeselection,
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
    final _this = (this as ShadCalendarTheme);

    return ShadCalendarTheme(
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
      decoration: decoration ?? _this.decoration,
      spacingBetweenMonths: spacingBetweenMonths ?? _this.spacingBetweenMonths,
      runSpacingBetweenMonths:
          runSpacingBetweenMonths ?? _this.runSpacingBetweenMonths,
      monthConstraints: monthConstraints ?? _this.monthConstraints,
      headerHeight: headerHeight ?? _this.headerHeight,
      headerPadding: headerPadding ?? _this.headerPadding,
      captionLayoutGap: captionLayoutGap ?? _this.captionLayoutGap,
      headerTextStyle: headerTextStyle ?? _this.headerTextStyle,
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
      dropdownFormatMonth: dropdownFormatMonth ?? _this.dropdownFormatMonth,
      dropdownFormatYear: dropdownFormatYear ?? _this.dropdownFormatYear,
      showWeekNumbers: showWeekNumbers ?? _this.showWeekNumbers,
      weekStartsOn: weekStartsOn ?? _this.weekStartsOn,
      fixedWeeks: fixedWeeks ?? _this.fixedWeeks,
      allowDeselection: allowDeselection ?? _this.allowDeselection,
    );
  }

  ShadCalendarTheme merge(ShadCalendarTheme? other) {
    final _this = (this as ShadCalendarTheme);

    if (other == null || identical(_this, other)) {
      return _this;
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
      decoration: _this.decoration?.merge(other.decoration) ?? other.decoration,
      spacingBetweenMonths: other.spacingBetweenMonths,
      runSpacingBetweenMonths: other.runSpacingBetweenMonths,
      monthConstraints: other.monthConstraints,
      headerHeight: other.headerHeight,
      headerPadding: other.headerPadding,
      captionLayoutGap: other.captionLayoutGap,
      headerTextStyle:
          _this.headerTextStyle?.merge(other.headerTextStyle) ??
          other.headerTextStyle,
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

    final _this = (this as ShadCalendarTheme);
    final _other = (other as ShadCalendarTheme);

    return _other.hideNavigation == _this.hideNavigation &&
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
        _other.decoration == _this.decoration &&
        _other.spacingBetweenMonths == _this.spacingBetweenMonths &&
        _other.runSpacingBetweenMonths == _this.runSpacingBetweenMonths &&
        _other.monthConstraints == _this.monthConstraints &&
        _other.headerHeight == _this.headerHeight &&
        _other.headerPadding == _this.headerPadding &&
        _other.captionLayoutGap == _this.captionLayoutGap &&
        _other.headerTextStyle == _this.headerTextStyle &&
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
        _other.dropdownFormatMonth == _this.dropdownFormatMonth &&
        _other.dropdownFormatYear == _this.dropdownFormatYear &&
        _other.showWeekNumbers == _this.showWeekNumbers &&
        _other.weekStartsOn == _this.weekStartsOn &&
        _other.fixedWeeks == _this.fixedWeeks &&
        _other.allowDeselection == _this.allowDeselection;
  }

  @override
  int get hashCode {
    final _this = (this as ShadCalendarTheme);

    return Object.hashAll([
      runtimeType,
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
      _this.decoration,
      _this.spacingBetweenMonths,
      _this.runSpacingBetweenMonths,
      _this.monthConstraints,
      _this.headerHeight,
      _this.headerPadding,
      _this.captionLayoutGap,
      _this.headerTextStyle,
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
      _this.dropdownFormatMonth,
      _this.dropdownFormatYear,
      _this.showWeekNumbers,
      _this.weekStartsOn,
      _this.fixedWeeks,
      _this.allowDeselection,
    ]);
  }
}
