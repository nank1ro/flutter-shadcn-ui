import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/components/button.dart';
import 'package:shadcn_ui/src/raw_components/portal.dart';

import 'package:shadcn_ui/src/theme/components/decorator.dart';

@immutable
class ShadContextMenuTheme {
  const ShadContextMenuTheme({
    this.merge = true,
    this.constraints,
    this.padding,
    this.leadingPadding,
    this.trailingPadding,
    this.itemPadding,
    this.insetPadding,
    this.anchor,
    this.showDelay,
    this.height,
    this.buttonVariant,
    this.decoration,
    this.textStyle,
    this.trailingTextStyle,
    this.itemConstraints,
    this.subMenuPadding,
    this.backgroundColor,
    this.selectedBackgroundColor,
  });

  final bool merge;

  /// {@macro ShadContextMenu.constraints}
  final BoxConstraints? constraints;

  /// {@macro ShadContextMenu.padding}
  final EdgeInsetsGeometry? padding;

  /// {@macro ShadContextMenuItem.leadingPadding}
  final EdgeInsetsGeometry? leadingPadding;

  /// {@macro ShadContextMenuItem.trailingPadding}
  final EdgeInsetsGeometry? trailingPadding;

  /// {@macro ShadContextMenuItem.padding}
  final EdgeInsetsGeometry? itemPadding;

  /// {@macro ShadContextMenuItem.insetPadding}
  final EdgeInsetsGeometry? insetPadding;

  /// {@macro ShadContextMenuItem.anchor}
  final ShadAnchorBase? anchor;

  /// {@macro ShadContextMenuItem.showDelay}
  final Duration? showDelay;

  /// {@macro ShadContextMenuItem.height}
  final double? height;

  /// {@macro ShadContextMenuItem.buttonVariant}
  final ShadButtonVariant? buttonVariant;

  /// {@macro ShadContextMenuItem.decoration}
  final ShadDecoration? decoration;

  /// {@macro ShadContextMenuItem.textStyle}
  final TextStyle? textStyle;

  /// {@macro ShadContextMenuItem.trailingTextStyle}
  final TextStyle? trailingTextStyle;

  /// {@macro ShadContextMenu.constraints}
  final BoxConstraints? itemConstraints;

  /// {@macro ShadContextMenu.padding}
  final EdgeInsetsGeometry? subMenuPadding;

  /// {@macro ShadContextMenuItem.backgroundColor}
  final Color? backgroundColor;

  /// {@macro ShadContextMenuItem.selectedBackgroundColor}
  final Color? selectedBackgroundColor;

  static ShadContextMenuTheme lerp(
    ShadContextMenuTheme a,
    ShadContextMenuTheme b,
    double t,
  ) {
    if (identical(a, b)) return a;
    return ShadContextMenuTheme(
      merge: b.merge,
      constraints: BoxConstraints.lerp(a.constraints, b.constraints, t),
      padding: EdgeInsetsGeometry.lerp(a.padding, b.padding, t),
      leadingPadding:
          EdgeInsetsGeometry.lerp(a.leadingPadding, b.leadingPadding, t),
      trailingPadding:
          EdgeInsetsGeometry.lerp(a.trailingPadding, b.trailingPadding, t),
      itemPadding: EdgeInsetsGeometry.lerp(a.itemPadding, b.itemPadding, t),
      insetPadding: EdgeInsetsGeometry.lerp(a.insetPadding, b.insetPadding, t),
      anchor: t < .5 ? a.anchor : b.anchor,
      showDelay: b.showDelay,
      height: lerpDouble(a.height, b.height, t),
      buttonVariant: t < .5 ? a.buttonVariant : b.buttonVariant,
      decoration: ShadDecoration.lerp(a.decoration, b.decoration, t),
      textStyle: TextStyle.lerp(a.textStyle, b.textStyle, t),
      trailingTextStyle:
          TextStyle.lerp(a.trailingTextStyle, b.trailingTextStyle, t),
      itemConstraints:
          BoxConstraints.lerp(a.itemConstraints, b.itemConstraints, t),
      subMenuPadding:
          EdgeInsetsGeometry.lerp(a.subMenuPadding, b.subMenuPadding, t),
      backgroundColor: Color.lerp(a.backgroundColor, b.backgroundColor, t),
      selectedBackgroundColor:
          Color.lerp(a.selectedBackgroundColor, b.selectedBackgroundColor, t),
    );
  }

