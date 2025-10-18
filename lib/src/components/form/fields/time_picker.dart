import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/components/form/field.dart';
import 'package:shadcn_ui/src/components/time_picker.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';

class ShadTimePickerFormField extends ShadFormBuilderField<ShadTimeOfDay> {
  ShadTimePickerFormField({
    super.id,
    super.key,
    super.onSaved,
    super.forceErrorText,
    super.label,
    super.error,
    super.description,
    super.valueTransformer,
    super.onReset,
    super.enabled,
    super.autovalidateMode,
    super.restorationId,
    super.validator,
    super.focusNode,

    /// {@macro ShadTimePicker.onChanged}
    super.onChanged,

    /// {@macro ShadTimePicker.initialValue}
    super.initialValue,

    /// @macro ShadTimePicker.controller
    this.controller,

    /// {@macro ShadTimePicker.axis}
    Axis? axis,

    /// {@macro ShadTimePicker.spacing}
    double? spacing,

    /// {@macro ShadTimePicker.runSpacing}
    double? runSpacing,

    /// {@macro ShadTimePicker.jumpToNextFieldWhenFilled}
    bool? jumpToNextFieldWhenFilled,

    /// {@macro ShadTimePicker.hourLabel}
    Widget? hourLabel,

    /// {@macro ShadTimePicker.minuteLabel}
    Widget? minuteLabel,

    /// {@macro ShadTimePicker.secondLabel}
    Widget? secondLabel,

    /// {@macro ShadTimePicker.hourPlaceholder}
    Widget? hourPlaceholder,

    /// {@macro ShadTimePicker.minutePlaceholder}
    Widget? minutePlaceholder,

    /// {@macro ShadTimePicker.secondPlaceholder}
    Widget? secondPlaceholder,

    /// {@macro ShadTimePicker.leading}
    Widget? leading,

    /// {@macro ShadTimePicker.trailing}
    Widget? trailing,

    /// {@macro ShadTimePicker.alignment}
    WrapAlignment? alignment,

    /// {@macro ShadTimePicker.runAlignment}
    WrapAlignment? runAlignment,

    /// {@macro ShadTimePicker.crossAxisAlignment}
    WrapCrossAlignment? crossAxisAlignment,

    /// {@macro ShadTimePicker.maxHour}
    int maxHour = 23,

    /// {@macro ShadTimePicker.maxMinute}
    int maxMinute = 59,

    /// {@macro ShadTimePicker.maxSecond}
    int maxSecond = 59,

    /// {@macro ShadTimePicker.minHour}
    int minHour = 0,

    /// {@macro ShadTimePicker.minMinute}
    int minMinute = 0,

    /// {@macro ShadTimePicker.minSecond}
    int minSecond = 0,

    /// {@macro ShadTimePicker.gap}
    double? gap,

    /// {@macro ShadTimePicker.style}
    TextStyle? style,

    /// {@macro ShadTimePicker.placeholderStyle}
    TextStyle? placeholderStyle,

    /// {@macro ShadTimePicker.labelStyle}
    TextStyle? labelStyle,

    /// {@macro ShadTimePicker.fieldWidth}
    double? fieldWidth,

    /// {@macro ShadTimePicker.fieldPadding}
    EdgeInsetsGeometry? fieldPadding,

    /// {@macro ShadTimePicker.fieldDecoration}
    ShadDecoration? fieldDecoration,

    /// {@macro ShadKeyboardToolbar.toolbarBuilder}
    WidgetBuilder? keyboardToolbarBuilder,
    this.showHours,
    this.showMinutes,
    this.showSeconds,
  }) : super(
         builder: (field) {
           final state = field as _ShadFormBuilderTimePickerState;
           return ShadTimePicker(
             controller: state.controller,
             onChanged: state.didChange,
             enabled: state.enabled,
             initialValue: state.initialValue,
             axis: axis,
             spacing: spacing,
             runSpacing: runSpacing,
             jumpToNextFieldWhenFilled: jumpToNextFieldWhenFilled,
             hourLabel: hourLabel,
             minuteLabel: minuteLabel,
             secondLabel: secondLabel,
             hourPlaceholder: hourPlaceholder,
             minutePlaceholder: minutePlaceholder,
             secondPlaceholder: secondPlaceholder,
             leading: leading,
             trailing: trailing,
             alignment: alignment,
             runAlignment: runAlignment,
             crossAxisAlignment: crossAxisAlignment,
             maxHour: maxHour,
             maxMinute: maxMinute,
             maxSecond: maxSecond,
             minHour: minHour,
             minMinute: minMinute,
             minSecond: minSecond,
             gap: gap,
             style: style,
             placeholderStyle: placeholderStyle,
             labelStyle: labelStyle,
             fieldWidth: fieldWidth,
             fieldPadding: fieldPadding,
             fieldDecoration: fieldDecoration,
             keyboardToolbarBuilder: keyboardToolbarBuilder,
             showHours: showHours,
             showMinutes: showMinutes,
             showSeconds: showSeconds,
           );
         },
       );

