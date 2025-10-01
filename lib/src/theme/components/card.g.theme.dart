// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'card.dart';

// **************************************************************************
// ThemeGenGenerator
// **************************************************************************

mixin _$ShadCardTheme {
  bool get canMerge => true;

  static ShadCardTheme lerp(ShadCardTheme? a, ShadCardTheme? b, double t) {
    if (a == null && b == null) {
      throw ArgumentError('Both a and b cannot be null');
    }

    return ShadCardTheme(
      padding: EdgeInsetsGeometry.lerp(a?.padding, b?.padding, t),
      backgroundColor: Color.lerp(a?.backgroundColor, b?.backgroundColor, t),
      radius: BorderRadius.lerp(a?.radius, b?.radius, t),
      border: Border.lerp(a?.border, b?.border, t),
      shadows: t < 0.5 ? a?.shadows : b?.shadows,
      width: lerpDouble$(a?.width, b?.width, t),
      height: lerpDouble$(a?.height, b?.height, t),
      rowMainAxisAlignment:
          t < 0.5 ? a?.rowMainAxisAlignment : b?.rowMainAxisAlignment,
      rowCrossAxisAlignment:
          t < 0.5 ? a?.rowCrossAxisAlignment : b?.rowCrossAxisAlignment,
      columnMainAxisAlignment:
          t < 0.5 ? a?.columnMainAxisAlignment : b?.columnMainAxisAlignment,
      columnCrossAxisAlignment:
          t < 0.5 ? a?.columnCrossAxisAlignment : b?.columnCrossAxisAlignment,
      rowMainAxisSize: t < 0.5 ? a?.rowMainAxisSize : b?.rowMainAxisSize,
      columnMainAxisSize:
          t < 0.5 ? a?.columnMainAxisSize : b?.columnMainAxisSize,
      clipBehavior: t < 0.5 ? a?.clipBehavior : b?.clipBehavior,
    );
  }

  ShadCardTheme copyWith({
    EdgeInsetsGeometry? padding,
    Color? backgroundColor,
    BorderRadius? radius,
    Border? border,
    List<BoxShadow>? shadows,
    double? width,
    double? height,
    MainAxisAlignment? rowMainAxisAlignment,
    CrossAxisAlignment? rowCrossAxisAlignment,
    MainAxisAlignment? columnMainAxisAlignment,
    CrossAxisAlignment? columnCrossAxisAlignment,
    MainAxisSize? rowMainAxisSize,
    MainAxisSize? columnMainAxisSize,
    Clip? clipBehavior,
  }) {
    final a = (this as ShadCardTheme);

    return ShadCardTheme(
      padding: padding ?? a.padding,
      backgroundColor: backgroundColor ?? a.backgroundColor,
      radius: radius ?? a.radius,
      border: border ?? a.border,
      shadows: shadows ?? a.shadows,
      width: width ?? a.width,
      height: height ?? a.height,
      rowMainAxisAlignment: rowMainAxisAlignment ?? a.rowMainAxisAlignment,
      rowCrossAxisAlignment: rowCrossAxisAlignment ?? a.rowCrossAxisAlignment,
      columnMainAxisAlignment:
          columnMainAxisAlignment ?? a.columnMainAxisAlignment,
      columnCrossAxisAlignment:
          columnCrossAxisAlignment ?? a.columnCrossAxisAlignment,
      rowMainAxisSize: rowMainAxisSize ?? a.rowMainAxisSize,
      columnMainAxisSize: columnMainAxisSize ?? a.columnMainAxisSize,
      clipBehavior: clipBehavior ?? a.clipBehavior,
    );
  }

  ShadCardTheme merge(ShadCardTheme? other) {
    final current = (this as ShadCardTheme);

    if (other == null) {
      return current;
    }

    if (!other.canMerge) {
      return other;
    }

    return copyWith(
      padding: other.padding,
      backgroundColor: other.backgroundColor,
      radius: other.radius,
      border: current.border?.merge(other.border) ?? other.border,
      shadows: other.shadows,
      width: other.width,
      height: other.height,
      rowMainAxisAlignment: other.rowMainAxisAlignment,
      rowCrossAxisAlignment: other.rowCrossAxisAlignment,
      columnMainAxisAlignment: other.columnMainAxisAlignment,
      columnCrossAxisAlignment: other.columnCrossAxisAlignment,
      rowMainAxisSize: other.rowMainAxisSize,
      columnMainAxisSize: other.columnMainAxisSize,
      clipBehavior: other.clipBehavior,
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

    final value = (this as ShadCardTheme);

    return other is ShadCardTheme &&
        other.padding == value.padding &&
        other.backgroundColor == value.backgroundColor &&
        other.radius == value.radius &&
        other.border == value.border &&
        other.shadows == value.shadows &&
        other.width == value.width &&
        other.height == value.height &&
        other.rowMainAxisAlignment == value.rowMainAxisAlignment &&
        other.rowCrossAxisAlignment == value.rowCrossAxisAlignment &&
        other.columnMainAxisAlignment == value.columnMainAxisAlignment &&
        other.columnCrossAxisAlignment == value.columnCrossAxisAlignment &&
        other.rowMainAxisSize == value.rowMainAxisSize &&
        other.columnMainAxisSize == value.columnMainAxisSize &&
        other.clipBehavior == value.clipBehavior;
  }

  @override
  int get hashCode {
    final value = (this as ShadCardTheme);

    return Object.hash(
      runtimeType,
      value.padding,
      value.backgroundColor,
      value.radius,
      value.border,
      value.shadows,
      value.width,
      value.height,
      value.rowMainAxisAlignment,
      value.rowCrossAxisAlignment,
      value.columnMainAxisAlignment,
      value.columnCrossAxisAlignment,
      value.rowMainAxisSize,
      value.columnMainAxisSize,
      value.clipBehavior,
    );
  }
}
