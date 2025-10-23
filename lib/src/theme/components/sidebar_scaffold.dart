import 'package:flutter/widgets.dart';
import 'package:theme_extensions_builder_annotation/theme_extensions_builder_annotation.dart';

part 'sidebar_scaffold.g.theme.dart';

@themeGen
@immutable
class ShadSidebarScaffoldTheme with _$ShadSidebarScaffoldTheme {
  const ShadSidebarScaffoldTheme({
    bool canMerge = true,
    this.bodyBackgroundColor,
  }) : _canMerge = canMerge;

  @ignore
  final bool _canMerge;

  /// {@macro ShadSidebarScaffold.initiallyExtended}
  final Color? bodyBackgroundColor;

  @override
  bool get canMerge => _canMerge;

  static ShadSidebarScaffoldTheme? lerp(
    ShadSidebarScaffoldTheme a,
    ShadSidebarScaffoldTheme b,
    double t,
  ) {
    return _$ShadSidebarScaffoldTheme.lerp(a, b, t);
  }
}
