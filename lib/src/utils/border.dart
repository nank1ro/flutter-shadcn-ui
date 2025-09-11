import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

extension ShadBorderSideToBorderSide on ShadBorderSide {
  BorderSide toBorderSide() {
    if (width == null || width == 0) return BorderSide.none;
    return BorderSide(
      color: color ?? Colors.transparent,
      width: width ?? 1,
      style: style ?? BorderStyle.solid,
      strokeAlign: strokeAlign ?? BorderSide.strokeAlignInside,
    );
  }
}

extension ShadBorderToBorder on ShadBorder {
  Border toBorder() {
    return Border(
      top: top?.toBorderSide() ?? BorderSide.none,
      right: right?.toBorderSide() ?? BorderSide.none,
      bottom: bottom?.toBorderSide() ?? BorderSide.none,
      left: left?.toBorderSide() ?? BorderSide.none,
    );
  }
}

/// {@template ShadBorder}
/// A wrapper around the [Border] class with a reasonable merge.
/// {@endtemplate}
class ShadBorder {
  /// {@macro ShadBorder}
  const ShadBorder({
    this.merge = true,
    this.padding,
    this.radius,
    this.top,
    this.right,
    this.bottom,
    this.left,
    this.offset,
  });

  /// Creates a border whose sides are all the same.
  const ShadBorder.fromBorderSide(
    ShadBorderSide side, {
    this.merge = true,
    this.padding,
    this.radius,
    this.offset,
  })  : top = side,
        right = side,
        bottom = side,
        left = side;

  /// Creates a border with symmetrical vertical and horizontal sides.
  ///
  /// The `vertical` argument applies to the [left] and [right] sides, and the
  /// `horizontal` argument applies to the [top] and [bottom] sides.
  const ShadBorder.symmetric({
    ShadBorderSide? vertical,
    ShadBorderSide? horizontal,
    this.merge = true,
    this.padding,
    this.radius,
    this.offset,
  })  : left = vertical,
        top = horizontal,
        right = vertical,
        bottom = horizontal;

  /// A uniform border with all sides the same color and width.
  ///
  /// The sides default to black solid borders, one logical pixel wide.
  factory ShadBorder.all({
    bool merge = true,
    Color? color,
    double? width,
    BorderStyle? style,
    double? strokeAlign,
    EdgeInsetsGeometry? padding,
    BorderRadiusGeometry? radius,
    double? offset,
  }) {
    final side = ShadBorderSide(
      color: color,
      width: width,
      style: style,
      strokeAlign: strokeAlign,
    );
    return ShadBorder.fromBorderSide(
      side,
      padding: padding,
      merge: merge,
      radius: radius,
      offset: offset,
    );
  }

  static ShadBorder? lerp(ShadBorder? a, ShadBorder? b, double t) {
    if (identical(a, b)) return a;
    return ShadBorder(
      merge: b?.merge ?? a?.merge ?? true,
      padding: EdgeInsetsGeometry.lerp(a?.padding, b?.padding, t),
      radius: BorderRadiusGeometry.lerp(a?.radius, b?.radius, t),
      top: ShadBorderSide.lerp(
        a?.top,
        b?.top,
        t,
      ),
      right: ShadBorderSide.lerp(
        a?.right,
        b?.right,
        t,
      ),
      bottom: ShadBorderSide.lerp(
        a?.bottom,
        b?.bottom,
        t,
      ),
      left: ShadBorderSide.lerp(
        a?.left,
        b?.left,
        t,
      ),
      offset: lerpDouble(a?.offset, b?.offset, t),
    );
  }

  bool get hasBorder =>
      (top?.width ?? 0) != 0 ||
      (right?.width ?? 0) != 0 ||
      (bottom?.width ?? 0) != 0 ||
      (left?.width ?? 0) != 0;

  static const ShadBorder none = ShadBorder(merge: false);

