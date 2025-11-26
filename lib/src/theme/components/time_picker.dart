import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/components/time_picker.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:theme_extensions_builder_annotation/theme_extensions_builder_annotation.dart';

part 'time_picker.g.theme.dart';

@themeGen
@immutable
class ShadTimePickerTheme with _$ShadTimePickerTheme {
  const ShadTimePickerTheme({
    bool canMerge = true,
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
    this.hourLabel,
    this.minuteLabel,
    this.secondLabel,
    this.hourPlaceholder,
    this.minutePlaceholder,
    this.secondPlaceholder,
    this.periodLabel,
    this.periodPlaceholder,
  }) : _canMerge = canMerge;

  @ignore
  final bool _canMerge;

  @override
  bool get canMerge => _canMerge;

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
  final ShadDayPeriod? initialDayPeriod;

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
  final EdgeInsetsGeometry? fieldPadding;

  /// {@macro ShadTimePicker.fieldDecoration}
  final ShadDecoration? fieldDecoration;

  /// {@macro ShadTimePicker.periodDecoration}
  final ShadDecoration? periodDecoration;

  /// {@macro ShadTimePicker.hourLabel}
  final Widget? hourLabel;

  /// {@macro ShadTimePicker.minuteLabel}
  final Widget? minuteLabel;

  /// {@macro ShadTimePicker.secondLabel}
  final Widget? secondLabel;

  /// {@macro ShadTimePicker.periodLabel}
  final Widget? periodLabel;

  /// {@macro ShadTimePicker.hourPlaceholder}
  final Widget? hourPlaceholder;

  /// {@macro ShadTimePicker.minutePlaceholder}
  final Widget? minutePlaceholder;

  /// {@macro ShadTimePicker.secondPlaceholder}
  final Widget? secondPlaceholder;

  /// {@macro ShadTimePicker.periodPlaceholder}
  final Widget? periodPlaceholder;

  static ShadTimePickerTheme? lerp(
    ShadTimePickerTheme? a,
    ShadTimePickerTheme? b,
    double t,
  ) =>
      _$ShadTimePickerTheme.lerp(a, b, t);
}
