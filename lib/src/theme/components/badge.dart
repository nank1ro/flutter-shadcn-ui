import 'package:flutter/widgets.dart';

@immutable
class ShadBadgeTheme {
  const ShadBadgeTheme({
    this.merge = true,
    this.shape,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.foregroundColor,
    this.padding,
    this.cursor,
  });

  final bool merge;

  /// {@macro ShadBadge.shape}
  final ShapeBorder? shape;

  /// {@macro ShadBadge.backgroundColor}
  final Color? backgroundColor;

  /// {@macro ShadBadge.hoverBackgroundColor}
  final Color? hoverBackgroundColor;

  /// {@macro ShadBadge.foregroundColor}
  final Color? foregroundColor;

  /// {@macro ShadBadge.padding}
  final EdgeInsets? padding;

  /// {@macro ShadBadge.cursor}
  final MouseCursor? cursor;

  static ShadBadgeTheme lerp(
    ShadBadgeTheme a,
    ShadBadgeTheme b,
    double t,
  ) {
    if (identical(a, b)) return a;
    return ShadBadgeTheme(
      merge: b.merge,
      shape: ShapeBorder.lerp(a.shape, b.shape, t),
      backgroundColor: Color.lerp(a.backgroundColor, b.backgroundColor, t),
      hoverBackgroundColor:
          Color.lerp(a.hoverBackgroundColor, b.hoverBackgroundColor, t),
      foregroundColor: Color.lerp(a.foregroundColor, b.foregroundColor, t),
      padding: EdgeInsets.lerp(a.padding, b.padding, t),
      cursor: t < 0.5 ? a.cursor : b.cursor,
    );
  }

  ShadBadgeTheme copyWith({
    bool? merge,
    ShapeBorder? shape,
    Color? backgroundColor,
    Color? hoverBackgroundColor,
    Color? foregroundColor,
    EdgeInsets? padding,
    MouseCursor? cursor,
  }) {
    return ShadBadgeTheme(
      merge: merge ?? this.merge,
      shape: shape ?? this.shape,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      hoverBackgroundColor: hoverBackgroundColor ?? this.hoverBackgroundColor,
      foregroundColor: foregroundColor ?? this.foregroundColor,
      padding: padding ?? this.padding,
      cursor: cursor ?? this.cursor,
    );
  }

  ShadBadgeTheme mergeWith(ShadBadgeTheme? other) {
    if (other == null) return this;
    if (!other.merge) return other;
    return copyWith(
      shape: other.shape,
      backgroundColor: other.backgroundColor,
      hoverBackgroundColor: other.hoverBackgroundColor,
      foregroundColor: other.foregroundColor,
      padding: other.padding,
      cursor: other.cursor,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShadBadgeTheme &&
        other.merge == merge &&
        other.shape == shape &&
        other.backgroundColor == backgroundColor &&
        other.hoverBackgroundColor == hoverBackgroundColor &&
        other.foregroundColor == foregroundColor &&
        other.padding == padding &&
        other.cursor == cursor;
  }

  @override
  int get hashCode {
    return shape.hashCode ^
        merge.hashCode ^
        backgroundColor.hashCode ^
        hoverBackgroundColor.hashCode ^
        foregroundColor.hashCode ^
        padding.hashCode ^
        cursor.hashCode;
  }
}
