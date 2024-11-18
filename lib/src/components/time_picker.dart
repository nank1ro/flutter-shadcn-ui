import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shadcn_ui/src/components/input.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/utils/separated_iterable.dart';

@immutable
class ShadTimeOfDay extends TimeOfDay {
  /// Creates a time of day.
  ///
  /// The [hour] argument must be between 0 and 23, inclusive. The [minute]
  /// argument must be between 0 and 59, inclusive. The [second] argument must
  /// be between 0 and 59, inclusive.
  const ShadTimeOfDay({
    required super.hour,
    required super.minute,
    required this.second,
  });

  /// Creates a time of day based on the given time.
  ///
  /// The [hour] is set to the time's hour and the [minute] is set to the time's
  /// minute in the timezone of the given [DateTime].
  ShadTimeOfDay.fromDateTime(DateTime time)
      : second = time.second,
        super(hour: time.hour, minute: time.minute);

  /// Creates a time of day based on the current time.
  ///
  /// The [hour] is set to the current hour, the [minute] is set to the
  /// current minute in the local time zone and the [second] is set to the
  /// current second.
  ShadTimeOfDay.now() : this.fromDateTime(DateTime.now());

  /// The selected second.
  final int second;

  @override
  bool operator ==(Object other) {
    return other is ShadTimeOfDay &&
        other.hour == hour &&
        other.minute == minute &&
        other.second == second;
  }

  @override
  int get hashCode => Object.hash(hour, minute, second);

  @override
  String toString() {
    String addLeadingZeroIfNeeded(int value) {
      return value.toString().padLeft(2, '0');
    }

    final hourLabel = addLeadingZeroIfNeeded(hour);
    final minuteLabel = addLeadingZeroIfNeeded(minute);
    final secondLabel = addLeadingZeroIfNeeded(second);

    return '$TimeOfDay($hourLabel:$minuteLabel:$secondLabel)';
  }
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

  @override
  State<ShadTimePicker> createState() => _ShadTimePickerState();
}

class _ShadTimePickerState extends State<ShadTimePicker> {
  final focusNodes = [FocusNode(), FocusNode(), FocusNode()];
  late final List<ShadTimePickerTextEditingController> controllers;
  late final Listenable listenable;

  @override
  void initState() {
    super.initState();
    controllers = [
      ShadTimePickerTextEditingController(
        max: 23,
        text: widget.initialValue?.hour.toString().padLeft(2, '0'),
      ),
      ShadTimePickerTextEditingController(
        text: widget.initialValue?.minute.toString().padLeft(2, '0'),
      ),
      ShadTimePickerTextEditingController(
        text: widget.initialValue?.second.toString().padLeft(2, '0'),
      ),
    ];
    listenable = Listenable.merge(controllers);
    listenable.addListener(onChanged);
  }

  @override
  void dispose() {
    listenable.removeListener(onChanged);
    for (final node in focusNodes) {
      node.dispose();
    }
    focusNodes.clear();
    for (final controller in controllers) {
      controller.dispose();
    }
    controllers.clear();
    super.dispose();
  }

  void onChanged() {
    final hour = controllers[0].text;
    final minute = controllers[1].text;
    final second = controllers[2].text;

    if (hour.length == 2 && minute.length == 2 && second.length == 2) {
      widget.onChanged?.call(
        ShadTimeOfDay(
          hour: int.parse(hour),
          minute: int.parse(minute),
          second: int.parse(second),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final effectiveAxis = widget.axis ?? Axis.horizontal;
    final effectiveSpacing = widget.spacing ?? 0;
    final effectiveRunSpacing = widget.runSpacing ?? 0;
    final effectiveJumpToNextField = widget.jumpToNextFieldWhenFilled ?? true;
    final effectiveHourLabel = widget.hourLabel ?? const Text('Hours');
    final effectiveMinuteLabel = widget.minuteLabel ?? const Text('Minutes');
    final effectiveSecondLabel = widget.secondLabel ?? const Text('Seconds');

    const defaultPlaceholder = Text('00');
    final effectiveHourPlaceholder =
        widget.hourPlaceholder ?? defaultPlaceholder;
    final effectiveMinutePlaceholder =
        widget.minutePlaceholder ?? defaultPlaceholder;
    final effectiveSecondPlaceholder =
        widget.secondPlaceholder ?? defaultPlaceholder;

    final effectiveAlignment = widget.alignment ?? WrapAlignment.center;
    final effectiveRunAlignment = widget.runAlignment ?? WrapAlignment.center;
    final effectiveCrossAxisAlignment =
        widget.crossAxisAlignment ?? WrapCrossAlignment.center;

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
          placeholder: effectiveHourPlaceholder,
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
          placeholder: effectiveSecondPlaceholder,
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
    this.onChanged,
    this.focusNode,
  });

  final Widget? label;
  final Widget? placeholder;
  final ShadTimePickerTextEditingController? controller;
  final double? gap;
  final TextStyle? style;
  final ValueChanged<String>? onChanged;
  final FocusNode? focusNode;

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

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.label != null)
          DefaultTextStyle(
            style: theme.textTheme.small.copyWith(
              fontSize: 12,
            ),
            child: widget.label!,
          ),
        SizedBox(
          width: 58,
          child: ShadInput(
            focusNode: widget.focusNode,
            style: effectiveStyle,
            placeholderStyle: effectivePlaceholderStyle,
            controller: controller,
            placeholder: widget.placeholder,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            maxLength: 2,
            showCursor: false,
            maxLengthEnforcement: MaxLengthEnforcement.none,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
    final effectivePlaceholderStyle =
        defaultPlaceholderStyle.merge(placeholderStyle);

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
