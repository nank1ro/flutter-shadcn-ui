import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/components/sidebar/common/enums.dart';
import 'package:theme_extensions_builder_annotation/theme_extensions_builder_annotation.dart';

part 'sidebar.g.theme.dart';

@themeGen
@immutable
class ShadSidebarTheme with _$ShadSidebarTheme {
  const ShadSidebarTheme({
    bool canMerge = true,
    this.side,
    this.extendedWidth,
    this.mobileWidth,
    this.mobileBreakPoint,
    this.collapseMode,
    this.collapsedToIconsWidth,
    this.animationDuration,
    this.animationCurve,
  }) : _canMerge = canMerge;

  @ignore
  final bool _canMerge;

  final ShadSidebarSide? side;
  final double? extendedWidth;
  final double? mobileWidth;
  final double? mobileBreakPoint;
  final double? collapsedToIconsWidth;
  final ShadSidebarCollapseMode? collapseMode;
  final Duration? animationDuration;
  final Curve? animationCurve;

  @override
  bool get canMerge => _canMerge;

  static ShadSidebarTheme? lerp(
    ShadSidebarTheme a,
    ShadSidebarTheme b,
    double t,
  ) {
    return _$ShadSidebarTheme.lerp(a, b, t);
  }
}
