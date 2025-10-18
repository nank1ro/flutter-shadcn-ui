import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/utils/animate.dart';

/// A customizable linear progress indicator widget.
///
/// The [ShadProgress] widget displays a styled progress bar with
/// configurable colors, height, and border radius. It integrates with
/// [ShadTheme] for consistent styling and uses Container-based implementation
/// instead of Material's LinearProgressIndicator.
class ShadProgress extends StatefulWidget {
  /// Creates a progress bar widget with the specified properties.
  const ShadProgress({
    super.key,
    this.value,
    this.backgroundColor,
    this.color,
    this.valueColor,
    this.minHeight,
    this.semanticsLabel,
    this.semanticsValue,
    this.borderRadius,
    this.innerBorderRadius,
  });

  /// {@template ShadProgress.value}
  /// The progress value between 0.0 and 1.0.
  /// If null, displays an indeterminate progress animation.
  /// {@endtemplate}
  final double? value;

  /// {@template ShadProgress.backgroundColor}
  /// The background color of the progress bar.
  /// Defaults to the theme's secondary color if not specified.
  /// {@endtemplate}
  final Color? backgroundColor;

  /// {@template ShadProgress.color}
  /// The color of the progress indicator itself.
  /// Defaults to the theme's primary color if not specified; overridden by
  /// [valueColor] if set.
  /// {@endtemplate}
  final Color? color;

  /// {@template ShadProgress.valueColor}
  /// An animated color value for the progress indicator.
  /// Overrides [color] if provided; defaults to null (uses [color]).
  /// {@endtemplate}
  final Animation<Color?>? valueColor;

  /// {@template ShadProgress.minHeight}
  /// The minimum height of the progress bar.
  /// Defaults to 16 if not specified.
  /// {@endtemplate}
  final double? minHeight;

  /// {@template ShadProgress.semanticsLabel}
  /// The accessibility label for the progress bar.
  /// Provides context to screen readers; defaults to null.
  /// {@endtemplate}
  final String? semanticsLabel;

  /// {@template ShadProgress.semanticsValue}
  /// The accessibility value for the progress bar (e.g., percentage).
  /// Provides current progress to screen readers; defaults to null.
  /// {@endtemplate}
  final String? semanticsValue;

  /// {@template ShadProgress.borderRadius}
  /// The border radius of the progress bar's outer container.
  /// Defaults to a circular radius of 16 if not specified.
  /// {@endtemplate}
  final BorderRadius? borderRadius;

  /// {@template ShadProgress.innerBorderRadius}
  /// The border radius of the progress indicator itself.
  /// Defaults to zero (sharp edges) if not specified.
  /// {@endtemplate}
  final BorderRadius? innerBorderRadius;

  @override
  State<ShadProgress> createState() => _ShadProgressState();
}

class _ShadProgressState extends State<ShadProgress>
    with SingleTickerProviderStateMixin {
  static const int _kIndeterminateLinearDuration = 1800;

  static const Curve line1HeadCurve = Interval(
    0,
    750 / _kIndeterminateLinearDuration,
    curve: Cubic(0.2, 0, 0.8, 1),
  );

  static const Curve line1TailCurve = Interval(
    333 / _kIndeterminateLinearDuration,
    (333 + 750) / _kIndeterminateLinearDuration,
    curve: Cubic(0.4, 0, 1, 1),
  );

  static const Curve line2HeadCurve = Interval(
    1000 / _kIndeterminateLinearDuration,
    (1000 + 567) / _kIndeterminateLinearDuration,
    curve: Cubic(0, 0, 0.65, 1),
  );

  static const Curve line2TailCurve = Interval(
    1267 / _kIndeterminateLinearDuration,
    (1267 + 533) / _kIndeterminateLinearDuration,
    curve: Cubic(0.10, 0, 0.45, 1),
  );

  AnimationController? _controller;

  @override
  void initState() {
    super.initState();
    if (widget.value == null) {
      _controller = AnimationController(
        duration: const Duration(milliseconds: _kIndeterminateLinearDuration),
        vsync: this,
      )..repeat();
    }
    if (widget.valueColor != null) {
      widget.valueColor!.addListener(_handleColorChange);
    }
  }

  @override
  void didUpdateWidget(ShadProgress oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value == null && oldWidget.value != null) {
      _controller = AnimationController(
        duration: const Duration(milliseconds: _kIndeterminateLinearDuration),
        vsync: this,
      )..repeat();
    } else if (widget.value != null && oldWidget.value == null) {
      _controller?.dispose();
      _controller = null;
    }
    if (widget.valueColor != oldWidget.valueColor) {
      oldWidget.valueColor?.removeListener(_handleColorChange);
      widget.valueColor?.addListener(_handleColorChange);
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    widget.valueColor?.removeListener(_handleColorChange);
    super.dispose();
  }

  void _handleColorChange() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final effectiveMinHeight =
        widget.minHeight ?? theme.progressTheme.minHeight ?? 16.0;
    final effectiveColor =
        widget.color ?? theme.progressTheme.color ?? theme.colorScheme.primary;
    final currentColor = widget.valueColor?.value ?? effectiveColor;
    final effectiveBackgroundColor =
        widget.backgroundColor ??
        theme.progressTheme.backgroundColor ??
        theme.colorScheme.secondary;
    final effectiveBorderRadius =
        widget.borderRadius ??
        theme.progressTheme.borderRadius ??
        const BorderRadius.all(Radius.circular(16));
    final effectiveInnerBorderRadius =
        widget.innerBorderRadius ??
        theme.progressTheme.innerBorderRadius ??
        BorderRadius.zero;

    return Semantics(
      label: widget.semanticsLabel,
      value: widget.semanticsValue,
      child: SizedBox(
        width: double.infinity,
        height: effectiveMinHeight,
        child: ClipRRect(
          borderRadius: effectiveBorderRadius,
          child: Container(
            width: double.infinity,
            height: effectiveMinHeight,
            decoration: BoxDecoration(
              color: effectiveBackgroundColor,
              borderRadius: effectiveInnerBorderRadius,
            ),
            child: widget.value != null
                ? ShadDeterminateProgress(
                    value: widget.value!,
                    color: currentColor,
                    borderRadius: effectiveInnerBorderRadius,
                  )
                : ShadIndeterminateProgress(
                    controller: _controller,
                    indeterminateLinearDuration: _kIndeterminateLinearDuration,
                    line1TailCurve: line1TailCurve,
                    line1HeadCurve: line1HeadCurve,
                    line2TailCurve: line2TailCurve,
                    line2HeadCurve: line2HeadCurve,
                    color: currentColor,
                    borderRadius: effectiveInnerBorderRadius,
                  ),
          ),
        ),
      ),
    );
  }
}