  ShadTimePickerFormField.period({
    super.id,
    super.key,
    super.onSaved,
    super.label,
    super.error,
    super.description,
    super.valueTransformer,
    super.onReset,
    super.enabled,
    super.autovalidateMode,
    super.restorationId,
    super.validator,

    /// {@macro ShadTimePicker.onChanged}
    super.onChanged,

    /// {@macro ShadTimePicker.initialValue}
    super.initialValue,

    /// @macro ShadTimePicker.controller
    this.controller,

    /// {@macro ShadTimePicker.axis}
    Axis? axis,

    /// {@macro ShadTimePicker.spacing}
    double? spacing,

    /// {@macro ShadTimePicker.runSpacing}
    double? runSpacing,

    /// {@macro ShadTimePicker.jumpToNextFieldWhenFilled}
    bool? jumpToNextFieldWhenFilled,

    /// {@macro ShadTimePicker.hourLabel}
    Widget? hourLabel,

    /// {@macro ShadTimePicker.minuteLabel}
    Widget? minuteLabel,

    /// {@macro ShadTimePicker.secondLabel}
    Widget? secondLabel,

    /// {@macro ShadTimePicker.hourPlaceholder}
    Widget? hourPlaceholder,

    /// {@macro ShadTimePicker.minutePlaceholder}
    Widget? minutePlaceholder,

    /// {@macro ShadTimePicker.secondPlaceholder}
    Widget? secondPlaceholder,

    /// {@macro ShadTimePicker.leading}
    Widget? leading,

    /// {@macro ShadTimePicker.trailing}
    Widget? trailing,

    /// {@macro ShadTimePicker.alignment}
    WrapAlignment? alignment,

    /// {@macro ShadTimePicker.runAlignment}
    WrapAlignment? runAlignment,

    /// {@macro ShadTimePicker.crossAxisAlignment}
    WrapCrossAlignment? crossAxisAlignment,

    /// {@macro ShadTimePicker.maxHour}
    int maxHour = 23,

    /// {@macro ShadTimePicker.maxMinute}
    int maxMinute = 59,

    /// {@macro ShadTimePicker.maxSecond}
    int maxSecond = 59,

    /// {@macro ShadTimePicker.minHour}
    int minHour = 0,

    /// {@macro ShadTimePicker.minMinute}
    int minMinute = 0,

    /// {@macro ShadTimePicker.minSecond}
    int minSecond = 0,

    /// {@macro ShadTimePicker.initialDayPeriod}
    ShadDayPeriod? initialDayPeriod,

    /// {@macro ShadTimePicker.periodLabel}
    Widget? periodLabel,

    /// {@macro ShadTimePicker.periodPlaceholder}
    Widget? periodPlaceholder,

    /// {@macro ShadTimePicker.periodHeight}
    double? periodHeight,

    /// {@macro ShadTimePicker.periodMinWidth}
    double? periodMinWidth,

    /// {@macro ShadTimePicker.gap}
    double? gap,

    /// {@macro ShadTimePicker.style}
    TextStyle? style,

    /// {@macro ShadTimePicker.placeholderStyle}
    TextStyle? placeholderStyle,

    /// {@macro ShadTimePicker.labelStyle}
    TextStyle? labelStyle,

    /// {@macro ShadTimePicker.fieldWidth}
    double? fieldWidth,

    /// {@macro ShadTimePicker.fieldPadding}
    EdgeInsetsGeometry? fieldPadding,

    /// {@macro ShadTimePicker.fieldDecoration}
    ShadDecoration? fieldDecoration,

    /// {@macro ShadTimePicker.periodDecoration}
    ShadDecoration? periodDecoration,

    /// {@macro ShadKeyboardToolbar.toolbarBuilder}
    WidgetBuilder? keyboardToolbarBuilder,
    this.showHours,
    this.showMinutes,
    this.showSeconds,
  }) : super(
         builder: (field) {
           final state = field as _ShadFormBuilderTimePickerState;
           return ShadTimePicker.period(
             controller: state.controller,
             onChanged: state.didChange,
             enabled: state.enabled,
             initialValue: state.initialValue,
             axis: axis,
             spacing: spacing,
             runSpacing: runSpacing,
             jumpToNextFieldWhenFilled: jumpToNextFieldWhenFilled,
             hourLabel: hourLabel,
             minuteLabel: minuteLabel,
             secondLabel: secondLabel,
             hourPlaceholder: hourPlaceholder,
             minutePlaceholder: minutePlaceholder,
             secondPlaceholder: secondPlaceholder,
             leading: leading,
             trailing: trailing,
             alignment: alignment,
             runAlignment: runAlignment,
             crossAxisAlignment: crossAxisAlignment,
             maxHour: maxHour,
             maxMinute: maxMinute,
             maxSecond: maxSecond,
             minHour: minHour,
             minMinute: minMinute,
             minSecond: minSecond,
             initialDayPeriod: initialDayPeriod,
             periodLabel: periodLabel,
             periodPlaceholder: periodPlaceholder,
             periodHeight: periodHeight,
             periodMinWidth: periodMinWidth,
             gap: gap,
             style: style,
             placeholderStyle: placeholderStyle,
             labelStyle: labelStyle,
             fieldWidth: fieldWidth,
             fieldPadding: fieldPadding,
             fieldDecoration: fieldDecoration,
             periodDecoration: periodDecoration,
             keyboardToolbarBuilder: keyboardToolbarBuilder,
             showHours: showHours,
             showMinutes: showMinutes,
             showSeconds: showSeconds,
           );
         },
       );