  /// Creates a [ShadBorder] that represents the addition of the two given
  /// [ShadBorder]s.
  ShadBorder mergeWith(ShadBorder? other) {
    if (other == null) return this;
    if (!other.merge) return other;
    if (other is ShadRoundedSuperellipseBorder) {
      return ShadRoundedSuperellipseBorder(
        side: switch (this) {
          final ShadRoundedSuperellipseBorder border =>
            border.side?.mergeWith(other.side) ?? other.side,
          _ => other.side,
        },
        radius: other.radius ?? radius,
      );
    }
    return copyWith(
      top: top?.mergeWith(other.top) ?? other.top,
      right: right?.mergeWith(other.right) ?? other.right,
      bottom: bottom?.mergeWith(other.bottom) ?? other.bottom,
      left: left?.mergeWith(other.left) ?? other.left,
      padding: other.padding,
      radius: other.radius,
      offset: other.offset,
    );
  }

  ShadBorder copyWith({
    EdgeInsetsGeometry? padding,
    ShadBorderSide? top,
    ShadBorderSide? right,
    ShadBorderSide? bottom,
    ShadBorderSide? left,
    BorderRadiusGeometry? radius,
    double? offset,
  }) {
    return ShadBorder(
      top: top ?? this.top,
      right: right ?? this.right,
      bottom: bottom ?? this.bottom,
      left: left ?? this.left,
      padding: padding ?? this.padding,
      radius: radius ?? this.radius,
      offset: offset ?? this.offset,
    );
  }

  /// Whether to merge with another border, defaults to true.
  final bool merge;

  /// The padding of the border, defaults to null.
  final EdgeInsetsGeometry? padding;

  /// The border radius of the border, defaults to null.
  final BorderRadiusGeometry? radius;

  /// The top side of this border.
  final ShadBorderSide? top;

  /// The right side of this border.
  final ShadBorderSide? right;

  final ShadBorderSide? bottom;

  /// The left side of this border.
  final ShadBorderSide? left;

  /// The offset between the border and the widget.
  ///
  /// NOTE: This is supported only by the secondaryBorder, because the border is
  /// drawn outward of the widget.
  final double? offset;

  @override
  String toString() {
    return '''ShadBorder(merge: $merge, padding: $padding, radius: $radius, top: $top, right: $right, bottom: $bottom, left: $left, offset: $offset)''';
  }
}

/// Creates the side of a border.
@immutable
class ShadBorderSide with Diagnosticable {
  /// Creates the side of a border.
  const ShadBorderSide({
    this.merge = true,
    this.color,
    this.width,
    this.style,
    this.strokeAlign,
  }) : assert(width == null || width >= 0.0);

  /// Merges two border sides into one
  ShadBorderSide mergeWith(ShadBorderSide? other) {
    if (other == null) return this;
    if (!other.merge) return other;
    return copyWith(
      color: other.color,
      width: other.width,
      style: other.style,
      strokeAlign: other.strokeAlign,
    );
  }

  /// Whether to merge the border side
  final bool merge;

  /// The color of this side of the border.
  final Color? color;

  /// The width of this side of the border, in logical pixels.
  ///
  /// Setting width to 0.0 will result in a hairline border. This means that
  /// the border will have the width of one physical pixel. Hairline
  /// rendering takes shortcuts when the path overlaps a pixel more than once.
  /// This means that it will render faster than otherwise, but it might
  /// double-hit pixels, giving it a slightly darker/lighter result.
  final double? width;

  /// The style of this side of the border.
  final BorderStyle? style;

  /// A hairline black border that is not rendered.
  static const ShadBorderSide none = ShadBorderSide(merge: false);

