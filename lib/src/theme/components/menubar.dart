import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:shadcn_ui/src/components/button.dart';
import 'package:shadcn_ui/src/raw_components/portal.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/utils/border.dart';
import 'package:shadcn_ui/src/utils/gesture_detector.dart';

@immutable
class ShadMenubarTheme {
  const ShadMenubarTheme({
    this.merge = true,
    this.radius,
    this.padding,
    this.backgroundColor,
    this.border,
    this.constraints,
    this.contextMenuPadding,
    this.effects,
    this.shadows,
    this.decoration,
    this.filter,
    this.anchor,
    this.buttonVariant,
    this.buttonSize,
    this.buttonCursor,
    this.buttonWidth,
    this.buttonHeight,
    this.buttonPadding,
    this.buttonBackgroundColor,
    this.buttonSelectedBackgroundColor,
    this.buttonHoverBackgroundColor,
    this.buttonForegroundColor,
    this.buttonHoverForegroundColor,
    this.buttonPressedBackgroundColor,
    this.buttonPressedForegroundColor,
    this.buttonShadows,
    this.buttonGradient,
    this.buttonTextDecoration,
    this.buttonHoverTextDecoration,
    this.buttonDecoration,
    this.buttonGap,
    this.buttonMainAxisAlignment,
    this.buttonCrossAxisAlignment,
    this.buttonHoverStrategies,
    this.buttonLongPressDuration,
    this.buttonTextDirection,
    this.buttonExpands,
  });

  final bool merge;

  /// {@macro ShadMenubar.radius}
  final BorderRadiusGeometry? radius;

  /// {@macro ShadMenubar.padding}
  final EdgeInsetsGeometry? padding;

  /// {@macro ShadMenubar.backgroundColor}
  final Color? backgroundColor;

  /// {@macro ShadMenubar.border}
  final ShadBorder? border;

  /// {@macro ShadContextMenu.constraints}
  final BoxConstraints? constraints;

  /// {@macro ShadContextMenu.padding}
  final EdgeInsetsGeometry? contextMenuPadding;

  /// {@macro ShadPopover.effects}
  final List<Effect<dynamic>>? effects;

  /// {@macro ShadPopover.shadows}
  final List<BoxShadow>? shadows;

  /// {@macro ShadPopover.decoration}
  final ShadDecoration? decoration;

  /// {@macro ShadPopover.filter}
  final ImageFilter? filter;

  /// {@macro ShadMenubarItem.anchor}
  final ShadAnchor? anchor;

  /// {@macro ShadButton.variant}
  final ShadButtonVariant? buttonVariant;

  /// {@macro ShadButton.size}
  final ShadButtonSize? buttonSize;

  /// {@macro ShadButton.cursor}
  final MouseCursor? buttonCursor;

  /// {@macro ShadButton.width}
  final double? buttonWidth;

  /// {@macro ShadMenubarItem.height}
  final double? buttonHeight;

  /// {@macro ShadButton.padding}
  final EdgeInsetsGeometry? buttonPadding;

  /// {@macro ShadButton.backgroundColor}
  final Color? buttonBackgroundColor;

  /// {@macro ShadMenubarItem.selectedBackgroundColor}
  final Color? buttonSelectedBackgroundColor;

  /// {@macro ShadButton.hoverBackgroundColor}
  final Color? buttonHoverBackgroundColor;

  /// {@macro ShadButton.foregroundColor}
  final Color? buttonForegroundColor;

  /// {@macro ShadButton.hoverForegroundColor}
  final Color? buttonHoverForegroundColor;

  /// {@macro ShadButton.pressedBackgroundColor}
  final Color? buttonPressedBackgroundColor;

  /// {@macro ShadButton.pressedForegroundColor}
  final Color? buttonPressedForegroundColor;

  /// {@macro ShadButton.shadows}
  final List<BoxShadow>? buttonShadows;

  /// {@macro ShadButton.gradient}
  final Gradient? buttonGradient;

  /// {@macro ShadButton.textDecoration}
  final TextDecoration? buttonTextDecoration;

