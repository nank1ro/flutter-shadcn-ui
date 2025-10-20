import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/raw_components/focusable.dart';

import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/utils/gesture_detector.dart';

/// Possible ways for a user to interact with a [ShadSlider].
enum ShadSliderInteraction {
  /// Allows the user to interact with a [ShadSlider] by tapping or sliding
  /// anywhere on the track.
  ///
  /// Essentially all possible interactions are allowed.
  ///
  /// This is different from [ShadSliderInteraction.slideOnly] as when you try
  /// to slide anywhere other than the thumb, the thumb will move to the first
  /// point of contact.
  tapAndSlide,

  /// Allows the user to interact with a [ShadSlider] by only tapping anywhere
  /// on the track.
  ///
  /// Sliding interaction is ignored.
  tapOnly,

  /// Allows the user to interact with a [ShadSlider] only by sliding anywhere
  /// on the track.
  ///
  /// Tapping interaction is ignored.
  slideOnly,

  /// Allows the user to interact with a [ShadSlider] only by sliding the thumb.
  ///
  /// Tapping and sliding interactions on the track are ignored.
  slideThumb,
}

/// {@template ShadSliderController}
/// A controller for the [ShadSlider] widget, managing its value.
///
/// Extends [ValueNotifier] to provide reactive updates when the slider value
/// changes.
/// {@endtemplate}
class ShadSliderController extends ValueNotifier<double> {
  /// Creates a [ShadSliderController] with an initial value.
  ShadSliderController({
    required double initialValue,
  }) : super(initialValue);
}

/// A customizable slider widget styled to match the Shadcn UI design system.
///
/// Allows users to select a value from a continuous range by dragging a thumb
/// along a track.
class ShadSlider extends StatefulWidget {
  /// Creates a [ShadSlider].
  ///
  /// Either [initialValue] or [controller] must be provided to determine the
  /// slider's starting value.
  const ShadSlider({
    super.key,
    this.initialValue,
    this.onChanged,
    this.enabled = true,
    this.min,
    this.max,
    this.focusNode,
    this.autofocus = false,
    this.mouseCursor,
    this.disabledMouseCursor,
    this.thumbColor,
    this.disabledThumbColor,
    this.thumbBorderColor,
    this.disabledThumbBorderColor,
    this.activeTrackColor,
    this.inactiveTrackColor,
    this.disabledActiveTrackColor,
    this.disabledInactiveTrackColor,
    this.trackHeight,
    this.thumbRadius,
    this.onChangeStart,
    this.onChangeEnd,
    this.divisions,
    this.label,
    this.semanticFormatterCallback,
    this.allowedInteraction,
    this.controller,
  }) : assert(
         (initialValue != null) ^ (controller != null),
         'Either initialValue or controller must be specified',
       );

  /// {@template ShadSlider.initialValue}
  /// The initial value of the slider.
  ///
  /// This value is used only when [controller] is null.
  /// {@endtemplate}
  final double? initialValue;

  /// {@template ShadSlider.onChanged}
  /// Callback that is called when the slider value changes.
  ///
  /// Provides the new value as an argument.
  /// {@endtemplate}
  final ValueChanged<double>? onChanged;

  /// {@template ShadSlider.enabled}
  /// Whether the slider is enabled.
  ///
  /// When disabled, the slider cannot be interacted with and visually appears
  /// disabled. Defaults to true.
  /// {@endtemplate}
  final bool enabled;

  /// {@template ShadSlider.min}
  /// The minimum value the slider can take.
  ///
  /// Defaults to 0.0.
  /// {@endtemplate}
  final double? min;

  /// {@template ShadSlider.max}
  /// The maximum value the slider can take.
  ///
  /// Defaults to 1.0.
  /// {@endtemplate}
  final double? max;

  /// {@template ShadSlider.focusNode}
  /// The focus node to control the focus state of the slider.
  ///
  /// If null, a default [FocusNode] will be created internally.
  /// {@endtemplate}
  final FocusNode? focusNode;

  /// {@template ShadSlider.autofocus}
  /// Whether the slider should automatically focus when it is first built.
  ///
  /// Defaults to false.
  /// {@endtemplate}
  final bool autofocus;

  /// {@template ShadSlider.mouseCursor}
  /// The cursor for the slider when it is enabled.
  ///
  /// Defaults to [SystemMouseCursors.click].
  /// {@endtemplate}
  final MouseCursor? mouseCursor;

