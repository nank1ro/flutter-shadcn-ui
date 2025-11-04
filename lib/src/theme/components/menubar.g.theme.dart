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
    final a = (this as ShadMenubarTheme);

    return ShadMenubarTheme(
      radius: radius ?? a.radius,
      padding: padding ?? a.padding,
      backgroundColor: backgroundColor ?? a.backgroundColor,
      border: border ?? a.border,
      constraints: constraints ?? a.constraints,
      contextMenuPadding: contextMenuPadding ?? a.contextMenuPadding,
      effects: effects ?? a.effects,
      shadows: shadows ?? a.shadows,
      decoration: decoration ?? a.decoration,
      filter: filter ?? a.filter,
      anchor: anchor ?? a.anchor,
      buttonVariant: buttonVariant ?? a.buttonVariant,
      buttonSize: buttonSize ?? a.buttonSize,
      buttonCursor: buttonCursor ?? a.buttonCursor,
      buttonWidth: buttonWidth ?? a.buttonWidth,
      buttonHeight: buttonHeight ?? a.buttonHeight,
      buttonPadding: buttonPadding ?? a.buttonPadding,
      buttonBackgroundColor: buttonBackgroundColor ?? a.buttonBackgroundColor,
      buttonSelectedBackgroundColor:
          buttonSelectedBackgroundColor ?? a.buttonSelectedBackgroundColor,
      buttonHoverBackgroundColor:
          buttonHoverBackgroundColor ?? a.buttonHoverBackgroundColor,
      buttonForegroundColor: buttonForegroundColor ?? a.buttonForegroundColor,
      buttonHoverForegroundColor:
          buttonHoverForegroundColor ?? a.buttonHoverForegroundColor,
      buttonPressedBackgroundColor:
          buttonPressedBackgroundColor ?? a.buttonPressedBackgroundColor,
      buttonPressedForegroundColor:
          buttonPressedForegroundColor ?? a.buttonPressedForegroundColor,
      buttonShadows: buttonShadows ?? a.buttonShadows,
      buttonGradient: buttonGradient ?? a.buttonGradient,
      buttonTextDecoration: buttonTextDecoration ?? a.buttonTextDecoration,
      buttonHoverTextDecoration:
          buttonHoverTextDecoration ?? a.buttonHoverTextDecoration,
      buttonDecoration: buttonDecoration ?? a.buttonDecoration,
      buttonGap: buttonGap ?? a.buttonGap,
      buttonMainAxisAlignment:
          buttonMainAxisAlignment ?? a.buttonMainAxisAlignment,
      buttonCrossAxisAlignment:
          buttonCrossAxisAlignment ?? a.buttonCrossAxisAlignment,
      buttonHoverStrategies: buttonHoverStrategies ?? a.buttonHoverStrategies,
      buttonLongPressDuration:
          buttonLongPressDuration ?? a.buttonLongPressDuration,
      buttonTextDirection: buttonTextDirection ?? a.buttonTextDirection,
      buttonExpands: buttonExpands ?? a.buttonExpands,
      selectOnHover: selectOnHover ?? a.selectOnHover,
    );
  }

  ShadMenubarTheme merge(ShadMenubarTheme? other) {
    final current = (this as ShadMenubarTheme);

    if (other == null) {
      return current;
    }

    if (!other.canMerge) {
      return other;
    }

    return copyWith(
      radius: other.radius,
      padding: other.padding,
      backgroundColor: other.backgroundColor,
      border: current.border?.merge(other.border) ?? other.border,
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

    final value = (this as ShadMenubarTheme);

    return other is ShadMenubarTheme &&
        other.radius == value.radius &&
        other.padding == value.padding &&
        other.backgroundColor == value.backgroundColor &&
        other.border == value.border &&
        other.constraints == value.constraints &&
        other.contextMenuPadding == value.contextMenuPadding &&
        other.effects == value.effects &&
        other.shadows == value.shadows &&
        other.decoration == value.decoration &&
        other.filter == value.filter &&
        other.anchor == value.anchor &&
        other.buttonVariant == value.buttonVariant &&
        other.buttonSize == value.buttonSize &&
        other.buttonCursor == value.buttonCursor &&
        other.buttonWidth == value.buttonWidth &&
        other.buttonHeight == value.buttonHeight &&
        other.buttonPadding == value.buttonPadding &&
        other.buttonBackgroundColor == value.buttonBackgroundColor &&
        other.buttonSelectedBackgroundColor ==
            value.buttonSelectedBackgroundColor &&
        other.buttonHoverBackgroundColor == value.buttonHoverBackgroundColor &&
        other.buttonForegroundColor == value.buttonForegroundColor &&
        other.buttonHoverForegroundColor == value.buttonHoverForegroundColor &&
        other.buttonPressedBackgroundColor ==
            value.buttonPressedBackgroundColor &&
        other.buttonPressedForegroundColor ==
            value.buttonPressedForegroundColor &&
        other.buttonShadows == value.buttonShadows &&
        other.buttonGradient == value.buttonGradient &&
        other.buttonTextDecoration == value.buttonTextDecoration &&
        other.buttonHoverTextDecoration == value.buttonHoverTextDecoration &&
        other.buttonDecoration == value.buttonDecoration &&
        other.buttonGap == value.buttonGap &&
        other.buttonMainAxisAlignment == value.buttonMainAxisAlignment &&
        other.buttonCrossAxisAlignment == value.buttonCrossAxisAlignment &&
        other.buttonHoverStrategies == value.buttonHoverStrategies &&
        other.buttonLongPressDuration == value.buttonLongPressDuration &&
        other.buttonTextDirection == value.buttonTextDirection &&
        other.buttonExpands == value.buttonExpands &&
        other.selectOnHover == value.selectOnHover;
  }

  @override
  int get hashCode {
    final value = (this as ShadMenubarTheme);

    return Object.hashAll([
      runtimeType,
      value.radius,
      value.padding,
      value.backgroundColor,
      value.border,
      value.constraints,
      value.contextMenuPadding,
      value.effects,
      value.shadows,
      value.decoration,
      value.filter,
      value.anchor,
      value.buttonVariant,
      value.buttonSize,
      value.buttonCursor,
      value.buttonWidth,
      value.buttonHeight,
      value.buttonPadding,
      value.buttonBackgroundColor,
      value.buttonSelectedBackgroundColor,
      value.buttonHoverBackgroundColor,
      value.buttonForegroundColor,
      value.buttonHoverForegroundColor,
      value.buttonPressedBackgroundColor,
      value.buttonPressedForegroundColor,
      value.buttonShadows,
      value.buttonGradient,
      value.buttonTextDecoration,
      value.buttonHoverTextDecoration,
      value.buttonDecoration,
      value.buttonGap,
      value.buttonMainAxisAlignment,
      value.buttonCrossAxisAlignment,
      value.buttonHoverStrategies,
      value.buttonLongPressDuration,
      value.buttonTextDirection,
      value.buttonExpands,
      value.selectOnHover,
    ]);
  }
}
