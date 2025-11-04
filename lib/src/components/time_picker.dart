import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/components/input.dart';
import 'package:shadcn_ui/src/components/select.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/utils/border.dart';
import 'package:shadcn_ui/src/utils/extensions/text_style.dart';
import 'package:shadcn_ui/src/utils/separated_iterable.dart';

/// Whether the TimeOfDay is before or after noon.
enum ShadDayPeriod {
  /// Ante meridiem (before noon).
  am,

  /// Post meridiem (after noon).
  pm,
}

/// Represents a time of day, including hour, minute, and second, and optionally period (AM/PM).
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
    ShadDayPeriod? period,
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
  final ShadDayPeriod? _period;

  /// Whether this time of day is before or after noon.
  ShadDayPeriod get period =>
      _period ??
      (hour < ShadTimeOfDay.hoursPerPeriod
          ? ShadDayPeriod.am
          : ShadDayPeriod.pm);

  /// The number of hours in one day, i.e. 24.
  static const int hoursPerDay = 24;

  /// The number of hours in one day period (see also [ShadDayPeriod]), i.e. 12.
  static const int hoursPerPeriod = 12;

  /// The number of minutes in one hour, i.e. 60.
  static const int minutesPerHour = 60;

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

    var s = '$ShadTimeOfDay($hourLabel:$minuteLabel:$secondLabel';

    if (_period != null) {
      s += ' ${_period.name.toUpperCase()}';
    }
    return s += ')';
  }

  ShadTimeOfDay copyWith({
    int? hour,
    int? minute,
    int? second,
    ShadDayPeriod? period,
  }) {
    return ShadTimeOfDay(
      hour: hour ?? this.hour,
      minute: minute ?? this.minute,
      second: second ?? this.second,
      period: period ?? this.period,
    );
  }
}

/// {@template ShadTimePickerController}
/// A controller for [ShadTimePicker] to manage the selected time.
///
/// Extends [ChangeNotifier] to provide reactive updates when the selected time
/// changes.
/// {@endtemplate}
class ShadTimePickerController extends ChangeNotifier {
  /// Creates a [ShadTimePickerController].
  ///
  /// Allows specifying initial hour, minute, second, and period.
  ShadTimePickerController({
    this.hour,
    this.minute,
    this.second,
    this.period,
  });

  /// Creates a [ShadTimePickerController] initialized with a [ShadTimeOfDay]
  /// object.
  ShadTimePickerController.fromTimeOfDay(ShadTimeOfDay? timeOfDay)
    : hour = timeOfDay?.hour,
      minute = timeOfDay?.minute,
      second = timeOfDay?.second,
      period = timeOfDay?.period;

  /// {@template ShadTimePickerController.hour}
  /// The selected hour.
  /// {@endtemplate}
  int? hour;

  /// {@template ShadTimePickerController.minute}
  /// The selected minute.
  /// {@endtemplate}
  int? minute;

  /// {@template ShadTimePickerController.second}
  /// The selected second.
  /// {@endtemplate}
  int? second;

  /// {@template ShadTimePickerController.period}
  /// The selected day period (AM/PM).
  /// {@endtemplate}
  ShadDayPeriod? period;

  /// Returns the current [ShadTimeOfDay] value from the controller.
  ///
  /// Returns `null` if any of hour, minute, or second are null.
  ShadTimeOfDay? get value {
    if (hour == null || minute == null || second == null) return null;
    return ShadTimeOfDay(
      hour: hour!,
      minute: minute!,
      second: second!,
      period: period,
    );
  }

  set value(ShadTimeOfDay? value) {
    hour = value?.hour;
    minute = value?.minute;
    second = value?.second;
    period = value?.period;
    notifyListeners();
  }

  /// Sets the hour and notifies listeners.
  void setHour(int? hour) {
    if (this.hour == hour) return;
    this.hour = hour;
    notifyListeners();
  }

  /// Sets the minute and notifies listeners.
  void setMinute(int? minute) {
    if (this.minute == minute) return;
    this.minute = minute;
    notifyListeners();
  }

  /// Sets the second and notifies listeners.
  void setSecond(int? second) {
    if (this.second == second) return;
    this.second = second;
    notifyListeners();
  }

