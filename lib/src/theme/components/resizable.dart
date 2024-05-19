import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

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
    this.handleIconSrc,
    this.dividerSize,
    this.resetOnDoubleTap,
    this.handleDecoration,
    this.handlePadding,
    this.handleSize,
    this.dividerThickness,
    this.dividerColor,
  });

  final bool merge;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisSize? mainAxisSize;
  final TextDirection? textDirection;
  final VerticalDirection? verticalDirection;
  final bool? showHandle;
  final ShadImageSrc? handleIconSrc;
  final double? dividerSize;
  final bool? resetOnDoubleTap;
  final ShadDecoration? handleDecoration;
  final EdgeInsets? handlePadding;
  final Size? handleSize;
  final double? dividerThickness;
  final Color? dividerColor;

  static ShadResizableTheme lerp(
    ShadResizableTheme a,
    ShadResizableTheme b,
    double t,
  ) {
    if (identical(a, b)) return a;
    return ShadResizableTheme(
      merge: b.merge,
      mainAxisAlignment: b.mainAxisAlignment,
      crossAxisAlignment: b.crossAxisAlignment,
      mainAxisSize: b.mainAxisSize,
      textDirection: b.textDirection,
      verticalDirection: b.verticalDirection,
      showHandle: b.showHandle,
      handleIconSrc: b.handleIconSrc,
      dividerSize: lerpDouble(a.dividerSize, b.dividerSize, t),
      resetOnDoubleTap: b.resetOnDoubleTap,
      handleDecoration:
          ShadDecoration.lerp(a.handleDecoration, b.handleDecoration, t),
      handlePadding: EdgeInsets.lerp(a.handlePadding, b.handlePadding, t),
      handleSize: Size.lerp(a.handleSize, b.handleSize, t),
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
      handleIconSrc: other.handleIconSrc,
      dividerSize: other.dividerSize,
      resetOnDoubleTap: other.resetOnDoubleTap,
      handleDecoration: other.handleDecoration,
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
    ShadImageSrc? handleIconSrc,
    double? dividerSize,
    bool? resetOnDoubleTap,
    ShadDecoration? handleDecoration,
    EdgeInsets? handlePadding,
    Size? handleSize,
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
      handleIconSrc: handleIconSrc ?? this.handleIconSrc,
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
        other.handleIconSrc == handleIconSrc &&
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
        handleIconSrc.hashCode ^
        dividerSize.hashCode ^
        resetOnDoubleTap.hashCode ^
        handleDecoration.hashCode ^
        handlePadding.hashCode ^
        handleSize.hashCode ^
        dividerColor.hashCode ^
        dividerThickness.hashCode;
  }
}
