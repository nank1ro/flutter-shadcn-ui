// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'progress.dart';

// **************************************************************************
// ThemeGenGenerator
// **************************************************************************

mixin _$ShadProgressTheme {
  bool get canMerge => true;

  static ShadProgressTheme? lerp(
    ShadProgressTheme? a,
    ShadProgressTheme? b,
    double t,
  ) {
    if (a == null && b == null) {
      return null;
    }

    return ShadProgressTheme(
      backgroundColor: Color.lerp(a?.backgroundColor, b?.backgroundColor, t),
      color: Color.lerp(a?.color, b?.color, t),
      borderRadius: BorderRadius.lerp(a?.borderRadius, b?.borderRadius, t),
      innerBorderRadius: BorderRadius.lerp(
        a?.innerBorderRadius,
        b?.innerBorderRadius,
        t,
      ),
      minHeight: lerpDouble$(a?.minHeight, b?.minHeight, t),
    );
  }

  ShadProgressTheme copyWith({
    Color? backgroundColor,
    Color? color,
    BorderRadius? borderRadius,
    BorderRadius? innerBorderRadius,
    double? minHeight,
  }) {
    final _this = (this as ShadProgressTheme);

    return ShadProgressTheme(
      backgroundColor: backgroundColor ?? _this.backgroundColor,
      color: color ?? _this.color,
      borderRadius: borderRadius ?? _this.borderRadius,
      innerBorderRadius: innerBorderRadius ?? _this.innerBorderRadius,
      minHeight: minHeight ?? _this.minHeight,
    );
  }

  ShadProgressTheme merge(ShadProgressTheme? other) {
    final _this = (this as ShadProgressTheme);

    if (other == null) {
      return _this;
    }

    if (!other.canMerge) {
      return other;
    }

    return copyWith(
      backgroundColor: other.backgroundColor,
      color: other.color,
      borderRadius: other.borderRadius,
      innerBorderRadius: other.innerBorderRadius,
      minHeight: other.minHeight,
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

    final _this = (this as ShadProgressTheme);
    final _other = (other as ShadProgressTheme);

    return _other.backgroundColor == _this.backgroundColor &&
        _other.color == _this.color &&
        _other.borderRadius == _this.borderRadius &&
        _other.innerBorderRadius == _this.innerBorderRadius &&
        _other.minHeight == _this.minHeight;
  }

  @override
  int get hashCode {
    final _this = (this as ShadProgressTheme);

    return Object.hash(
      runtimeType,
      _this.backgroundColor,
      _this.color,
      _this.borderRadius,
      _this.innerBorderRadius,
      _this.minHeight,
    );
  }
}
