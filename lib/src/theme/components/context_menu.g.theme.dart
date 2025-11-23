// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'context_menu.dart';

// **************************************************************************
// ThemeGenGenerator
// **************************************************************************

mixin _$ShadContextMenuTheme {
  bool get canMerge => true;

  static ShadContextMenuTheme? lerp(
    ShadContextMenuTheme? a,
    ShadContextMenuTheme? b,
    double t,
  ) {
    if (a == null && b == null) {
      return null;
    }

    return ShadContextMenuTheme(
      popoverReverseDuration: lerpDuration$(
        a?.popoverReverseDuration,
        b?.popoverReverseDuration,
        t,
      ),
      constraints: BoxConstraints.lerp(a?.constraints, b?.constraints, t),
      padding: EdgeInsetsGeometry.lerp(a?.padding, b?.padding, t),
      leadingPadding: EdgeInsetsGeometry.lerp(
        a?.leadingPadding,
        b?.leadingPadding,
        t,
      ),
      trailingPadding: EdgeInsetsGeometry.lerp(
        a?.trailingPadding,
        b?.trailingPadding,
        t,
      ),
      itemPadding: EdgeInsetsGeometry.lerp(a?.itemPadding, b?.itemPadding, t),
      insetPadding: EdgeInsetsGeometry.lerp(
        a?.insetPadding,
        b?.insetPadding,
        t,
      ),
      anchor: t < 0.5 ? a?.anchor : b?.anchor,
      showDelay: lerpDuration$(a?.showDelay, b?.showDelay, t),
      height: lerpDouble$(a?.height, b?.height, t),
      buttonVariant: t < 0.5 ? a?.buttonVariant : b?.buttonVariant,
      itemDecoration: ShadDecoration.lerp(
        a?.itemDecoration,
        b?.itemDecoration,
        t,
      ),
      textStyle: TextStyle.lerp(a?.textStyle, b?.textStyle, t),
      trailingTextStyle: TextStyle.lerp(
        a?.trailingTextStyle,
        b?.trailingTextStyle,
        t,
      ),
      itemConstraints: BoxConstraints.lerp(
        a?.itemConstraints,
        b?.itemConstraints,
        t,
      ),
      subMenuPadding: EdgeInsetsGeometry.lerp(
        a?.subMenuPadding,
        b?.subMenuPadding,
        t,
      ),
      backgroundColor: Color.lerp(a?.backgroundColor, b?.backgroundColor, t),
      selectedBackgroundColor: Color.lerp(
        a?.selectedBackgroundColor,
        b?.selectedBackgroundColor,
        t,
      ),
      closeOnTap: t < 0.5 ? a?.closeOnTap : b?.closeOnTap,
      effects: t < 0.5 ? a?.effects : b?.effects,
      shadows: t < 0.5 ? a?.shadows : b?.shadows,
      decoration: ShadDecoration.lerp(a?.decoration, b?.decoration, t),
      filter: t < 0.5 ? a?.filter : b?.filter,
    );
  }

  ShadContextMenuTheme copyWith({
    Duration? popoverReverseDuration,
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
    ShadDecoration? itemDecoration,
    TextStyle? textStyle,
    TextStyle? trailingTextStyle,
    BoxConstraints? itemConstraints,
    EdgeInsetsGeometry? subMenuPadding,
    Color? backgroundColor,
    Color? selectedBackgroundColor,
    bool? closeOnTap,
    List<Effect<dynamic>>? effects,
    List<BoxShadow>? shadows,
    ShadDecoration? decoration,
    ImageFilter? filter,
  }) {
    final a = (this as ShadContextMenuTheme);

    return ShadContextMenuTheme(
      popoverReverseDuration:
          popoverReverseDuration ?? a.popoverReverseDuration,
      constraints: constraints ?? a.constraints,
      padding: padding ?? a.padding,
      leadingPadding: leadingPadding ?? a.leadingPadding,
      trailingPadding: trailingPadding ?? a.trailingPadding,
      itemPadding: itemPadding ?? a.itemPadding,
      insetPadding: insetPadding ?? a.insetPadding,
      anchor: anchor ?? a.anchor,
      showDelay: showDelay ?? a.showDelay,
      height: height ?? a.height,
      buttonVariant: buttonVariant ?? a.buttonVariant,
      itemDecoration: itemDecoration ?? a.itemDecoration,
      textStyle: textStyle ?? a.textStyle,
      trailingTextStyle: trailingTextStyle ?? a.trailingTextStyle,
      itemConstraints: itemConstraints ?? a.itemConstraints,
      subMenuPadding: subMenuPadding ?? a.subMenuPadding,
      backgroundColor: backgroundColor ?? a.backgroundColor,
      selectedBackgroundColor:
          selectedBackgroundColor ?? a.selectedBackgroundColor,
      closeOnTap: closeOnTap ?? a.closeOnTap,
      effects: effects ?? a.effects,
      shadows: shadows ?? a.shadows,
      decoration: decoration ?? a.decoration,
      filter: filter ?? a.filter,
    );
  }

  ShadContextMenuTheme merge(ShadContextMenuTheme? other) {
    final current = (this as ShadContextMenuTheme);

    if (other == null) {
      return current;
    }

    if (!other.canMerge) {
      return other;
    }

    return copyWith(
      popoverReverseDuration: other.popoverReverseDuration,
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
      itemDecoration:
          current.itemDecoration?.merge(other.itemDecoration) ??
          other.itemDecoration,
      textStyle: current.textStyle?.merge(other.textStyle) ?? other.textStyle,
      trailingTextStyle:
          current.trailingTextStyle?.merge(other.trailingTextStyle) ??
          other.trailingTextStyle,
      itemConstraints: other.itemConstraints,
      subMenuPadding: other.subMenuPadding,
      backgroundColor: other.backgroundColor,
      selectedBackgroundColor: other.selectedBackgroundColor,
      closeOnTap: other.closeOnTap,
      effects: other.effects,
      shadows: other.shadows,
      decoration:
          current.decoration?.merge(other.decoration) ?? other.decoration,
      filter: other.filter,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    if (other is! ShadContextMenuTheme) {
      return false;
    }

    final value = (this as ShadContextMenuTheme);

    return other.popoverReverseDuration == value.popoverReverseDuration &&
        other.constraints == value.constraints &&
        other.padding == value.padding &&
        other.leadingPadding == value.leadingPadding &&
        other.trailingPadding == value.trailingPadding &&
        other.itemPadding == value.itemPadding &&
        other.insetPadding == value.insetPadding &&
        other.anchor == value.anchor &&
        other.showDelay == value.showDelay &&
        other.height == value.height &&
        other.buttonVariant == value.buttonVariant &&
        other.itemDecoration == value.itemDecoration &&
        other.textStyle == value.textStyle &&
        other.trailingTextStyle == value.trailingTextStyle &&
        other.itemConstraints == value.itemConstraints &&
        other.subMenuPadding == value.subMenuPadding &&
        other.backgroundColor == value.backgroundColor &&
        other.selectedBackgroundColor == value.selectedBackgroundColor &&
        other.closeOnTap == value.closeOnTap &&
        other.effects == value.effects &&
        other.shadows == value.shadows &&
        other.decoration == value.decoration &&
        other.filter == value.filter;
  }

  @override
  int get hashCode {
    final value = (this as ShadContextMenuTheme);

    return Object.hashAll([
      runtimeType,
      value.popoverReverseDuration,
      value.constraints,
      value.padding,
      value.leadingPadding,
      value.trailingPadding,
      value.itemPadding,
      value.insetPadding,
      value.anchor,
      value.showDelay,
      value.height,
      value.buttonVariant,
      value.itemDecoration,
      value.textStyle,
      value.trailingTextStyle,
      value.itemConstraints,
      value.subMenuPadding,
      value.backgroundColor,
      value.selectedBackgroundColor,
      value.closeOnTap,
      value.effects,
      value.shadows,
      value.decoration,
      value.filter,
    ]);
  }
}
