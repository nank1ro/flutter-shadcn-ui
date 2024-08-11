import 'package:flutter/material.dart';

import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:shadcn_ui/src/theme/theme.dart';

@immutable
class ShadBorder extends Border {
  const ShadBorder({
    this.merge = true,
    this.padding,
    this.radius,
    super.top,
    super.right,
    super.bottom,
    super.left,
  });

  /// Creates a border whose sides are all the same.
  const ShadBorder.fromBorderSide(
    BorderSide side, {
    this.merge = true,
    this.padding,
    this.radius,
  }) : super(top: side, right: side, bottom: side, left: side);

  /// Creates a border with symmetrical vertical and horizontal sides.
  ///
  /// The `vertical` argument applies to the [left] and [right] sides, and the
  /// `horizontal` argument applies to the [top] and [bottom] sides.
  ///
  /// All arguments default to [BorderSide.none].
  const ShadBorder.symmetric({
    BorderSide vertical = BorderSide.none,
    BorderSide horizontal = BorderSide.none,
    this.merge = true,
    this.padding,
    this.radius,
  }) : super(
          top: vertical,
          right: horizontal,
          bottom: vertical,
          left: horizontal,
        );

  factory ShadBorder.all({
    bool merge = true,
    Color color = const Color(0xFF000000),
    double width = 1.0,
    BorderStyle style = BorderStyle.solid,
    double strokeAlign = BorderSide.strokeAlignInside,
    EdgeInsets? padding,
    BorderRadiusGeometry? radius,
  }) {
    return ShadBorder.fromBorderSide(
      BorderSide(
        color: color,
        width: width,
        style: style,
        strokeAlign: strokeAlign,
      ),
      padding: padding,
      merge: merge,
      radius: radius,
    );
  }

  static const ShadBorder none = ShadBorder(merge: false);

  bool get hasBorder =>
      top.width != 0 ||
      right.width != 0 ||
      bottom.width != 0 ||
      left.width != 0;

  /// The padding of the border, defaults to null.
  final EdgeInsets? padding;

  /// Whether to merge with another border, defaults to true.
  final bool merge;

  /// The border radius of the border, defaults to null.
  final BorderRadiusGeometry? radius;

  static ShadBorder? lerp(
    ShadBorder? a,
    ShadBorder? b,
    double t,
  ) {
    if (a == null && b == null) return null;
    return ShadBorder(
      padding: EdgeInsets.lerp(a?.padding, b?.padding, t),
      top: lerpBorderSide(a?.top, b?.top, t),
      right: lerpBorderSide(a?.right, b?.right, t),
      bottom: lerpBorderSide(a?.bottom, b?.bottom, t),
      left: lerpBorderSide(a?.left, b?.left, t),
      radius: BorderRadiusGeometry.lerp(a?.radius, b?.radius, t),
    );
  }

  static BorderSide lerpBorderSide(
    BorderSide? a,
    BorderSide? b,
    double t,
  ) {
    if (identical(a, b)) {
      return a ?? BorderSide.none;
    }
    if (a == null) {
      return b!.scale(t);
    }
    if (b == null) {
      return a.scale(1.0 - t);
    }
    return BorderSide.lerp(a, b, t);
  }

  ShadBorder copyWith({
    EdgeInsets? padding,
    BorderSide? top,
    BorderSide? right,
    BorderSide? bottom,
    BorderSide? left,
    BorderRadiusGeometry? radius,
  }) {
    return ShadBorder(
      padding: padding ?? this.padding,
      top: top ?? this.top,
      right: right ?? this.right,
      bottom: bottom ?? this.bottom,
      left: left ?? this.left,
      radius: radius ?? this.radius,
    );
  }

  ShadBorder mergeWith(ShadBorder? other) {
    if (other == null) return this;
    if (!other.merge) return other;
    return copyWith(
      padding: other.padding,
      top: other.top,
      right: other.right,
      bottom: other.bottom,
      left: other.left,
      radius: other.radius,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShadBorder &&
        other.merge == merge &&
        other.padding == padding &&
        other.top == top &&
        other.right == right &&
        other.bottom == bottom &&
        other.left == left &&
        other.radius == radius;
  }

  @override
  int get hashCode {
    return merge.hashCode ^
        padding.hashCode ^
        top.hashCode ^
        right.hashCode ^
        bottom.hashCode ^
        left.hashCode ^
        radius.hashCode;
  }
}

@immutable
class ShadDecoration {
  const ShadDecoration({
    this.merge = true,
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
  });

  static const ShadDecoration none = ShadDecoration(
    merge: false,
    border: ShadBorder.none,
    focusedBorder: ShadBorder.none,
    errorBorder: ShadBorder.none,
    secondaryBorder: ShadBorder.none,
    secondaryFocusedBorder: ShadBorder.none,
    secondaryErrorBorder: ShadBorder.none,
  );

