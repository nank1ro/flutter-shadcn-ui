import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shadcn_ui/src/components/input.dart';
import 'package:shadcn_ui/src/components/select.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/utils/separated_iterable.dart';

@immutable
class ShadTimeOfDay {
  /// Creates a time of day.
  ///
  /// The [hour] argument must be between 0 and 23, inclusive. The [minute]
  /// argument must be between 0 and 59, inclusive.
  const ShadTimeOfDay({
    required this.hour,
    required this.minute,
    required this.second,
    DayPeriod? period,
  }) : _period = period;

  /// Creates a time of day based on the given time.
  ///
  /// The [hour] is set to the time's hour and the [minute] is set to the time's
  /// minute in the timezone of the given [DateTime].
  ShadTimeOfDay.fromDateTime(DateTime time)
      : hour = time.hour,
        minute = time.minute,
        second = time.second,
        _period = null;

  /// Creates a time of day based on the current time.
  ///
  /// The [hour] is set to the current hour, the [minute] is set to the
  /// current minute in the local time zone and the [second] is set to the
  /// current second.
  ShadTimeOfDay.now() : this.fromDateTime(DateTime.now());

  /// The selected hour, in 24 hour time from 0..23.
  final int hour;

  /// The selected minute.
  final int minute;

  /// The selected second.
  final int second;

  /// The selected period of the day.
  final DayPeriod? _period;

  /// Whether this time of day is before or after noon.
  DayPeriod get period =>
      _period ??
      (hour < TimeOfDay.hoursPerPeriod ? DayPeriod.am : DayPeriod.pm);

  @override
  bool operator ==(Object other) {
    return other is ShadTimeOfDay &&
        other.hour == hour &&
        other.minute == minute &&
        other.second == second &&
        other.period == period;
  }

  @override
  int get hashCode => Object.hash(hour, minute, second, period);

  @override
  String toString() {
    String addLeadingZeroIfNeeded(int value) {
      return value.toString().padLeft(2, '0');
    }

    final hourLabel = addLeadingZeroIfNeeded(hour);
    final minuteLabel = addLeadingZeroIfNeeded(minute);
    final secondLabel = addLeadingZeroIfNeeded(second);

    var s = '$TimeOfDay($hourLabel:$minuteLabel:$secondLabel';

    if (_period != null) {
      s += ' ${_period!.name.toUpperCase()}';
    }
    return s += ')';
  }
}

enum ShadTimePickerVariant {
  primary,
  period,
}

class ShadTimePicker extends StatefulWidget {
  const ShadTimePicker({
    super.key,
    this.axis,
    this.spacing,
    this.runSpacing,
    this.jumpToNextFieldWhenFilled,
    this.onChanged,
    this.initialValue,
    this.hourLabel,
    this.minuteLabel,
    this.secondLabel,
    this.hourPlaceholder,
    this.minutePlaceholder,
    this.secondPlaceholder,
    this.leading,
    this.trailing,
    this.alignment,
    this.runAlignment,
    this.crossAxisAlignment,
    this.maxHour = 23,
    this.maxMinute = 59,
    this.maxSecond = 59,
    this.minHour = 0,
    this.minMinute = 0,
    this.minSecond = 0,
    this.gap,
    this.style,
    this.labelStyle,
    this.placeholderStyle,
    this.fieldWidth,
    this.fieldPadding,
  })  : variant = ShadTimePickerVariant.primary,
        initialDayPeriod = null,
        periodLabel = null,
        periodPlaceholder = null,
        periodHeight = null,
        periodMinWidth = null;

