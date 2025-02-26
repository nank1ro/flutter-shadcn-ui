import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart' show ShadDividerTheme;
import 'package:shadcn_ui/src/theme/components/divider.dart'
    show ShadDividerTheme;
import 'package:shadcn_ui/src/theme/theme.dart';

/// {@template ShadDivider.}
/// {@endtemplate}

/// Variants available for the [ShadDivider] widget.
enum ShadDividerVariant { vertical, horizontal }

/// A customizable widget that supports horizontal and vertical dividers.
///
/// Typically used to separate content or sections of row, columns, or lists.
class ShadDivider extends StatelessWidget {
  /// Creates a vertical divider.
  const ShadDivider.vertical({
    this.margin,
    this.thickness,
    this.color,
    this.radius,
    super.key,
  }) : variant = ShadDividerVariant.vertical;

  /// Creates a horizontal divider.
  const ShadDivider.horizontal({
    this.margin,
    this.thickness,
    this.color,
    this.radius,
    super.key,
  }) : variant = ShadDividerVariant.horizontal;

  /// Creates a divider with a specified [variant].
  const ShadDivider.raw({
    this.margin,
    this.thickness,
    this.color,
    required this.variant,
    this.radius,
    super.key,
  });

  /// {@template ShadDivider.margin}
  /// The margin (or space) around the divider.
  ///{@endtemplate}
  ///
  /// This will override [ShadDividerTheme.verticalMargin] and
  /// [ShadDividerTheme.horizontalMargin].
  final EdgeInsets? margin;

  /// {@template ShadDivider.thickness}
  /// The thickness of the divider.
  /// This controls the height of the horizontal divider and the
  /// width of the vertical divider.
  /// {@endtemplate}
  ///
  /// This will override [ShadDividerTheme.thickness].
  final double? thickness;

  /// {@template ShadDivider.color}
  /// The color of the divider.
  /// {@endtemplate}
  ///
  /// This will override [ShadDividerTheme.color].
  final Color? color;

  /// The variant of the divider.
  /// This can be explicitly passed using the [ShadDivider.raw] constructor.
  final ShadDividerVariant variant;

  /// {@template ShadDivider.radius}
  /// The amount of radius for the border of the divider.
  ///
  /// If this is null, then the default radius of [BoxDecoration] will be used.
  /// {@endtemplate}
  final BorderRadiusGeometry? radius;

  @override
  Widget build(BuildContext context) {
    final shadTheme = ShadTheme.of(context);
    final dividerTheme = shadTheme.dividerTheme;

    final thickness = this.thickness ?? dividerTheme.thickness;
    final color = this.color ?? dividerTheme.color;
    final borderSide = BorderSide(
      color: color ?? shadTheme.colorScheme.border,
      width: thickness ?? 1,
    );

    final margin = this.margin ??
        switch (variant) {
          ShadDividerVariant.vertical => dividerTheme.verticalMargin,
          ShadDividerVariant.horizontal => dividerTheme.horizontalMargin,
        } ??
        EdgeInsets.zero;

    return Padding(
      padding: margin,
      child: switch (variant) {
        ShadDividerVariant.vertical => DecoratedBox(
            decoration: BoxDecoration(
              border: Border(left: borderSide),
              borderRadius: radius,
            ),
            child: SizedBox(width: thickness, height: double.infinity),
          ),
        ShadDividerVariant.horizontal => DecoratedBox(
            decoration: BoxDecoration(
              border: Border(bottom: borderSide),
              borderRadius: radius,
            ),
            child: SizedBox(height: thickness, width: double.infinity),
          ),
      },
    );
  }
}