  /// The relative position of the stroke on a [ShadBorderSide] in an
  /// [OutlinedBorder] or [Border].
  ///
  /// Values typically range from -1.0 ([BorderSide.strokeAlignInside], inside
  /// border, default) to 1.0 ([BorderSide.strokeAlignOutside], outside border),
  /// without any bound constraints (e.g., a value of -2.0 is not typical, but
  /// allowed).
  /// A value of 0 ([BorderSide.strokeAlignCenter]) will center the border on
  /// the edge of the widget.
  ///
  /// When set to [BorderSide.strokeAlignInside], the stroke is drawn completely
  /// inside
  /// the widget. For [BorderSide.strokeAlignCenter] and
  /// [BorderSide.strokeAlignOutside], a property
  /// such as [Container.clipBehavior] can be used in an outside widget to clip
  /// it. If [Container.decoration] has a border, the container may incorporate
  /// [width] as additional padding:
  /// - [BorderSide.strokeAlignInside] provides padding with full [width].
  /// - [BorderSide.strokeAlignCenter] provides padding with half [width].
  /// - [BorderSide.strokeAlignOutside] provides zero padding, as stroke is
  /// drawn entirely outside.
  ///
  /// This property is not honored by toPaint (because the [Paint] object
  /// cannot represent it); it is intended that classes that use
  /// [ShadBorderSide] objects implement this property when painting borders by
  /// suitably inflating or deflating their regions.
  final double? strokeAlign;

  /// Creates a copy of this border but with the given fields replaced with the
  /// new values.
  ShadBorderSide copyWith({
    bool? merge,
    Color? color,
    double? width,
    BorderStyle? style,
    double? strokeAlign,
  }) {
    return ShadBorderSide(
      merge: merge ?? this.merge,
      color: color ?? this.color,
      width: width ?? this.width,
      style: style ?? this.style,
      strokeAlign: strokeAlign ?? this.strokeAlign,
    );
  }

  static ShadBorderSide? lerp(ShadBorderSide? a, ShadBorderSide? b, double t) {
    if (identical(a, b)) return a;
    return ShadBorderSide(
      merge: b?.merge ?? a?.merge ?? true,
      color: Color.lerp(a?.color, b?.color, t),
      width: lerpDouble(a?.width, b?.width, t),
      style: t < 0.5 ? a?.style : b?.style,
      strokeAlign: lerpDouble(a?.strokeAlign, b?.strokeAlign, t),
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
    return other is ShadBorderSide &&
        other.merge == merge &&
        other.color == color &&
        other.width == width &&
        other.style == style &&
        other.strokeAlign == strokeAlign;
  }

  @override
  int get hashCode => Object.hash(merge, color, width, style, strokeAlign);

  @override
  String toStringShort() => 'ShadBorderSide';

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        DiagnosticsProperty<Color>(
          'color',
          color,
          defaultValue: const Color(0xFF000000),
        ),
      )
      ..add(
        DiagnosticsProperty<bool>(
          'merge',
          merge,
          defaultValue: true,
        ),
      );

    // ignore: cascade_invocations
    properties
      ..add(DoubleProperty('width', width, defaultValue: 1.0))
      ..add(
        DoubleProperty(
          'strokeAlign',
          strokeAlign,
          defaultValue: BorderSide.strokeAlignInside,
        ),
      )
      ..add(
        EnumProperty<BorderStyle>(
          'style',
          style,
          defaultValue: BorderStyle.solid,
        ),
      );
  }
}

extension ShadRoundedSuperellipseBorderExt on ShadRoundedSuperellipseBorder {
  ShapeBorder toBorder({
    TextDirection? textDirection,
    BorderRadius defaultRadius = BorderRadius.zero,
  }) {
    final effectiveTextDirection = textDirection ?? TextDirection.ltr;
    return RoundedSuperellipseBorder(
      side: side?.toBorderSide() ?? BorderSide.none,
      borderRadius: radius?.resolve(effectiveTextDirection) ?? defaultRadius,
    );
  }
}

/// A rectangular border with rounded corners following the shape of an
/// [RSuperellipse].
@immutable
class ShadRoundedSuperellipseBorder extends ShadBorder {
  const ShadRoundedSuperellipseBorder({
    super.merge,
    this.side,
    super.radius,
  });

  final ShadBorderSide? side;

  @override
  String toString() {
    return '''ShadRoundedSuperellipseBorder(merge: $merge, side: $side, radius: $radius)''';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShadRoundedSuperellipseBorder && other.side == side;
  }

  @override
  int get hashCode => side.hashCode | radius.hashCode | merge.hashCode;
}
