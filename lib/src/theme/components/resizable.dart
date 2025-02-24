import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';

@immutable
class ShadResizableTheme {
  const ShadResizableTheme({
    this.merge = true,
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
  });

  final bool merge;

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
  final EdgeInsets? handlePadding;

  /// {@macro ShadResizablePanelGroup.handleSize}
  final double? handleSize;

  /// {@macro ShadResizablePanelGroup.dividerThickness}
  final double? dividerThickness;

  /// {@macro ShadResizablePanelGroup.dividerColor}
  final Color? dividerColor;

  static ShadResizableTheme lerp(
    ShadResizableTheme a,
    ShadResizableTheme b,
    double t,
  ) {
    if (identical(a, b)) return a;
    return ShadResizableTheme(
      merge: b.merge,
      mainAxisAlignment: t < 0.5 ? a.mainAxisAlignment : b.mainAxisAlignment,
      crossAxisAlignment: t < 0.5 ? a.crossAxisAlignment : b.crossAxisAlignment,
      mainAxisSize: t < 0.5 ? a.mainAxisSize : b.mainAxisSize,
      textDirection: t < 0.5 ? a.textDirection : b.textDirection,
      verticalDirection: t < 0.5 ? a.verticalDirection : b.verticalDirection,
      showHandle: t < 0.5 ? a.showHandle : b.showHandle,
      handleIconData: t < 0.5 ? a.handleIconData : b.handleIconData,
      dividerSize: lerpDouble(a.dividerSize, b.dividerSize, t),
      resetOnDoubleTap: t < 0.5 ? a.resetOnDoubleTap : b.resetOnDoubleTap,
      handleDecoration:
          ShadDecoration.lerp(a.handleDecoration, b.handleDecoration, t),
      handlePadding: EdgeInsets.lerp(a.handlePadding, b.handlePadding, t),
      handleSize: lerpDouble(a.handleSize, b.handleSize, t),
      dividerColor: Color.lerp(a.dividerColor, b.dividerColor, t),
      dividerThickness: lerpDouble(a.dividerThickness, b.dividerThickness, t),
    );
  }

  ShadResizableTheme mergeWith(ShadResizableTheme? other) {
    if (other == null) return this;
    if (!other.merge) return other;
    return copyWith(
      mainAxisAlignment: other.mainAxisAlignment,
      crossAxisAlignment: other.crossAxisAlignment,
      mainAxisSize: other.mainAxisSize,
      textDirection: other.textDirection,
      verticalDirection: other.verticalDirection,
      showHandle: other.showHandle,
      handleIconData: other.handleIconData,
      dividerSize: other.dividerSize,
      resetOnDoubleTap: other.resetOnDoubleTap,
      handleDecoration: handleDecoration?.mergeWith(other.handleDecoration) ??
          other.handleDecoration,
      handlePadding: other.handlePadding,
      handleSize: other.handleSize,
      dividerColor: other.dividerColor,
      dividerThickness: other.dividerThickness,
    );
  }

  ShadResizableTheme copyWith({
    bool? merge,
    MainAxisAlignment? mainAxisAlignment,
    CrossAxisAlignment? crossAxisAlignment,
    MainAxisSize? mainAxisSize,
    TextDirection? textDirection,
    VerticalDirection? verticalDirection,
    bool? showHandle,
    IconData? handleIconData,
    double? dividerSize,
    bool? resetOnDoubleTap,
    ShadDecoration? handleDecoration,
    EdgeInsets? handlePadding,
    double? handleSize,
    Color? dividerColor,
    double? dividerThickness,
  }) {
    return ShadResizableTheme(
      merge: merge ?? this.merge,
      mainAxisAlignment: mainAxisAlignment ?? this.mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment ?? this.crossAxisAlignment,
      mainAxisSize: mainAxisSize ?? this.mainAxisSize,
      textDirection: textDirection ?? this.textDirection,
      verticalDirection: verticalDirection ?? this.verticalDirection,
      showHandle: showHandle ?? this.showHandle,
      handleIconData: handleIconData ?? this.handleIconData,
      dividerSize: dividerSize ?? this.dividerSize,
      resetOnDoubleTap: resetOnDoubleTap ?? this.resetOnDoubleTap,
      handleDecoration: handleDecoration ?? this.handleDecoration,
      handlePadding: handlePadding ?? this.handlePadding,
      handleSize: handleSize ?? this.handleSize,
      dividerColor: dividerColor ?? this.dividerColor,
      dividerThickness: dividerThickness ?? this.dividerThickness,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShadResizableTheme &&
        other.merge == merge &&
        other.mainAxisAlignment == mainAxisAlignment &&
        other.crossAxisAlignment == crossAxisAlignment &&
        other.mainAxisSize == mainAxisSize &&
        other.textDirection == textDirection &&
        other.verticalDirection == verticalDirection &&
        other.showHandle == showHandle &&
        other.handleIconData == handleIconData &&
        other.dividerSize == dividerSize &&
        other.resetOnDoubleTap == resetOnDoubleTap &&
        other.handleDecoration == handleDecoration &&
        other.handlePadding == handlePadding &&
        other.handleSize == handleSize &&
        other.dividerColor == dividerColor &&
        other.dividerThickness == dividerThickness;
  }

  @override
  int get hashCode {
    return merge.hashCode ^
        mainAxisAlignment.hashCode ^
        crossAxisAlignment.hashCode ^
        mainAxisSize.hashCode ^
        textDirection.hashCode ^
        verticalDirection.hashCode ^
        showHandle.hashCode ^
        handleIconData.hashCode ^
        dividerSize.hashCode ^
        resetOnDoubleTap.hashCode ^
        handleDecoration.hashCode ^
        handlePadding.hashCode ^
        handleSize.hashCode ^
        dividerColor.hashCode ^
        dividerThickness.hashCode;
  }
}