  const ShadTimePicker.period({
    super.key,
    this.axis,
    this.spacing,
    this.runSpacing,
    this.jumpToNextFieldWhenFilled,
    this.onChanged,
    this.initialValue,
    this.hourLabel,
    this.minuteLabel,
    this.secondLabel,
    this.hourPlaceholder,
    this.minutePlaceholder,
    this.secondPlaceholder,
    this.leading,
    this.trailing,
    this.alignment,
    this.runAlignment,
    this.crossAxisAlignment,
    this.maxHour = 12,
    this.maxMinute = 59,
    this.maxSecond = 59,
    this.minHour = 0,
    this.minMinute = 0,
    this.minSecond = 0,
    this.initialDayPeriod,
    this.periodLabel,
    this.periodPlaceholder,
    this.periodHeight,
    this.periodMinWidth,
    this.gap,
    this.style,
    this.labelStyle,
    this.placeholderStyle,
    this.fieldWidth,
    this.fieldPadding,
  }) : variant = ShadTimePickerVariant.period;

  const ShadTimePicker.raw({
    super.key,
    required this.variant,
    this.axis,
    this.spacing,
    this.runSpacing,
    this.jumpToNextFieldWhenFilled,
    this.onChanged,
    this.initialValue,
    this.hourLabel,
    this.minuteLabel,
    this.secondLabel,
    this.hourPlaceholder,
    this.minutePlaceholder,
    this.secondPlaceholder,
    this.leading,
    this.trailing,
    this.alignment,
    this.runAlignment,
    this.crossAxisAlignment,
    this.maxHour = 23,
    this.maxMinute = 59,
    this.maxSecond = 59,
    this.minHour = 0,
    this.minMinute = 0,
    this.minSecond = 0,
    this.initialDayPeriod,
    this.periodLabel,
    this.periodPlaceholder,
    this.periodHeight,
    this.periodMinWidth,
    this.gap,
    this.style,
    this.labelStyle,
    this.placeholderStyle,
    this.fieldWidth,
    this.fieldPadding,
  });

  /// {@template ShadTimePicker.axis}
  /// The axis along which the fields are laid out. Defaults to `horizontal`.
  /// {@endtemplate}
  final Axis? axis;

  /// {@template ShadTimePicker.spacing}
  /// The spacing between the fields in the picker. Defaults to `0`.
  /// {@endtemplate}
  final double? spacing;

  /// {@template ShadTimePicker.runSpacing}
  /// The run spacing between the fields in the picker. Defaults to `0`.
  /// {@endtemplate}
  final double? runSpacing;

  /// {@template ShadTimePicker.jumpToNextFieldWhenFilled}
  /// Whether the focus should jump to the next field when the current field is
  /// filled. Defaults to `true`.
  /// {@endtemplate}
  final bool? jumpToNextFieldWhenFilled;

  /// {@template ShadTimePicker.onChanged}
  /// The callback that is called when the selected time changes.
  /// {@endtemplate}
  final ValueChanged<ShadTimeOfDay>? onChanged;

  /// {@template ShadTimePicker.initialValue}
  /// The initial time to show in the picker, defaults to null.
  /// {@endtemplate}
  final ShadTimeOfDay? initialValue;

  /// {@template ShadTimePicker.hourLabel}
  /// The widget to display as the label for the hour field.
  /// {@endtemplate}
  final Widget? hourLabel;

  /// {@template ShadTimePicker.minuteLabel}
  /// The widget to display as the label for the minute field.
  /// {@endtemplate}
  final Widget? minuteLabel;

  /// {@template ShadTimePicker.secondLabel}
  /// The widget to display as the label for the second field.
  /// {@endtemplate}
  final Widget? secondLabel;

  /// {@template ShadTimePicker.hourPlaceholder}
  /// The widget to display as the placeholder for the hour field, defaults to
  /// `Text('00')`.
  /// {@endtemplate}
  final Widget? hourPlaceholder;

  /// {@template ShadTimePicker.minutePlaceholder}
  /// The widget to display as the placeholder for the minute field, defaults to
  /// `Text('00')`.
  /// {@endtemplate}
  final Widget? minutePlaceholder;

  /// {@template ShadTimePicker.secondPlaceholder}
  /// The widget to display as the placeholder for the second field, defaults to
  /// `Text('00')`.
  /// {@endtemplate}
  final Widget? secondPlaceholder;

  /// {@template ShadTimePicker.leading}
  /// The widget to display before the fields in the picker.
  /// {@endtemplate}
  final Widget? leading;

