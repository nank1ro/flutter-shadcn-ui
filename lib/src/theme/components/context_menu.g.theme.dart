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
    final _this = (this as ShadContextMenuTheme);

    return ShadContextMenuTheme(
      popoverReverseDuration:
          popoverReverseDuration ?? _this.popoverReverseDuration,
      constraints: constraints ?? _this.constraints,
      padding: padding ?? _this.padding,
      leadingPadding: leadingPadding ?? _this.leadingPadding,
      trailingPadding: trailingPadding ?? _this.trailingPadding,
      itemPadding: itemPadding ?? _this.itemPadding,
      insetPadding: insetPadding ?? _this.insetPadding,
      anchor: anchor ?? _this.anchor,
      showDelay: showDelay ?? _this.showDelay,
      height: height ?? _this.height,
      buttonVariant: buttonVariant ?? _this.buttonVariant,
      itemDecoration: itemDecoration ?? _this.itemDecoration,
      textStyle: textStyle ?? _this.textStyle,
      trailingTextStyle: trailingTextStyle ?? _this.trailingTextStyle,
      itemConstraints: itemConstraints ?? _this.itemConstraints,
      subMenuPadding: subMenuPadding ?? _this.subMenuPadding,
      backgroundColor: backgroundColor ?? _this.backgroundColor,
      selectedBackgroundColor:
          selectedBackgroundColor ?? _this.selectedBackgroundColor,
      closeOnTap: closeOnTap ?? _this.closeOnTap,
      effects: effects ?? _this.effects,
      shadows: shadows ?? _this.shadows,
      decoration: decoration ?? _this.decoration,
      filter: filter ?? _this.filter,
    );
  }

  ShadContextMenuTheme merge(ShadContextMenuTheme? other) {
    final _this = (this as ShadContextMenuTheme);

    if (other == null) {
      return _this;
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
      itemDecoration: other.itemDecoration,
      textStyle: _this.textStyle?.merge(other.textStyle) ?? other.textStyle,
      trailingTextStyle:
          _this.trailingTextStyle?.merge(other.trailingTextStyle) ??
              other.trailingTextStyle,
      itemConstraints: other.itemConstraints,
      subMenuPadding: other.subMenuPadding,
      backgroundColor: other.backgroundColor,
      selectedBackgroundColor: other.selectedBackgroundColor,
      closeOnTap: other.closeOnTap,
      effects: other.effects,
      shadows: other.shadows,
      decoration: other.decoration,
      filter: other.filter,
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

    final _this = (this as ShadContextMenuTheme);
    final _other = (other as ShadContextMenuTheme);

    return _other.popoverReverseDuration == _this.popoverReverseDuration &&
        _other.constraints == _this.constraints &&
        _other.padding == _this.padding &&
        _other.leadingPadding == _this.leadingPadding &&
        _other.trailingPadding == _this.trailingPadding &&
        _other.itemPadding == _this.itemPadding &&
        _other.insetPadding == _this.insetPadding &&
        _other.anchor == _this.anchor &&
        _other.showDelay == _this.showDelay &&
        _other.height == _this.height &&
        _other.buttonVariant == _this.buttonVariant &&
        _other.itemDecoration == _this.itemDecoration &&
        _other.textStyle == _this.textStyle &&
        _other.trailingTextStyle == _this.trailingTextStyle &&
        _other.itemConstraints == _this.itemConstraints &&
        _other.subMenuPadding == _this.subMenuPadding &&
        _other.backgroundColor == _this.backgroundColor &&
        _other.selectedBackgroundColor == _this.selectedBackgroundColor &&
        _other.closeOnTap == _this.closeOnTap &&
        _other.effects == _this.effects &&
        _other.shadows == _this.shadows &&
        _other.decoration == _this.decoration &&
        _other.filter == _this.filter;
  }

  @override
  int get hashCode {
    final _this = (this as ShadContextMenuTheme);

    return Object.hashAll([
      runtimeType,
      _this.popoverReverseDuration,
      _this.constraints,
      _this.padding,
      _this.leadingPadding,
      _this.trailingPadding,
      _this.itemPadding,
      _this.insetPadding,
      _this.anchor,
      _this.showDelay,
      _this.height,
      _this.buttonVariant,
      _this.itemDecoration,
      _this.textStyle,
      _this.trailingTextStyle,
      _this.itemConstraints,
      _this.subMenuPadding,
      _this.backgroundColor,
      _this.selectedBackgroundColor,
      _this.closeOnTap,
      _this.effects,
      _this.shadows,
      _this.decoration,
      _this.filter,
    ]);
  }
}
