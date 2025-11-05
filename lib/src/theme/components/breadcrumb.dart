import 'package:flutter/widgets.dart';
import 'package:theme_extensions_builder_annotation/theme_extensions_builder_annotation.dart';

part 'breadcrumb.g.theme.dart';

@themeGen
@immutable
class ShadBreadcrumbTheme with _$ShadBreadcrumbTheme {
  const ShadBreadcrumbTheme({
    bool canMerge = true,
    this.separator,
    this.ellipsis,
    this.separatorSize,
    this.ellipsisSize,
    this.spacing,
    this.itemTextStyle,
    this.linkTextStyle,
    this.linkNormalTextColor,
    this.linkHoverTextColor,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.dropdownMenuBackgroundColor,
    this.dropdownMenuPadding,
    this.dropdownTextStyle,
    this.dropdownItemPadding,
  }): _canMerge = canMerge;

  @ignore
  final bool _canMerge;

  @override
  bool get canMerge => _canMerge;

  /// {@macro ShadBreadcrumb.separator}
  final Widget? separator;

  /// {@macro ShadBreadcrumb.ellipsis}
  final Widget? ellipsis;

  /// {@macro ShadBreadcrumb.separatorSize}
  final double? separatorSize;

  /// {@macro ShadBreadcrumb.ellipsisSize}
  final double? ellipsisSize;

  /// {@macro ShadBreadcrumb.spacing}
  final double? spacing;

  /// {@macro ShadBreadcrumb.itemTextStyle}
  final TextStyle? itemTextStyle;

  /// {@macro ShadBreadcrumb.linkTextStyle}
  final TextStyle? linkTextStyle;

  /// {@macro ShadBreadcrumb.linkNormalTextColor}
  final Color? linkNormalTextColor;

  /// {@macro ShadBreadcrumb.linkHoverTextColor}
  final Color? linkHoverTextColor;

  /// {@macro ShadBreadcrumb.wrapAlignment}
  final WrapAlignment? mainAxisAlignment;

  /// {@macro ShadBreadcrumb.wrapCrossAxisAlignment}
  final WrapCrossAlignment? crossAxisAlignment;

  /// {@macro ShadBreadcrumb.dropdownMenuBackgroundColor}
  final Color? dropdownMenuBackgroundColor;

  /// {@macro ShadBreadcrumb.dropdownMenuPadding}
  final EdgeInsets? dropdownMenuPadding;

  /// {@macro ShadBreadcrumb.dropdownTextStyle}
  final TextStyle? dropdownTextStyle;

  /// {@macro ShadBreadcrumb.dropdownItemPadding}
  final EdgeInsets? dropdownItemPadding;

  static ShadBreadcrumbTheme? lerp(
      ShadBreadcrumbTheme? a,
      ShadBreadcrumbTheme? b,
      double t,
      ) => _$ShadBreadcrumbTheme.lerp(a, b, t);
}