  /// {@template ShadTimePicker.trailing}
  /// The widget to display after the fields in the picker.
  /// {@endtemplate}
  final Widget? trailing;

  /// {@template ShadTimePicker.alignment}
  /// The alignment of the fields in the picker. Defaults to
  /// `WrapAlignment.center`.
  /// {@endtemplate}
  final WrapAlignment? alignment;

  /// {@template ShadTimePicker.runAlignment}
  /// The alignment of the fields in the picker. Defaults to
  /// `WrapAlignment.center`.
  /// {@endtemplate}
  final WrapAlignment? runAlignment;

  /// {@template ShadTimePicker.crossAxisAlignment}
  /// The alignment of the fields in the picker. Defaults to
  /// `WrapCrossAlignment.center`.
  /// {@endtemplate}
  final WrapCrossAlignment? crossAxisAlignment;

  /// {@template ShadTimePicker.maxHour}
  /// The maximum hour value that can be selected. Defaults to 23 if [variant]
  /// is [ShadTimePickerVariant.primary] or 12 if [variant] is
  /// [ShadTimePickerVariant.period].
  /// {@endtemplate}
  final int maxHour;

  /// {@template ShadTimePicker.maxMinute}
  /// The maximum minute value that can be selected. Defaults to 59.
  /// {@endtemplate}
  final int maxMinute;

  /// {@template ShadTimePicker.maxSecond}
  /// The maximum second value that can be selected. Defaults to 59.
  /// {@endtemplate}
  final int maxSecond;

  /// {@template ShadTimePicker.minHour}
  /// The minimum hour value that can be selected. Defaults to 0.
  /// {@endtemplate}
  final int minHour;

  /// {@template ShadTimePicker.minMinute}
  /// The minimum minute value that can be selected. Defaults to 0.
  /// {@endtemplate}
  final int minMinute;

  /// {@template ShadTimePicker.minSecond}
  /// The minimum second value that can be selected. Defaults to 0.
  /// {@endtemplate}
  final int minSecond;

  /// {@template ShadTimePicker.variant}
  /// The variant of the time picker.
  /// {@endtemplate}
  final ShadTimePickerVariant variant;

  /// {@template ShadTimePicker.initialDayPeriod}
  /// The initial day period to show in the picker, defaults to `DayPeriod.am`.
  /// {@endtemplate}
  final DayPeriod? initialDayPeriod;

  /// {@template ShadTimePicker.periodLabel}
  /// The widget to display as the label for the period field.
  /// {@endtemplate}
  final Widget? periodLabel;

  /// {@template ShadTimePicker.periodPlaceholder}
  /// The widget to display as the placeholder for the period field, defaults
  /// to `null`.
  /// {@endtemplate}
  final Widget? periodPlaceholder;

  /// {@template ShadTimePicker.periodHeight}
  /// The height of the period field, defaults to `50`.
  /// {@endtemplate}
  final double? periodHeight;

  /// {@template ShadTimePicker.periodMinWidth}
  /// The min width of the period field, defaults to `65`.
  /// {@endtemplate}
  final double? periodMinWidth;

  /// {@template ShadTimePicker.gap}
  /// The gap between the label and the field in the picker. Defaults to `2`.
  /// {@endtemplate}
  final double? gap;

  /// {@template ShadTimePicker.style}
  /// The style of the label. Defaults to
  /// ```
  /// theme.textTheme.muted.copyWith(
  ///   color: theme.colorScheme.foreground,
  ///   fontSize: 16,
  ///   height: 24 / 16,
  /// ),
  /// ```
  /// {@endtemplate}
  final TextStyle? style;

  /// {@template ShadTimePicker.placeholderStyle}
  /// The style of the placeholder. Defaults to
  /// ```
  /// theme.textTheme.muted.copyWith(
  ///   fontSize: 16,
  ///   height: 24 / 16,
  /// ),
  /// ```
  /// {@endtemplate}
  final TextStyle? placeholderStyle;

