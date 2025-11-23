// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'time_picker.dart';

// **************************************************************************
// ThemeGenGenerator
// **************************************************************************

mixin _$ShadTimePickerTheme {
  bool get canMerge => true;

  static ShadTimePickerTheme? lerp(
    ShadTimePickerTheme? a,
    ShadTimePickerTheme? b,
    double t,
  ) {
    if (a == null && b == null) {
      return null;
    }

    return ShadTimePickerTheme(
      axis: t < 0.5 ? a?.axis : b?.axis,
      spacing: lerpDouble$(a?.spacing, b?.spacing, t),
      runSpacing: lerpDouble$(a?.runSpacing, b?.runSpacing, t),
      jumpToNextFieldWhenFilled: t < 0.5
          ? a?.jumpToNextFieldWhenFilled
          : b?.jumpToNextFieldWhenFilled,
      alignment: t < 0.5 ? a?.alignment : b?.alignment,
      runAlignment: t < 0.5 ? a?.runAlignment : b?.runAlignment,
      crossAxisAlignment: t < 0.5
          ? a?.crossAxisAlignment
          : b?.crossAxisAlignment,
      initialDayPeriod: t < 0.5 ? a?.initialDayPeriod : b?.initialDayPeriod,
      periodHeight: lerpDouble$(a?.periodHeight, b?.periodHeight, t),
      periodMinWidth: lerpDouble$(a?.periodMinWidth, b?.periodMinWidth, t),
      gap: lerpDouble$(a?.gap, b?.gap, t),
      style: TextStyle.lerp(a?.style, b?.style, t),
      placeholderStyle: TextStyle.lerp(
        a?.placeholderStyle,
        b?.placeholderStyle,
        t,
      ),
      labelStyle: TextStyle.lerp(a?.labelStyle, b?.labelStyle, t),
      fieldWidth: lerpDouble$(a?.fieldWidth, b?.fieldWidth, t),
      fieldPadding: EdgeInsetsGeometry.lerp(
        a?.fieldPadding,
        b?.fieldPadding,
        t,
      ),
      fieldDecoration: ShadDecoration.lerp(
        a?.fieldDecoration,
        b?.fieldDecoration,
        t,
      ),
      periodDecoration: ShadDecoration.lerp(
        a?.periodDecoration,
        b?.periodDecoration,
        t,
      ),
      hourLabel: t < 0.5 ? a?.hourLabel : b?.hourLabel,
      minuteLabel: t < 0.5 ? a?.minuteLabel : b?.minuteLabel,
      secondLabel: t < 0.5 ? a?.secondLabel : b?.secondLabel,
      periodLabel: t < 0.5 ? a?.periodLabel : b?.periodLabel,
      hourPlaceholder: t < 0.5 ? a?.hourPlaceholder : b?.hourPlaceholder,
      minutePlaceholder: t < 0.5 ? a?.minutePlaceholder : b?.minutePlaceholder,
      secondPlaceholder: t < 0.5 ? a?.secondPlaceholder : b?.secondPlaceholder,
      periodPlaceholder: t < 0.5 ? a?.periodPlaceholder : b?.periodPlaceholder,
    );
  }

  ShadTimePickerTheme copyWith({
    Axis? axis,
    double? spacing,
    double? runSpacing,
    bool? jumpToNextFieldWhenFilled,
    WrapAlignment? alignment,
    WrapAlignment? runAlignment,
    WrapCrossAlignment? crossAxisAlignment,
    ShadDayPeriod? initialDayPeriod,
    double? periodHeight,
    double? periodMinWidth,
    double? gap,
    TextStyle? style,
    TextStyle? placeholderStyle,
    TextStyle? labelStyle,
    double? fieldWidth,
    EdgeInsetsGeometry? fieldPadding,
    ShadDecoration? fieldDecoration,
    ShadDecoration? periodDecoration,
    Widget? hourLabel,
    Widget? minuteLabel,
    Widget? secondLabel,
    Widget? periodLabel,
    Widget? hourPlaceholder,
    Widget? minutePlaceholder,
    Widget? secondPlaceholder,
    Widget? periodPlaceholder,
  }) {
    final a = (this as ShadTimePickerTheme);

    return ShadTimePickerTheme(
      axis: axis ?? a.axis,
      spacing: spacing ?? a.spacing,
      runSpacing: runSpacing ?? a.runSpacing,
      jumpToNextFieldWhenFilled:
          jumpToNextFieldWhenFilled ?? a.jumpToNextFieldWhenFilled,
      alignment: alignment ?? a.alignment,
      runAlignment: runAlignment ?? a.runAlignment,
      crossAxisAlignment: crossAxisAlignment ?? a.crossAxisAlignment,
      initialDayPeriod: initialDayPeriod ?? a.initialDayPeriod,
      periodHeight: periodHeight ?? a.periodHeight,
      periodMinWidth: periodMinWidth ?? a.periodMinWidth,
      gap: gap ?? a.gap,
      style: style ?? a.style,
      placeholderStyle: placeholderStyle ?? a.placeholderStyle,
      labelStyle: labelStyle ?? a.labelStyle,
      fieldWidth: fieldWidth ?? a.fieldWidth,
      fieldPadding: fieldPadding ?? a.fieldPadding,
      fieldDecoration: fieldDecoration ?? a.fieldDecoration,
      periodDecoration: periodDecoration ?? a.periodDecoration,
      hourLabel: hourLabel ?? a.hourLabel,
      minuteLabel: minuteLabel ?? a.minuteLabel,
      secondLabel: secondLabel ?? a.secondLabel,
      periodLabel: periodLabel ?? a.periodLabel,
      hourPlaceholder: hourPlaceholder ?? a.hourPlaceholder,
      minutePlaceholder: minutePlaceholder ?? a.minutePlaceholder,
      secondPlaceholder: secondPlaceholder ?? a.secondPlaceholder,
      periodPlaceholder: periodPlaceholder ?? a.periodPlaceholder,
    );
  }

  ShadTimePickerTheme merge(ShadTimePickerTheme? other) {
    final current = (this as ShadTimePickerTheme);

    if (other == null) {
      return current;
    }

    if (!other.canMerge) {
      return other;
    }

    return copyWith(
      axis: other.axis,
      spacing: other.spacing,
      runSpacing: other.runSpacing,
      jumpToNextFieldWhenFilled: other.jumpToNextFieldWhenFilled,
      alignment: other.alignment,
      runAlignment: other.runAlignment,
      crossAxisAlignment: other.crossAxisAlignment,
      initialDayPeriod: other.initialDayPeriod,
      periodHeight: other.periodHeight,
      periodMinWidth: other.periodMinWidth,
      gap: other.gap,
      style: current.style?.merge(other.style) ?? other.style,
      placeholderStyle:
          current.placeholderStyle?.merge(other.placeholderStyle) ??
          other.placeholderStyle,
      labelStyle:
          current.labelStyle?.merge(other.labelStyle) ?? other.labelStyle,
      fieldWidth: other.fieldWidth,
      fieldPadding: other.fieldPadding,
      fieldDecoration:
          current.fieldDecoration?.merge(other.fieldDecoration) ??
          other.fieldDecoration,
      periodDecoration:
          current.periodDecoration?.merge(other.periodDecoration) ??
          other.periodDecoration,
      hourLabel: other.hourLabel,
      minuteLabel: other.minuteLabel,
      secondLabel: other.secondLabel,
      periodLabel: other.periodLabel,
      hourPlaceholder: other.hourPlaceholder,
      minutePlaceholder: other.minutePlaceholder,
      secondPlaceholder: other.secondPlaceholder,
      periodPlaceholder: other.periodPlaceholder,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    if (other is! ShadTimePickerTheme) {
      return false;
    }

    final value = (this as ShadTimePickerTheme);

    return other.axis == value.axis &&
        other.spacing == value.spacing &&
        other.runSpacing == value.runSpacing &&
        other.jumpToNextFieldWhenFilled == value.jumpToNextFieldWhenFilled &&
        other.alignment == value.alignment &&
        other.runAlignment == value.runAlignment &&
        other.crossAxisAlignment == value.crossAxisAlignment &&
        other.initialDayPeriod == value.initialDayPeriod &&
        other.periodHeight == value.periodHeight &&
        other.periodMinWidth == value.periodMinWidth &&
        other.gap == value.gap &&
        other.style == value.style &&
        other.placeholderStyle == value.placeholderStyle &&
        other.labelStyle == value.labelStyle &&
        other.fieldWidth == value.fieldWidth &&
        other.fieldPadding == value.fieldPadding &&
        other.fieldDecoration == value.fieldDecoration &&
        other.periodDecoration == value.periodDecoration &&
        other.hourLabel == value.hourLabel &&
        other.minuteLabel == value.minuteLabel &&
        other.secondLabel == value.secondLabel &&
        other.periodLabel == value.periodLabel &&
        other.hourPlaceholder == value.hourPlaceholder &&
        other.minutePlaceholder == value.minutePlaceholder &&
        other.secondPlaceholder == value.secondPlaceholder &&
        other.periodPlaceholder == value.periodPlaceholder;
  }

  @override
  int get hashCode {
    final value = (this as ShadTimePickerTheme);

    return Object.hashAll([
      runtimeType,
      value.axis,
      value.spacing,
      value.runSpacing,
      value.jumpToNextFieldWhenFilled,
      value.alignment,
      value.runAlignment,
      value.crossAxisAlignment,
      value.initialDayPeriod,
      value.periodHeight,
      value.periodMinWidth,
      value.gap,
      value.style,
      value.placeholderStyle,
      value.labelStyle,
      value.fieldWidth,
      value.fieldPadding,
      value.fieldDecoration,
      value.periodDecoration,
      value.hourLabel,
      value.minuteLabel,
      value.secondLabel,
      value.periodLabel,
      value.hourPlaceholder,
      value.minutePlaceholder,
      value.secondPlaceholder,
      value.periodPlaceholder,
    ]);
  }
}
