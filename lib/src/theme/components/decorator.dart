import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shadcn_ui/src/theme/theme.dart';

@immutable
class ShadBorder {
  const ShadBorder({
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

  static ShadBorder lerp(
    ShadBorder? a,
    ShadBorder? b,
    double t,
  ) {
    return ShadBorder(
      width: lerpDouble(a?.width, b?.width, t),
      color: Color.lerp(a?.color, b?.color, t),
      radius: BorderRadiusGeometry.lerp(a?.radius, b?.radius, t),
      padding: EdgeInsets.lerp(a?.padding, b?.padding, t),
    );
  }

  ShadBorder copyWith({
    double? width,
    Color? color,
    BorderRadiusGeometry? radius,
    EdgeInsets? padding,
  }) {
    return ShadBorder(
      width: width ?? this.width,
      color: color ?? this.color,
      radius: radius ?? this.radius,
      padding: padding ?? this.padding,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShadBorder &&
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
class ShadDecorationTheme {
  const ShadDecorationTheme({
    this.merge = true,
    this.border,
    this.focusedBorder,
  });

  final bool merge;
  final ShadBorder? border;
  final ShadBorder? focusedBorder;

  static ShadDecorationTheme lerp(
    ShadDecorationTheme? a,
    ShadDecorationTheme? b,
    double t,
  ) {
    return ShadDecorationTheme(
      border: ShadBorder.lerp(a?.border, b?.border, t),
      focusedBorder: ShadBorder.lerp(a?.focusedBorder, b?.focusedBorder, t),
    );
  }

  ShadDecorationTheme mergeWith(ShadDecorationTheme? other) {
    if (other == null) return this;
    if (!other.merge) return other;
    return copyWith(
      border: other.border ?? border,
      focusedBorder: other.focusedBorder ?? focusedBorder,
    );
  }

  ShadDecorationTheme copyWith({
    ShadBorder? border,
    ShadBorder? focusedBorder,
  }) {
    return ShadDecorationTheme(
      border: border ?? this.border,
      focusedBorder: focusedBorder ?? this.focusedBorder,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShadDecorationTheme &&
        other.border == border &&
        other.focusedBorder == focusedBorder;
  }

  @override
  int get hashCode => border.hashCode ^ focusedBorder.hashCode;
}

class ShadDecorator extends StatelessWidget {
  const ShadDecorator({
    super.key,
    required this.child,
    this.decoration,
    this.focused = false,
  });

  /// The child to decorate.
  final Widget child;

  /// The decoration to apply to the child.
  final ShadDecorationTheme? decoration;

  /// Whether the child has focus, defaults to false.
  final bool focused;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final effectiveDecoration = decoration ?? theme.decoration;
    final border = focused
        ? effectiveDecoration.focusedBorder
        : effectiveDecoration.border;

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