  /// {@template ShadTimePicker.labelStyle}
  /// The style of the label. Defaults to
  /// `theme.textTheme.small.copyWith(fontSize: 12)`
  /// {@endtemplate}
  final TextStyle? labelStyle;

  /// {@template ShadTimePicker.fieldWidth}
  /// The width of the field, defaults to `58`.
  /// {@endtemplate}
  final double? fieldWidth;

  /// {@template ShadTimePicker.fieldPadding}
  /// The padding of the field, defaults to
  /// `const EdgeInsets.symmetric(horizontal: 12, vertical: 8)`.
  /// {@endtemplate}
  final EdgeInsets? fieldPadding;

  @override
  State<ShadTimePicker> createState() => _ShadTimePickerState();
}

class _ShadTimePickerState extends State<ShadTimePicker> {
  final focusNodes = [FocusNode(), FocusNode(), FocusNode()];
  final periodFocusNode = FocusNode();
  late final List<ShadTimePickerTextEditingController> controllers;
  late final Listenable listenable;
  late final selectedDayPeriod =
      ValueNotifier<DayPeriod?>(widget.initialDayPeriod ?? DayPeriod.am);

  @override
  void initState() {
    super.initState();
    controllers = [
      ShadTimePickerTextEditingController(
        max: widget.maxHour,
        min: widget.minHour,
        text: widget.initialValue?.hour.toString().padLeft(2, '0'),
        placeholderStyle: widget.placeholderStyle,
      ),
      ShadTimePickerTextEditingController(
        max: widget.maxMinute,
        min: widget.minMinute,
        text: widget.initialValue?.minute.toString().padLeft(2, '0'),
        placeholderStyle: widget.placeholderStyle,
      ),
      ShadTimePickerTextEditingController(
        max: widget.maxSecond,
        min: widget.minSecond,
        text: widget.initialValue?.second.toString().padLeft(2, '0'),
        placeholderStyle: widget.placeholderStyle,
      ),
    ];
    listenable = Listenable.merge([...controllers, selectedDayPeriod]);
    listenable.addListener(onChanged);
  }

  @override
  void dispose() {
    selectedDayPeriod.dispose();
    listenable.removeListener(onChanged);
    for (final node in focusNodes) {
      node.dispose();
    }
    focusNodes.clear();
    for (final controller in controllers) {
      controller.dispose();
    }
    controllers.clear();
    periodFocusNode.dispose();
    super.dispose();
  }

