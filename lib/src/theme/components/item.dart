import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/components/item.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:theme_extensions_builder_annotation/theme_extensions_builder_annotation.dart';

part 'item.g.theme.dart';

/// The theme for ShadItem.
///
/// Use this class to override some properties to all items in just one
/// place.
@themeGen
@immutable
class ShadItemTheme with _$ShadItemTheme {
  const ShadItemTheme({
    bool canMerge = true,
    this.decoration,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.cursor,
    this.size,
    this.padding,
    this.gap,
    this.titleStyle,
    this.descriptionStyle,
    this.descriptionMaxLines,
    this.contentSpacing,
    this.actionsSpacing,
    this.headerSpacing,
    this.footerSpacing,
    this.mediaIconSize,
    this.mediaIconContainerSize,
    this.mediaImageSize,
    this.mediaRadius,
    this.mediaBackgroundColor,
    this.mediaBorderColor,
  }) : _canMerge = canMerge;

  @ignore
  final bool _canMerge;

  @override
  bool get canMerge => _canMerge;

  /// {@macro ShadItem.decoration}
  final ShadDecoration? decoration;

  /// {@macro ShadItem.backgroundColor}
  final Color? backgroundColor;

  /// {@macro ShadItem.hoverBackgroundColor}
  final Color? hoverBackgroundColor;

  /// {@macro ShadItem.cursor}
  final MouseCursor? cursor;

  /// {@macro ShadItem.size}
  final ShadItemSize? size;

  /// {@macro ShadItem.padding}
  final EdgeInsetsGeometry? padding;

  /// {@macro ShadItem.gap}
  final double? gap;

  /// {@macro ShadItemTitle.style}
  final TextStyle? titleStyle;

  /// {@macro ShadItemDescription.style}
  final TextStyle? descriptionStyle;

  /// {@macro ShadItemDescription.maxLines}
  final int? descriptionMaxLines;

  /// {@macro ShadItemContent.spacing}
  final double? contentSpacing;

  /// {@macro ShadItemActions.spacing}
  final double? actionsSpacing;

  /// {@macro ShadItemHeader.spacing}
  final double? headerSpacing;

  /// {@macro ShadItemFooter.spacing}
  final double? footerSpacing;

  /// {@macro ShadItemMedia.iconSize}
  final double? mediaIconSize;

  /// {@macro ShadItemMedia.size}
  final double? mediaIconContainerSize;

  /// {@macro ShadItemMedia.size}
  final double? mediaImageSize;

  /// {@macro ShadItemMedia.radius}
  final BorderRadius? mediaRadius;

  /// {@macro ShadItemMedia.backgroundColor}
  final Color? mediaBackgroundColor;

  /// {@macro ShadItemMedia.borderColor}
  final Color? mediaBorderColor;

  static ShadItemTheme? lerp(
    ShadItemTheme? a,
    ShadItemTheme? b,
    double t,
  ) => _$ShadItemTheme.lerp(a, b, t);
}
