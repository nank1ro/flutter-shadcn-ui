import 'dart:ui';

import 'package:flutter/widgets.dart';

import 'package:shadcn_ui/shadcn_ui.dart';

@immutable
class ShadCalendarTheme {
  const ShadCalendarTheme({
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
    this.decoration,
    this.spacingBetweenMonths,
    this.runSpacingBetweenMonths,
    this.monthConstraints,
    this.headerHeight,
    this.headerPadding,
    this.captionLayoutGap,
    this.headerTextStyle,
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
  });

  final bool merge;

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
  final ShadDecoration? decoration;

  /// {@macro ShadCalendar.spacingBetweenMonths}
  final double? spacingBetweenMonths;

  /// {@macro ShadCalendar.runSpacingBetweenMonths}
  final double? runSpacingBetweenMonths;

  /// {@macro ShadCalendar.monthConstraints}
  final BoxConstraints? monthConstraints;

  /// {@macro ShadCalendar.headerHeight}
  final double? headerHeight;

  /// {@macro ShadCalendar.headerPadding}
  final EdgeInsets? headerPadding;

  /// {@macro ShadCalendar.captionLayoutGap}
  final double? captionLayoutGap;

  /// {@macro ShadCalendar.headerTextStyle}
  final TextStyle? headerTextStyle;

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

  static ShadCalendarTheme lerp(
    ShadCalendarTheme a,
    ShadCalendarTheme b,
    double t,
  ) {
    if (identical(a, b)) return a;
    return ShadCalendarTheme(
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
      decoration: ShadDecoration.lerp(a.decoration, b.decoration, t),
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
      headerHeight: lerpDouble(a.headerHeight, b.headerHeight, t),
      headerPadding: EdgeInsets.lerp(
        a.headerPadding,
        b.headerPadding,
        t,
      ),
      captionLayoutGap: lerpDouble(a.captionLayoutGap, b.captionLayoutGap, t),
      headerTextStyle: TextStyle.lerp(
        a.headerTextStyle,
        b.headerTextStyle,
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
    );
  }

  ShadCalendarTheme mergeWith(ShadCalendarTheme? other) {
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
      decoration: other.decoration ?? decoration,
      spacingBetweenMonths: other.spacingBetweenMonths ?? spacingBetweenMonths,
      runSpacingBetweenMonths:
          other.runSpacingBetweenMonths ?? runSpacingBetweenMonths,
      monthConstraints: other.monthConstraints ?? monthConstraints,
      headerHeight: other.headerHeight ?? headerHeight,
      headerPadding: other.headerPadding ?? headerPadding,
      captionLayoutGap: other.captionLayoutGap ?? captionLayoutGap,
      headerTextStyle: other.headerTextStyle ?? headerTextStyle,
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
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShadCalendarTheme &&
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
        other.decoration == decoration &&
        other.spacingBetweenMonths == spacingBetweenMonths &&
        other.runSpacingBetweenMonths == runSpacingBetweenMonths &&
        other.monthConstraints == monthConstraints &&
        other.headerHeight == headerHeight &&
        other.headerPadding == headerPadding &&
        other.captionLayoutGap == captionLayoutGap &&
        other.headerTextStyle == headerTextStyle &&
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
        other.captionLayout == captionLayout;
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
        decoration.hashCode ^
        spacingBetweenMonths.hashCode ^
        runSpacingBetweenMonths.hashCode ^
        monthConstraints.hashCode ^
        headerHeight.hashCode ^
        headerPadding.hashCode ^
        captionLayoutGap.hashCode ^
        headerTextStyle.hashCode ^
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
        captionLayout.hashCode;
  }

  ShadCalendarTheme copyWith({
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
    ShadDecoration? decoration,
    double? spacingBetweenMonths,
    double? runSpacingBetweenMonths,
    BoxConstraints? monthConstraints,
    double? headerHeight,
    EdgeInsets? headerPadding,
    double? captionLayoutGap,
    TextStyle? headerTextStyle,
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
  }) {
    return ShadCalendarTheme(
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
      decoration: decoration ?? this.decoration,
      spacingBetweenMonths: spacingBetweenMonths ?? this.spacingBetweenMonths,
      runSpacingBetweenMonths:
          runSpacingBetweenMonths ?? this.runSpacingBetweenMonths,
      monthConstraints: monthConstraints ?? this.monthConstraints,
      headerHeight: headerHeight ?? this.headerHeight,
      headerPadding: headerPadding ?? this.headerPadding,
      captionLayoutGap: captionLayoutGap ?? this.captionLayoutGap,
      headerTextStyle: headerTextStyle ?? this.headerTextStyle,
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
    );
  }
}