  ShadTimePickerFormField.raw({
    required ShadTimePickerVariant variant,
    super.id,
    super.key,
    super.onSaved,
    super.label,
    super.error,
    super.description,
    super.valueTransformer,
    super.onReset,
    super.enabled,
    super.autovalidateMode,
    super.restorationId,
    super.validator,

    /// {@macro ShadTimePicker.onChanged}
    super.onChanged,

    /// {@macro ShadTimePicker.initialValue}
    super.initialValue,

    /// @macro ShadTimePicker.controller
    this.controller,

    /// {@macro ShadTimePicker.axis}
    Axis? axis,

    /// {@macro ShadTimePicker.spacing}
    double? spacing,

    /// {@macro ShadTimePicker.runSpacing}
    double? runSpacing,

    /// {@macro ShadTimePicker.jumpToNextFieldWhenFilled}
    bool? jumpToNextFieldWhenFilled,

    /// {@macro ShadTimePicker.hourLabel}
    Widget? hourLabel,

    /// {@macro ShadTimePicker.minuteLabel}
    Widget? minuteLabel,

    /// {@macro ShadTimePicker.secondLabel}
    Widget? secondLabel,

    /// {@macro ShadTimePicker.hourPlaceholder}
    Widget? hourPlaceholder,

    /// {@macro ShadTimePicker.minutePlaceholder}
    Widget? minutePlaceholder,

    /// {@macro ShadTimePicker.secondPlaceholder}
    Widget? secondPlaceholder,

    /// {@macro ShadTimePicker.leading}
    Widget? leading,

    /// {@macro ShadTimePicker.trailing}
    Widget? trailing,

    /// {@macro ShadTimePicker.alignment}
    WrapAlignment? alignment,

    /// {@macro ShadTimePicker.runAlignment}
    WrapAlignment? runAlignment,

    /// {@macro ShadTimePicker.crossAxisAlignment}
    WrapCrossAlignment? crossAxisAlignment,

    /// {@macro ShadTimePicker.maxHour}
    int maxHour = 23,

    /// {@macro ShadTimePicker.maxMinute}
    int maxMinute = 59,

    /// {@macro ShadTimePicker.maxSecond}
    int maxSecond = 59,

    /// {@macro ShadTimePicker.minHour}
    int minHour = 0,

    /// {@macro ShadTimePicker.minMinute}
    int minMinute = 0,

    /// {@macro ShadTimePicker.minSecond}
    int minSecond = 0,

    /// {@macro ShadTimePicker.initialDayPeriod}
    ShadDayPeriod? initialDayPeriod,

    /// {@macro ShadTimePicker.periodLabel}
    Widget? periodLabel,

    /// {@macro ShadTimePicker.periodPlaceholder}
    Widget? periodPlaceholder,

    /// {@macro ShadTimePicker.periodHeight}
    double? periodHeight,

    /// {@macro ShadTimePicker.periodMinWidth}
    double? periodMinWidth,

    /// {@macro ShadTimePicker.gap}
    double? gap,

    /// {@macro ShadTimePicker.style}
    TextStyle? style,

    /// {@macro ShadTimePicker.placeholderStyle}
    TextStyle? placeholderStyle,

    /// {@macro ShadTimePicker.labelStyle}
    TextStyle? labelStyle,

    /// {@macro ShadTimePicker.fieldWidth}
    double? fieldWidth,

    /// {@macro ShadTimePicker.fieldPadding}
    EdgeInsetsGeometry? fieldPadding,

    /// {@macro ShadTimePicker.fieldDecoration}
    ShadDecoration? fieldDecoration,

    /// {@macro ShadTimePicker.periodDecoration}
    ShadDecoration? periodDecoration,

    /// {@macro ShadKeyboardToolbar.toolbarBuilder}
    WidgetBuilder? keyboardToolbarBuilder,
    this.showHours,
    this.showMinutes,
    this.showSeconds,
  }) : super(
         builder: (field) {
           final state = field as _ShadFormBuilderTimePickerState;
           return ShadTimePicker.raw(
             variant: variant,
             controller: state.controller,
             onChanged: state.didChange,
             enabled: state.enabled,
             initialValue: state.initialValue,
             axis: axis,
             spacing: spacing,
             runSpacing: runSpacing,
             jumpToNextFieldWhenFilled: jumpToNextFieldWhenFilled,
             hourLabel: hourLabel,
             minuteLabel: minuteLabel,
             secondLabel: secondLabel,
             hourPlaceholder: hourPlaceholder,
             minutePlaceholder: minutePlaceholder,
             secondPlaceholder: secondPlaceholder,
             leading: leading,
             trailing: trailing,
             alignment: alignment,
             runAlignment: runAlignment,
             crossAxisAlignment: crossAxisAlignment,
             maxHour: maxHour,
             maxMinute: maxMinute,
             maxSecond: maxSecond,
             minHour: minHour,
             minMinute: minMinute,
             minSecond: minSecond,
             initialDayPeriod: initialDayPeriod,
             periodLabel: periodLabel,
             periodPlaceholder: periodPlaceholder,
             periodHeight: periodHeight,
             periodMinWidth: periodMinWidth,
             gap: gap,
             style: style,
             placeholderStyle: placeholderStyle,
             labelStyle: labelStyle,
             fieldWidth: fieldWidth,
             fieldPadding: fieldPadding,
             fieldDecoration: fieldDecoration,
             periodDecoration: periodDecoration,
             keyboardToolbarBuilder: keyboardToolbarBuilder,
             showHours: showHours,
             showMinutes: showMinutes,
             showSeconds: showSeconds,
           );
         },
       );