  /// {@macro ShadButton.hoverTextDecoration}
  final TextDecoration? buttonHoverTextDecoration;

  /// {@macro ShadButton.decoration}
  final ShadDecoration? buttonDecoration;

  /// {@macro ShadButton.gap}
  final double? buttonGap;

  /// {@macro ShadButton.mainAxisAlignment}
  final MainAxisAlignment? buttonMainAxisAlignment;

  /// {@macro ShadButton.crossAxisAlignment}
  final CrossAxisAlignment? buttonCrossAxisAlignment;

  /// {@macro ShadButton.hoverStrategies}
  final ShadHoverStrategies? buttonHoverStrategies;

  /// {@macro ShadButton.longPressDuration}
  final Duration? buttonLongPressDuration;

  /// {@macro ShadButton.textDirection}
  final TextDirection? buttonTextDirection;

  /// {@macro ShadButton.expands}
  final bool? buttonExpands;

  static ShadMenubarTheme lerp(
    ShadMenubarTheme a,
    ShadMenubarTheme b,
    double t,
  ) {
    if (identical(a, b)) return a;
    return ShadMenubarTheme(
      merge: b.merge,
      radius: BorderRadiusGeometry.lerp(a.radius, b.radius, t),
      padding: EdgeInsetsGeometry.lerp(a.padding, b.padding, t),
      backgroundColor: Color.lerp(a.backgroundColor, b.backgroundColor, t),
      border: ShadBorder.lerp(a.border, b.border, t),
      constraints: BoxConstraints.lerp(a.constraints, b.constraints, t),
      contextMenuPadding: EdgeInsetsGeometry.lerp(
        a.contextMenuPadding,
        b.contextMenuPadding,
        t,
      ),
      effects: t < 0.5 ? a.effects : b.effects,
      shadows: t < 0.5 ? a.shadows : b.shadows,
      decoration: ShadDecoration.lerp(a.decoration, b.decoration, t),
      filter: t < 0.5 ? a.filter : b.filter,
      anchor: t < 0.5 ? a.anchor : b.anchor,
      buttonVariant: t < 0.5 ? a.buttonVariant : b.buttonVariant,
      buttonSize: t < 0.5 ? a.buttonSize : b.buttonSize,
      buttonCursor: t < 0.5 ? a.buttonCursor : b.buttonCursor,
      buttonWidth: lerpDouble(a.buttonWidth, b.buttonWidth, t),
      buttonHeight: lerpDouble(a.buttonHeight, b.buttonHeight, t),
      buttonPadding:
          EdgeInsetsGeometry.lerp(a.buttonPadding, b.buttonPadding, t),
      buttonBackgroundColor:
          Color.lerp(a.buttonBackgroundColor, b.buttonBackgroundColor, t),
      buttonSelectedBackgroundColor: Color.lerp(
        a.buttonSelectedBackgroundColor,
        b.buttonSelectedBackgroundColor,
        t,
      ),
      buttonHoverBackgroundColor: Color.lerp(
        a.buttonHoverBackgroundColor,
        b.buttonHoverBackgroundColor,
        t,
      ),
      buttonForegroundColor:
          Color.lerp(a.buttonForegroundColor, b.buttonForegroundColor, t),
      buttonHoverForegroundColor: Color.lerp(
        a.buttonHoverForegroundColor,
        b.buttonHoverForegroundColor,
        t,
      ),
      buttonPressedBackgroundColor: Color.lerp(
        a.buttonPressedBackgroundColor,
        b.buttonPressedBackgroundColor,
        t,
      ),
      buttonPressedForegroundColor: Color.lerp(
        a.buttonPressedForegroundColor,
        b.buttonPressedForegroundColor,
        t,
      ),
      buttonShadows: t < 0.5 ? a.buttonShadows : b.buttonShadows,
      buttonGradient: Gradient.lerp(a.buttonGradient, b.buttonGradient, t),
      buttonTextDecoration:
          t < 0.5 ? a.buttonTextDecoration : b.buttonTextDecoration,
      buttonHoverTextDecoration:
          t < 0.5 ? a.buttonHoverTextDecoration : b.buttonHoverTextDecoration,
      buttonDecoration:
          ShadDecoration.lerp(a.buttonDecoration, b.buttonDecoration, t),
      buttonGap: lerpDouble(a.buttonGap, b.buttonGap, t),
      buttonMainAxisAlignment:
          t < 0.5 ? a.buttonMainAxisAlignment : b.buttonMainAxisAlignment,
      buttonCrossAxisAlignment:
          t < 0.5 ? a.buttonCrossAxisAlignment : b.buttonCrossAxisAlignment,
      buttonHoverStrategies:
          t < 0.5 ? a.buttonHoverStrategies : b.buttonHoverStrategies,
      buttonLongPressDuration:
          a.buttonLongPressDuration != null && b.buttonLongPressDuration != null
              ? lerpDuration(
                  a.buttonLongPressDuration!,
                  b.buttonLongPressDuration!,
                  t,
                )
              : b.buttonLongPressDuration,
      buttonTextDirection:
          t < 0.5 ? a.buttonTextDirection : b.buttonTextDirection,
      buttonExpands: t < 0.5 ? a.buttonExpands : b.buttonExpands,
    );
  }

