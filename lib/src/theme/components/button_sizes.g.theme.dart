// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'button_sizes.dart';

// **************************************************************************
// ThemeGenGenerator
// **************************************************************************

mixin _$ShadButtonSizeTheme {
  bool get canMerge => true;

  static ShadButtonSizeTheme? lerp(
    ShadButtonSizeTheme? a,
    ShadButtonSizeTheme? b,
    double t,
  ) {
    if (a == null && b == null) {
      return null;
    }

    return ShadButtonSizeTheme(
      height: lerpDouble$(a?.height, b?.height, t)!,
      padding: EdgeInsetsGeometry.lerp(a?.padding, b?.padding, t)!,
      width: lerpDouble$(a?.width, b?.width, t),
    );
  }

  ShadButtonSizeTheme copyWith({
    double? height,
    EdgeInsetsGeometry? padding,
    double? width,
  }) {
    final _this = (this as ShadButtonSizeTheme);

    return ShadButtonSizeTheme(
      height: height ?? _this.height,
      padding: padding ?? _this.padding,
      width: width ?? _this.width,
    );
  }

  ShadButtonSizeTheme merge(ShadButtonSizeTheme? other) {
    final _this = (this as ShadButtonSizeTheme);

    if (other == null) {
      return _this;
    }

    if (!other.canMerge) {
      return other;
    }

    return copyWith(
      height: other.height,
      padding: other.padding,
      width: other.width,
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

    final _this = (this as ShadButtonSizeTheme);
    final _other = (other as ShadButtonSizeTheme);

    return _other.height == _this.height &&
        _other.padding == _this.padding &&
        _other.width == _this.width;
  }

  @override
  int get hashCode {
    final _this = (this as ShadButtonSizeTheme);

    return Object.hash(runtimeType, _this.height, _this.padding, _this.width);
  }
}

mixin _$ShadButtonSizesTheme {
  bool get canMerge => true;

  static ShadButtonSizesTheme? lerp(
    ShadButtonSizesTheme? a,
    ShadButtonSizesTheme? b,
    double t,
  ) {
    if (a == null && b == null) {
      return null;
    }

    return ShadButtonSizesTheme(
      regular: ShadButtonSizeTheme.lerp(a?.regular, b?.regular, t),
      sm: ShadButtonSizeTheme.lerp(a?.sm, b?.sm, t),
      lg: ShadButtonSizeTheme.lerp(a?.lg, b?.lg, t),
      icon: ShadButtonSizeTheme.lerp(a?.icon, b?.icon, t),
    );
  }

  ShadButtonSizesTheme copyWith({
    ShadButtonSizeTheme? regular,
    ShadButtonSizeTheme? sm,
    ShadButtonSizeTheme? lg,
    ShadButtonSizeTheme? icon,
  }) {
    final _this = (this as ShadButtonSizesTheme);

    return ShadButtonSizesTheme(
      regular: regular ?? _this.regular,
      sm: sm ?? _this.sm,
      lg: lg ?? _this.lg,
      icon: icon ?? _this.icon,
    );
  }

  ShadButtonSizesTheme merge(ShadButtonSizesTheme? other) {
    final _this = (this as ShadButtonSizesTheme);

    if (other == null) {
      return _this;
    }

    if (!other.canMerge) {
      return other;
    }

    return copyWith(
      regular: other.regular,
      sm: other.sm,
      lg: other.lg,
      icon: other.icon,
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

    final _this = (this as ShadButtonSizesTheme);
    final _other = (other as ShadButtonSizesTheme);

    return _other.regular == _this.regular &&
        _other.sm == _this.sm &&
        _other.lg == _this.lg &&
        _other.icon == _this.icon;
  }

  @override
  int get hashCode {
    final _this = (this as ShadButtonSizesTheme);

    return Object.hash(
      runtimeType,
      _this.regular,
      _this.sm,
      _this.lg,
      _this.icon,
    );
  }
}