  /// Sets the day period (AM/PM) and notifies listeners.
  void setDayPeriod(ShadDayPeriod? period) {
    if (this.period == period) return;
    this.period = period;
    notifyListeners();
  }
}

/// Enum representing different variants of [ShadTimePicker].
enum ShadTimePickerVariant {
  /// Primary variant with 24-hour format.
  primary,

  /// Variant with AM/PM period selection and 12-hour format.
  period,
}

/// {@template ShadTimePicker}
/// A customizable time picker component with hour, minute, and second inputs.
///
/// Supports different variants, layouts, and extensive styling options.
/// {@endtemplate}
class ShadTimePicker extends StatefulWidget {
  /// Creates a [ShadTimePicker] with the primary variant (24-hour format).
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
    this.fieldDecoration,
    this.controller,
    this.enabled = true,
    this.keyboardToolbarBuilder,
    this.showHours,
    this.showSeconds,
    this.showMinutes,
  }) : variant = ShadTimePickerVariant.primary,
       initialDayPeriod = null,
       periodLabel = null,
       periodPlaceholder = null,
       periodHeight = null,
       periodDecoration = null,
       periodMinWidth = null,
       assert(
         false != showHours || false != showMinutes || false != showSeconds,
         '''At least one of showHours, showMinutes, or showSeconds must not be false''',
       );

  /// Creates a [ShadTimePicker] with the period variant (12-hour format with AM/PM).
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
    this.fieldDecoration,
    this.periodDecoration,
    this.controller,
    this.enabled = true,
    this.keyboardToolbarBuilder,
    this.showHours,
    this.showMinutes,
    this.showSeconds,
  }) : variant = ShadTimePickerVariant.period,
       assert(
         false != showHours || false != showMinutes || false != showSeconds,
         '''At least one of showHours, showMinutes, or showSeconds must not be false''',
       );

  /// Creates a [ShadTimePicker] with a raw variant, allowing explicit variant
  /// specification.
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
    this.fieldDecoration,
    this.periodDecoration,
    this.controller,
    this.enabled = true,
    this.keyboardToolbarBuilder,
    this.showHours,
    this.showMinutes,
    this.showSeconds,
  }) : assert(
         false != showHours || false != showMinutes || false != showSeconds,
         '''At least one of showHours, showMinutes, or showSeconds must not be false''',
       );

  /// {@template ShadTimePicker.axis}
  /// The axis along which the fields are laid out. Defaults to `horizontal`.
  /// {@endtemplate}
  final Axis? axis;

  /// {@template ShadTimePicker.spacing}
  /// The spacing between the fields in the picker. Defaults to `8`.
  /// {@endtemplate}
  final double? spacing;

  /// {@template ShadTimePicker.runSpacing}
  /// The run spacing between the fields in the picker. Defaults to `4`.
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
  /// The initial day period to show in the picker, defaults to
  /// `ShadDayPeriod.am`.
  /// {@endtemplate}
  final ShadDayPeriod? initialDayPeriod;

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
  /// The height of the period field, defaults to `42`.
  /// {@endtemplate}
  final double? periodHeight;

  /// {@template ShadTimePicker.periodMinWidth}
  /// The min width of the period field, defaults to `65`.
  /// {@endtemplate}
  final double? periodMinWidth;

  /// {@template ShadTimePicker.gap}
  /// The gap between the label and the field in the picker. Defaults to `4`.
  /// {@endtemplate}
  final double? gap;

  /// {@template ShadTimePicker.style}
  /// The style of the label. Defaults to
  /// ```dart
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
  /// ```dart
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
  /// The width of the field, defaults to `48`.
  /// {@endtemplate}
  final double? fieldWidth;

  /// {@template ShadTimePicker.fieldPadding}
  /// The padding of the field, defaults to
  /// `const EdgeInsets.symmetric(horizontal: 12, vertical: 8)`.
  /// {@endtemplate}
  final EdgeInsetsGeometry? fieldPadding;

  /// {@template ShadTimePicker.fieldDecoration}
  /// The decoration of the field, defaults to
  /// ```dart
  /// ShadDecoration(border: ShadBorder.all(
  ///   color: colorScheme.border,
  ///   radius: radius,
  ///   ),
  /// ),
  /// ```
  /// {@endtemplate}
  final ShadDecoration? fieldDecoration;

  /// {@template ShadTimePicker.periodDecoration}
  /// The decoration of the field, defaults to `null`.
  /// {@endtemplate}
  final ShadDecoration? periodDecoration;

  /// {@template ShadTimePicker.controller}
  /// The controller of the time picker, defaults to `null`.
  /// {@endtemplate}
  final ShadTimePickerController? controller;

  /// {@template ShadTimePicker.enabled}
  /// Whether the time picker is enabled, defaults to `true`.
  /// {@endtemplate}
  final bool enabled;

  /// {@macro ShadKeyboardToolbar.toolbarBuilder}
  final WidgetBuilder? keyboardToolbarBuilder;

  /// {@template ShadTimePicker.showHours}
  /// Whether to show the hours field, defaults to `true`.
  /// {@endtemplate}
  final bool? showHours;

  /// {@template ShadTimePicker.showMinutes}
  /// Whether to show the minutes field, defaults to `true`.
  /// {@endtemplate}
  final bool? showMinutes;

  /// {@template ShadTimePicker.showSeconds}
  /// Whether to show the seconds field, defaults to `true`.
  /// {@endtemplate}
  final bool? showSeconds;

  @override
  State<ShadTimePicker> createState() => _ShadTimePickerState();
}

