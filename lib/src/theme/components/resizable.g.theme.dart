// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'resizable.dart';

// **************************************************************************
// ThemeGenGenerator
// **************************************************************************

mixin _$ShadResizableTheme {
  bool get canMerge => true;

  static ShadResizableTheme? lerp(
    ShadResizableTheme? a,
    ShadResizableTheme? b,
    double t,
  ) {
    if (a == null && b == null) {
      return null;
    }

    return ShadResizableTheme(
      mainAxisAlignment: t < 0.5 ? a?.mainAxisAlignment : b?.mainAxisAlignment,
      crossAxisAlignment: t < 0.5
          ? a?.crossAxisAlignment
          : b?.crossAxisAlignment,
      mainAxisSize: t < 0.5 ? a?.mainAxisSize : b?.mainAxisSize,
      textDirection: t < 0.5 ? a?.textDirection : b?.textDirection,
      verticalDirection: t < 0.5 ? a?.verticalDirection : b?.verticalDirection,
      showHandle: t < 0.5 ? a?.showHandle : b?.showHandle,
      handleIconData: t < 0.5 ? a?.handleIconData : b?.handleIconData,
      dividerSize: lerpDouble$(a?.dividerSize, b?.dividerSize, t),
      resetOnDoubleTap: t < 0.5 ? a?.resetOnDoubleTap : b?.resetOnDoubleTap,
      handleDecoration: ShadDecoration.lerp(
        a?.handleDecoration,
        b?.handleDecoration,
        t,
      ),
      handlePadding: EdgeInsetsGeometry.lerp(
        a?.handlePadding,
        b?.handlePadding,
        t,
      ),
      handleSize: lerpDouble$(a?.handleSize, b?.handleSize, t),
      dividerThickness: lerpDouble$(
        a?.dividerThickness,
        b?.dividerThickness,
        t,
      ),
      dividerColor: Color.lerp(a?.dividerColor, b?.dividerColor, t),
    );
  }

  ShadResizableTheme copyWith({
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
    EdgeInsetsGeometry? handlePadding,
    double? handleSize,
    double? dividerThickness,
    Color? dividerColor,
  }) {
    final a = (this as ShadResizableTheme);

    return ShadResizableTheme(
      mainAxisAlignment: mainAxisAlignment ?? a.mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment ?? a.crossAxisAlignment,
      mainAxisSize: mainAxisSize ?? a.mainAxisSize,
      textDirection: textDirection ?? a.textDirection,
      verticalDirection: verticalDirection ?? a.verticalDirection,
      showHandle: showHandle ?? a.showHandle,
      handleIconData: handleIconData ?? a.handleIconData,
      dividerSize: dividerSize ?? a.dividerSize,
      resetOnDoubleTap: resetOnDoubleTap ?? a.resetOnDoubleTap,
      handleDecoration: handleDecoration ?? a.handleDecoration,
      handlePadding: handlePadding ?? a.handlePadding,
      handleSize: handleSize ?? a.handleSize,
      dividerThickness: dividerThickness ?? a.dividerThickness,
      dividerColor: dividerColor ?? a.dividerColor,
    );
  }

  ShadResizableTheme merge(ShadResizableTheme? other) {
    final current = (this as ShadResizableTheme);

    if (other == null) {
      return current;
    }

    if (!other.canMerge) {
      return other;
    }

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
      handleDecoration: other.handleDecoration,
      handlePadding: other.handlePadding,
      handleSize: other.handleSize,
      dividerThickness: other.dividerThickness,
      dividerColor: other.dividerColor,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    if (other.runtimeType != runtimeType) {
      return false;
    }

    final value = (this as ShadResizableTheme);

    return other is ShadResizableTheme &&
        other.mainAxisAlignment == value.mainAxisAlignment &&
        other.crossAxisAlignment == value.crossAxisAlignment &&
        other.mainAxisSize == value.mainAxisSize &&
        other.textDirection == value.textDirection &&
        other.verticalDirection == value.verticalDirection &&
        other.showHandle == value.showHandle &&
        other.handleIconData == value.handleIconData &&
        other.dividerSize == value.dividerSize &&
        other.resetOnDoubleTap == value.resetOnDoubleTap &&
        other.handleDecoration == value.handleDecoration &&
        other.handlePadding == value.handlePadding &&
        other.handleSize == value.handleSize &&
        other.dividerThickness == value.dividerThickness &&
        other.dividerColor == value.dividerColor;
  }

  @override
  int get hashCode {
    final value = (this as ShadResizableTheme);

    return Object.hash(
      runtimeType,
      value.mainAxisAlignment,
      value.crossAxisAlignment,
      value.mainAxisSize,
      value.textDirection,
      value.verticalDirection,
      value.showHandle,
      value.handleIconData,
      value.dividerSize,
      value.resetOnDoubleTap,
      value.handleDecoration,
      value.handlePadding,
      value.handleSize,
      value.dividerThickness,
      value.dividerColor,
    );
  }
}
