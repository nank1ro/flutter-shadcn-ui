import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:theme_extensions_builder_annotation/theme_extensions_builder_annotation.dart';

part 'card.g.theme.dart';

@themeGen
@immutable
class ShadCardTheme with _$ShadCardTheme {
  const ShadCardTheme({
    bool canMerge = true,
    this.backgroundColor,
    this.padding,
    this.radius,
    this.border,
    this.shadows,
    this.width,
    this.height,
    this.rowMainAxisAlignment,
    this.rowCrossAxisAlignment,
    this.columnMainAxisAlignment,
    this.columnCrossAxisAlignment,
    this.rowMainAxisSize,
    this.columnMainAxisSize,
    this.clipBehavior,
  }) : _canMerge = canMerge;

  @ignore
  final bool _canMerge;

  @override
  bool get canMerge => _canMerge;

  /// {@macro ShadCard.padding}
  final EdgeInsetsGeometry? padding;

  /// {@macro ShadCard.backgroundColor}
  final Color? backgroundColor;

  /// {@macro ShadCard.radius}
  final BorderRadius? radius;

  /// {@macro ShadCard.border}
  final Border? border;

  /// {@macro ShadCard.shadows}
  final List<BoxShadow>? shadows;

  /// {@macro ShadCard.width}
  final double? width;

  /// {@macro ShadCard.height}
  final double? height;

  /// {@macro ShadCard.rowMainAxisAlignment}
  final MainAxisAlignment? rowMainAxisAlignment;

  /// {@macro ShadCard.rowCrossAxisAlignment}
  final CrossAxisAlignment? rowCrossAxisAlignment;

  /// {@macro ShadCard.columnMainAxisAlignment}
  final MainAxisAlignment? columnMainAxisAlignment;

  /// {@macro ShadCard.columnCrossAxisAlignment}
  final CrossAxisAlignment? columnCrossAxisAlignment;

  /// {@macro ShadCard.rowMainAxisSize}
  final MainAxisSize? rowMainAxisSize;

  /// {@macro ShadCard.columnMainAxisSize}
  final MainAxisSize? columnMainAxisSize;

  /// {@macro ShadCard.clipBehavior}
  final Clip? clipBehavior;

  static ShadCardTheme lerp(
    ShadCardTheme a,
    ShadCardTheme b,
    double t,
  ) =>
      _$ShadCardTheme.lerp(a, b, t);
}
