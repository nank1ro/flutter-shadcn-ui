import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:shadcn_ui/src/components/button.dart';
import 'package:shadcn_ui/src/raw_components/portal.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/utils/border.dart';
import 'package:shadcn_ui/src/utils/gesture_detector.dart';
import 'package:theme_extensions_builder_annotation/theme_extensions_builder_annotation.dart';

part 'menubar.g.theme.dart';

@themeGen
@immutable
class ShadMenubarTheme with _$ShadMenubarTheme {
  const ShadMenubarTheme({
    bool canMerge = true,
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
    this.selectOnHover,
  }) : _canMerge = canMerge;

  @ignore
  final bool _canMerge;

  @override
  bool get canMerge => _canMerge;

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
  final ShadAnchorBase? anchor;

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

  /// {@macro ShadMenubar.selectOnHover}
  final bool? selectOnHover;

  static ShadMenubarTheme? lerp(
    ShadMenubarTheme? a,
    ShadMenubarTheme? b,
    double t,
  ) => _$ShadMenubarTheme.lerp(a, b, t);
}
