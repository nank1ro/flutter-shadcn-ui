import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/utils/border.dart';
import 'package:theme_extensions_builder_annotation/theme_extensions_builder_annotation.dart';

part 'decorator.g.theme.dart';

@themeGen
@immutable
class ShadDecoration with _$ShadDecoration {
  const ShadDecoration({
    bool canMerge = true,
    this.border,
    this.focusedBorder,
    this.errorBorder,
    this.secondaryBorder,
    this.secondaryFocusedBorder,
    this.secondaryErrorBorder,
    this.labelStyle,
    this.errorLabelStyle,
    this.errorStyle,
    this.descriptionStyle,
    this.labelPadding,
    this.descriptionPadding,
    this.errorPadding,
    this.fallbackToBorder,
    this.color,
    this.image,
    this.shadows,
    this.gradient,
    this.backgroundBlendMode,
    this.shape,
    this.hasError,
    this.fallbackToLabelStyle,
    this.disableSecondaryBorder,
  }) : _canMerge = canMerge;

  @ignore
  final bool _canMerge;

  @override
  bool get canMerge => _canMerge;

  static const ShadDecoration none = ShadDecoration(
    canMerge: false,
    border: ShadBorder.none,
    focusedBorder: ShadBorder.none,
    errorBorder: ShadBorder.none,
    secondaryBorder: ShadBorder.none,
    secondaryFocusedBorder: ShadBorder.none,
    secondaryErrorBorder: ShadBorder.none,
  );

  final TextStyle? labelStyle;
  final TextStyle? errorLabelStyle;
  final ShadBorder? border;
  final ShadBorder? focusedBorder;
  final ShadBorder? errorBorder;
  final ShadBorder? secondaryBorder;
  final ShadBorder? secondaryFocusedBorder;
  final ShadBorder? secondaryErrorBorder;
  final TextStyle? errorStyle;
  final TextStyle? descriptionStyle;
  final EdgeInsetsGeometry? labelPadding;
  final EdgeInsetsGeometry? descriptionPadding;
  final EdgeInsetsGeometry? errorPadding;
  final Color? color;
  final DecorationImage? image;
  final List<BoxShadow>? shadows;
  final Gradient? gradient;
  final BlendMode? backgroundBlendMode;
  final BoxShape? shape;
  final bool? hasError;
  final bool? disableSecondaryBorder;

  /// Whether to fallback to the [border] if no [focusedBorder] or [errorBorder]
  /// is provided, defaults to true.
  ///
  /// This also affects the [secondaryBorder] with the same conditions.
  final bool? fallbackToBorder;

  /// Whether to fallback to the [labelStyle] if no [errorLabelStyle] is
  /// provided, defaults to true.
  final bool? fallbackToLabelStyle;

  static ShadDecoration? lerp(
    ShadDecoration? a,
    ShadDecoration? b,
    double t,
  ) => _$ShadDecoration.lerp(a, b, t);

  @override
  String toString() {
    return '''ShadDecoration(border: $border, focusedBorder: $focusedBorder, errorBorder: $errorBorder, secondaryBorder: $secondaryBorder, secondaryFocusedBorder: $secondaryFocusedBorder, secondaryErrorBorder: $secondaryErrorBorder, labelStyle: $labelStyle, errorLabelStyle: $errorLabelStyle, errorStyle: $errorStyle, descriptionStyle: $descriptionStyle, labelPadding: $labelPadding, descriptionPadding: $descriptionPadding, errorPadding: $errorPadding, fallbackToBorder: $fallbackToBorder, color: $color, image: $image, shadows: $shadows, gradient: $gradient, backgroundBlendMode: $backgroundBlendMode, shape: $shape, hasError: $hasError, fallbackToLabelStyle: $fallbackToLabelStyle, disableSecondaryBorder: $disableSecondaryBorder)''';
  }
}

class ShadDecorator extends StatelessWidget {
  const ShadDecorator({
    super.key,
    this.child,
    this.decoration,
    this.focused = false,
  });

  /// The child to decorate.
  final Widget? child;

  /// The decoration to apply to the child.
  final ShadDecoration? decoration;

