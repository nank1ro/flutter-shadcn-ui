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
      backgroundBlendMode:
          t < 0.5 ? a?.backgroundBlendMode : b?.backgroundBlendMode,
      shape: t < 0.5 ? a?.shape : b?.shape,
      hasError: t < 0.5 ? a?.hasError : b?.hasError,
      disableSecondaryBorder:
          t < 0.5 ? a?.disableSecondaryBorder : b?.disableSecondaryBorder,
      fallbackToBorder: t < 0.5 ? a?.fallbackToBorder : b?.fallbackToBorder,
      fallbackToLabelStyle:
          t < 0.5 ? a?.fallbackToLabelStyle : b?.fallbackToLabelStyle,
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
    final _this = (this as ShadDecoration);

    return ShadDecoration(
      labelStyle: labelStyle ?? _this.labelStyle,
      errorLabelStyle: errorLabelStyle ?? _this.errorLabelStyle,
      border: border ?? _this.border,
      focusedBorder: focusedBorder ?? _this.focusedBorder,
      errorBorder: errorBorder ?? _this.errorBorder,
      secondaryBorder: secondaryBorder ?? _this.secondaryBorder,
      secondaryFocusedBorder:
          secondaryFocusedBorder ?? _this.secondaryFocusedBorder,
      secondaryErrorBorder: secondaryErrorBorder ?? _this.secondaryErrorBorder,
      errorStyle: errorStyle ?? _this.errorStyle,
      descriptionStyle: descriptionStyle ?? _this.descriptionStyle,
      labelPadding: labelPadding ?? _this.labelPadding,
      descriptionPadding: descriptionPadding ?? _this.descriptionPadding,
      errorPadding: errorPadding ?? _this.errorPadding,
      color: color ?? _this.color,
      image: image ?? _this.image,
      shadows: shadows ?? _this.shadows,
      gradient: gradient ?? _this.gradient,
      backgroundBlendMode: backgroundBlendMode ?? _this.backgroundBlendMode,
      shape: shape ?? _this.shape,
      hasError: hasError ?? _this.hasError,
      disableSecondaryBorder:
          disableSecondaryBorder ?? _this.disableSecondaryBorder,
      fallbackToBorder: fallbackToBorder ?? _this.fallbackToBorder,
      fallbackToLabelStyle: fallbackToLabelStyle ?? _this.fallbackToLabelStyle,
    );
  }

  ShadDecoration merge(ShadDecoration? other) {
    final _this = (this as ShadDecoration);

    if (other == null) {
      return _this;
    }

    if (!other.canMerge) {
      return other;
    }

    return copyWith(
      labelStyle: _this.labelStyle?.merge(other.labelStyle) ?? other.labelStyle,
      errorLabelStyle: _this.errorLabelStyle?.merge(other.errorLabelStyle) ??
          other.errorLabelStyle,
      border: _this.border?.merge(other.border) ?? other.border,
      focusedBorder: _this.focusedBorder?.merge(other.focusedBorder) ??
          other.focusedBorder,
      errorBorder:
          _this.errorBorder?.merge(other.errorBorder) ?? other.errorBorder,
      secondaryBorder: _this.secondaryBorder?.merge(other.secondaryBorder) ??
          other.secondaryBorder,
      secondaryFocusedBorder:
          _this.secondaryFocusedBorder?.merge(other.secondaryFocusedBorder) ??
              other.secondaryFocusedBorder,
      secondaryErrorBorder:
          _this.secondaryErrorBorder?.merge(other.secondaryErrorBorder) ??
              other.secondaryErrorBorder,
      errorStyle: _this.errorStyle?.merge(other.errorStyle) ?? other.errorStyle,
      descriptionStyle: _this.descriptionStyle?.merge(other.descriptionStyle) ??
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

    final _this = (this as ShadDecoration);
    final _other = (other as ShadDecoration);

    return _other.labelStyle == _this.labelStyle &&
        _other.errorLabelStyle == _this.errorLabelStyle &&
        _other.border == _this.border &&
        _other.focusedBorder == _this.focusedBorder &&
        _other.errorBorder == _this.errorBorder &&
        _other.secondaryBorder == _this.secondaryBorder &&
        _other.secondaryFocusedBorder == _this.secondaryFocusedBorder &&
        _other.secondaryErrorBorder == _this.secondaryErrorBorder &&
        _other.errorStyle == _this.errorStyle &&
        _other.descriptionStyle == _this.descriptionStyle &&
        _other.labelPadding == _this.labelPadding &&
        _other.descriptionPadding == _this.descriptionPadding &&
        _other.errorPadding == _this.errorPadding &&
        _other.color == _this.color &&
        _other.image == _this.image &&
        _other.shadows == _this.shadows &&
        _other.gradient == _this.gradient &&
        _other.backgroundBlendMode == _this.backgroundBlendMode &&
        _other.shape == _this.shape &&
        _other.hasError == _this.hasError &&
        _other.disableSecondaryBorder == _this.disableSecondaryBorder &&
        _other.fallbackToBorder == _this.fallbackToBorder &&
        _other.fallbackToLabelStyle == _this.fallbackToLabelStyle;
  }

  @override
  int get hashCode {
    final _this = (this as ShadDecoration);

    return Object.hashAll([
      runtimeType,
      _this.labelStyle,
      _this.errorLabelStyle,
      _this.border,
      _this.focusedBorder,
      _this.errorBorder,
      _this.secondaryBorder,
      _this.secondaryFocusedBorder,
      _this.secondaryErrorBorder,
      _this.errorStyle,
      _this.descriptionStyle,
      _this.labelPadding,
      _this.descriptionPadding,
      _this.errorPadding,
      _this.color,
      _this.image,
      _this.shadows,
      _this.gradient,
      _this.backgroundBlendMode,
      _this.shape,
      _this.hasError,
      _this.disableSecondaryBorder,
      _this.fallbackToBorder,
      _this.fallbackToLabelStyle,
    ]);
  }
}
