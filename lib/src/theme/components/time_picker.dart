import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';

@immutable
class ShadTimePickerTheme {
  const ShadTimePickerTheme({
    this.merge = true,
    this.axis,
    this.spacing,
    this.runSpacing,
    this.jumpToNextFieldWhenFilled,
    this.alignment,
    this.runAlignment,
    this.crossAxisAlignment,
    this.initialDayPeriod,
    this.periodHeight,
    this.periodMinWidth,
    this.gap,
    this.style,
    this.placeholderStyle,
    this.labelStyle,
    this.fieldWidth,
    this.fieldPadding,
    this.fieldDecoration,
    this.periodDecoration,
  });

  final bool merge;

  /// {@macro ShadTimePicker.axis}
  final Axis? axis;

  /// {@macro ShadTimePicker.spacing}
  final double? spacing;

  /// {@macro ShadTimePicker.runSpacing}
  final double? runSpacing;

  /// {@macro ShadTimePicker.jumpToNextFieldWhenFilled}
  final bool? jumpToNextFieldWhenFilled;

  /// {@macro ShadTimePicker.alignment}
  final WrapAlignment? alignment;

  /// {@macro ShadTimePicker.runAlignment}
  final WrapAlignment? runAlignment;

  /// {@macro ShadTimePicker.crossAxisAlignment}
  final WrapCrossAlignment? crossAxisAlignment;

  /// {@macro ShadTimePicker.initialDayPeriod}
  final DayPeriod? initialDayPeriod;

  /// {@macro ShadTimePicker.periodHeight}
  final double? periodHeight;

  /// {@macro ShadTimePicker.periodMinWidth}
  final double? periodMinWidth;

  /// {@macro ShadTimePicker.gap}
  final double? gap;

  /// {@macro ShadTimePicker.style}
  final TextStyle? style;

  /// {@macro ShadTimePicker.placeholderStyle}
  final TextStyle? placeholderStyle;

  /// {@macro ShadTimePicker.labelStyle}
  final TextStyle? labelStyle;

  /// {@macro ShadTimePicker.fieldWidth}
  final double? fieldWidth;

  /// {@macro ShadTimePicker.fieldPadding}
  final EdgeInsets? fieldPadding;

  /// {@macro ShadTimePicker.fieldDecoration}
  final ShadDecoration? fieldDecoration;

  /// {@macro ShadTimePicker.periodDecoration}
  final ShadDecoration? periodDecoration;

  static ShadTimePickerTheme lerp(
    ShadTimePickerTheme a,
    ShadTimePickerTheme b,
    double t,
  ) {
    if (identical(a, b)) return a;
    return ShadTimePickerTheme(
      merge: b.merge,
      axis: t < 0.5 ? a.axis : b.axis,
      spacing: lerpDouble(a.spacing, b.spacing, t),
      runSpacing: lerpDouble(a.runSpacing, b.runSpacing, t),
      jumpToNextFieldWhenFilled:
          t < 0.5 ? a.jumpToNextFieldWhenFilled : b.jumpToNextFieldWhenFilled,
      alignment: t < .5 ? a.alignment : b.alignment,
      runAlignment: t < .5 ? a.runAlignment : b.runAlignment,
      crossAxisAlignment: t < .5 ? a.crossAxisAlignment : b.crossAxisAlignment,
      initialDayPeriod: t < .5 ? a.initialDayPeriod : b.initialDayPeriod,
      periodHeight: lerpDouble(a.periodHeight, b.periodHeight, t),
      periodMinWidth: lerpDouble(a.periodMinWidth, b.periodMinWidth, t),
      gap: lerpDouble(a.gap, b.gap, t),
      style: TextStyle.lerp(a.style, b.style, t),
      placeholderStyle:
          TextStyle.lerp(a.placeholderStyle, b.placeholderStyle, t),
      labelStyle: TextStyle.lerp(a.labelStyle, b.labelStyle, t),
      fieldWidth: t < .5 ? a.fieldWidth : b.fieldWidth,
      fieldPadding: EdgeInsets.lerp(a.fieldPadding, b.fieldPadding, t),
      fieldDecoration:
          ShadDecoration.lerp(a.fieldDecoration, b.fieldDecoration, t),
      periodDecoration:
          ShadDecoration.lerp(a.periodDecoration, b.periodDecoration, t),
    );
  }