  /// Whether the child has focus, defaults to false.
  final bool focused;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final textDirection = Directionality.of(context);

    final effectiveDecoration = theme.decoration.merge(decoration);

    final effectiveFallbackToBorder =
        effectiveDecoration.fallbackToBorder ?? true;

    final effectiveDisableSecondaryBorder =
        effectiveDecoration.disableSecondaryBorder ??
        theme.disableSecondaryBorder;

    final hasError = effectiveDecoration.hasError ?? false;

    final fallbackBorder = switch (focused) {
      true => effectiveDecoration.focusedBorder,
      false => effectiveDecoration.border,
    };

    var border = switch (hasError) {
      true => effectiveDecoration.errorBorder,
      false => fallbackBorder,
    };

    if (effectiveFallbackToBorder && border == null) {
      border = fallbackBorder ?? effectiveDecoration.border;
    }

    final fallbackSecondaryBorder = switch (focused) {
      true => effectiveDecoration.secondaryFocusedBorder,
      false => effectiveDecoration.secondaryBorder,
    };

    var secondaryBorder = switch (hasError) {
      true => effectiveDecoration.secondaryErrorBorder,
      false => fallbackSecondaryBorder,
    };

    if (effectiveFallbackToBorder && secondaryBorder == null) {
      secondaryBorder =
          fallbackSecondaryBorder ?? effectiveDecoration.secondaryBorder;
    }

    final primaryDecoration = switch (border) {
      final ShadRoundedSuperellipseBorder border => ShapeDecoration(
        color: effectiveDecoration.color,
        image: effectiveDecoration.image,
        shadows: effectiveDecoration.shadows,
        gradient: effectiveDecoration.gradient,
        shape: border.toBorder(
          textDirection: textDirection,
          defaultRadius: theme.radius,
        ),
      ),
      final ShadBorder? border => BoxDecoration(
        border: true == border?.hasBorder ? border?.toBorder() : null,
        borderRadius: effectiveDecoration.shape == BoxShape.circle
            ? null
            : border?.radius,
        color: effectiveDecoration.color,
        shape: effectiveDecoration.shape ?? BoxShape.rectangle,
        backgroundBlendMode: effectiveDecoration.backgroundBlendMode,
        boxShadow: effectiveDecoration.shadows,
        gradient: effectiveDecoration.gradient,
        image: effectiveDecoration.image,
      ),
    };

    Widget decorated = Container(
      decoration: primaryDecoration,
      padding: border?.padding,
      child: child,
    );

    if (secondaryBorder != null && !effectiveDisableSecondaryBorder) {
      decorated = Padding(
        padding: secondaryBorder.padding ?? EdgeInsets.zero,
        child: CustomPaint(
          foregroundPainter: ShadOutwardBorderPainter(
            border: secondaryBorder.toBorder(),
            offset: secondaryBorder.offset ?? 0,
            radius:
                secondaryBorder.radius?.resolve(textDirection) ??
                BorderRadius.zero,
            textDirection: textDirection,
          ),
          child: decorated,
        ),
      );
    }

    return decorated;
  }
}

/// {@template shadOutwardBorderPainter}
/// A [CustomPainter] that paints a border outward from the given rectangle.
/// {@endtemplate}
class ShadOutwardBorderPainter extends CustomPainter {
  /// {@macro shadOutwardBorderPainter}
  const ShadOutwardBorderPainter({
    required this.border,
    required this.offset,
    required this.radius,
    required this.textDirection,
  });

  /// The border to paint.
  final Border border;

  /// The offset to inflate the border by.
  final double offset;

  /// The radius of the border.
  final BorderRadius? radius;

  /// The text direction to use when painting the border.
  final TextDirection? textDirection;

  @override
  void paint(Canvas canvas, Size size) {
    border.paint(
      canvas,
      (Offset.zero & size).inflate(offset),
      borderRadius: radius,
      textDirection: textDirection,
    );
  }

  @override
  bool shouldRepaint(covariant ShadOutwardBorderPainter oldDelegate) {
    return border != oldDelegate.border ||
        offset != oldDelegate.offset ||
        radius != oldDelegate.radius ||
        textDirection != oldDelegate.textDirection;
  }
}