  void onChanged() {
    final hour = controllers[0].text;
    final minute = controllers[1].text;
    final second = controllers[2].text;
    final period = selectedDayPeriod.value;

    if (hour.length == 2 &&
        minute.length == 2 &&
        second.length == 2 &&
        (widget.variant == ShadTimePickerVariant.primary || period != null)) {
      widget.onChanged?.call(
        ShadTimeOfDay(
          hour: int.parse(hour),
          minute: int.parse(minute),
          second: int.parse(second),
          period:
              widget.variant == ShadTimePickerVariant.period ? period : null,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final effectiveAxis =
        widget.axis ?? theme.timePickerTheme.axis ?? Axis.horizontal;
    final effectiveSpacing =
        widget.spacing ?? theme.timePickerTheme.spacing ?? 0;
    final effectiveRunSpacing =
        widget.runSpacing ?? theme.timePickerTheme.runSpacing ?? 0;
    final effectiveJumpToNextField = widget.jumpToNextFieldWhenFilled ??
        theme.timePickerTheme.jumpToNextFieldWhenFilled ??
        true;
    final effectiveHourLabel = widget.hourLabel ?? const Text('Hours');
    final effectiveMinuteLabel = widget.minuteLabel ?? const Text('Minutes');
    final effectiveSecondLabel = widget.secondLabel ?? const Text('Seconds');
    final effectivePeriodLabel = widget.periodLabel ?? const Text('Period');

    const defaultPlaceholder = Text('00');
    final effectiveHourPlaceholder =
        widget.hourPlaceholder ?? defaultPlaceholder;
    final effectiveMinutePlaceholder =
        widget.minutePlaceholder ?? defaultPlaceholder;
    final effectiveSecondPlaceholder =
        widget.secondPlaceholder ?? defaultPlaceholder;
    final effectivePeriodPlaceholder = widget.periodPlaceholder;

    final effectiveAlignment = widget.alignment ??
        theme.timePickerTheme.alignment ??
        WrapAlignment.center;
    final effectiveRunAlignment = widget.runAlignment ??
        theme.timePickerTheme.runAlignment ??
        WrapAlignment.center;
    final effectiveCrossAxisAlignment = widget.crossAxisAlignment ??
        theme.timePickerTheme.crossAxisAlignment ??
        WrapCrossAlignment.center;

    final effectivePeriodHeight =
        widget.periodHeight ?? theme.timePickerTheme.periodHeight ?? 50;
    final effectivePeriodMinWidth =
        widget.periodMinWidth ?? theme.timePickerTheme.periodMinWidth ?? 65;
    final effectiveGap = widget.gap ?? theme.timePickerTheme.gap ?? 2;
    final effectiveFieldWidth =
        widget.fieldWidth ?? theme.timePickerTheme.fieldWidth ?? 58;
    final effectiveFieldPadding = widget.fieldPadding ??
        theme.timePickerTheme.fieldPadding ??
        const EdgeInsets.symmetric(horizontal: 12, vertical: 8);

    final effectiveStyle = theme.textTheme.muted
        .copyWith(
          color: theme.colorScheme.foreground,
          fontSize: 16,
          height: 24 / 16,
        )
        .merge(theme.timePickerTheme.style)
        .merge(widget.style);

    final effectiveLabelStyle = theme.textTheme.small
        .copyWith(fontSize: 12)
        .merge(theme.timePickerTheme.labelStyle)
        .merge(widget.labelStyle);

    return Wrap(
      direction: effectiveAxis,
      spacing: effectiveSpacing,
      runSpacing: effectiveRunSpacing,
      alignment: effectiveAlignment,
      runAlignment: effectiveRunAlignment,
      crossAxisAlignment: effectiveCrossAxisAlignment,
      children: [
        if (widget.leading != null) widget.leading!,
        ShadTimePickerField(
          focusNode: focusNodes[0],
          label: effectiveHourLabel,
          controller: controllers[0],
          gap: effectiveGap,
          placeholder: effectiveHourPlaceholder,
          style: effectiveStyle,
          labelStyle: effectiveLabelStyle,
          width: effectiveFieldWidth,
          padding: effectiveFieldPadding,
          onChanged: (v) {
            if (effectiveJumpToNextField && v.length == 2) {
              focusNodes[1].requestFocus();
            }
          },
        ),
        ShadTimePickerField(
          focusNode: focusNodes[1],
          label: effectiveMinuteLabel,
          controller: controllers[1],
          placeholder: effectiveMinutePlaceholder,
          gap: effectiveGap,
          style: effectiveStyle,
          labelStyle: effectiveLabelStyle,
          width: effectiveFieldWidth,
          padding: effectiveFieldPadding,
          onChanged: (v) {
            if (effectiveJumpToNextField && v.length == 2) {
              focusNodes[2].requestFocus();
            }
          },
        ),
        ShadTimePickerField(
          focusNode: focusNodes[2],
          label: effectiveSecondLabel,
          controller: controllers[2],
          gap: effectiveGap,
          placeholder: effectiveSecondPlaceholder,
          style: effectiveStyle,
          labelStyle: effectiveLabelStyle,
          width: effectiveFieldWidth,
          padding: effectiveFieldPadding,
          onChanged: (v) {
            if (effectiveJumpToNextField &&
                v.length == 2 &&
                widget.variant == ShadTimePickerVariant.period) {
              periodFocusNode.requestFocus();
            }
          },
        ),
        if (widget.variant == ShadTimePickerVariant.period)
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              DefaultTextStyle(
                style: effectiveLabelStyle,
                child: effectivePeriodLabel,
              ),
              SizedBox(height: effectiveGap),
              SizedBox(
                height: effectivePeriodHeight,
                child: ShadSelect(
                  focusNode: periodFocusNode,
                  minWidth: effectivePeriodMinWidth,
                  placeholder: effectivePeriodPlaceholder,
                  initialValue: selectedDayPeriod.value,
                  options: DayPeriod.values
                      .map(
                        (v) => ShadOption(
                          value: v,
                          child: Text(v.name.toUpperCase()),
                        ),
                      )
                      .toList(),
                  selectedOptionBuilder: (context, value) {
                    return Text(value.name.toUpperCase());
                  },
                  onChanged: (value) {
                    selectedDayPeriod.value = value;
                  },
                ),
              ),
            ],
          ),
        if (widget.trailing != null) widget.trailing!,
      ],
    );
  }
}

class ShadTimePickerField extends StatefulWidget {
  const ShadTimePickerField({
    super.key,
    this.label,
    this.placeholder,
    this.controller,
    this.gap,
    this.style,
    this.labelStyle,
    this.onChanged,
    this.focusNode,
    this.width,
    this.padding,
  });

