import 'package:flutter/widgets.dart';
import 'package:theme_extensions_builder_annotation/theme_extensions_builder_annotation.dart';

part 'sidebar.g.theme.dart';

@themeGen
@immutable
class ShadSidebarTheme with _$ShadSidebarTheme {
  const ShadSidebarTheme({
    bool canMerge = true,
    this.backgroundColor,
    this.foregroundColor,
    this.borderColor,
    this.ringColor,
    this.accentColor,
    this.accentForegroundColor,
    this.primaryColor,
    this.primaryForegroundColor,
  }) : _canMerge = canMerge;

  @ignore
  final bool _canMerge;

  @override
  bool get canMerge => _canMerge;

  final Color? backgroundColor;

  final Color? foregroundColor;

  final Color? borderColor;

  final Color? ringColor;

  final Color? accentColor;

  final Color? accentForegroundColor;

  final Color? primaryColor;

  final Color? primaryForegroundColor;

  static ShadSidebarTheme? lerp(
    ShadSidebarTheme a,
    ShadSidebarTheme b,
    double t,
  ) {
    return _$ShadSidebarTheme.lerp(a, b, t);
  }
}
