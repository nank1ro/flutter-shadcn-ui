import 'dart:ui';

import 'package:flutter/material.dart';

@immutable
class ShadcnBorder {
  const ShadcnBorder({
    this.width,
    this.color,
    this.radius,
    this.padding,
  });

  /// The width of the border, defaults to 1.0.
  final double? width;

  /// The color of the border, defaults to Colors.black.
  final Color? color;

  /// The radius of the border, defaults to null.
  final BorderRadiusGeometry? radius;

  /// The padding of the border, defaults to null.
  final EdgeInsets? padding;

  static ShadcnBorder lerp(
    ShadcnBorder? a,
    ShadcnBorder? b,
    double t,
  ) {
    return ShadcnBorder(
      width: lerpDouble(a?.width, b?.width, t),
      color: Color.lerp(a?.color, b?.color, t),
      radius: BorderRadiusGeometry.lerp(a?.radius, b?.radius, t),
      padding: EdgeInsets.lerp(a?.padding, b?.padding, t),
    );
  }

  ShadcnBorder copyWith({
    double? width,
    Color? color,
    BorderRadiusGeometry? radius,
    EdgeInsets? padding,
  }) {
    return ShadcnBorder(
      width: width ?? this.width,
      color: color ?? this.color,
      radius: radius ?? this.radius,
      padding: padding ?? this.padding,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShadcnBorder &&
        other.width == width &&
        other.color == color &&
        other.radius == radius &&
        other.padding == padding;
  }

  @override
  int get hashCode {
    return width.hashCode ^ color.hashCode ^ radius.hashCode ^ padding.hashCode;
  }
}

@immutable
class ShadcnDecorationTheme {
  const ShadcnDecorationTheme({
    this.merge = true,
    this.border,
    this.focusedBorder,
  });

  final bool merge;
  final ShadcnBorder? border;
  final ShadcnBorder? focusedBorder;

  static ShadcnDecorationTheme lerp(
    ShadcnDecorationTheme? a,
    ShadcnDecorationTheme? b,
    double t,
  ) {
    return ShadcnDecorationTheme(
      border: ShadcnBorder.lerp(a?.border, b?.border, t),
      focusedBorder: ShadcnBorder.lerp(a?.focusedBorder, b?.focusedBorder, t),
    );
  }

  ShadcnDecorationTheme mergeWith(ShadcnDecorationTheme? other) {
    if (other == null) return this;
    if (!other.merge) return other;
    return copyWith(
      border: other.border ?? border,
      focusedBorder: other.focusedBorder ?? focusedBorder,
    );
  }

  ShadcnDecorationTheme copyWith({
    ShadcnBorder? border,
    ShadcnBorder? focusedBorder,
  }) {
    return ShadcnDecorationTheme(
      border: border ?? this.border,
      focusedBorder: focusedBorder ?? this.focusedBorder,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShadcnDecorationTheme &&
        other.border == border &&
        other.focusedBorder == focusedBorder;
  }

  @override
  int get hashCode => border.hashCode ^ focusedBorder.hashCode;
}

class ShadcnDecorator extends StatelessWidget {
  const ShadcnDecorator({
    super.key,
    required this.child,
    required this.decoration,
    this.focused = false,
  });

  /// The child to decorate.
  final Widget child;

  /// The decoration to apply to the child.
  final ShadcnDecorationTheme decoration;

  /// Whether the child has focus, defaults to false.
  final bool focused;

  @override
  Widget build(BuildContext context) {
    final border = focused ? decoration.focusedBorder : decoration.border;

    return Container(
      decoration: BoxDecoration(
        border: border?.width == null && border?.color == null
            ? null
            : Border.all(
                color: border?.color ?? Colors.black,
                width: border?.width ?? 1.0,
              ),
        borderRadius: border?.radius,
      ),
      padding: border?.padding,
      child: child,
    );
  }
}