/// {@template ShadIndeterminateProgress}
/// A widget that represents the indeterminate state of the progress bar.
/// {@endtemplate}
class ShadIndeterminateProgress extends StatelessWidget {
  /// {@macro ShadIndeterminateProgress}
  const ShadIndeterminateProgress({
    super.key,
    required this.controller,
    required this.indeterminateLinearDuration,
    required this.line1TailCurve,
    required this.line1HeadCurve,
    required this.line2TailCurve,
    required this.line2HeadCurve,
    required this.color,
    required this.borderRadius,
  });

  final AnimationController? controller;
  final int indeterminateLinearDuration;
  final Curve line1TailCurve;
  final Curve line1HeadCurve;
  final Curve line2TailCurve;
  final Curve line2HeadCurve;
  final Color color;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final containerWidth = constraints.maxWidth;
        final bar = Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: borderRadius,
          ),
        );

        return Stack(
          children: [
            ShadAnimate(
              controller: controller,
              onPlay: (controller) => controller.repeat(),
              effects: [
                CustomEffect(
                  duration: Duration(milliseconds: indeterminateLinearDuration),
                  curve: Curves.linear,
                  builder: (context, value, child) {
                    final start =
                        line1TailCurve.transform(value) * containerWidth;
                    final end =
                        line1HeadCurve.transform(value) * containerWidth;
                    final w = (end - start)
                        .clamp(0, double.infinity)
                        .toDouble();
                    if (w <= 0) {
                      return const SizedBox.shrink();
                    }
                    return Positioned(
                      left: start,
                      top: 0,
                      bottom: 0,
                      width: w,
                      child: child,
                    );
                  },
                ),
              ],
              child: bar,
            ),
            ShadAnimate(
              controller: controller,
              onPlay: (controller) => controller.repeat(),
              effects: [
                CustomEffect(
                  duration: Duration(milliseconds: indeterminateLinearDuration),
                  curve: Curves.linear,
                  builder: (context, value, child) {
                    final start =
                        line2TailCurve.transform(value) * containerWidth;
                    final end =
                        line2HeadCurve.transform(value) * containerWidth;
                    final w = (end - start)
                        .clamp(0, double.infinity)
                        .toDouble();
                    if (w <= 0) {
                      return const SizedBox.shrink();
                    }
                    return Positioned(
                      left: start,
                      top: 0,
                      bottom: 0,
                      width: w,
                      child: child,
                    );
                  },
                ),
              ],
              child: bar,
            ),
          ],
        );
      },
    );
  }
}

/// {@template ShadDeterminateProgress}
/// A widget that represents the determinate state of the progress bar.
/// {@endtemplate}
class ShadDeterminateProgress extends StatelessWidget {
  /// {@macro ShadDeterminateProgress}
  const ShadDeterminateProgress({
    super.key,
    required this.value,
    required this.color,
    required this.borderRadius,
  });

  final double value;
  final Color color;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    final clampedValue = value.clamp(0, 1).toDouble();
    return FractionallySizedBox(
      alignment: Alignment.centerLeft,
      widthFactor: clampedValue,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: borderRadius,
        ),
      ),
    );
  }
}
