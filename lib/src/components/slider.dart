import 'package:flutter/material.dart';
import 'package:shadcn_ui/src/raw_components/focusable.dart';

import 'package:shadcn_ui/src/theme/theme.dart';

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
  final SemanticFormatterCallback? semanticFormatterCallback;

  /// {@template ShadSlider.allowedInteraction}
  /// Configures how the user can interact with the slider.
  ///
  /// Defaults to `SliderInteraction.continuous`.
  /// {@endtemplate}
  final SliderInteraction? allowedInteraction;

  /// {@macro ShadSliderController}
  final ShadSliderController? controller;

  @override
  State<ShadSlider> createState() => _ShadSliderState();
}

class _ShadSliderState extends State<ShadSlider> {
  late final controller = widget.controller ??
      ShadSliderController(
        initialValue: widget.initialValue!,
      );

  @override
  void dispose() {
    // dispose the internal controller
    if (widget.controller == null) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final mTheme = Theme.of(context);

    final effectiveMouseCursor = widget.mouseCursor ??
        theme.sliderTheme.mouseCursor ??
        SystemMouseCursors.click;
    final effectiveDisabledMouseCursor = widget.disabledMouseCursor ??
        theme.sliderTheme.disabledMouseCursor ??
        SystemMouseCursors.forbidden;

    final effectiveMin = widget.min ?? theme.sliderTheme.min ?? 0;
    final effectiveMax = widget.max ?? theme.sliderTheme.max ?? 1;

    final effectiveThumbColor = widget.thumbColor ??
        theme.sliderTheme.thumbColor ??
        theme.colorScheme.background;

    final effectiveThumbBorderColor = widget.thumbBorderColor ??
        theme.sliderTheme.thumbBorderColor ??
        theme.colorScheme.primary;

    final effectiveDisabledThumbColor = widget.disabledThumbColor ??
        theme.sliderTheme.disabledThumbColor ??
        theme.colorScheme.background;

    final effectiveDisabledThumbBorderColor = widget.disabledThumbBorderColor ??
        theme.sliderTheme.disabledThumbBorderColor ??
        theme.colorScheme.primary.withValues(alpha: .5);

    final effectiveActiveTrackColor = widget.activeTrackColor ??
        theme.sliderTheme.activeTrackColor ??
        theme.colorScheme.primary;

    final effectiveInactiveTrackColor = widget.inactiveTrackColor ??
        theme.sliderTheme.inactiveTrackColor ??
        theme.colorScheme.secondary;

    final effectiveDisabledActiveTrackColor = widget.disabledActiveTrackColor ??
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

    return ShadFocusable(
      skipTraversal: true,
      builder: (context, focused, child) {
        return Theme(
          data: mTheme.copyWith(
            sliderTheme: mTheme.sliderTheme.copyWith(
              trackHeight: effectiveTrackHeight,
              thumbShape: ShadSliderThumbShape(
                focused: focused,
                radius: effectiveThumbRadius,
                borderColor: effectiveThumbBorderColor,
                disabledBorderColor: effectiveDisabledThumbBorderColor,
                thumbColor: effectiveThumbColor,
                disabledThumbColor: effectiveDisabledThumbColor,
              ),
              overlayShape: SliderComponentShape.noOverlay,
              activeTrackColor: effectiveActiveTrackColor,
              disabledActiveTrackColor: effectiveDisabledActiveTrackColor,
              inactiveTrackColor: effectiveInactiveTrackColor,
              disabledInactiveTrackColor: effectiveDisabledInactiveTrackColor,
              disabledThumbColor: effectiveDisabledThumbColor,
            ),
          ),
          child: ValueListenableBuilder(
            valueListenable: controller,
            builder: (context, value, child) {
              return Slider(
                value: value,
                min: effectiveMin,
                max: effectiveMax,
                mouseCursor: widget.enabled
                    ? effectiveMouseCursor
                    : effectiveDisabledMouseCursor,
                onChanged: widget.enabled
                    ? (v) {
                        controller.value = v;
                        widget.onChanged?.call(v);
                      }
                    : null,
                autofocus: widget.autofocus,
                focusNode: widget.focusNode,
                onChangeStart: widget.onChangeStart,
                onChangeEnd: widget.onChangeEnd,
                divisions: widget.divisions,
                label: widget.label,
                semanticFormatterCallback: widget.semanticFormatterCallback,
                allowedInteraction: widget.allowedInteraction,
              );
            },
          ),
        );
      },
    );
  }
}

/// {@template ShadSliderThumbShape}
/// Custom thumb shape for the [ShadSlider] to match the Shadcn UI style.
///
/// Defines how the slider thumb is painted, including border and focus states.
/// {@endtemplate}
class ShadSliderThumbShape extends SliderComponentShape {
  /// {@macro ShadSliderThumbShape}
  const ShadSliderThumbShape({
    required this.radius,
    required this.borderColor,
    required this.disabledBorderColor,
    required this.thumbColor,
    required this.disabledThumbColor,
    required this.focused,
  });

  /// {@template ShadSliderThumbShape.radius}
  /// The radius of the thumb.
  /// {@endtemplate}
  final double radius;

  /// {@template ShadSliderThumbShape.borderColor}
  /// The border color of the thumb when enabled and not focused.
  /// {@endtemplate}
  final Color borderColor;

  /// {@template ShadSliderThumbShape.disabledBorderColor}
  /// The border color of the thumb when disabled.
  /// {@endtemplate}
  final Color disabledBorderColor;

  /// {@template ShadSliderThumbShape.thumbColor}
  /// The fill color of the thumb when enabled.
  /// {@endtemplate}
  final Color thumbColor;

  /// {@template ShadSliderThumbShape.disabledThumbColor}
  /// The fill color of the thumb when disabled.
  /// {@endtemplate}
  final Color disabledThumbColor;

  /// {@template ShadSliderThumbShape.focused}
  /// Whether the slider is currently focused.
  /// {@endtemplate}
  final bool focused;

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(radius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final canvas = context.canvas;

    final colorTween = ColorTween(
      begin: disabledThumbColor,
      end: thumbColor,
    );

    final color = colorTween.evaluate(enableAnimation)!;

    canvas.drawCircle(
      center,
      radius + (focused ? 4 : 0),
      Paint()..color = color,
    );

    final borderColorTween = ColorTween(
      begin: disabledBorderColor,
      end: borderColor,
    );

    final effectiveBorderColor = borderColorTween.evaluate(enableAnimation)!;

    final paintBorder = Paint()
      ..color = effectiveBorderColor
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(center, radius, paintBorder);

    if (focused) {
      final paintFocus = Paint()
        ..color = borderColor
        ..strokeWidth = 2
        ..style = PaintingStyle.stroke;

      canvas.drawCircle(center, radius + 4, paintFocus);
    }
  }
}