  final bool merge;
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
  final EdgeInsets? labelPadding;
  final EdgeInsets? descriptionPadding;
  final EdgeInsets? errorPadding;
  final Color? color;
  final DecorationImage? image;
  final List<BoxShadow>? shadows;
  final Gradient? gradient;
  final BlendMode? backgroundBlendMode;
  final BoxShape? shape;
  final bool? hasError;

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
  ) {
    if (a == null && b == null) return null;
    return ShadDecoration(
      border: ShadBorder.lerp(a?.border, b?.border, t),
      focusedBorder: ShadBorder.lerp(a?.focusedBorder, b?.focusedBorder, t),
      errorBorder: ShadBorder.lerp(a?.errorBorder, b?.errorBorder, t),
      secondaryBorder:
          ShadBorder.lerp(a?.secondaryBorder, b?.secondaryBorder, t),
      secondaryFocusedBorder: ShadBorder.lerp(
        a?.secondaryFocusedBorder,
        b?.secondaryFocusedBorder,
        t,
      ),
      secondaryErrorBorder:
          ShadBorder.lerp(a?.secondaryErrorBorder, b?.secondaryErrorBorder, t),
      labelStyle: TextStyle.lerp(a?.labelStyle, b?.labelStyle, t),
      errorLabelStyle:
          TextStyle.lerp(a?.errorLabelStyle, b?.errorLabelStyle, t),
      errorStyle: TextStyle.lerp(a?.errorStyle, b?.errorStyle, t),
      descriptionStyle:
          TextStyle.lerp(a?.descriptionStyle, b?.descriptionStyle, t),
      labelPadding: EdgeInsets.lerp(a?.labelPadding, b?.labelPadding, t),
      descriptionPadding:
          EdgeInsets.lerp(a?.descriptionPadding, b?.descriptionPadding, t),
      errorPadding: EdgeInsets.lerp(a?.errorPadding, b?.errorPadding, t),
      fallbackToBorder: t < 0.5 ? a?.fallbackToBorder : b?.fallbackToBorder,
      color: Color.lerp(a?.color, b?.color, t),
      image: DecorationImage.lerp(a?.image, b?.image, t),
      shadows: BoxShadow.lerpList(a?.shadows, b?.shadows, t),
      gradient: Gradient.lerp(a?.gradient, b?.gradient, t),
      backgroundBlendMode:
          t < 0.5 ? a?.backgroundBlendMode : b?.backgroundBlendMode,
      shape: t < 0.5 ? a?.shape : b?.shape,
      hasError: t < 0.5 ? a?.hasError : b?.hasError,
      fallbackToLabelStyle:
          t < 0.5 ? a?.fallbackToLabelStyle : b?.fallbackToLabelStyle,
    );
  }

  ShadDecoration mergeWith(ShadDecoration? other) {
    if (other == null) return this;
    if (!other.merge) return other;
    return copyWith(
      border: border?.mergeWith(other.border) ?? other.border,
      focusedBorder:
          focusedBorder?.mergeWith(other.focusedBorder) ?? other.focusedBorder,
      errorBorder:
          errorBorder?.mergeWith(other.errorBorder) ?? other.errorBorder,
      secondaryBorder: secondaryBorder?.mergeWith(other.secondaryBorder) ??
          other.secondaryBorder,
      secondaryFocusedBorder:
          secondaryFocusedBorder?.mergeWith(other.secondaryFocusedBorder) ??
              other.secondaryFocusedBorder,
      secondaryErrorBorder:
          secondaryErrorBorder?.mergeWith(other.secondaryErrorBorder) ??
              other.secondaryErrorBorder,
      labelStyle: other.labelStyle ?? labelStyle,
      errorLabelStyle: other.errorLabelStyle ?? errorLabelStyle,
      errorStyle: other.errorStyle ?? errorStyle,
      descriptionStyle: other.descriptionStyle ?? descriptionStyle,
      labelPadding: other.labelPadding ?? labelPadding,
      descriptionPadding: other.descriptionPadding ?? descriptionPadding,
      errorPadding: other.errorPadding ?? errorPadding,
      fallbackToBorder: other.fallbackToBorder ?? fallbackToBorder,
      color: other.color ?? color,
      shape: other.shape ?? shape,
      backgroundBlendMode: other.backgroundBlendMode ?? backgroundBlendMode,
      shadows: other.shadows ?? shadows,
      gradient: other.gradient ?? gradient,
      image: other.image ?? image,
      hasError: other.hasError ?? hasError,
      fallbackToLabelStyle: other.fallbackToLabelStyle ?? fallbackToLabelStyle,
    );
  }