class _ShadTimePickerState extends State<ShadTimePicker> {
  ShadTimePickerController? _controller;
  ShadTimePickerController get controller => widget.controller ?? _controller!;
  late final hourController = ShadTimePickerTextEditingController(
    max: widget.maxHour,
    min: widget.minHour,
    text: widget.initialValue?.hour == null && widget.controller?.hour == null
        ? null
        : (widget.initialValue?.hour ?? widget.controller?.hour)
              .toString()
              .padLeft(2, '0'),
    placeholderStyle: widget.placeholderStyle,
  );
  late final minuteController = ShadTimePickerTextEditingController(
    max: widget.maxMinute,
    min: widget.minMinute,
    text:
        widget.initialValue?.minute == null && widget.controller?.minute == null
        ? null
        : (widget.initialValue?.minute ?? widget.controller?.minute)
              .toString()
              .padLeft(2, '0'),
    placeholderStyle: widget.placeholderStyle,
  );
  late final secondController = ShadTimePickerTextEditingController(
    max: widget.maxSecond,
    min: widget.minSecond,
    text:
        widget.initialValue?.second == null && widget.controller?.second == null
        ? null
        : (widget.initialValue?.second ?? widget.controller?.second)
              .toString()
              .padLeft(2, '0'),
    placeholderStyle: widget.placeholderStyle,
  );

