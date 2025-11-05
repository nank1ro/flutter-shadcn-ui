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
    this.ellipsisSize,
    this.spacing,
    this.itemTextStyle,
    this.linkTextStyle,
    this.linkHoverTextStyle,
    this.currentPageTextStyle,
    this.itemPadding,
    this.pagePadding,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
  }): _canMerge = canMerge;

  @ignore
  final bool _canMerge;

  @override
  bool get canMerge => _canMerge;

  /// {@macro ShadBreadcrumb.separator}
  final Widget? separator;

  /// {@macro ShadBreadcrumb.ellipsis}
  final Widget? ellipsis;

  /// {@macro ShadBreadcrumb.ellipsisSize}
  final Size? ellipsisSize;

  /// {@macro ShadBreadcrumb.spacing}
  final double? spacing;

  /// {@macro ShadBreadcrumb.itemTextStyle}
  final TextStyle? itemTextStyle;

  /// {@macro ShadBreadcrumb.linkTextStyle}
  final TextStyle? linkTextStyle;

  /// {@macro ShadBreadcrumb.linkHoverTextStyle}
  final TextStyle? linkHoverTextStyle;

  /// {@macro ShadBreadcrumb.currentPageTextStyle}
  final TextStyle? currentPageTextStyle;

  /// {@macro ShadBreadcrumb.itemPadding}
  final EdgeInsets? itemPadding;

  /// {@macro ShadBreadcrumb.pagePadding}
  final EdgeInsets? pagePadding;

  /// {@macro ShadBreadcrumb.mainAxisAlignment}
  final MainAxisAlignment? mainAxisAlignment;

  /// {@macro ShadBreadcrumb.crossAxisAlignment}
  final CrossAxisAlignment? crossAxisAlignment;

  static ShadBreadcrumbTheme? lerp(
      ShadBreadcrumbTheme a,
      ShadBreadcrumbTheme b,
      double t,
      )  => _$ShadBreadcrumbTheme.lerp(a, b, t);
}
