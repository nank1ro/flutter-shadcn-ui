import 'package:flutter/material.dart';

import 'package:shadcn_ui/src/theme/theme.dart';

class ShadSliderController extends ValueNotifier<double> {
  ShadSliderController({
    required double initialValue,
  }) : super(initialValue);
}

class ShadSlider extends StatefulWidget {
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

  final double? initialValue;
  final ValueChanged<double>? onChanged;
  final bool enabled;
  final double? min;
  final double? max;
  final FocusNode? focusNode;
  final bool autofocus;
  final MouseCursor? mouseCursor;
  final MouseCursor? disabledMouseCursor;
  final Color? thumbColor;
  final Color? disabledThumbColor;
  final Color? thumbBorderColor;
  final Color? disabledThumbBorderColor;
  final Color? activeTrackColor;
  final Color? inactiveTrackColor;
  final Color? disabledActiveTrackColor;
  final Color? disabledInactiveTrackColor;
  final double? trackHeight;
  final double? thumbRadius;
  final ValueChanged<double>? onChangeStart;
  final ValueChanged<double>? onChangeEnd;
  final int? divisions;
  final String? label;
  final SemanticFormatterCallback? semanticFormatterCallback;
  final SliderInteraction? allowedInteraction;
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
  void initState() {
    super.initState();
    controller.addListener(onChanged);
  }

  @override
  void dispose() {
    controller.removeListener(onChanged);
    // dispose the internal controller
    if (widget.controller == null) {
      controller.dispose();
    }
    super.dispose();
  }

  void onChanged() {
    widget.onChanged?.call(controller.value);
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
        theme.colorScheme.primary.withOpacity(.5);

    final effectiveActiveTrackColor = widget.activeTrackColor ??
        theme.sliderTheme.activeTrackColor ??
        theme.colorScheme.primary;

    final effectiveInactiveTrackColor = widget.inactiveTrackColor ??
        theme.sliderTheme.inactiveTrackColor ??
        theme.colorScheme.secondary;

    final effectiveDisabledActiveTrackColor = widget.disabledActiveTrackColor ??
        theme.sliderTheme.disabledActiveTrackColor ??
        theme.colorScheme.primary.withOpacity(.5);

    final effectiveDisabledInactiveTrackColor =
        widget.disabledInactiveTrackColor ??
            theme.sliderTheme.disabledInactiveTrackColor ??
            theme.colorScheme.secondary.withOpacity(.5);

    final effectiveTrackHeight =
        widget.trackHeight ?? theme.sliderTheme.trackHeight ?? 8;

    final effectiveThumbRadius =
        widget.thumbRadius ?? theme.sliderTheme.thumbRadius ?? 10.0;

    return Theme(
      data: mTheme.copyWith(
        sliderTheme: mTheme.sliderTheme.copyWith(
          trackHeight: effectiveTrackHeight,
          thumbShape: ShadSliderThumbShape(
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
            onChanged: widget.enabled ? (v) => controller.value = v : null,
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
  }
}

class ShadSliderThumbShape extends SliderComponentShape {
  const ShadSliderThumbShape({
    required this.radius,
    required this.borderColor,
    required this.disabledBorderColor,
    required this.thumbColor,
    required this.disabledThumbColor,
  });

  final double radius;
  final Color borderColor;
  final Color disabledBorderColor;
  final Color thumbColor;
  final Color disabledThumbColor;

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
      radius,
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
  }
}
