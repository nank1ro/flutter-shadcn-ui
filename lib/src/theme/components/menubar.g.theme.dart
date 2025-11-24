// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'menubar.dart';

// **************************************************************************
// ThemeGenGenerator
// **************************************************************************

mixin _$ShadMenubarTheme {
  bool get canMerge => true;

  static ShadMenubarTheme? lerp(
    ShadMenubarTheme? a,
    ShadMenubarTheme? b,
    double t,
  ) {
    if (a == null && b == null) {
      return null;
    }

    return ShadMenubarTheme(
      radius: BorderRadiusGeometry.lerp(a?.radius, b?.radius, t),
      padding: EdgeInsetsGeometry.lerp(a?.padding, b?.padding, t),
      backgroundColor: Color.lerp(a?.backgroundColor, b?.backgroundColor, t),
      border: ShadBorder.lerp(a?.border, b?.border, t),
      constraints: BoxConstraints.lerp(a?.constraints, b?.constraints, t),
      contextMenuPadding: EdgeInsetsGeometry.lerp(
        a?.contextMenuPadding,
        b?.contextMenuPadding,
        t,
      ),
      effects: t < 0.5 ? a?.effects : b?.effects,
      shadows: t < 0.5 ? a?.shadows : b?.shadows,
      decoration: ShadDecoration.lerp(a?.decoration, b?.decoration, t),
      filter: t < 0.5 ? a?.filter : b?.filter,
      anchor: t < 0.5 ? a?.anchor : b?.anchor,
      buttonVariant: t < 0.5 ? a?.buttonVariant : b?.buttonVariant,
      buttonSize: t < 0.5 ? a?.buttonSize : b?.buttonSize,
      buttonCursor: t < 0.5 ? a?.buttonCursor : b?.buttonCursor,
      buttonWidth: lerpDouble$(a?.buttonWidth, b?.buttonWidth, t),
      buttonHeight: lerpDouble$(a?.buttonHeight, b?.buttonHeight, t),
      buttonPadding: EdgeInsetsGeometry.lerp(
        a?.buttonPadding,
        b?.buttonPadding,
        t,
      ),
      buttonBackgroundColor: Color.lerp(
        a?.buttonBackgroundColor,
        b?.buttonBackgroundColor,
        t,
      ),
      buttonSelectedBackgroundColor: Color.lerp(
        a?.buttonSelectedBackgroundColor,
        b?.buttonSelectedBackgroundColor,
        t,
      ),
      buttonHoverBackgroundColor: Color.lerp(
        a?.buttonHoverBackgroundColor,
        b?.buttonHoverBackgroundColor,
        t,
      ),
      buttonForegroundColor: Color.lerp(
        a?.buttonForegroundColor,
        b?.buttonForegroundColor,
        t,
      ),
      buttonHoverForegroundColor: Color.lerp(
        a?.buttonHoverForegroundColor,
        b?.buttonHoverForegroundColor,
        t,
      ),
      buttonPressedBackgroundColor: Color.lerp(
        a?.buttonPressedBackgroundColor,
        b?.buttonPressedBackgroundColor,
        t,
      ),
      buttonPressedForegroundColor: Color.lerp(
        a?.buttonPressedForegroundColor,
        b?.buttonPressedForegroundColor,
        t,
      ),
      buttonShadows: t < 0.5 ? a?.buttonShadows : b?.buttonShadows,
      buttonGradient: Gradient.lerp(a?.buttonGradient, b?.buttonGradient, t),
      buttonTextDecoration: t < 0.5
          ? a?.buttonTextDecoration
          : b?.buttonTextDecoration,
      buttonHoverTextDecoration: t < 0.5
          ? a?.buttonHoverTextDecoration
          : b?.buttonHoverTextDecoration,
      buttonDecoration: ShadDecoration.lerp(
        a?.buttonDecoration,
        b?.buttonDecoration,
        t,
      ),
      buttonGap: lerpDouble$(a?.buttonGap, b?.buttonGap, t),
      buttonMainAxisAlignment: t < 0.5
          ? a?.buttonMainAxisAlignment
          : b?.buttonMainAxisAlignment,
      buttonCrossAxisAlignment: t < 0.5
          ? a?.buttonCrossAxisAlignment
          : b?.buttonCrossAxisAlignment,
      buttonHoverStrategies: t < 0.5
          ? a?.buttonHoverStrategies
          : b?.buttonHoverStrategies,
      buttonLongPressDuration: lerpDuration$(
        a?.buttonLongPressDuration,
        b?.buttonLongPressDuration,
        t,
      ),
      buttonTextDirection: t < 0.5
          ? a?.buttonTextDirection
          : b?.buttonTextDirection,
      buttonExpands: t < 0.5 ? a?.buttonExpands : b?.buttonExpands,
      selectOnHover: t < 0.5 ? a?.selectOnHover : b?.selectOnHover,
    );
  }

  ShadMenubarTheme copyWith({
    BorderRadiusGeometry? radius,
    EdgeInsetsGeometry? padding,
    Color? backgroundColor,
    ShadBorder? border,
    BoxConstraints? constraints,
    EdgeInsetsGeometry? contextMenuPadding,
    List<Effect<dynamic>>? effects,
    List<BoxShadow>? shadows,
    ShadDecoration? decoration,
    ImageFilter? filter,
    ShadAnchorBase? anchor,
    ShadButtonVariant? buttonVariant,
    ShadButtonSize? buttonSize,
    MouseCursor? buttonCursor,
    double? buttonWidth,
    double? buttonHeight,
    EdgeInsetsGeometry? buttonPadding,
    Color? buttonBackgroundColor,
    Color? buttonSelectedBackgroundColor,
    Color? buttonHoverBackgroundColor,
    Color? buttonForegroundColor,
    Color? buttonHoverForegroundColor,
    Color? buttonPressedBackgroundColor,
    Color? buttonPressedForegroundColor,
    List<BoxShadow>? buttonShadows,
    Gradient? buttonGradient,
    TextDecoration? buttonTextDecoration,
    TextDecoration? buttonHoverTextDecoration,
    ShadDecoration? buttonDecoration,
    double? buttonGap,
    MainAxisAlignment? buttonMainAxisAlignment,
    CrossAxisAlignment? buttonCrossAxisAlignment,
    ShadHoverStrategies? buttonHoverStrategies,
    Duration? buttonLongPressDuration,
    TextDirection? buttonTextDirection,
    bool? buttonExpands,
    bool? selectOnHover,
  }) {
    final _this = (this as ShadMenubarTheme);

    return ShadMenubarTheme(
      radius: radius ?? _this.radius,
      padding: padding ?? _this.padding,
      backgroundColor: backgroundColor ?? _this.backgroundColor,
      border: border ?? _this.border,
      constraints: constraints ?? _this.constraints,
      contextMenuPadding: contextMenuPadding ?? _this.contextMenuPadding,
      effects: effects ?? _this.effects,
      shadows: shadows ?? _this.shadows,
      decoration: decoration ?? _this.decoration,
      filter: filter ?? _this.filter,
      anchor: anchor ?? _this.anchor,
      buttonVariant: buttonVariant ?? _this.buttonVariant,
      buttonSize: buttonSize ?? _this.buttonSize,
      buttonCursor: buttonCursor ?? _this.buttonCursor,
      buttonWidth: buttonWidth ?? _this.buttonWidth,
      buttonHeight: buttonHeight ?? _this.buttonHeight,
      buttonPadding: buttonPadding ?? _this.buttonPadding,
      buttonBackgroundColor:
          buttonBackgroundColor ?? _this.buttonBackgroundColor,
      buttonSelectedBackgroundColor:
          buttonSelectedBackgroundColor ?? _this.buttonSelectedBackgroundColor,
      buttonHoverBackgroundColor:
          buttonHoverBackgroundColor ?? _this.buttonHoverBackgroundColor,
      buttonForegroundColor:
          buttonForegroundColor ?? _this.buttonForegroundColor,
      buttonHoverForegroundColor:
          buttonHoverForegroundColor ?? _this.buttonHoverForegroundColor,
      buttonPressedBackgroundColor:
          buttonPressedBackgroundColor ?? _this.buttonPressedBackgroundColor,
      buttonPressedForegroundColor:
          buttonPressedForegroundColor ?? _this.buttonPressedForegroundColor,
      buttonShadows: buttonShadows ?? _this.buttonShadows,
      buttonGradient: buttonGradient ?? _this.buttonGradient,
      buttonTextDecoration: buttonTextDecoration ?? _this.buttonTextDecoration,
      buttonHoverTextDecoration:
          buttonHoverTextDecoration ?? _this.buttonHoverTextDecoration,
      buttonDecoration: buttonDecoration ?? _this.buttonDecoration,
      buttonGap: buttonGap ?? _this.buttonGap,
      buttonMainAxisAlignment:
          buttonMainAxisAlignment ?? _this.buttonMainAxisAlignment,
      buttonCrossAxisAlignment:
          buttonCrossAxisAlignment ?? _this.buttonCrossAxisAlignment,
      buttonHoverStrategies:
          buttonHoverStrategies ?? _this.buttonHoverStrategies,
      buttonLongPressDuration:
          buttonLongPressDuration ?? _this.buttonLongPressDuration,
      buttonTextDirection: buttonTextDirection ?? _this.buttonTextDirection,
      buttonExpands: buttonExpands ?? _this.buttonExpands,
      selectOnHover: selectOnHover ?? _this.selectOnHover,
    );
  }

  ShadMenubarTheme merge(ShadMenubarTheme? other) {
    final _this = (this as ShadMenubarTheme);

    if (other == null) {
      return _this;
    }

    if (!other.canMerge) {
      return other;
    }

    return copyWith(
      radius: other.radius,
      padding: other.padding,
      backgroundColor: other.backgroundColor,
      border: _this.border?.merge(other.border) ?? other.border,
      constraints: other.constraints,
      contextMenuPadding: other.contextMenuPadding,
      effects: other.effects,
      shadows: other.shadows,
      decoration: other.decoration,
      filter: other.filter,
      anchor: other.anchor,
      buttonVariant: other.buttonVariant,
      buttonSize: other.buttonSize,
      buttonCursor: other.buttonCursor,
      buttonWidth: other.buttonWidth,
      buttonHeight: other.buttonHeight,
      buttonPadding: other.buttonPadding,
      buttonBackgroundColor: other.buttonBackgroundColor,
      buttonSelectedBackgroundColor: other.buttonSelectedBackgroundColor,
      buttonHoverBackgroundColor: other.buttonHoverBackgroundColor,
      buttonForegroundColor: other.buttonForegroundColor,
      buttonHoverForegroundColor: other.buttonHoverForegroundColor,
      buttonPressedBackgroundColor: other.buttonPressedBackgroundColor,
      buttonPressedForegroundColor: other.buttonPressedForegroundColor,
      buttonShadows: other.buttonShadows,
      buttonGradient: other.buttonGradient,
      buttonTextDecoration: other.buttonTextDecoration,
      buttonHoverTextDecoration: other.buttonHoverTextDecoration,
      buttonDecoration: other.buttonDecoration,
      buttonGap: other.buttonGap,
      buttonMainAxisAlignment: other.buttonMainAxisAlignment,
      buttonCrossAxisAlignment: other.buttonCrossAxisAlignment,
      buttonHoverStrategies: other.buttonHoverStrategies,
      buttonLongPressDuration: other.buttonLongPressDuration,
      buttonTextDirection: other.buttonTextDirection,
      buttonExpands: other.buttonExpands,
      selectOnHover: other.selectOnHover,
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

    final _this = (this as ShadMenubarTheme);
    final _other = (other as ShadMenubarTheme);

    return _other.radius == _this.radius &&
        _other.padding == _this.padding &&
        _other.backgroundColor == _this.backgroundColor &&
        _other.border == _this.border &&
        _other.constraints == _this.constraints &&
        _other.contextMenuPadding == _this.contextMenuPadding &&
        _other.effects == _this.effects &&
        _other.shadows == _this.shadows &&
        _other.decoration == _this.decoration &&
        _other.filter == _this.filter &&
        _other.anchor == _this.anchor &&
        _other.buttonVariant == _this.buttonVariant &&
        _other.buttonSize == _this.buttonSize &&
        _other.buttonCursor == _this.buttonCursor &&
        _other.buttonWidth == _this.buttonWidth &&
        _other.buttonHeight == _this.buttonHeight &&
        _other.buttonPadding == _this.buttonPadding &&
        _other.buttonBackgroundColor == _this.buttonBackgroundColor &&
        _other.buttonSelectedBackgroundColor ==
            _this.buttonSelectedBackgroundColor &&
        _other.buttonHoverBackgroundColor == _this.buttonHoverBackgroundColor &&
        _other.buttonForegroundColor == _this.buttonForegroundColor &&
        _other.buttonHoverForegroundColor == _this.buttonHoverForegroundColor &&
        _other.buttonPressedBackgroundColor ==
            _this.buttonPressedBackgroundColor &&
        _other.buttonPressedForegroundColor ==
            _this.buttonPressedForegroundColor &&
        _other.buttonShadows == _this.buttonShadows &&
        _other.buttonGradient == _this.buttonGradient &&
        _other.buttonTextDecoration == _this.buttonTextDecoration &&
        _other.buttonHoverTextDecoration == _this.buttonHoverTextDecoration &&
        _other.buttonDecoration == _this.buttonDecoration &&
        _other.buttonGap == _this.buttonGap &&
        _other.buttonMainAxisAlignment == _this.buttonMainAxisAlignment &&
        _other.buttonCrossAxisAlignment == _this.buttonCrossAxisAlignment &&
        _other.buttonHoverStrategies == _this.buttonHoverStrategies &&
        _other.buttonLongPressDuration == _this.buttonLongPressDuration &&
        _other.buttonTextDirection == _this.buttonTextDirection &&
        _other.buttonExpands == _this.buttonExpands &&
        _other.selectOnHover == _this.selectOnHover;
  }

  @override
  int get hashCode {
    final _this = (this as ShadMenubarTheme);

    return Object.hashAll([
      runtimeType,
      _this.radius,
      _this.padding,
      _this.backgroundColor,
      _this.border,
      _this.constraints,
      _this.contextMenuPadding,
      _this.effects,
      _this.shadows,
      _this.decoration,
      _this.filter,
      _this.anchor,
      _this.buttonVariant,
      _this.buttonSize,
      _this.buttonCursor,
      _this.buttonWidth,
      _this.buttonHeight,
      _this.buttonPadding,
      _this.buttonBackgroundColor,
      _this.buttonSelectedBackgroundColor,
      _this.buttonHoverBackgroundColor,
      _this.buttonForegroundColor,
      _this.buttonHoverForegroundColor,
      _this.buttonPressedBackgroundColor,
      _this.buttonPressedForegroundColor,
      _this.buttonShadows,
      _this.buttonGradient,
      _this.buttonTextDecoration,
      _this.buttonHoverTextDecoration,
      _this.buttonDecoration,
      _this.buttonGap,
      _this.buttonMainAxisAlignment,
      _this.buttonCrossAxisAlignment,
      _this.buttonHoverStrategies,
      _this.buttonLongPressDuration,
      _this.buttonTextDirection,
      _this.buttonExpands,
      _this.selectOnHover,
    ]);
  }
}
