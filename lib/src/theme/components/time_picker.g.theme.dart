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
    if (identical(a, b)) {
      return a;
    }

    if (a == null) {
      return t == 1.0 ? b : null;
    }

    if (b == null) {
      return t == 0.0 ? a : null;
    }

    return ShadTimePickerTheme(
      axis: t < 0.5 ? a.axis : b.axis,
      spacing: lerpDouble$(a.spacing, b.spacing, t),
      runSpacing: lerpDouble$(a.runSpacing, b.runSpacing, t),
      jumpToNextFieldWhenFilled: t < 0.5
          ? a.jumpToNextFieldWhenFilled
          : b.jumpToNextFieldWhenFilled,
      alignment: t < 0.5 ? a.alignment : b.alignment,
      runAlignment: t < 0.5 ? a.runAlignment : b.runAlignment,
      crossAxisAlignment: t < 0.5 ? a.crossAxisAlignment : b.crossAxisAlignment,
      initialDayPeriod: t < 0.5 ? a.initialDayPeriod : b.initialDayPeriod,
      periodHeight: lerpDouble$(a.periodHeight, b.periodHeight, t),
      periodMinWidth: lerpDouble$(a.periodMinWidth, b.periodMinWidth, t),
      gap: lerpDouble$(a.gap, b.gap, t),
      style: TextStyle.lerp(a.style, b.style, t),
      placeholderStyle: TextStyle.lerp(
        a.placeholderStyle,
        b.placeholderStyle,
        t,
      ),
      labelStyle: TextStyle.lerp(a.labelStyle, b.labelStyle, t),
      fieldWidth: lerpDouble$(a.fieldWidth, b.fieldWidth, t),
      fieldPadding: EdgeInsetsGeometry.lerp(a.fieldPadding, b.fieldPadding, t),
      fieldDecoration: ShadDecoration.lerp(
        a.fieldDecoration,
        b.fieldDecoration,
        t,
      ),
      periodDecoration: ShadDecoration.lerp(
        a.periodDecoration,
        b.periodDecoration,
        t,
      ),
      hourLabel: t < 0.5 ? a.hourLabel : b.hourLabel,
      minuteLabel: t < 0.5 ? a.minuteLabel : b.minuteLabel,
      secondLabel: t < 0.5 ? a.secondLabel : b.secondLabel,
      periodLabel: t < 0.5 ? a.periodLabel : b.periodLabel,
      hourPlaceholder: t < 0.5 ? a.hourPlaceholder : b.hourPlaceholder,
      minutePlaceholder: t < 0.5 ? a.minutePlaceholder : b.minutePlaceholder,
      secondPlaceholder: t < 0.5 ? a.secondPlaceholder : b.secondPlaceholder,
      periodPlaceholder: t < 0.5 ? a.periodPlaceholder : b.periodPlaceholder,
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
    final _this = (this as ShadTimePickerTheme);

    return ShadTimePickerTheme(
      axis: axis ?? _this.axis,
      spacing: spacing ?? _this.spacing,
      runSpacing: runSpacing ?? _this.runSpacing,
      jumpToNextFieldWhenFilled:
          jumpToNextFieldWhenFilled ?? _this.jumpToNextFieldWhenFilled,
      alignment: alignment ?? _this.alignment,
      runAlignment: runAlignment ?? _this.runAlignment,
      crossAxisAlignment: crossAxisAlignment ?? _this.crossAxisAlignment,
      initialDayPeriod: initialDayPeriod ?? _this.initialDayPeriod,
      periodHeight: periodHeight ?? _this.periodHeight,
      periodMinWidth: periodMinWidth ?? _this.periodMinWidth,
      gap: gap ?? _this.gap,
      style: style ?? _this.style,
      placeholderStyle: placeholderStyle ?? _this.placeholderStyle,
      labelStyle: labelStyle ?? _this.labelStyle,
      fieldWidth: fieldWidth ?? _this.fieldWidth,
      fieldPadding: fieldPadding ?? _this.fieldPadding,
      fieldDecoration: fieldDecoration ?? _this.fieldDecoration,
      periodDecoration: periodDecoration ?? _this.periodDecoration,
      hourLabel: hourLabel ?? _this.hourLabel,
      minuteLabel: minuteLabel ?? _this.minuteLabel,
      secondLabel: secondLabel ?? _this.secondLabel,
      periodLabel: periodLabel ?? _this.periodLabel,
      hourPlaceholder: hourPlaceholder ?? _this.hourPlaceholder,
      minutePlaceholder: minutePlaceholder ?? _this.minutePlaceholder,
      secondPlaceholder: secondPlaceholder ?? _this.secondPlaceholder,
      periodPlaceholder: periodPlaceholder ?? _this.periodPlaceholder,
    );
  }

  ShadTimePickerTheme merge(ShadTimePickerTheme? other) {
    final _this = (this as ShadTimePickerTheme);

    if (other == null || identical(_this, other)) {
      return _this;
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
      style: _this.style?.merge(other.style) ?? other.style,
      placeholderStyle:
          _this.placeholderStyle?.merge(other.placeholderStyle) ??
          other.placeholderStyle,
      labelStyle: _this.labelStyle?.merge(other.labelStyle) ?? other.labelStyle,
      fieldWidth: other.fieldWidth,
      fieldPadding: other.fieldPadding,
      fieldDecoration:
          _this.fieldDecoration?.merge(other.fieldDecoration) ??
          other.fieldDecoration,
      periodDecoration:
          _this.periodDecoration?.merge(other.periodDecoration) ??
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

    if (other.runtimeType != runtimeType) {
      return false;
    }

    final _this = (this as ShadTimePickerTheme);
    final _other = (other as ShadTimePickerTheme);

    return _other.axis == _this.axis &&
        _other.spacing == _this.spacing &&
        _other.runSpacing == _this.runSpacing &&
        _other.jumpToNextFieldWhenFilled == _this.jumpToNextFieldWhenFilled &&
        _other.alignment == _this.alignment &&
        _other.runAlignment == _this.runAlignment &&
        _other.crossAxisAlignment == _this.crossAxisAlignment &&
        _other.initialDayPeriod == _this.initialDayPeriod &&
        _other.periodHeight == _this.periodHeight &&
        _other.periodMinWidth == _this.periodMinWidth &&
        _other.gap == _this.gap &&
        _other.style == _this.style &&
        _other.placeholderStyle == _this.placeholderStyle &&
        _other.labelStyle == _this.labelStyle &&
        _other.fieldWidth == _this.fieldWidth &&
        _other.fieldPadding == _this.fieldPadding &&
        _other.fieldDecoration == _this.fieldDecoration &&
        _other.periodDecoration == _this.periodDecoration &&
        _other.hourLabel == _this.hourLabel &&
        _other.minuteLabel == _this.minuteLabel &&
        _other.secondLabel == _this.secondLabel &&
        _other.periodLabel == _this.periodLabel &&
        _other.hourPlaceholder == _this.hourPlaceholder &&
        _other.minutePlaceholder == _this.minutePlaceholder &&
        _other.secondPlaceholder == _this.secondPlaceholder &&
        _other.periodPlaceholder == _this.periodPlaceholder;
  }

  @override
  int get hashCode {
    final _this = (this as ShadTimePickerTheme);

    return Object.hashAll([
      runtimeType,
      _this.axis,
      _this.spacing,
      _this.runSpacing,
      _this.jumpToNextFieldWhenFilled,
      _this.alignment,
      _this.runAlignment,
      _this.crossAxisAlignment,
      _this.initialDayPeriod,
      _this.periodHeight,
      _this.periodMinWidth,
      _this.gap,
      _this.style,
      _this.placeholderStyle,
      _this.labelStyle,
      _this.fieldWidth,
      _this.fieldPadding,
      _this.fieldDecoration,
      _this.periodDecoration,
      _this.hourLabel,
      _this.minuteLabel,
      _this.secondLabel,
      _this.periodLabel,
      _this.hourPlaceholder,
      _this.minutePlaceholder,
      _this.secondPlaceholder,
      _this.periodPlaceholder,
    ]);
  }
}
