// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'decorator.dart';

// **************************************************************************
// ThemeGenGenerator
// **************************************************************************

mixin _$ShadDecoration {
  bool get canMerge => true;

  static ShadDecoration? lerp(ShadDecoration? a, ShadDecoration? b, double t) {
    if (a == null && b == null) {
      return null;
    }

    return ShadDecoration(
      labelStyle: TextStyle.lerp(a?.labelStyle, b?.labelStyle, t),
      errorLabelStyle: TextStyle.lerp(
        a?.errorLabelStyle,
        b?.errorLabelStyle,
        t,
      ),
      border: ShadBorder.lerp(a?.border, b?.border, t),
      focusedBorder: ShadBorder.lerp(a?.focusedBorder, b?.focusedBorder, t),
      errorBorder: ShadBorder.lerp(a?.errorBorder, b?.errorBorder, t),
      secondaryBorder: ShadBorder.lerp(
        a?.secondaryBorder,
        b?.secondaryBorder,
        t,
      ),
      secondaryFocusedBorder: ShadBorder.lerp(
        a?.secondaryFocusedBorder,
        b?.secondaryFocusedBorder,
        t,
      ),
      secondaryErrorBorder: ShadBorder.lerp(
        a?.secondaryErrorBorder,
        b?.secondaryErrorBorder,
        t,
      ),
      errorStyle: TextStyle.lerp(a?.errorStyle, b?.errorStyle, t),
      descriptionStyle: TextStyle.lerp(
        a?.descriptionStyle,
        b?.descriptionStyle,
        t,
      ),
      labelPadding: EdgeInsetsGeometry.lerp(
        a?.labelPadding,
        b?.labelPadding,
        t,
      ),
      descriptionPadding: EdgeInsetsGeometry.lerp(
        a?.descriptionPadding,
        b?.descriptionPadding,
        t,
      ),
      errorPadding: EdgeInsetsGeometry.lerp(
        a?.errorPadding,
        b?.errorPadding,
        t,
      ),
      color: Color.lerp(a?.color, b?.color, t),
      image: DecorationImage.lerp(a?.image, b?.image, t),
      shadows: t < 0.5 ? a?.shadows : b?.shadows,
      gradient: Gradient.lerp(a?.gradient, b?.gradient, t),
      backgroundBlendMode: t < 0.5
          ? a?.backgroundBlendMode
          : b?.backgroundBlendMode,
      shape: t < 0.5 ? a?.shape : b?.shape,
      hasError: t < 0.5 ? a?.hasError : b?.hasError,
      disableSecondaryBorder: t < 0.5
          ? a?.disableSecondaryBorder
          : b?.disableSecondaryBorder,
      fallbackToBorder: t < 0.5 ? a?.fallbackToBorder : b?.fallbackToBorder,
      fallbackToLabelStyle: t < 0.5
          ? a?.fallbackToLabelStyle
          : b?.fallbackToLabelStyle,
    );
  }

  ShadDecoration copyWith({
    TextStyle? labelStyle,
    TextStyle? errorLabelStyle,
    ShadBorder? border,
    ShadBorder? focusedBorder,
    ShadBorder? errorBorder,
    ShadBorder? secondaryBorder,
    ShadBorder? secondaryFocusedBorder,
    ShadBorder? secondaryErrorBorder,
    TextStyle? errorStyle,
    TextStyle? descriptionStyle,
    EdgeInsetsGeometry? labelPadding,
    EdgeInsetsGeometry? descriptionPadding,
    EdgeInsetsGeometry? errorPadding,
    Color? color,
    DecorationImage? image,
    List<BoxShadow>? shadows,
    Gradient? gradient,
    BlendMode? backgroundBlendMode,
    BoxShape? shape,
    bool? hasError,
    bool? disableSecondaryBorder,
    bool? fallbackToBorder,
    bool? fallbackToLabelStyle,
  }) {
    final a = (this as ShadDecoration);

    return ShadDecoration(
      labelStyle: labelStyle ?? a.labelStyle,
      errorLabelStyle: errorLabelStyle ?? a.errorLabelStyle,
      border: border ?? a.border,
      focusedBorder: focusedBorder ?? a.focusedBorder,
      errorBorder: errorBorder ?? a.errorBorder,
      secondaryBorder: secondaryBorder ?? a.secondaryBorder,
      secondaryFocusedBorder:
          secondaryFocusedBorder ?? a.secondaryFocusedBorder,
      secondaryErrorBorder: secondaryErrorBorder ?? a.secondaryErrorBorder,
      errorStyle: errorStyle ?? a.errorStyle,
      descriptionStyle: descriptionStyle ?? a.descriptionStyle,
      labelPadding: labelPadding ?? a.labelPadding,
      descriptionPadding: descriptionPadding ?? a.descriptionPadding,
      errorPadding: errorPadding ?? a.errorPadding,
      color: color ?? a.color,
      image: image ?? a.image,
      shadows: shadows ?? a.shadows,
      gradient: gradient ?? a.gradient,
      backgroundBlendMode: backgroundBlendMode ?? a.backgroundBlendMode,
      shape: shape ?? a.shape,
      hasError: hasError ?? a.hasError,
      disableSecondaryBorder:
          disableSecondaryBorder ?? a.disableSecondaryBorder,
      fallbackToBorder: fallbackToBorder ?? a.fallbackToBorder,
      fallbackToLabelStyle: fallbackToLabelStyle ?? a.fallbackToLabelStyle,
    );
  }

  ShadDecoration merge(ShadDecoration? other) {
    final current = (this as ShadDecoration);

    if (other == null) {
      return current;
    }

    if (!other.canMerge) {
      return other;
    }

    return copyWith(
      labelStyle:
          current.labelStyle?.merge(other.labelStyle) ?? other.labelStyle,
      errorLabelStyle:
          current.errorLabelStyle?.merge(other.errorLabelStyle) ??
          other.errorLabelStyle,
      border: current.border?.merge(other.border) ?? other.border,
      focusedBorder:
          current.focusedBorder?.merge(other.focusedBorder) ??
          other.focusedBorder,
      errorBorder:
          current.errorBorder?.merge(other.errorBorder) ?? other.errorBorder,
      secondaryBorder:
          current.secondaryBorder?.merge(other.secondaryBorder) ??
          other.secondaryBorder,
      secondaryFocusedBorder:
          current.secondaryFocusedBorder?.merge(other.secondaryFocusedBorder) ??
          other.secondaryFocusedBorder,
      secondaryErrorBorder:
          current.secondaryErrorBorder?.merge(other.secondaryErrorBorder) ??
          other.secondaryErrorBorder,
      errorStyle:
          current.errorStyle?.merge(other.errorStyle) ?? other.errorStyle,
      descriptionStyle:
          current.descriptionStyle?.merge(other.descriptionStyle) ??
          other.descriptionStyle,
      labelPadding: other.labelPadding,
      descriptionPadding: other.descriptionPadding,
      errorPadding: other.errorPadding,
      color: other.color,
      image: other.image,
      shadows: other.shadows,
      gradient: other.gradient,
      backgroundBlendMode: other.backgroundBlendMode,
      shape: other.shape,
      hasError: other.hasError,
      disableSecondaryBorder: other.disableSecondaryBorder,
      fallbackToBorder: other.fallbackToBorder,
      fallbackToLabelStyle: other.fallbackToLabelStyle,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    if (other.runtimeType != runtimeType) {
      return false;
    }

    final value = (this as ShadDecoration);

    return other is ShadDecoration &&
        other.labelStyle == value.labelStyle &&
        other.errorLabelStyle == value.errorLabelStyle &&
        other.border == value.border &&
        other.focusedBorder == value.focusedBorder &&
        other.errorBorder == value.errorBorder &&
        other.secondaryBorder == value.secondaryBorder &&
        other.secondaryFocusedBorder == value.secondaryFocusedBorder &&
        other.secondaryErrorBorder == value.secondaryErrorBorder &&
        other.errorStyle == value.errorStyle &&
        other.descriptionStyle == value.descriptionStyle &&
        other.labelPadding == value.labelPadding &&
        other.descriptionPadding == value.descriptionPadding &&
        other.errorPadding == value.errorPadding &&
        other.color == value.color &&
        other.image == value.image &&
        other.shadows == value.shadows &&
        other.gradient == value.gradient &&
        other.backgroundBlendMode == value.backgroundBlendMode &&
        other.shape == value.shape &&
        other.hasError == value.hasError &&
        other.disableSecondaryBorder == value.disableSecondaryBorder &&
        other.fallbackToBorder == value.fallbackToBorder &&
        other.fallbackToLabelStyle == value.fallbackToLabelStyle;
  }

  @override
  int get hashCode {
    final value = (this as ShadDecoration);

    return Object.hashAll([
      runtimeType,
      value.labelStyle,
      value.errorLabelStyle,
      value.border,
      value.focusedBorder,
      value.errorBorder,
      value.secondaryBorder,
      value.secondaryFocusedBorder,
      value.secondaryErrorBorder,
      value.errorStyle,
      value.descriptionStyle,
      value.labelPadding,
      value.descriptionPadding,
      value.errorPadding,
      value.color,
      value.image,
      value.shadows,
      value.gradient,
      value.backgroundBlendMode,
      value.shape,
      value.hasError,
      value.disableSecondaryBorder,
      value.fallbackToBorder,
      value.fallbackToLabelStyle,
    ]);
  }
}
