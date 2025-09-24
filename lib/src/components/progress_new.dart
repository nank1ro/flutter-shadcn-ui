import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shadcn_ui/src/theme/theme.dart';

/// A customizable linear progress indicator widget.
///
/// The [ShadProgressNew] widget displays a styled progress bar with
/// configurable colors, height, and border radius. It integrates with
/// [ShadTheme] for consistent styling and uses Container-based implementation
/// instead of Material's LinearProgressIndicator.
class ShadProgressNew extends StatelessWidget {
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

  static const int _kIndeterminateLinearDuration = 1800;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    final effectiveMinHeight =
        minHeight ?? theme.progressTheme.minHeight ?? 16.0;

    final effectiveColor =
        color ?? theme.progressTheme.color ?? theme.colorScheme.primary;

    final effectiveBackgroundColor = backgroundColor ??
        theme.progressTheme.backgroundColor ??
        theme.colorScheme.secondary;

    final effectiveBorderRadius = borderRadius ??
        theme.progressTheme.borderRadius ??
        const BorderRadius.all(Radius.circular(16));

    final effectiveInnerBorderRadius = innerBorderRadius ??
        theme.progressTheme.innerBorderRadius ??
        BorderRadius.zero;

    // Handle valueColor animation
    final currentColor = valueColor?.value ?? effectiveColor;

    return Semantics(
      label: semanticsLabel,
      value: semanticsValue,
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
            child: value != null
                ? _buildDeterminateProgress(
                    value!,
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
    return ClipRect(
      child: Animate(
        effects: const [
          SlideEffect(
            duration: Duration(milliseconds: _kIndeterminateLinearDuration),
            begin: Offset(-0.8, 0),
            end: Offset(1.2, 0),
            // Bar moves for 75% of cycle, matching Material timing
            curve: Interval(0, 0.75, curve: Cubic(0.4, 0, 0.6, 1)),
          ),
        ],
        onPlay: (controller) => controller.repeat(),
        child: FractionallySizedBox(
          widthFactor: 0.6,
          child: Container(
            height: double.infinity,
            decoration: BoxDecoration(
              color: color,
              borderRadius: borderRadius,
            ),
          ),
        ),
      ),
    );
  }
}
