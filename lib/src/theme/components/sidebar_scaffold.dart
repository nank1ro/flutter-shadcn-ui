import 'package:flutter/widgets.dart';

import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:theme_extensions_builder_annotation/theme_extensions_builder_annotation.dart';

part 'sidebar_scaffold.g.theme.dart';

@themeGen
@immutable
class ShadSidebarScaffoldTheme with _$ShadSidebarScaffoldTheme {
  const ShadSidebarScaffoldTheme({
    bool canMerge = true,
    this.keyboardShortcut,
    this.mobileBreakPoint,
    this.side,
    this.variant,
    this.initiallyExtended,
    this.animationDuration,
    this.animationCurve,
    this.collapsedToIconsWidth,
    this.extendedWidth,
    this.mobileWidth,
    this.collapseMode,
    this.sidebarBorderColor,
  }) : _canMerge = canMerge;

  @ignore
  final bool _canMerge;

  @override
  bool get canMerge => _canMerge;

  // {{@macro ShadSidebarScaffold.side}}
  final ShadSidebarSide? side;

  // {{@macro ShadSidebarScaffold.variant}}
  final ShadSidebarVariant? variant;

  // {{@macro ShadSidebarScaffold.initiallyExtended}}
  final bool? initiallyExtended;

  // {{@macro ShadSidebarScaffold.animationDuration}}
  final Duration? animationDuration;

  // {{@macro ShadSidebarScaffold.animationCurve}}
  final Curve? animationCurve;

  // {{@macro ShadSidebarScaffold.collapsedToIconsWidth}}
  final double? collapsedToIconsWidth;

  // {{@macro ShadSidebarScaffold.extendedWidth}}
  final double? extendedWidth;

  // {{@macro ShadSidebarScaffold.mobileWidth}}
  final double? mobileWidth;

  // {{@macro ShadSidebarScaffold.collapseMode}}
  final ShadSidebarCollapseMode? collapseMode;

  // {{@macro ShadSidebarScaffold.mobileBreakPoint}}
  final double? mobileBreakPoint;

  // {{@macro ShadSidebarScaffold.keyboardShortcut}}
  final ShortcutActivator? keyboardShortcut;

  // {{@macro ShadSidebarScaffold.sidebarBorderColor}}
  final Color? sidebarBorderColor;

  static ShadSidebarScaffoldTheme? lerp(
    ShadSidebarScaffoldTheme a,
    ShadSidebarScaffoldTheme b,
    double t,
  ) {
    return _$ShadSidebarScaffoldTheme.lerp(a, b, t);
  }
}