  /// {@template ShadSlider.disabledMouseCursor}
  /// The cursor for the slider when it is disabled.
  ///
  /// Defaults to [SystemMouseCursors.forbidden].
  /// {@endtemplate}
  final MouseCursor? disabledMouseCursor;

  /// {@template ShadSlider.thumbColor}
  /// The color of the slider thumb when enabled.
  ///
  /// Defaults to the theme's background color.
  /// {@endtemplate}
  final Color? thumbColor;

  /// {@template ShadSlider.disabledThumbColor}
  /// The color of the slider thumb when disabled.
  ///
  /// Defaults to the theme's background color.
  /// {@endtemplate}
  final Color? disabledThumbColor;

  /// {@template ShadSlider.thumbBorderColor}
  /// The border color of the slider thumb when enabled.
  ///
  /// Defaults to the theme's primary color.
  /// {@endtemplate}
  final Color? thumbBorderColor;

  /// {@template ShadSlider.disabledThumbBorderColor}
  /// The border color of the slider thumb when disabled.
  ///
  /// Defaults to a semi-transparent version of the theme's primary color.
  /// {@endtemplate}
  final Color? disabledThumbBorderColor;

  /// {@template ShadSlider.activeTrackColor}
  /// The color of the active portion of the slider track.
  ///
  /// Defaults to the theme's primary color.
  /// {@endtemplate}
  final Color? activeTrackColor;

  /// {@template ShadSlider.inactiveTrackColor}
  /// The color of the inactive portion of the slider track.
  ///
  /// Defaults to the theme's secondary color.
  /// {@endtemplate}
  final Color? inactiveTrackColor;

  /// {@template ShadSlider.disabledActiveTrackColor}
  /// The color of the active track when the slider is disabled.
  ///
  /// Defaults to a semi-transparent version of the theme's primary color.
  /// {@endtemplate}
  final Color? disabledActiveTrackColor;

  /// {@template ShadSlider.disabledInactiveTrackColor}
  /// The color of the inactive track when the slider is disabled.
  ///
  /// Defaults to a semi-transparent version of the theme's secondary color.
  /// {@endtemplate}
  final Color? disabledInactiveTrackColor;

  /// {@template ShadSlider.trackHeight}
  /// The height of the slider track.
  ///
  /// Defaults to 8.0.
  /// {@endtemplate}
  final double? trackHeight;

  /// {@template ShadSlider.thumbRadius}
  /// The radius of the slider thumb.
  ///
  /// Defaults to 10.0.
  /// {@endtemplate}
  final double? thumbRadius;

  /// {@template ShadSlider.onChangeStart}
  /// Callback that is called when the user starts to change the slider value.
  ///
  /// Provides the starting value as an argument.
  /// {@endtemplate}
  final ValueChanged<double>? onChangeStart;

  /// {@template ShadSlider.onChangeEnd}
  /// Callback that is called when the user finishes changing the slider value.
  ///
  /// Provides the ending value as an argument.
  /// {@endtemplate}
  final ValueChanged<double>? onChangeEnd;

  /// {@template ShadSlider.divisions}
  /// The number of discrete divisions the slider has.
  ///
  /// When provided, the slider will snap to these divisions.
  /// {@endtemplate}
  final int? divisions;

  /// {@template ShadSlider.label}
  /// A label to display above the slider when the thumb is pressed.
  /// {@endtemplate}
  final String? label;

  /// {@template ShadSlider.semanticFormatterCallback}
  /// A semantic formatter to be called by assistive technologies.
  /// {@endtemplate}
  final String Function(double value)? semanticFormatterCallback;

  /// {@template ShadSlider.allowedInteraction}
  /// Configures how the user can interact with the slider.
  ///
  /// Defaults to `ShadSliderInteraction.tapAndSlide`.
  /// {@endtemplate}
  final ShadSliderInteraction? allowedInteraction;

  /// {@macro ShadSliderController}
  final ShadSliderController? controller;

  @override
  State<ShadSlider> createState() => _ShadSliderState();
}

class _ShadSliderState extends State<ShadSlider> {
  late final controller =
      widget.controller ??
      ShadSliderController(
        initialValue: widget.initialValue!,
      );

  FocusNode? _focusNode;
  FocusNode get focusNode => widget.focusNode ?? (_focusNode ??= FocusNode());

