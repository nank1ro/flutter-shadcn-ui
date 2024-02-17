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
class ShadDecoration {
  const ShadDecoration({
    this.merge = true,
    this.border,
    this.focusedBorder,
    this.labelStyle,
    this.errorLabelStyle,
    this.errorStyle,
    this.descriptionStyle,
    this.labelPadding,
    this.placeholderStyle,
    this.descriptionPadding,
    this.errorPadding,
  });

  final bool merge;
  final TextStyle? labelStyle;
  final TextStyle? errorLabelStyle;
  final ShadBorder? border;
  final ShadBorder? focusedBorder;
  final TextStyle? errorStyle;
  final TextStyle? placeholderStyle;
  final TextStyle? descriptionStyle;
  final EdgeInsets? labelPadding;
  final EdgeInsets? descriptionPadding;
  final EdgeInsets? errorPadding;

  static ShadDecoration lerp(
    ShadDecoration? a,
    ShadDecoration? b,
    double t,
  ) {
    return ShadDecoration(
      border: ShadBorder.lerp(a?.border, b?.border, t),
      focusedBorder: ShadBorder.lerp(a?.focusedBorder, b?.focusedBorder, t),
      labelStyle: TextStyle.lerp(a?.labelStyle, b?.labelStyle, t),
      errorLabelStyle:
          TextStyle.lerp(a?.errorLabelStyle, b?.errorLabelStyle, t),
      errorStyle: TextStyle.lerp(a?.errorStyle, b?.errorStyle, t),
      descriptionStyle:
          TextStyle.lerp(a?.descriptionStyle, b?.descriptionStyle, t),
      labelPadding: EdgeInsets.lerp(a?.labelPadding, b?.labelPadding, t),
      descriptionPadding:
          EdgeInsets.lerp(a?.descriptionPadding, b?.descriptionPadding, t),
      errorPadding: EdgeInsets.lerp(a?.errorPadding, b?.errorPadding, t),
      placeholderStyle:
          TextStyle.lerp(a?.placeholderStyle, b?.placeholderStyle, t),
    );
  }

  ShadDecoration mergeWith(ShadDecoration? other) {
    if (other == null) return this;
    if (!other.merge) return other;
    return copyWith(
      border: other.border ?? border,
      focusedBorder: other.focusedBorder ?? focusedBorder,
      labelStyle: other.labelStyle ?? labelStyle,
      errorLabelStyle: other.errorLabelStyle ?? errorLabelStyle,
      errorStyle: other.errorStyle ?? errorStyle,
      descriptionStyle: other.descriptionStyle ?? descriptionStyle,
      labelPadding: other.labelPadding ?? labelPadding,
      descriptionPadding: other.descriptionPadding ?? descriptionPadding,
      errorPadding: other.errorPadding ?? errorPadding,
      placeholderStyle: other.placeholderStyle ?? placeholderStyle,
    );
  }

  ShadDecoration copyWith({
    ShadBorder? border,
    ShadBorder? focusedBorder,
    TextStyle? labelStyle,
    TextStyle? errorLabelStyle,
    TextStyle? errorStyle,
    TextStyle? descriptionStyle,
    EdgeInsets? labelPadding,
    EdgeInsets? descriptionPadding,
    EdgeInsets? errorPadding,
    TextStyle? placeholderStyle,
  }) {
    return ShadDecoration(
      border: border ?? this.border,
      focusedBorder: focusedBorder ?? this.focusedBorder,
      labelStyle: labelStyle ?? this.labelStyle,
      errorLabelStyle: errorLabelStyle ?? this.errorLabelStyle,
      errorStyle: errorStyle ?? this.errorStyle,
      descriptionStyle: descriptionStyle ?? this.descriptionStyle,
      labelPadding: labelPadding ?? this.labelPadding,
      descriptionPadding: descriptionPadding ?? this.descriptionPadding,
      errorPadding: errorPadding ?? this.errorPadding,
      placeholderStyle: placeholderStyle ?? this.placeholderStyle,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShadDecoration &&
        other.border == border &&
        other.focusedBorder == focusedBorder &&
        other.labelStyle == labelStyle &&
        other.errorLabelStyle == errorLabelStyle &&
        other.errorStyle == errorStyle &&
        other.descriptionStyle == descriptionStyle &&
        other.labelPadding == labelPadding &&
        other.descriptionPadding == descriptionPadding &&
        other.errorPadding == errorPadding &&
        other.placeholderStyle == placeholderStyle;
  }

  @override
  int get hashCode =>
      border.hashCode ^
      focusedBorder.hashCode ^
      labelStyle.hashCode ^
      errorLabelStyle.hashCode ^
      errorStyle.hashCode ^
      descriptionStyle.hashCode ^
      labelPadding.hashCode ^
      descriptionPadding.hashCode ^
      errorPadding.hashCode ^
      placeholderStyle.hashCode;
}

class ShadDecorator extends StatelessWidget {
  const ShadDecorator({
    super.key,
    required this.child,
    this.decoration,
    this.hasError = false,
    this.focused = false,
    this.isEmpty = false,
    this.label,
    this.error,
    this.description,
    this.placeholder,
  });

  /// The child to decorate.
  final Widget child;

  /// The decoration to apply to the child.
  final ShadDecoration? decoration;

  /// Whether the child has focus, defaults to false.
  final bool focused;

  final bool isEmpty;

  final bool hasError;

  final Widget? label;

  final Widget? error;
  final Widget? description;
  final Widget? placeholder;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final effectiveDecoration = decoration ?? theme.decoration;
    final border = focused
        ? effectiveDecoration.focusedBorder
        : effectiveDecoration.border;

    final TextStyle effectiveLabelStyle;
    final effectiveErrorStyle = effectiveDecoration.errorStyle ??
        theme.textTheme.muted.copyWith(
          fontWeight: FontWeight.w500,
          color: theme.colorScheme.destructive,
        );

    if (!hasError) {
      effectiveLabelStyle = effectiveDecoration.labelStyle ??
          theme.textTheme.muted.copyWith(
            fontWeight: FontWeight.w500,
            color: theme.colorScheme.foreground,
          );
    } else {
      effectiveLabelStyle = effectiveDecoration.errorLabelStyle ??
          theme.textTheme.muted.copyWith(
            fontWeight: FontWeight.w500,
            color: theme.colorScheme.destructive,
          );
    }

    final effectivePlaceholderStyle =
        effectiveDecoration.placeholderStyle ?? theme.textTheme.muted;

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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null)
            Padding(
              padding: effectiveDecoration.labelPadding ??
                  const EdgeInsets.only(bottom: 8),
              child: DefaultTextStyle(
                style: effectiveLabelStyle,
                child: label!,
              ),
            ),
          Stack(
            children: [
              if (isEmpty && placeholder != null)
                DefaultTextStyle(
                  style: effectivePlaceholderStyle,
                  child: placeholder!,
                ),
              child,
            ],
          ),
          if (description != null)
            Padding(
              padding: effectiveDecoration.descriptionPadding ??
                  const EdgeInsets.only(top: 8),
              child: DefaultTextStyle(
                style: effectiveDecoration.descriptionStyle ??
                    theme.textTheme.muted,
                child: description!,
              ),
            ),
          if (error != null)
            Padding(
              padding: effectiveDecoration.errorPadding ??
                  const EdgeInsets.only(top: 8),
              child: DefaultTextStyle(
                style: effectiveErrorStyle,
                child: error!,
              ),
            ),
        ],
      ),
    );
  }
}
