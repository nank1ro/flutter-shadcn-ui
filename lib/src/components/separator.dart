import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/theme/components/separator.dart';
import 'package:shadcn_ui/src/theme/theme.dart';

/// Variants available for the [ShadSeparator] widget.
enum ShadSeparatorVariant { vertical, horizontal }

/// A customizable widget that supports horizontal and vertical separators.
///
/// Typically used to separate content or sections of row, columns, or lists.
class ShadSeparator extends StatelessWidget {
  /// Creates a vertical separator.
  const ShadSeparator.vertical({
    this.margin,
    this.thickness,
    this.color,
    this.radius,
    super.key,
  }) : variant = ShadSeparatorVariant.vertical;

  /// Creates a horizontal separator.
  const ShadSeparator.horizontal({
    this.margin,
    this.thickness,
    this.color,
    this.radius,
    super.key,
  }) : variant = ShadSeparatorVariant.horizontal;

  /// Creates a separator with a specified [variant].
  const ShadSeparator.raw({
    this.margin,
    this.thickness,
    this.color,
    required this.variant,
    this.radius,
    super.key,
  });

  /// {@template ShadSeparator.margin}
  /// The margin (or space) around the separator.
  ///{@endtemplate}
  ///
  /// This will override [ShadSeparatorTheme.verticalMargin] and
  /// [ShadSeparatorTheme.horizontalMargin].
  final EdgeInsetsGeometry? margin;

  /// {@template ShadSeparator.thickness}
  /// The thickness of the separator.
  /// This controls the height of the horizontal separator and the
  /// width of the vertical separator.
  /// {@endtemplate}
  ///
  /// This will override [ShadSeparatorTheme.thickness].
  final double? thickness;

  /// {@template ShadSeparator.color}
  /// The color of the separator.
  /// {@endtemplate}
  ///
  /// This will override [ShadSeparatorTheme.color].
  final Color? color;

  /// The variant of the separator.
  /// This can be explicitly passed using the [ShadSeparator.raw] constructor.
  final ShadSeparatorVariant variant;

  /// {@template ShadSeparator.radius}
  /// The amount of radius for the border of the separator.
  ///
  /// If this is null, then the default radius of [BoxDecoration] will be used.
  /// {@endtemplate}
  final BorderRadiusGeometry? radius;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final separatorTheme = theme.separatorTheme;

    final effectiveThickness = thickness ?? separatorTheme.thickness ?? 1;
    final effectiveColor =
        color ?? separatorTheme.color ?? theme.colorScheme.border;

    final borderSide = BorderSide(
      color: effectiveColor,
      width: effectiveThickness,
    );

    final defaultMargin = switch (variant) {
      ShadSeparatorVariant.vertical => separatorTheme.verticalMargin,
      ShadSeparatorVariant.horizontal => separatorTheme.horizontalMargin,
    };

    final effectiveMargin = margin ?? defaultMargin ?? EdgeInsets.zero;

    return Padding(
      padding: effectiveMargin,
      child: switch (variant) {
        ShadSeparatorVariant.vertical => DecoratedBox(
          decoration: BoxDecoration(
            border: Border(left: borderSide),
            borderRadius: radius,
          ),
          child: SizedBox(width: effectiveThickness, height: double.infinity),
        ),
        ShadSeparatorVariant.horizontal => DecoratedBox(
          decoration: BoxDecoration(
            border: Border(bottom: borderSide),
            borderRadius: radius,
          ),
          child: SizedBox(height: effectiveThickness, width: double.infinity),
        ),
      },
    );
  }
}
