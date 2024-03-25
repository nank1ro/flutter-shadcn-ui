import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

@immutable
class ShadCardTheme {
  const ShadCardTheme({
    this.merge = true,
    this.backgroundColor,
    this.padding,
    this.radius,
    this.border,
    this.shadows,
    this.width,
    this.height,
    this.rowMainAxisAlignment,
    this.rowCrossAxisAlignment,
    this.columnMainAxisAlignment,
    this.columnCrossAxisAlignment,
    this.rowMainAxisSize,
    this.columnMainAxisSize,
  });

  final bool merge;
  final EdgeInsets? padding;
  final Color? backgroundColor;
  final BorderRadius? radius;
  final Border? border;
  final List<BoxShadow>? shadows;
  final double? width;
  final double? height;
  final MainAxisAlignment? rowMainAxisAlignment;
  final CrossAxisAlignment? rowCrossAxisAlignment;
  final MainAxisAlignment? columnMainAxisAlignment;
  final CrossAxisAlignment? columnCrossAxisAlignment;
  final MainAxisSize? rowMainAxisSize;
  final MainAxisSize? columnMainAxisSize;

  static ShadCardTheme lerp(
    ShadCardTheme a,
    ShadCardTheme b,
    double t,
  ) {
    if (identical(a, b)) return a;
    return ShadCardTheme(
      merge: b.merge,
      backgroundColor: Color.lerp(a.backgroundColor, b.backgroundColor, t),
      padding: EdgeInsets.lerp(a.padding, b.padding, t),
      radius: BorderRadius.lerp(a.radius, b.radius, t),
      border: Border.lerp(a.border, b.border, t),
      shadows: b.shadows,
      width: lerpDouble(a.width, b.width, t),
      height: lerpDouble(a.height, b.height, t),
      rowMainAxisAlignment: b.rowMainAxisAlignment,
      rowCrossAxisAlignment: b.rowCrossAxisAlignment,
      columnMainAxisAlignment: b.columnMainAxisAlignment,
      columnCrossAxisAlignment: b.columnCrossAxisAlignment,
      rowMainAxisSize: b.rowMainAxisSize,
      columnMainAxisSize: b.columnMainAxisSize,
    );
  }

  ShadCardTheme copyWith({
    bool? merge,
    Color? backgroundColor,
    EdgeInsets? padding,
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
  }) {
    return ShadCardTheme(
      merge: merge ?? this.merge,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      padding: padding ?? this.padding,
      radius: radius ?? this.radius,
      border: border ?? this.border,
      shadows: shadows ?? this.shadows,
      width: width ?? this.width,
      height: height ?? this.height,
      rowMainAxisAlignment: rowMainAxisAlignment ?? this.rowMainAxisAlignment,
      rowCrossAxisAlignment:
          rowCrossAxisAlignment ?? this.rowCrossAxisAlignment,
      columnMainAxisAlignment:
          columnMainAxisAlignment ?? this.columnMainAxisAlignment,
      columnCrossAxisAlignment:
          columnCrossAxisAlignment ?? this.columnCrossAxisAlignment,
      rowMainAxisSize: rowMainAxisSize ?? this.rowMainAxisSize,
      columnMainAxisSize: columnMainAxisSize ?? this.columnMainAxisSize,
    );
  }

  ShadCardTheme mergeWith(ShadCardTheme? other) {
    if (other == null) return this;
    if (!other.merge) return other;
    return copyWith(
      backgroundColor: other.backgroundColor,
      padding: other.padding,
      radius: other.radius,
      border: other.border,
      shadows: other.shadows,
      width: other.width,
      height: other.height,
      rowMainAxisAlignment: other.rowMainAxisAlignment,
      rowCrossAxisAlignment: other.rowCrossAxisAlignment,
      columnMainAxisAlignment: other.columnMainAxisAlignment,
      columnCrossAxisAlignment: other.columnCrossAxisAlignment,
      rowMainAxisSize: other.rowMainAxisSize,
      columnMainAxisSize: other.columnMainAxisSize,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShadCardTheme &&
        other.merge == merge &&
        other.padding == padding &&
        other.backgroundColor == backgroundColor &&
        other.radius == radius &&
        other.border == border &&
        listEquals(other.shadows, shadows) &&
        other.width == width &&
        other.height == height &&
        other.rowMainAxisAlignment == rowMainAxisAlignment &&
        other.rowCrossAxisAlignment == rowCrossAxisAlignment &&
        other.columnMainAxisAlignment == columnMainAxisAlignment &&
        other.columnCrossAxisAlignment == columnCrossAxisAlignment &&
        other.rowMainAxisSize == rowMainAxisSize &&
        other.columnMainAxisSize == columnMainAxisSize;
  }

  @override
  int get hashCode {
    return merge.hashCode ^
        padding.hashCode ^
        backgroundColor.hashCode ^
        radius.hashCode ^
        border.hashCode ^
        shadows.hashCode ^
        width.hashCode ^
        height.hashCode ^
        rowMainAxisAlignment.hashCode ^
        rowCrossAxisAlignment.hashCode ^
        columnMainAxisAlignment.hashCode ^
        columnCrossAxisAlignment.hashCode ^
        rowMainAxisSize.hashCode ^
        columnMainAxisSize.hashCode;
  }
}