  final Widget? label;
  final Widget? placeholder;
  final ShadTimePickerTextEditingController? controller;
  final double? gap;
  final TextStyle? style;
  final TextStyle? labelStyle;
  final ValueChanged<String>? onChanged;
  final FocusNode? focusNode;
  final double? width;
  final EdgeInsets? padding;

  @override
  State<ShadTimePickerField> createState() => _ShadTimePickerFieldState();
}

class _ShadTimePickerFieldState extends State<ShadTimePickerField> {
  ShadTimePickerTextEditingController? _controller;
  ShadTimePickerTextEditingController get controller =>
      widget.controller ?? _controller!;

  @override
  void initState() {
    super.initState();
    if (widget.controller == null) {
      _controller = ShadTimePickerTextEditingController();
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final effectiveGap = widget.gap ?? 2;

    final defaultStyle = theme.textTheme.muted.copyWith(
      color: theme.colorScheme.foreground,
      fontSize: 16,
      height: 24 / 16,
    );

    final effectiveStyle = defaultStyle.merge(widget.style);

    final defaultPlaceholderStyle = theme.textTheme.muted.copyWith(
      fontSize: 16,
      height: 24 / 16,
    );

    final effectivePlaceholderStyle =
        defaultPlaceholderStyle.merge(controller.placeholderStyle);

    final defaultLabelStyle = theme.textTheme.small.copyWith(fontSize: 12);
    final effectiveLabelStyle = defaultLabelStyle.merge(widget.labelStyle);
    final effectiveWidth = widget.width ?? 58;
    final effectivePadding = widget.padding ??
        const EdgeInsets.symmetric(horizontal: 12, vertical: 8);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.label != null)
          DefaultTextStyle(
            style: effectiveLabelStyle,
            child: widget.label!,
          ),
        SizedBox(
          width: effectiveWidth,
          child: ShadInput(
            focusNode: widget.focusNode,
            style: effectiveStyle,
            placeholderStyle: effectivePlaceholderStyle,
            controller: controller,
            decoration: ShadDecoration(
              border: ShadBorder.all(
                color: theme.colorScheme.border,
                radius: theme.radius,
              ),
            ),
            placeholder: widget.placeholder,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            maxLength: 2,
            showCursor: false,
            maxLengthEnforcement: MaxLengthEnforcement.none,
            padding: effectivePadding,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            onChanged: (value) {
              widget.onChanged?.call(value);
            },
          ),
        ),
      ].separatedBy(SizedBox(height: effectiveGap)),
    );
  }
}

class ShadTimePickerTextEditingController extends TextEditingController {
  ShadTimePickerTextEditingController({
    super.text,
    this.placeholderStyle,
    this.min = 0,
    this.max = 59,
  });