  @override
  ShadFormBuilderFieldState<ShadTimePickerFormField, ShadTimeOfDay>
  createState() => _ShadFormBuilderTimePickerState();

  final ShadTimePickerController? controller;

  /// {@macro ShadTimePicker.showHours}
  final bool? showHours;

  /// {@macro ShadTimePicker.showMinutes}
  final bool? showMinutes;

  /// {@macro ShadTimePicker.showSeconds}
  final bool? showSeconds;
}

class _ShadFormBuilderTimePickerState
    extends ShadFormBuilderFieldState<ShadTimePickerFormField, ShadTimeOfDay> {
  // ignore: use_late_for_private_fields_and_variables
  ShadTimePickerController? _controller;
  ShadTimePickerController get controller => widget.controller ?? _controller!;

  bool get showSeconds => widget.showSeconds ?? true;
  bool get showHours => widget.showHours ?? true;
  bool get showMinutes => widget.showMinutes ?? true;

  @override
  void initState() {
    super.initState();
    if (widget.controller == null) {
      _controller = ShadTimePickerController.fromTimeOfDay(widget.initialValue);
    }
    controller.setHour(showHours ? controller.hour : 0);
    controller.setMinute(showMinutes ? controller.minute : 0);
    controller.setSecond(showSeconds ? controller.second : 0);
  }

  @override
  void reset() {
    super.reset();
    controller.value = initialValue;
  }

  @override
  void didUpdateWidget(
    covariant ShadTimePickerFormField oldWidget,
  ) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.showHours != widget.showHours) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        controller.setHour(showHours ? null : 0);
      });
    }
    if (oldWidget.showMinutes != widget.showMinutes) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        controller.setMinute(showMinutes ? null : 0);
      });
    }
    if (oldWidget.showSeconds != widget.showSeconds) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        controller.setSecond(showSeconds ? null : 0);
      });
    }
  }
}