  ShadTimePickerTheme copyWith({
    bool? merge,
    Axis? axis,
    double? spacing,
    double? runSpacing,
    bool? jumpToNextFieldWhenFilled,
    WrapAlignment? alignment,
    WrapAlignment? runAlignment,
    WrapCrossAlignment? crossAxisAlignment,
    DayPeriod? initialDayPeriod,
    double? periodHeight,
    double? periodMinWidth,
    double? gap,
    TextStyle? style,
    TextStyle? placeholderStyle,
    TextStyle? labelStyle,
    double? fieldWidth,
    EdgeInsets? fieldPadding,
    ShadDecoration? fieldDecoration,
    ShadDecoration? periodDecoration,
  }) {
    return ShadTimePickerTheme(
      merge: merge ?? this.merge,
      axis: axis ?? this.axis,
      spacing: spacing ?? this.spacing,
      runSpacing: runSpacing ?? this.runSpacing,
      jumpToNextFieldWhenFilled:
          jumpToNextFieldWhenFilled ?? this.jumpToNextFieldWhenFilled,
      alignment: alignment ?? this.alignment,
      runAlignment: runAlignment ?? this.runAlignment,
      crossAxisAlignment: crossAxisAlignment ?? this.crossAxisAlignment,
      initialDayPeriod: initialDayPeriod ?? this.initialDayPeriod,
      periodHeight: periodHeight ?? this.periodHeight,
      periodMinWidth: periodMinWidth ?? this.periodMinWidth,
      gap: gap ?? this.gap,
      style: style ?? this.style,
      placeholderStyle: placeholderStyle ?? this.placeholderStyle,
      labelStyle: labelStyle ?? this.labelStyle,
      fieldWidth: fieldWidth ?? this.fieldWidth,
      fieldPadding: fieldPadding ?? this.fieldPadding,
      fieldDecoration: fieldDecoration ?? this.fieldDecoration,
      periodDecoration: periodDecoration ?? this.periodDecoration,
    );
  }

  ShadTimePickerTheme mergeWith(ShadTimePickerTheme? other) {
    if (other == null) return this;
    if (!other.merge) return other;
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
      style: other.style,
      placeholderStyle: other.placeholderStyle,
      labelStyle: other.labelStyle,
      fieldWidth: other.fieldWidth,
      fieldPadding: other.fieldPadding,
      fieldDecoration: other.fieldDecoration,
      periodDecoration: other.periodDecoration,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShadTimePickerTheme &&
        other.merge == merge &&
        other.axis == axis &&
        other.spacing == spacing &&
        other.runSpacing == runSpacing &&
        other.jumpToNextFieldWhenFilled == jumpToNextFieldWhenFilled &&
        other.alignment == alignment &&
        other.runAlignment == runAlignment &&
        other.crossAxisAlignment == crossAxisAlignment &&
        other.initialDayPeriod == initialDayPeriod &&
        other.periodHeight == periodHeight &&
        other.periodMinWidth == periodMinWidth &&
        other.gap == gap &&
        other.style == style &&
        other.placeholderStyle == placeholderStyle &&
        other.labelStyle == labelStyle &&
        other.fieldWidth == fieldWidth &&
        other.fieldPadding == fieldPadding &&
        other.fieldDecoration == fieldDecoration &&
        other.periodDecoration == periodDecoration;
  }

  @override
  int get hashCode {
    return merge.hashCode ^
        axis.hashCode ^
        spacing.hashCode ^
        runSpacing.hashCode ^
        jumpToNextFieldWhenFilled.hashCode ^
        alignment.hashCode ^
        runAlignment.hashCode ^
        crossAxisAlignment.hashCode ^
        initialDayPeriod.hashCode ^
        periodHeight.hashCode ^
        periodMinWidth.hashCode ^
        gap.hashCode ^
        style.hashCode ^
        placeholderStyle.hashCode ^
        labelStyle.hashCode ^
        fieldWidth.hashCode ^
        fieldPadding.hashCode ^
        fieldDecoration.hashCode ^
        periodDecoration.hashCode;
  }
}