  ShadTimePickerTextEditingController.fromValue(
    TextEditingValue? value, {
    this.placeholderStyle,
    this.min = 0,
    this.max = 59,
  })  : assert(
          value == null ||
              !value.composing.isValid ||
              value.isComposingRangeValid,
          '''
          New TextEditingValue $value has an invalid non-empty composing range
          ${value.composing}. It is recommended to use a valid composing range,
          even for readonly text fields.''',
        ),
        super.fromValue(value ?? TextEditingValue.empty);

  final TextStyle? placeholderStyle;
  final int min;
  final int max;

  @override
  TextSpan buildTextSpan({
    required BuildContext context,
    TextStyle? style,
    required bool withComposing,
  }) {
    assert(
      !value.composing.isValid || !withComposing || value.isComposingRangeValid,
    );
    // If the composing range is out of range for the current text, ignore it to
    // preserve the tree integrity, otherwise in release mode a RangeError will
    // be thrown and this EditableText will be built with a broken subtree.
    final composingRegionOutOfRange =
        !value.isComposingRangeValid || !withComposing;

    final theme = ShadTheme.of(context);

    final defaultPlaceholderStyle = theme.textTheme.muted.copyWith(
      fontSize: 16,
      height: 24 / 16,
    );
    final effectivePlaceholderStyle = defaultPlaceholderStyle
        .merge(theme.timePickerTheme.placeholderStyle)
        .merge(placeholderStyle);

    final intValue = int.tryParse(value.text);
    if (intValue == null) return const TextSpan();

    if (composingRegionOutOfRange) {
      return TextSpan(
        style: style,
        children: [
          if (value.text.length == 1 && intValue < 10)
            TextSpan(text: '0', style: effectivePlaceholderStyle),
          TextSpan(text: text),
        ],
      );
    }

    final composingStyle =
        style?.merge(const TextStyle(decoration: TextDecoration.underline)) ??
            const TextStyle(decoration: TextDecoration.underline);
    return TextSpan(
      style: style,
      children: <TextSpan>[
        TextSpan(text: value.composing.textBefore(value.text)),
        TextSpan(
          style: composingStyle,
          text: value.composing.textInside(value.text),
        ),
        TextSpan(text: value.composing.textAfter(value.text)),
      ],
    );
  }

  /// Setting this will notify all the listeners of this [TextEditingController]
  /// that they need to update (it calls [notifyListeners]). For this reason,
  /// this value should only be set between frames, e.g. in response to user
  /// actions, not during the build, layout, or paint phases.
  ///
  /// This property can be set from a listener added to this
  /// [TextEditingController]; **however, one should not also set [selection]
  /// in a separate statement. To change both the [text] and the [selection]
  /// change the controller's [value].** Setting this here will clear
  /// the current selection and composing range, so avoid using it directly
  /// unless that is the desired behavior.
  @override
  set text(String newText) {
    final effectiveText = adjustText(newText);

    value = value.copyWith(
      text: effectiveText,
      selection: const TextSelection.collapsed(offset: -1),
      composing: TextRange.empty,
    );
  }

  @override
  set value(TextEditingValue newValue) {
    assert(
      !newValue.composing.isValid || newValue.isComposingRangeValid,
      'New TextEditingValue $newValue has an invalid non-empty composing range '
      '${newValue.composing}. It is recommended to use a valid composing range,'
      ' even for readonly text fields.',
    );
    final newText = adjustText(newValue.text);
    // super.value = newValue;
    super.value = TextEditingValue(
      text: adjustText(newValue.text),
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }

  String adjustText(String newText) {
    var effectiveText = newText;
    if (effectiveText.length == 3) {
      effectiveText = effectiveText.substring(2);
    }

    final intValue = int.tryParse(effectiveText);
    if (intValue == null) return '';
    if (intValue < min) return min.toString();
    if (intValue > max) return max.toString();
    return effectiveText;
  }

  ShadTimePickerTextEditingController copyWith({
    String? text,
    int? min,
    int? max,
    TextStyle? placeholderStyle,
  }) {
    return ShadTimePickerTextEditingController(
      text: text ?? this.text,
      min: min ?? this.min,
      max: max ?? this.max,
      placeholderStyle: placeholderStyle ?? this.placeholderStyle,
    );
  }
}