  ShadMenubarTheme copyWith({
    bool? merge,
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
    ShadAnchor? anchor,
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
  }) {
    return ShadMenubarTheme(
      merge: merge ?? this.merge,
      radius: radius ?? this.radius,
      padding: padding ?? this.padding,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      border: border ?? this.border,
      constraints: constraints ?? this.constraints,
      contextMenuPadding: contextMenuPadding ?? this.contextMenuPadding,
      effects: effects ?? this.effects,
      shadows: shadows ?? this.shadows,
      decoration: decoration ?? this.decoration,
      filter: filter ?? this.filter,
      anchor: anchor ?? this.anchor,
      buttonVariant: buttonVariant ?? this.buttonVariant,
      buttonSize: buttonSize ?? this.buttonSize,
      buttonCursor: buttonCursor ?? this.buttonCursor,
      buttonWidth: buttonWidth ?? this.buttonWidth,
      buttonHeight: buttonHeight ?? this.buttonHeight,
      buttonPadding: buttonPadding ?? this.buttonPadding,
      buttonBackgroundColor:
          buttonBackgroundColor ?? this.buttonBackgroundColor,
      buttonSelectedBackgroundColor:
          buttonSelectedBackgroundColor ?? this.buttonSelectedBackgroundColor,
      buttonHoverBackgroundColor:
          buttonHoverBackgroundColor ?? this.buttonHoverBackgroundColor,
      buttonForegroundColor:
          buttonForegroundColor ?? this.buttonForegroundColor,
      buttonHoverForegroundColor:
          buttonHoverForegroundColor ?? this.buttonHoverForegroundColor,
      buttonPressedBackgroundColor:
          buttonPressedBackgroundColor ?? this.buttonPressedBackgroundColor,
      buttonPressedForegroundColor:
          buttonPressedForegroundColor ?? this.buttonPressedForegroundColor,
      buttonShadows: buttonShadows ?? this.buttonShadows,
      buttonGradient: buttonGradient ?? this.buttonGradient,
      buttonTextDecoration: buttonTextDecoration ?? this.buttonTextDecoration,
      buttonHoverTextDecoration:
          buttonHoverTextDecoration ?? this.buttonHoverTextDecoration,
      buttonDecoration: buttonDecoration ?? this.buttonDecoration,
      buttonGap: buttonGap ?? this.buttonGap,
      buttonMainAxisAlignment:
          buttonMainAxisAlignment ?? this.buttonMainAxisAlignment,
      buttonCrossAxisAlignment:
          buttonCrossAxisAlignment ?? this.buttonCrossAxisAlignment,
      buttonHoverStrategies:
          buttonHoverStrategies ?? this.buttonHoverStrategies,
      buttonLongPressDuration:
          buttonLongPressDuration ?? this.buttonLongPressDuration,
      buttonTextDirection: buttonTextDirection ?? this.buttonTextDirection,
      buttonExpands: buttonExpands ?? this.buttonExpands,
    );
  }