  ShadDecoration copyWith({
    ShadBorder? border,
    ShadBorder? focusedBorder,
    ShadBorder? errorBorder,
    ShadBorder? secondaryBorder,
    ShadBorder? secondaryFocusedBorder,
    ShadBorder? secondaryErrorBorder,
    TextStyle? labelStyle,
    TextStyle? errorLabelStyle,
    TextStyle? errorStyle,
    TextStyle? descriptionStyle,
    EdgeInsets? labelPadding,
    EdgeInsets? descriptionPadding,
    EdgeInsets? errorPadding,
    bool? fallbackToBorder,
    Color? color,
    BoxShape? shape,
    BlendMode? backgroundBlendMode,
    List<BoxShadow>? shadows,
    Gradient? gradient,
    DecorationImage? image,
    bool? hasError,
    bool? fallbackToLabelStyle,
  }) {
    return ShadDecoration(
      border: border ?? this.border,
      focusedBorder: focusedBorder ?? this.focusedBorder,
      errorBorder: errorBorder ?? this.errorBorder,
      secondaryBorder: secondaryBorder ?? this.secondaryBorder,
      secondaryFocusedBorder:
          secondaryFocusedBorder ?? this.secondaryFocusedBorder,
      secondaryErrorBorder: secondaryErrorBorder ?? this.secondaryErrorBorder,
      labelStyle: labelStyle ?? this.labelStyle,
      errorLabelStyle: errorLabelStyle ?? this.errorLabelStyle,
      errorStyle: errorStyle ?? this.errorStyle,
      descriptionStyle: descriptionStyle ?? this.descriptionStyle,
      labelPadding: labelPadding ?? this.labelPadding,
      descriptionPadding: descriptionPadding ?? this.descriptionPadding,
      errorPadding: errorPadding ?? this.errorPadding,
      fallbackToBorder: fallbackToBorder ?? this.fallbackToBorder,
      color: color ?? this.color,
      shape: shape ?? this.shape,
      backgroundBlendMode: backgroundBlendMode ?? this.backgroundBlendMode,
      shadows: shadows ?? this.shadows,
      gradient: gradient ?? this.gradient,
      image: image ?? this.image,
      hasError: hasError ?? this.hasError,
      fallbackToLabelStyle: fallbackToLabelStyle ?? this.fallbackToLabelStyle,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShadDecoration &&
        other.border == border &&
        other.focusedBorder == focusedBorder &&
        other.errorBorder == errorBorder &&
        other.secondaryBorder == secondaryBorder &&
        other.secondaryFocusedBorder == secondaryFocusedBorder &&
        other.secondaryErrorBorder == secondaryErrorBorder &&
        other.labelStyle == labelStyle &&
        other.errorLabelStyle == errorLabelStyle &&
        other.errorStyle == errorStyle &&
        other.descriptionStyle == descriptionStyle &&
        other.labelPadding == labelPadding &&
        other.descriptionPadding == descriptionPadding &&
        other.errorPadding == errorPadding &&
        other.fallbackToBorder == fallbackToBorder &&
        other.color == color &&
        other.shape == shape &&
        other.backgroundBlendMode == backgroundBlendMode &&
        other.shadows == shadows &&
        other.gradient == gradient &&
        other.image == image &&
        other.hasError == hasError &&
        other.fallbackToLabelStyle == fallbackToLabelStyle;
  }

  @override
  int get hashCode =>
      border.hashCode ^
      focusedBorder.hashCode ^
      errorBorder.hashCode ^
      secondaryBorder.hashCode ^
      secondaryFocusedBorder.hashCode ^
      secondaryErrorBorder.hashCode ^
      labelStyle.hashCode ^
      errorLabelStyle.hashCode ^
      errorStyle.hashCode ^
      descriptionStyle.hashCode ^
      labelPadding.hashCode ^
      descriptionPadding.hashCode ^
      errorPadding.hashCode ^
      fallbackToBorder.hashCode ^
      color.hashCode ^
      shape.hashCode ^
      backgroundBlendMode.hashCode ^
      shadows.hashCode ^
      gradient.hashCode ^
      image.hashCode ^
      hasError.hashCode ^
      fallbackToLabelStyle.hashCode;

  @override
  String toString() {
    return '''ShadDecoration(border: $border, focusedBorder: $focusedBorder, errorBorder: $errorBorder, secondaryBorder: $secondaryBorder, secondaryFocusedBorder: $secondaryFocusedBorder, secondaryErrorBorder: $secondaryErrorBorder, labelStyle: $labelStyle, errorLabelStyle: $errorLabelStyle, errorStyle: $errorStyle, descriptionStyle: $descriptionStyle, labelPadding: $labelPadding, descriptionPadding: $descriptionPadding, errorPadding: $errorPadding, fallbackToBorder: $fallbackToBorder, color: $color, image: $image, shadows: $shadows, gradient: $gradient, backgroundBlendMode: $backgroundBlendMode, shape: $shape, hasError: $hasError, fallbackToLabelStyle: $fallbackToLabelStyle)''';
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

    final effectiveDecoration = theme.decoration.mergeWith(decoration);

    final effectiveFallbackToBorder =
        effectiveDecoration.fallbackToBorder ?? true;

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

    Widget decorated = Container(
      decoration: BoxDecoration(
        border: true == border?.hasBorder ? border : null,
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
      padding: border?.padding,
      child: child,
    );

    if (secondaryBorder != null && !theme.disableSecondaryBorder) {
      decorated = Container(
        decoration: BoxDecoration(
          border: secondaryBorder.hasBorder ? secondaryBorder : null,
          borderRadius: secondaryBorder.radius,
        ),
        padding: secondaryBorder.padding,
        child: decorated,
      );
    }

    return decorated;
  }
}