  ShadContextMenuTheme copyWith({
    bool? merge,
    BoxConstraints? constraints,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? leadingPadding,
    EdgeInsetsGeometry? trailingPadding,
    EdgeInsetsGeometry? itemPadding,
    EdgeInsetsGeometry? insetPadding,
    ShadAnchorBase? anchor,
    Duration? showDelay,
    double? height,
    ShadButtonVariant? buttonVariant,
    ShadDecoration? decoration,
    TextStyle? textStyle,
    TextStyle? trailingTextStyle,
    BoxConstraints? itemConstraints,
    EdgeInsetsGeometry? subMenuPadding,
    Color? backgroundColor,
    Color? selectedBackgroundColor,
  }) {
    return ShadContextMenuTheme(
      merge: merge ?? this.merge,
      constraints: constraints ?? this.constraints,
      padding: padding ?? this.padding,
      leadingPadding: leadingPadding ?? this.leadingPadding,
      trailingPadding: trailingPadding ?? this.trailingPadding,
      itemPadding: itemPadding ?? this.itemPadding,
      insetPadding: insetPadding ?? this.insetPadding,
      anchor: anchor ?? this.anchor,
      showDelay: showDelay ?? this.showDelay,
      height: height ?? this.height,
      buttonVariant: buttonVariant ?? this.buttonVariant,
      decoration: decoration ?? this.decoration,
      textStyle: textStyle ?? this.textStyle,
      trailingTextStyle: trailingTextStyle ?? this.trailingTextStyle,
      itemConstraints: itemConstraints ?? this.itemConstraints,
      subMenuPadding: subMenuPadding ?? this.subMenuPadding,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      selectedBackgroundColor:
          selectedBackgroundColor ?? this.selectedBackgroundColor,
    );
  }

  ShadContextMenuTheme mergeWith(ShadContextMenuTheme? other) {
    if (other == null) return this;
    if (!other.merge) return other;
    return copyWith(
      constraints: other.constraints,
      padding: other.padding,
      leadingPadding: other.leadingPadding,
      trailingPadding: other.trailingPadding,
      itemPadding: other.itemPadding,
      insetPadding: other.insetPadding,
      anchor: other.anchor,
      showDelay: other.showDelay,
      height: other.height,
      buttonVariant: other.buttonVariant,
      decoration: decoration?.mergeWith(other.decoration) ?? other.decoration,
      textStyle: other.textStyle,
      trailingTextStyle: other.trailingTextStyle,
      itemConstraints: other.itemConstraints,
      subMenuPadding: other.subMenuPadding,
      backgroundColor: other.backgroundColor,
      selectedBackgroundColor: other.selectedBackgroundColor,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShadContextMenuTheme &&
        other.merge == merge &&
        other.constraints == constraints &&
        other.padding == padding &&
        other.leadingPadding == leadingPadding &&
        other.trailingPadding == trailingPadding &&
        other.itemPadding == itemPadding &&
        other.insetPadding == insetPadding &&
        other.anchor == anchor &&
        other.showDelay == showDelay &&
        other.height == height &&
        other.buttonVariant == buttonVariant &&
        other.decoration == decoration &&
        other.textStyle == textStyle &&
        other.trailingTextStyle == trailingTextStyle &&
        other.itemConstraints == itemConstraints &&
        other.subMenuPadding == subMenuPadding &&
        other.backgroundColor == backgroundColor &&
        other.selectedBackgroundColor == selectedBackgroundColor;
  }

  @override
  int get hashCode {
    return merge.hashCode ^
        constraints.hashCode ^
        padding.hashCode ^
        leadingPadding.hashCode ^
        trailingPadding.hashCode ^
        itemPadding.hashCode ^
        insetPadding.hashCode ^
        anchor.hashCode ^
        showDelay.hashCode ^
        height.hashCode ^
        buttonVariant.hashCode ^
        decoration.hashCode ^
        textStyle.hashCode ^
        trailingTextStyle.hashCode ^
        itemConstraints.hashCode ^
        subMenuPadding.hashCode ^
        backgroundColor.hashCode ^
        selectedBackgroundColor.hashCode;
  }
}