  ShadMenubarTheme mergeWith(ShadMenubarTheme? other) {
    if (other == null) return this;
    if (!other.merge) return other;
    return copyWith(
      radius: other.radius,
      padding: other.padding,
      backgroundColor: other.backgroundColor,
      border: other.border,
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
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShadMenubarTheme &&
        other.merge == merge &&
        other.radius == radius &&
        other.padding == padding &&
        other.backgroundColor == backgroundColor &&
        other.border == border &&
        other.constraints == constraints &&
        other.contextMenuPadding == contextMenuPadding &&
        listEquals(other.effects, effects) &&
        listEquals(other.shadows, shadows) &&
        other.decoration == decoration &&
        other.filter == filter &&
        other.anchor == anchor &&
        other.buttonVariant == buttonVariant &&
        other.buttonSize == buttonSize &&
        other.buttonCursor == buttonCursor &&
        other.buttonWidth == buttonWidth &&
        other.buttonHeight == buttonHeight &&
        other.buttonPadding == buttonPadding &&
        other.buttonBackgroundColor == buttonBackgroundColor &&
        other.buttonSelectedBackgroundColor == buttonSelectedBackgroundColor &&
        other.buttonHoverBackgroundColor == buttonHoverBackgroundColor &&
        other.buttonForegroundColor == buttonForegroundColor &&
        other.buttonHoverForegroundColor == buttonHoverForegroundColor &&
        other.buttonPressedBackgroundColor == buttonPressedBackgroundColor &&
        other.buttonPressedForegroundColor == buttonPressedForegroundColor &&
        listEquals(other.buttonShadows, buttonShadows) &&
        other.buttonGradient == buttonGradient &&
        other.buttonTextDecoration == buttonTextDecoration &&
        other.buttonHoverTextDecoration == buttonHoverTextDecoration &&
        other.buttonDecoration == buttonDecoration &&
        other.buttonGap == buttonGap &&
        other.buttonMainAxisAlignment == buttonMainAxisAlignment &&
        other.buttonCrossAxisAlignment == buttonCrossAxisAlignment &&
        other.buttonHoverStrategies == buttonHoverStrategies &&
        other.buttonLongPressDuration == buttonLongPressDuration &&
        other.buttonTextDirection == buttonTextDirection &&
        other.buttonExpands == buttonExpands;
  }

  @override
  int get hashCode {
    return merge.hashCode ^
        radius.hashCode ^
        padding.hashCode ^
        backgroundColor.hashCode ^
        border.hashCode ^
        constraints.hashCode ^
        contextMenuPadding.hashCode ^
        effects.hashCode ^
        shadows.hashCode ^
        decoration.hashCode ^
        filter.hashCode ^
        anchor.hashCode ^
        buttonVariant.hashCode ^
        buttonSize.hashCode ^
        buttonCursor.hashCode ^
        buttonWidth.hashCode ^
        buttonHeight.hashCode ^
        buttonPadding.hashCode ^
        buttonBackgroundColor.hashCode ^
        buttonSelectedBackgroundColor.hashCode ^
        buttonHoverBackgroundColor.hashCode ^
        buttonForegroundColor.hashCode ^
        buttonHoverForegroundColor.hashCode ^
        buttonPressedBackgroundColor.hashCode ^
        buttonPressedForegroundColor.hashCode ^
        buttonShadows.hashCode ^
        buttonGradient.hashCode ^
        buttonTextDecoration.hashCode ^
        buttonHoverTextDecoration.hashCode ^
        buttonDecoration.hashCode ^
        buttonGap.hashCode ^
        buttonMainAxisAlignment.hashCode ^
        buttonCrossAxisAlignment.hashCode ^
        buttonHoverStrategies.hashCode ^
        buttonLongPressDuration.hashCode ^
        buttonTextDirection.hashCode ^
        buttonExpands.hashCode;
  }
}
