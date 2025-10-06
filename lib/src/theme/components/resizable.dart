import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:theme_extensions_builder_annotation/theme_extensions_builder_annotation.dart';

part 'resizable.g.theme.dart';

@themeGen
@immutable
class ShadResizableTheme with _$ShadResizableTheme {
  const ShadResizableTheme({
    bool canMerge = true,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.mainAxisSize,
    this.textDirection,
    this.verticalDirection,
    this.showHandle,
    this.handleIconData,
    this.dividerSize,
    this.resetOnDoubleTap,
    this.handleDecoration,
    this.handlePadding,
    this.handleSize,
    this.dividerThickness,
    this.dividerColor,
  }) : _canMerge = canMerge;

  @ignore
  final bool _canMerge;

  @override
  bool get canMerge => _canMerge;

  /// {@macro ShadResizablePanelGroup.mainAxisAlignment}
  final MainAxisAlignment? mainAxisAlignment;

  /// {@macro ShadResizablePanelGroup.crossAxisAlignment}
  final CrossAxisAlignment? crossAxisAlignment;

  /// {@macro ShadResizablePanelGroup.mainAxisSize}
  final MainAxisSize? mainAxisSize;

  /// {@macro ShadResizablePanelGroup.textDirection}
  final TextDirection? textDirection;

  /// {@macro ShadResizablePanelGroup.verticalDirection}
  final VerticalDirection? verticalDirection;

  /// {@macro ShadResizablePanelGroup.showHandle}
  final bool? showHandle;

  /// {@macro ShadResizablePanelGroup.handleIconData}
  final IconData? handleIconData;

  /// {@macro ShadResizablePanelGroup.dividerSize}
  final double? dividerSize;

  /// {@macro ShadResizablePanelGroup.resetOnDoubleTap}
  final bool? resetOnDoubleTap;

  /// {@macro ShadResizablePanelGroup.handleDecoration}
  final ShadDecoration? handleDecoration;

  /// {@macro ShadResizablePanelGroup.handlePadding}
  final EdgeInsetsGeometry? handlePadding;

  /// {@macro ShadResizablePanelGroup.handleSize}
  final double? handleSize;

  /// {@macro ShadResizablePanelGroup.dividerThickness}
  final double? dividerThickness;

  /// {@macro ShadResizablePanelGroup.dividerColor}
  final Color? dividerColor;

  static ShadResizableTheme? lerp(
    ShadResizableTheme? a,
    ShadResizableTheme? b,
    double t,
  ) =>
      _$ShadResizableTheme.lerp(a, b, t);
}
