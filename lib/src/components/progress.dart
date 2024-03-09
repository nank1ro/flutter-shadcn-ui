import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shadcn_ui/src/theme/theme.dart';

const double _progressBorderRadius = 12;
const Duration _linearAnimationDuration = Duration(milliseconds: 660);
const Cubic _linearAnimationCubic = Cubic(0.65, 0, 0.35, 1);

class ShadProgress extends StatelessWidget {
  const ShadProgress({
    super.key,
    this.trackHeight,
    this.value,
    this.activeTrackColor,
    this.inactiveTrackColor,
  }) : assert(value == null || (value >= 0 && value <= 1));

  final double? trackHeight;
  final double? value;
  final Color? activeTrackColor;
  final Color? inactiveTrackColor;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final mTheme = Theme.of(context);

    final effectiveActiveColor = activeTrackColor ??
        theme.sliderTheme.activeTrackColor ??
        theme.colorScheme.primary;

    final effectiveInactiveLinearTrackColor = inactiveTrackColor ??
        theme.sliderTheme.inactiveTrackColor ??
        theme.colorScheme.secondary;

    final effectiveLinearMinHeight =
        trackHeight ?? theme.sliderTheme.trackHeight ?? 8;

    return Theme(
      data: mTheme.copyWith(
        progressIndicatorTheme: mTheme.progressIndicatorTheme.copyWith(
          linearMinHeight: effectiveLinearMinHeight,
          linearTrackColor: effectiveInactiveLinearTrackColor,
          color: effectiveActiveColor,
        ),
      ),
      child: CustomLinearProgressIndicator(
        value: value,
        borderRadius: const BorderRadius.all(
          Radius.circular(_progressBorderRadius),
        ),
      ),
    );
  }
}

class CustomLinearProgressIndicator extends ProgressIndicator {
  const CustomLinearProgressIndicator({
    super.key,
    super.value,
    super.backgroundColor,
    super.color,
    super.valueColor,
    this.minHeight,
    super.semanticsLabel,
    super.semanticsValue,
    this.borderRadius = BorderRadius.zero,
  }) : assert(minHeight == null || minHeight > 0);

  final double? minHeight;

  final BorderRadiusGeometry borderRadius;

  @override
  State<CustomLinearProgressIndicator> createState() =>
      _LinearProgressIndicatorState();
}

class _LinearProgressIndicatorState extends State<CustomLinearProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: _linearAnimationDuration,
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: _linearAnimationCubic,
      reverseCurve: _linearAnimationCubic,
    );

    if (widget.value != null) {
      _controller.animateTo(widget.value!);
    }
  }

  @override
  void didUpdateWidget(CustomLinearProgressIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != null && widget.value! <= 1) {
      _controller.animateTo(widget.value!);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textDirection = Directionality.of(context);

    final defaults = _LinearProgressIndicatorDefaultsM3(context);

    final indicatorTheme = ProgressIndicatorTheme.of(context);

    final trackColor = widget.backgroundColor ??
        indicatorTheme.linearTrackColor ??
        defaults.linearTrackColor;

    final minHeight = widget.minHeight ??
        indicatorTheme.linearMinHeight ??
        defaults.linearMinHeight;

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        final expandedSemanticsValue = '${(widget.value! * 100).round()}%';
        return Semantics(
          label: widget.semanticsLabel,
          value: expandedSemanticsValue,
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: trackColor,
              shape: RoundedRectangleBorder(borderRadius: widget.borderRadius),
            ),
            constraints: BoxConstraints(
              minWidth: double.infinity,
              minHeight: minHeight,
            ),
            child: CustomPaint(
              painter: _LinearProgressIndicatorPainter(
                endValue: widget.value!,
                backgroundColor: trackColor,
                valueColor:
                    _getValueColor(context, defaultColor: defaults.color),
                animationValue: _animation.value,
                textDirection: textDirection,
                indicatorBorderRadius: BorderRadiusDirectional.horizontal(
                  start: const Radius.circular(_progressBorderRadius),
                  end: _controller.value == 1.0
                      ? const Radius.circular(_progressBorderRadius)
                      : Radius.zero,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Color _getValueColor(BuildContext context, {Color? defaultColor}) {
    return widget.valueColor?.value ??
        widget.color ??
        ProgressIndicatorTheme.of(context).color ??
        defaultColor ??
        Theme.of(context).colorScheme.primary;
  }
}

class _LinearProgressIndicatorPainter extends CustomPainter {
  const _LinearProgressIndicatorPainter({
    required this.backgroundColor,
    required this.valueColor,
    required this.animationValue,
    required this.textDirection,
    required this.indicatorBorderRadius,
    required this.endValue,
  });
  final double endValue;
  final Color backgroundColor;
  final Color valueColor;
  final double animationValue;
  final TextDirection textDirection;
  final BorderRadiusGeometry indicatorBorderRadius;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = valueColor
      ..style = PaintingStyle.fill;

    final barWidth = clampDouble(animationValue, 0, endValue) * size.width;

    if (barWidth <= 0.0) {
      return;
    }

    final double left;
    switch (textDirection) {
      case TextDirection.rtl:
        left = size.width - barWidth;
      case TextDirection.ltr:
        left = 0;
    }

    final rect = Offset(left, 0) & Size(barWidth, size.height);
    final rrect = indicatorBorderRadius.resolve(textDirection).toRRect(rect);

    canvas.drawRRect(rrect, paint);
  }

  @override
  bool shouldRepaint(_LinearProgressIndicatorPainter oldPainter) {
    return oldPainter.backgroundColor != backgroundColor ||
        oldPainter.valueColor != valueColor ||
        oldPainter.animationValue != animationValue ||
        oldPainter.textDirection != textDirection ||
        oldPainter.indicatorBorderRadius != indicatorBorderRadius;
  }
}

class _LinearProgressIndicatorDefaultsM3 extends ProgressIndicatorThemeData {
  _LinearProgressIndicatorDefaultsM3(this.context);

  final BuildContext context;
  late final ColorScheme _colors = Theme.of(context).colorScheme;

  @override
  Color get color => _colors.primary;

  @override
  Color get linearTrackColor => _colors.surfaceVariant;

  @override
  double get linearMinHeight => 4;
}
