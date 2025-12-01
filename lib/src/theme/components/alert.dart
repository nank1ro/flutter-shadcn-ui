import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:theme_extensions_builder_annotation/theme_extensions_builder_annotation.dart';

part 'alert.g.theme.dart';

@themeGen
@immutable
class ShadAlertTheme with _$ShadAlertTheme {
  const ShadAlertTheme({
    bool canMerge = true,
    this.decoration,
    this.iconPadding,
    this.iconColor,
    this.iconSize,
    this.titleStyle,
    this.descriptionStyle,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
  }) : _canMerge = canMerge;

  @ignore
  final bool _canMerge;

  @override
  bool get canMerge => _canMerge;

  /// {@macro ShadAlert.decoration}
  final ShadDecoration? decoration;

  /// {@macro ShadAlert.iconPadding}
  final EdgeInsetsGeometry? iconPadding;

  /// {@macro ShadAlert.iconColor}
  final Color? iconColor;

  /// {@macro ShadAlert.title}
  final TextStyle? titleStyle;

  /// {@macro ShadAlert.descriptionStyle}
  final TextStyle? descriptionStyle;

  /// {@macro ShadAlert.mainAxisAlignment}
  final MainAxisAlignment? mainAxisAlignment;

  /// {@macro ShadAlert.crossAxisAlignment}
  final CrossAxisAlignment? crossAxisAlignment;

  /// {@macro ShadAlert.iconSize}
  final double? iconSize;

  static ShadAlertTheme? lerp(
    ShadAlertTheme? a,
    ShadAlertTheme? b,
    double t,
  ) => _$ShadAlertTheme.lerp(a, b, t);
}
