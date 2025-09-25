import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/theme/theme.dart';

/// A customizable linear progress indicator widget.
///
/// The [ShadProgressNew] widget displays a styled progress bar with
/// configurable colors, height, and border radius. It integrates with
/// [ShadTheme] for consistent styling and uses Container-based implementation
/// instead of Material's LinearProgressIndicator.
class ShadProgressNew extends StatefulWidget {
  /// Creates a progress bar widget with the specified properties.
  const ShadProgressNew({
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
  State<ShadProgressNew> createState() => _ShadProgressNewState();
}

class _ShadProgressNewState extends State<ShadProgressNew>
    with SingleTickerProviderStateMixin {
  static const int _kIndeterminateLinearDuration = 1800;

  static const Curve line1HeadCurve = Interval(
    0.0,
    750 / _kIndeterminateLinearDuration,
    curve: Cubic(0.2, 0.0, 0.8, 1.0),
  );

  static const Curve line1TailCurve = Interval(
    333 / _kIndeterminateLinearDuration,
    (333 + 750) / _kIndeterminateLinearDuration,
    curve: Cubic(0.4, 0.0, 1.0, 1.0),
  );

  static const Curve line2HeadCurve = Interval(
    1000 / _kIndeterminateLinearDuration,
    (1000 + 567) / _kIndeterminateLinearDuration,
    curve: Cubic(0.0, 0.0, 0.65, 1.0),
  );

  static const Curve line2TailCurve = Interval(
    1267 / _kIndeterminateLinearDuration,
    (1267 + 533) / _kIndeterminateLinearDuration,
    curve: Cubic(0.10, 0.0, 0.45, 1.0),
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
  void didUpdateWidget(ShadProgressNew oldWidget) {
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
    final effectiveBackgroundColor = widget.backgroundColor ??
        theme.progressTheme.backgroundColor ??
        theme.colorScheme.secondary;
    final effectiveBorderRadius = widget.borderRadius ??
        theme.progressTheme.borderRadius ??
        const BorderRadius.all(Radius.circular(16));
    final effectiveInnerBorderRadius = widget.innerBorderRadius ??
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
                ? _buildDeterminateProgress(
                    widget.value!,
                    currentColor,
                    effectiveInnerBorderRadius,
                  )
                : _buildIndeterminateProgress(
                    currentColor,
                    effectiveInnerBorderRadius,
                  ),
          ),
        ),
      ),
    );
  }

  Widget _buildDeterminateProgress(
    double value,
    Color color,
    BorderRadius borderRadius,
  ) {
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

  Widget _buildIndeterminateProgress(
    Color color,
    BorderRadius borderRadius,
  ) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return AnimatedBuilder(
          animation: _controller!,
          builder: (context, child) {
            final double t = _controller!.value;
            final double containerWidth = constraints.maxWidth;

            final double line1Start =
                containerWidth * line1TailCurve.transform(t);
            final double line1End =
                containerWidth * line1HeadCurve.transform(t);
            double line1Width = line1End - line1Start;
            if (line1Width < 0) line1Width = 0;

            final double line2Start =
                containerWidth * line2TailCurve.transform(t);
            final double line2End =
                containerWidth * line2HeadCurve.transform(t);
            double line2Width = line2End - line2Start;
            if (line2Width < 0) line2Width = 0;

            return Stack(
              children: <Widget>[
                if (line1Width > 0)
                  Positioned(
                    left: line1Start,
                    top: 0,
                    width: line1Width,
                    bottom: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: borderRadius,
                      ),
                    ),
                  ),
                if (line2Width > 0)
                  Positioned(
                    left: line2Start,
                    top: 0,
                    width: line2Width,
                    bottom: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: borderRadius,
                      ),
                    ),
                  ),
              ],
            );
          },
        );
      },
    );
  }
}