  final focusNodes = [FocusNode(), FocusNode(), FocusNode()];
  final periodFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    if (widget.controller == null) {
      _controller = ShadTimePickerController(
        hour: widget.initialValue?.hour,
        minute: widget.initialValue?.minute,
        second: widget.initialValue?.second,
        period: widget.initialDayPeriod,
      );
    }
    controller.addListener(onChanged);
  }

  @override
  void dispose() {
    _controller?.dispose();
    controller.removeListener(onChanged);
    for (final node in focusNodes) {
      node.dispose();
    }
    focusNodes.clear();
    periodFocusNode.dispose();
    super.dispose();
  }

  void onChanged() {
    if (controller.hour == null ||
        controller.minute == null ||
        controller.second == null) {
      return;
    }
    if (widget.variant == ShadTimePickerVariant.period &&
        controller.period == null) {
      return;
    }
    widget.onChanged?.call(
      ShadTimeOfDay(
        hour: controller.hour!,
        minute: controller.minute!,
        second: controller.second!,
        period: controller.period,
      ),
    );
  }

  void focusNextField(int currentIndex) {
    final nextIndex = currentIndex + 1;
    if (nextIndex < 3) {
      final shouldShow = [
        widget.showHours ?? true,
        widget.showMinutes ?? true,
        widget.showSeconds ?? true,
      ];

      for (var i = nextIndex; i < 3; i++) {
        if (shouldShow[i]) {
          focusNodes[i].requestFocus();
          return;
        }
      }
    }

    // Handle period focus for period variant
    if (widget.variant == ShadTimePickerVariant.period) {
      periodFocusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final effectiveAxis =
        widget.axis ?? theme.timePickerTheme.axis ?? Axis.horizontal;
    final effectiveSpacing =
        widget.spacing ?? theme.timePickerTheme.spacing ?? 8;
    final effectiveRunSpacing =
        widget.runSpacing ?? theme.timePickerTheme.runSpacing ?? 4;
    final effectiveJumpToNextField =
        widget.jumpToNextFieldWhenFilled ??
        theme.timePickerTheme.jumpToNextFieldWhenFilled ??
        true;
    final effectiveHourLabel =
        widget.hourLabel ??
        theme.timePickerTheme.hourLabel ??
        const Text('Hours');
    final effectiveMinuteLabel =
        widget.minuteLabel ??
        theme.timePickerTheme.minuteLabel ??
        const Text('Minutes');
    final effectiveSecondLabel =
        widget.secondLabel ??
        theme.timePickerTheme.secondLabel ??
        const Text('Seconds');
    final effectivePeriodLabel =
        widget.periodLabel ??
        theme.timePickerTheme.periodLabel ??
        const Text('Period');

    const defaultPlaceholder = Text('00');
    final effectiveHourPlaceholder =
        widget.hourPlaceholder ??
        theme.timePickerTheme.hourPlaceholder ??
        defaultPlaceholder;
    final effectiveMinutePlaceholder =
        widget.minutePlaceholder ??
        theme.timePickerTheme.minutePlaceholder ??
        defaultPlaceholder;
    final effectiveSecondPlaceholder =
        widget.secondPlaceholder ??
        theme.timePickerTheme.secondPlaceholder ??
        defaultPlaceholder;
    final effectivePeriodPlaceholder =
        widget.periodPlaceholder ??
        theme.timePickerTheme.periodPlaceholder ??
        Text('AM', style: theme.textTheme.muted);

    final effectiveAlignment =
        widget.alignment ??
        theme.timePickerTheme.alignment ??
        WrapAlignment.center;
    final effectiveRunAlignment =
        widget.runAlignment ??
        theme.timePickerTheme.runAlignment ??
        WrapAlignment.center;
    final effectiveCrossAxisAlignment =
        widget.crossAxisAlignment ??
        theme.timePickerTheme.crossAxisAlignment ??
        WrapCrossAlignment.center;

    final effectivePeriodHeight =
        widget.periodHeight ?? theme.timePickerTheme.periodHeight ?? 42;
    final effectivePeriodMinWidth =
        widget.periodMinWidth ?? theme.timePickerTheme.periodMinWidth ?? 65;
    final effectiveGap = widget.gap ?? theme.timePickerTheme.gap ?? 4;
    final effectiveFieldWidth =
        widget.fieldWidth ?? theme.timePickerTheme.fieldWidth ?? 48;
    final effectiveFieldPadding =
        widget.fieldPadding ??
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
        .merge(widget.labelStyle)
        .fallback(color: theme.colorScheme.foreground);

    final effectiveFieldDecoration =
        ShadDecoration(
              border: ShadBorder.all(
                color: theme.colorScheme.border,
                radius: theme.radius,
              ),
            )
            .merge(theme.timePickerTheme.fieldDecoration)
            .merge(widget.fieldDecoration);

    final effectivePeriodDecoration =
        (theme.timePickerTheme.periodDecoration ?? const ShadDecoration())
            .merge(widget.periodDecoration);

    return Wrap(
      direction: effectiveAxis,
      spacing: effectiveSpacing,
      runSpacing: effectiveRunSpacing,
      alignment: effectiveAlignment,
      runAlignment: effectiveRunAlignment,
      crossAxisAlignment: effectiveCrossAxisAlignment,
      textDirection: TextDirection.ltr,
      children: [
        if (widget.leading != null) widget.leading!,
        if (widget.showHours ?? true)
          ShadTimePickerField(
            focusNode: focusNodes[0],
            label: effectiveHourLabel,
            controller: hourController,
            gap: effectiveGap,
            placeholder: effectiveHourPlaceholder,
            style: effectiveStyle,
            labelStyle: effectiveLabelStyle,
            width: effectiveFieldWidth,
            padding: effectiveFieldPadding,
            decoration: effectiveFieldDecoration,
            enabled: widget.enabled,
            keyboardToolbarBuilder: widget.keyboardToolbarBuilder,
            onChanged: (v) {
              if (v.isNotEmpty) {
                controller.setHour(int.tryParse(v));
                if (v.length == 2 && effectiveJumpToNextField) {
                  focusNextField(0);
                }
              }
            },
          ),
        if (widget.showMinutes ?? true)
          ShadTimePickerField(
            focusNode: focusNodes[1],
            label: effectiveMinuteLabel,
            controller: minuteController,
            placeholder: effectiveMinutePlaceholder,
            gap: effectiveGap,
            style: effectiveStyle,
            labelStyle: effectiveLabelStyle,
            width: effectiveFieldWidth,
            padding: effectiveFieldPadding,
            decoration: effectiveFieldDecoration,
            enabled: widget.enabled,
            keyboardToolbarBuilder: widget.keyboardToolbarBuilder,
            onChanged: (v) {
              if (v.isNotEmpty) {
                controller.setMinute(int.tryParse(v));
                if (v.length == 2 && effectiveJumpToNextField) {
                  focusNextField(1);
                }
              }
            },
          ),
        if (widget.showSeconds ?? true)
          ShadTimePickerField(
            focusNode: focusNodes[2],
            label: effectiveSecondLabel,
            controller: secondController,
            gap: effectiveGap,
            placeholder: effectiveSecondPlaceholder,
            style: effectiveStyle,
            labelStyle: effectiveLabelStyle,
            width: effectiveFieldWidth,
            padding: effectiveFieldPadding,
            decoration: effectiveFieldDecoration,
            enabled: widget.enabled,
            keyboardToolbarBuilder: widget.keyboardToolbarBuilder,
            onChanged: (v) {
              if (v.isNotEmpty) {
                controller.setSecond(int.tryParse(v));
                if (v.length == 2 &&
                    effectiveJumpToNextField &&
                    widget.variant == ShadTimePickerVariant.period) {
                  focusNextField(2);
                }
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
                  initialValue: controller.period,
                  decoration: effectivePeriodDecoration,
                  enabled: widget.enabled,
                  options: ShadDayPeriod.values
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
                    controller.setDayPeriod(value);
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

/// {@template ShadTimePickerField}
/// A single input field for [ShadTimePicker], used for hour, minute, or second
/// input.
/// {@endtemplate}
class ShadTimePickerField extends StatefulWidget {
  /// {@macro ShadTimePickerField}
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
    this.decoration,
    this.enabled = true,
    this.keyboardToolbarBuilder,
  });

  /// {@template ShadTimePickerField.label}
  /// The label widget to display above the input field.
  ///
  /// Typically a [Text] widget describing the field.
  /// {@endtemplate}
  final Widget? label;

  /// {@template ShadTimePickerField.placeholder}
  /// The placeholder widget to display when the input field is empty.
  ///
  /// Typically a [Text] widget providing a hint of the expected input.
  /// {@endtemplate}
  final Widget? placeholder;

  /// {@template ShadTimePickerField.controller}
  /// The text editing controller for the input field.
  ///
  /// Manages the text input and selection for the time picker field. Uses
  /// [ShadTimePickerTextEditingController].
  /// {@endtemplate}
  final ShadTimePickerTextEditingController? controller;

  /// {@template ShadTimePickerField.gap}
  /// The vertical gap between the label and the input field.
  ///
  /// Defaults to `2`.
  /// {@endtemplate}
  final double? gap;

  /// {@template ShadTimePickerField.style}
  /// The text style for the input field's text.
  ///
  /// Defines the appearance of the entered time value.
  /// {@endtemplate}
  final TextStyle? style;

  /// {@template ShadTimePickerField.labelStyle}
  /// The text style for the label widget.
  ///
  /// Defines the appearance of the field's label.
  /// {@endtemplate}
  final TextStyle? labelStyle;

  /// {@template ShadTimePickerField.onChanged}
  /// Callback function invoked when the text in the input field changes.
  ///
  /// Provides the current text value as an argument.
  /// {@endtemplate}
  final ValueChanged<String>? onChanged;

  /// {@template ShadTimePickerField.focusNode}
  /// Focus node to control the focus state of the input field.
  ///
  /// If null, a default [FocusNode] will be created internally.
  /// {@endtemplate}
  final FocusNode? focusNode;

  /// {@template ShadTimePickerField.width}
  /// The width of the input field.
  ///
  /// Defaults to `58`.
  /// {@endtemplate}
  final double? width;

  /// {@template ShadTimePickerField.padding}
  /// Padding around the input field's content area.
  ///
  /// Defaults to `EdgeInsets.symmetric(horizontal: 12, vertical: 8)`.
  /// {@endtemplate}
  final EdgeInsetsGeometry? padding;

  /// {@template ShadTimePickerField.decoration}
  /// The visual decoration of the input field.
  ///
  /// Uses [ShadDecoration] to define borders, colors, and more.
  /// {@endtemplate}
  final ShadDecoration? decoration;

  /// {@template ShadTimePickerField.enabled}
  /// Whether the input field is enabled.
  ///
  /// When disabled, the field cannot be interacted with and visually appears
  /// disabled. Defaults to `true`.
  /// {@endtemplate}
  final bool enabled;

  /// {@macro ShadKeyboardToolbar.toolbarBuilder}
  final WidgetBuilder? keyboardToolbarBuilder;

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

    final effectivePlaceholderStyle = defaultPlaceholderStyle
        .merge(theme.timePickerTheme.placeholderStyle)
        .merge(controller.placeholderStyle);

    final defaultLabelStyle = theme.textTheme.small.copyWith(fontSize: 12);
    final effectiveLabelStyle = defaultLabelStyle.merge(widget.labelStyle);
    final effectiveWidth = widget.width ?? 58;
    final effectivePadding =
        widget.padding ??
        const EdgeInsets.symmetric(horizontal: 12, vertical: 8);

    final effectiveDecoration = ShadDecoration(
      border: ShadBorder.all(
        color: theme.colorScheme.border,
        radius: theme.radius,
      ),
    ).merge(widget.decoration);

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
            enabled: widget.enabled,
            focusNode: widget.focusNode,
            style: effectiveStyle,
            placeholderStyle: effectivePlaceholderStyle,
            controller: controller,
            decoration: effectiveDecoration,
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
            keyboardToolbarBuilder: widget.keyboardToolbarBuilder,
          ),
        ),
      ].separatedBy(SizedBox(height: effectiveGap)),
    );
  }
}

