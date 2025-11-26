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
      crossAxisAlignment:
          t < 0.5 ? a?.crossAxisAlignment : b?.crossAxisAlignment,
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
    final _this = (this as ShadResizableTheme);

    return ShadResizableTheme(
      mainAxisAlignment: mainAxisAlignment ?? _this.mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment ?? _this.crossAxisAlignment,
      mainAxisSize: mainAxisSize ?? _this.mainAxisSize,
      textDirection: textDirection ?? _this.textDirection,
      verticalDirection: verticalDirection ?? _this.verticalDirection,
      showHandle: showHandle ?? _this.showHandle,
      handleIconData: handleIconData ?? _this.handleIconData,
      dividerSize: dividerSize ?? _this.dividerSize,
      resetOnDoubleTap: resetOnDoubleTap ?? _this.resetOnDoubleTap,
      handleDecoration: handleDecoration ?? _this.handleDecoration,
      handlePadding: handlePadding ?? _this.handlePadding,
      handleSize: handleSize ?? _this.handleSize,
      dividerThickness: dividerThickness ?? _this.dividerThickness,
      dividerColor: dividerColor ?? _this.dividerColor,
    );
  }

  ShadResizableTheme merge(ShadResizableTheme? other) {
    final _this = (this as ShadResizableTheme);

    if (other == null) {
      return _this;
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

    final _this = (this as ShadResizableTheme);
    final _other = (other as ShadResizableTheme);

    return _other.mainAxisAlignment == _this.mainAxisAlignment &&
        _other.crossAxisAlignment == _this.crossAxisAlignment &&
        _other.mainAxisSize == _this.mainAxisSize &&
        _other.textDirection == _this.textDirection &&
        _other.verticalDirection == _this.verticalDirection &&
        _other.showHandle == _this.showHandle &&
        _other.handleIconData == _this.handleIconData &&
        _other.dividerSize == _this.dividerSize &&
        _other.resetOnDoubleTap == _this.resetOnDoubleTap &&
        _other.handleDecoration == _this.handleDecoration &&
        _other.handlePadding == _this.handlePadding &&
        _other.handleSize == _this.handleSize &&
        _other.dividerThickness == _this.dividerThickness &&
        _other.dividerColor == _this.dividerColor;
  }

  @override
  int get hashCode {
    final _this = (this as ShadResizableTheme);

    return Object.hash(
      runtimeType,
      _this.mainAxisAlignment,
      _this.crossAxisAlignment,
      _this.mainAxisSize,
      _this.textDirection,
      _this.verticalDirection,
      _this.showHandle,
      _this.handleIconData,
      _this.dividerSize,
      _this.resetOnDoubleTap,
      _this.handleDecoration,
      _this.handlePadding,
      _this.handleSize,
      _this.dividerThickness,
      _this.dividerColor,
    );
  }
}