  @override
  void didUpdateWidget(covariant ShadSlider oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller) {
      // Dispose the old controller if it was internally created
      if (oldWidget.controller == null) {
        oldWidget.controller?.dispose();
      }
      // Initialize the new controller if it's null
      if (widget.controller == null) {
        controller.value = widget.initialValue!;
      }
    }

    if (oldWidget.focusNode != widget.focusNode) {
      // Dispose the old focus node if it was internally created
      if (oldWidget.focusNode == null) {
        _focusNode?.dispose();
        _focusNode = null;
      }
      // Initialize the new focus node if it's null
      if (widget.focusNode == null && _focusNode == null) {
        _focusNode = FocusNode();
      }
    }
  }

  @override
  void dispose() {
    _focusNode?.dispose();
    // dispose the internal controller
    if (widget.controller == null) {
      controller.dispose();
    }
    super.dispose();
  }

  void _updateSliderValue(double newValue) {
    final effectiveMin = widget.min ?? 0;
    final effectiveMax = widget.max ?? 1;
    var clampedValue = newValue.clamp(effectiveMin, effectiveMax);

    if (widget.divisions != null) {
      final step = (effectiveMax - effectiveMin) / widget.divisions!;
      clampedValue =
          ((clampedValue - effectiveMin) / step).round() * step + effectiveMin;
    }

    if (clampedValue != controller.value) {
      controller.value = clampedValue;
      widget.onChanged?.call(clampedValue);
    }
  }

  void _handleTrackTap(Offset localPosition, BoxConstraints constraints) {
    final effectiveMin = widget.min ?? 0;
    final effectiveMax = widget.max ?? 1;
    final newValue =
        effectiveMin +
        (localPosition.dx / constraints.maxWidth) *
            (effectiveMax - effectiveMin);
    _updateSliderValue(newValue);
  }

  void _handleTrackPan(Offset localPosition, BoxConstraints constraints) {
    final effectiveMin = widget.min ?? 0;
    final effectiveMax = widget.max ?? 1;
    final newValue =
        effectiveMin +
        (localPosition.dx / constraints.maxWidth) *
            (effectiveMax - effectiveMin);
    _updateSliderValue(newValue);
  }

  bool _handleKeyEvent(KeyEvent event) {
    if (!widget.enabled ||
        (event is! KeyDownEvent && event is! KeyRepeatEvent)) {
      return false;
    }

    final effectiveMin = widget.min ?? 0;
    final effectiveMax = widget.max ?? 1;
    final range = effectiveMax - effectiveMin;

    double increment;
    if (widget.divisions != null && widget.divisions! > 0) {
      increment = range / widget.divisions!;
    } else {
      increment = range * 0.01; // 1% of range for smooth movement
    }

    var newValue = controller.value;

    if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
      newValue -= increment;
    } else if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
      newValue += increment;
    } else {
      return false;
    }

    _updateSliderValue(newValue);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    final effectiveMouseCursor =
        widget.mouseCursor ??
        theme.sliderTheme.mouseCursor ??
        SystemMouseCursors.click;
    final effectiveDisabledMouseCursor =
        widget.disabledMouseCursor ??
        theme.sliderTheme.disabledMouseCursor ??
        SystemMouseCursors.forbidden;

    final effectiveMin = widget.min ?? theme.sliderTheme.min ?? 0;
    final effectiveMax = widget.max ?? theme.sliderTheme.max ?? 1;

    final effectiveThumbColor =
        widget.thumbColor ??
        theme.sliderTheme.thumbColor ??
        theme.colorScheme.background;

    final effectiveThumbBorderColor =
        widget.thumbBorderColor ??
        theme.sliderTheme.thumbBorderColor ??
        theme.colorScheme.primary;

    final effectiveDisabledThumbColor =
        widget.disabledThumbColor ??
        theme.sliderTheme.disabledThumbColor ??
        theme.colorScheme.background;

    final effectiveDisabledThumbBorderColor =
        widget.disabledThumbBorderColor ??
        theme.sliderTheme.disabledThumbBorderColor ??
        theme.colorScheme.primary.withValues(alpha: .5);

    final effectiveActiveTrackColor =
        widget.activeTrackColor ??
        theme.sliderTheme.activeTrackColor ??
        theme.colorScheme.primary;

    final effectiveInactiveTrackColor =
        widget.inactiveTrackColor ??
        theme.sliderTheme.inactiveTrackColor ??
        theme.colorScheme.secondary;

    final effectiveDisabledActiveTrackColor =
        widget.disabledActiveTrackColor ??
        theme.sliderTheme.disabledActiveTrackColor ??
        theme.colorScheme.primary.withValues(alpha: .5);

    final effectiveDisabledInactiveTrackColor =
        widget.disabledInactiveTrackColor ??
        theme.sliderTheme.disabledInactiveTrackColor ??
        theme.colorScheme.secondary.withValues(alpha: .5);

    final effectiveTrackHeight =
        widget.trackHeight ?? theme.sliderTheme.trackHeight ?? 8;

    final effectiveThumbRadius =
        widget.thumbRadius ?? theme.sliderTheme.thumbRadius ?? 10.0;

    final effectiveAllowedInteraction =
        widget.allowedInteraction ?? ShadSliderInteraction.tapAndSlide;

    // Focus ring configuration
    const focusRingBorderWidth = 2.0;
    const focusRingPadding = 2.0;
    const thumbBorderWidth = 2.0;

    // Division marks configuration
    const divisionMarkWidth = 2.0;
    const divisionMarkHeight = 6.0;
    const divisionMarkOffset = 1.0;
    const divisionMarkBorderRadius = 1.0;

    // Track border radius
    const activeTrackBorderRadius = 8.0;

    // Calculate total additional space needed when focused
    const focusRingTotalSpace = (focusRingBorderWidth + focusRingPadding) * 2;

    return ShadFocusable(
      canRequestFocus: widget.enabled,
      focusNode: focusNode,
      onKeyEvent: (node, event) {
        return _handleKeyEvent(event)
            ? KeyEventResult.handled
            : KeyEventResult.ignored;
      },
      builder: (context, focused, child) {
        return ValueListenableBuilder(
          valueListenable: controller,
          builder: (context, value, child) {
            return LayoutBuilder(
              builder: (context, constraints) {
                assert(
                  constraints.hasBoundedWidth,
                  'ShadSlider requires a bounded width',
                );
                // Calculate the effective width available for the track
                final effectiveTrackWidth = constraints.maxWidth;
                return Stack(
                  clipBehavior: Clip.none,
                  children: [
                    // Track with gesture handling based on interaction mode
                    ShadGestureDetector(
                      cursor: widget.enabled
                          ? effectiveMouseCursor
                          : effectiveDisabledMouseCursor,
                      onTapDown:
                          widget.enabled &&
                              (effectiveAllowedInteraction ==
                                      ShadSliderInteraction.tapAndSlide ||
                                  effectiveAllowedInteraction ==
                                      ShadSliderInteraction.tapOnly)
                          ? (details) {
                              final box =
                                  context.findRenderObject()! as RenderBox;
                              final localPosition = box.globalToLocal(
                                details.globalPosition,
                              );
                              _handleTrackTap(localPosition, constraints);
                            }
                          : null,
                      onPanUpdate:
                          widget.enabled &&
                              (effectiveAllowedInteraction ==
                                      ShadSliderInteraction.tapAndSlide ||
                                  effectiveAllowedInteraction ==
                                      ShadSliderInteraction.slideOnly)
                          ? (details) {
                              final box =
                                  context.findRenderObject()! as RenderBox;
                              final localPosition = box.globalToLocal(
                                details.globalPosition,
                              );
                              _handleTrackPan(localPosition, constraints);
                            }
                          : null,
                      onPanStart: widget.enabled
                          ? (details) =>
                                widget.onChangeStart?.call(controller.value)
                          : null,
                      onPanEnd: widget.enabled
                          ? (details) =>
                                widget.onChangeEnd?.call(controller.value)
                          : null,
                      child: Stack(
                        children: [
                          // whole track
                          SizedBox(
                            width: effectiveTrackWidth,
                            height: effectiveTrackHeight,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: theme.radius,
                                color: widget.enabled
                                    ? effectiveInactiveTrackColor
                                    : effectiveDisabledInactiveTrackColor,
                              ),
                            ),
                          ),
                          // active track
                          SizedBox(
                            width:
                                effectiveTrackWidth *
                                ((effectiveMax - effectiveMin) == 0
                                        ? 0.0
                                        : ((value - effectiveMin) /
                                              (effectiveMax - effectiveMin)))
                                    .clamp(0.0, 1.0),
                            height: effectiveTrackHeight,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(
                                    activeTrackBorderRadius,
                                  ),
                                  bottomLeft: Radius.circular(
                                    activeTrackBorderRadius,
                                  ),
                                ),
                                color: widget.enabled
                                    ? effectiveActiveTrackColor
                                    : effectiveDisabledActiveTrackColor,
                              ),
                            ),
                          ),
                          // division marks
                          if (widget.divisions != null && widget.divisions! > 0)
                            ...List.generate(widget.divisions! + 1, (index) {
                              final position = index / widget.divisions!;
                              return Positioned(
                                left:
                                    position * effectiveTrackWidth -
                                    divisionMarkOffset,
                                top:
                                    (effectiveTrackHeight -
                                        divisionMarkHeight) /
                                    2,
                                child: Container(
                                  width: divisionMarkWidth,
                                  height: divisionMarkHeight,
                                  decoration: BoxDecoration(
                                    color: widget.enabled
                                        ? theme.colorScheme.border
                                        : theme.colorScheme.border.withValues(
                                            alpha: 0.5,
                                          ),
                                    borderRadius: BorderRadius.circular(
                                      divisionMarkBorderRadius,
                                    ),
                                  ),
                                ),
                              );
                            }),
                        ],
                      ),
                    ),
                    // thumb
                    Positioned(
                      left:
                          (((effectiveMax - effectiveMin) == 0
                                      ? 0.0
                                      : ((value - effectiveMin) /
                                                (effectiveMax - effectiveMin)) *
                                            constraints.maxWidth) -
                                  effectiveThumbRadius -
                                  (focused ? focusRingTotalSpace / 2 : 0))
                              .clamp(
                                -(effectiveThumbRadius +
                                    (focused ? focusRingTotalSpace / 2 : 0)),
                                constraints.maxWidth -
                                    effectiveThumbRadius -
                                    (focused ? focusRingTotalSpace / 2 : 0),
                              ),
                      top:
                          (effectiveTrackHeight - effectiveThumbRadius * 2) /
                              2 -
                          (focused ? focusRingTotalSpace / 2 : 0),
                      child: Semantics(
                        slider: true,
                        value:
                            widget.semanticFormatterCallback?.call(value) ??
                            value.toString(),
                        child: SizedBox(
                          width:
                              effectiveThumbRadius * 2 +
                              (focused ? focusRingTotalSpace : 0),
                          height:
                              effectiveThumbRadius * 2 +
                              (focused ? focusRingTotalSpace : 0),
                          child: ShadGestureDetector(
                            cursor: widget.enabled
                                ? effectiveMouseCursor
                                : effectiveDisabledMouseCursor,
                            onPanUpdate:
                                widget.enabled &&
                                    (effectiveAllowedInteraction ==
                                            ShadSliderInteraction.tapAndSlide ||
                                        effectiveAllowedInteraction ==
                                            ShadSliderInteraction.slideOnly ||
                                        effectiveAllowedInteraction ==
                                            ShadSliderInteraction.slideThumb)
                                ? (details) {
                                    final box =
                                        context.findRenderObject()!
                                            as RenderBox;
                                    final localPosition = box.globalToLocal(
                                      details.globalPosition,
                                    );
                                    _handleTrackPan(localPosition, constraints);
                                  }
                                : null,
                            onPanStart: widget.enabled
                                ? (details) => widget.onChangeStart?.call(
                                    controller.value,
                                  )
                                : null,
                            onPanEnd: widget.enabled
                                ? (details) =>
                                      widget.onChangeEnd?.call(controller.value)
                                : null,
                            child: focused
                                ? Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: widget.enabled
                                          ? effectiveThumbColor
                                          : effectiveDisabledThumbColor,
                                      border: Border.all(
                                        color: theme.colorScheme.ring,
                                        width: focusRingBorderWidth,
                                      ),
                                    ),
                                    child: Container(
                                      margin: const EdgeInsets.all(
                                        focusRingPadding,
                                      ),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: widget.enabled
                                            ? effectiveThumbColor
                                            : effectiveDisabledThumbColor,
                                        border: Border.all(
                                          color: widget.enabled
                                              ? effectiveThumbBorderColor
                                              // ignore: lines_longer_than_80_chars
                                              : effectiveDisabledThumbBorderColor,
                                          width: thumbBorderWidth,
                                        ),
                                      ),
                                    ),
                                  )
                                : Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: widget.enabled
                                          ? effectiveThumbColor
                                          : effectiveDisabledThumbColor,
                                      border: Border.all(
                                        color: widget.enabled
                                            ? effectiveThumbBorderColor
                                            : effectiveDisabledThumbBorderColor,
                                        width: thumbBorderWidth,
                                      ),
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          },
        );
      },
    );
  }
}