/// {@template ShadTimePickerTextEditingController}
/// Custom [TextEditingController] for [ShadTimePickerField] to handle time
/// input formatting and validation.
/// {@endtemplate}
class ShadTimePickerTextEditingController extends TextEditingController {
  /// Creates a [ShadTimePickerTextEditingController].
  ShadTimePickerTextEditingController({
    super.text,
    this.placeholderStyle,
    this.min = 0,
    this.max = 59,
  });

  /// Creates a [ShadTimePickerTextEditingController] from a [TextEditingValue].
  ShadTimePickerTextEditingController.fromValue(
    TextEditingValue? value, {
    this.placeholderStyle,
    this.min = 0,
    this.max = 59,
  }) : assert(
         value == null ||
             !value.composing.isValid ||
             value.isComposingRangeValid,
         '''
          New TextEditingValue $value has an invalid non-empty composing range
          ${value.composing}. It is recommended to use a valid composing range,
          even for readonly text fields.''',
       ),
       super.fromValue(value ?? TextEditingValue.empty);

  /// {@template ShadTimePickerTextEditingController.placeholderStyle}
  /// The style of the placeholder text.
  /// {@endtemplate}
  final TextStyle? placeholderStyle;

  /// {@template ShadTimePickerTextEditingController.min}
  /// Minimum allowed value for the input field.
  /// {@endtemplate}
  final int min;

  /// {@template ShadTimePickerTextEditingController.max}
  /// Maximum allowed value for the input field.
  /// {@endtemplate}
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

    final intValue = int.tryParse(value.text);
    if (intValue == null) return const TextSpan();

    return TextSpan(
      style: style,
      children: [
        if (value.text.length == 1 && intValue < 10) const TextSpan(text: '0'),
        TextSpan(text: text),
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
