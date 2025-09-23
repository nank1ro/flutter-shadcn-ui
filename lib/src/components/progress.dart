import 'package:flutter/material.dart';
import 'package:shadcn_ui/src/theme/theme.dart';

/// A customizable linear progress indicator widget.
///
/// The [ShadProgress] widget displays a styled progress bar with configurable
/// colors, height, and border radius. It integrates with [ShadTheme] for
/// consistent styling and wraps LinearProgressIndicator with additional
/// customization options.
class ShadProgress extends StatelessWidget {
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
  /// Defaults to the theme’s secondary color if not specified.
  /// {@endtemplate}
  final Color? backgroundColor;

  /// {@template ShadProgress.color}
  /// The color of the progress indicator itself.
  /// Defaults to the theme’s primary color if not specified; overridden by
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
  /// The border radius of the progress bar’s outer container.
  /// Defaults to a circular radius of 16 if not specified.
  /// {@endtemplate}
  final BorderRadius? borderRadius;

  /// {@template ShadProgress.innerBorderRadius}
  /// The border radius of the progress indicator itself.
  /// Defaults to zero (sharp edges) if not specified.
  /// {@endtemplate}
  final BorderRadius? innerBorderRadius;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    final effectiveMinHeight = minHeight ?? theme.progressTheme.minHeight ?? 16;

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

    return ClipRRect(
      borderRadius: effectiveBorderRadius,
      child: LinearProgressIndicator(
        value: value,
        backgroundColor: effectiveBackgroundColor,
        color: effectiveColor,
        valueColor: valueColor,
        minHeight: effectiveMinHeight,
        semanticsLabel: semanticsLabel,
        semanticsValue: semanticsValue,
        borderRadius: effectiveInnerBorderRadius,
      ),
    );
  }
}
