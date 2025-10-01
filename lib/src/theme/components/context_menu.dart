import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shadcn_ui/src/components/button.dart';
import 'package:shadcn_ui/src/raw_components/portal.dart';

import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:theme_extensions_builder_annotation/theme_extensions_builder_annotation.dart';

part 'context_menu.g.theme.dart';

@themeGen
@immutable
class ShadContextMenuTheme with _$ShadContextMenuTheme {
  const ShadContextMenuTheme({
    bool canMerge = true,
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
    this.closeOnTap,
    this.effects,
    this.shadows,
    this.itemDecoration,
    this.filter,
    this.popoverReverseDuration,
  }) : _canMerge = canMerge;

  @ignore
  final bool _canMerge;

  @override
  bool get canMerge => _canMerge;

  /// {@macro ShadPopover.reverseDuration}
  final Duration? popoverReverseDuration;

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
  final ShadDecoration? itemDecoration;

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

  /// {@macro ShadContextMenuItem.closeOnTap}
  final bool? closeOnTap;

  /// {@macro ShadPopover.effects}
  final List<Effect<dynamic>>? effects;

  /// {@macro ShadPopover.shadows}
  final List<BoxShadow>? shadows;

  /// {@macro ShadPopover.decoration}
  final ShadDecoration? decoration;

  /// {@macro ShadPopover.filter}
  final ImageFilter? filter;

  static ShadContextMenuTheme lerp(
    ShadContextMenuTheme a,
    ShadContextMenuTheme b,
    double t,
  ) =>
      _$ShadContextMenuTheme.lerp(a, b, t);
}
