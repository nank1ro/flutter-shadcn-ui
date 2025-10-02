import 'package:flutter/widgets.dart';
import 'package:theme_extensions_builder_annotation/theme_extensions_builder_annotation.dart';

part 'badge.g.theme.dart';

@themeGen
@immutable
class ShadBadgeTheme with _$ShadBadgeTheme {
  const ShadBadgeTheme({
    bool canMerge = true,
    this.shape,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.foregroundColor,
    this.padding,
    this.cursor,
  }) : _canMerge = canMerge;

  @ignore
  final bool _canMerge;

  @override
  bool get canMerge => _canMerge;

  /// {@macro ShadBadge.shape}
  final ShapeBorder? shape;

  /// {@macro ShadBadge.backgroundColor}
  final Color? backgroundColor;

  /// {@macro ShadBadge.hoverBackgroundColor}
  final Color? hoverBackgroundColor;

  /// {@macro ShadBadge.foregroundColor}
  final Color? foregroundColor;

  /// {@macro ShadBadge.padding}
  final EdgeInsetsGeometry? padding;

  /// {@macro ShadBadge.cursor}
  final MouseCursor? cursor;

  static ShadBadgeTheme? lerp(
    ShadBadgeTheme? a,
    ShadBadgeTheme? b,
    double t,
  ) =>
      _$ShadBadgeTheme.lerp(a, b, t);
}
