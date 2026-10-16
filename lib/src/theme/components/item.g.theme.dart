// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'item.dart';

// **************************************************************************
// ThemeGenGenerator
// **************************************************************************

mixin _$ShadItemTheme {
  bool get canMerge => true;

  static ShadItemTheme? lerp(ShadItemTheme? a, ShadItemTheme? b, double t) {
    if (identical(a, b)) {
      return a;
    }

    if (a == null) {
      return t == 1.0 ? b : null;
    }

    if (b == null) {
      return t == 0.0 ? a : null;
    }

    return ShadItemTheme(
      decoration: ShadDecoration.lerp(a.decoration, b.decoration, t),
      backgroundColor: Color.lerp(a.backgroundColor, b.backgroundColor, t),
      hoverBackgroundColor: Color.lerp(
        a.hoverBackgroundColor,
        b.hoverBackgroundColor,
        t,
      ),
      cursor: t < 0.5 ? a.cursor : b.cursor,
      size: t < 0.5 ? a.size : b.size,
      padding: EdgeInsetsGeometry.lerp(a.padding, b.padding, t),
      gap: lerpDouble$(a.gap, b.gap, t),
      titleStyle: TextStyle.lerp(a.titleStyle, b.titleStyle, t),
      descriptionStyle: TextStyle.lerp(
        a.descriptionStyle,
        b.descriptionStyle,
        t,
      ),
      descriptionMaxLines: t < 0.5
          ? a.descriptionMaxLines
          : b.descriptionMaxLines,
      contentSpacing: lerpDouble$(a.contentSpacing, b.contentSpacing, t),
      actionsSpacing: lerpDouble$(a.actionsSpacing, b.actionsSpacing, t),
      headerSpacing: lerpDouble$(a.headerSpacing, b.headerSpacing, t),
      footerSpacing: lerpDouble$(a.footerSpacing, b.footerSpacing, t),
      mediaIconSize: lerpDouble$(a.mediaIconSize, b.mediaIconSize, t),
      mediaIconContainerSize: lerpDouble$(
        a.mediaIconContainerSize,
        b.mediaIconContainerSize,
        t,
      ),
      mediaImageSize: lerpDouble$(a.mediaImageSize, b.mediaImageSize, t),
      mediaRadius: BorderRadius.lerp(a.mediaRadius, b.mediaRadius, t),
      mediaBackgroundColor: Color.lerp(
        a.mediaBackgroundColor,
        b.mediaBackgroundColor,
        t,
      ),
      mediaBorderColor: Color.lerp(a.mediaBorderColor, b.mediaBorderColor, t),
    );
  }

  ShadItemTheme copyWith({
    ShadDecoration? decoration,
    Color? backgroundColor,
    Color? hoverBackgroundColor,
    MouseCursor? cursor,
    ShadItemSize? size,
    EdgeInsetsGeometry? padding,
    double? gap,
    TextStyle? titleStyle,
    TextStyle? descriptionStyle,
    int? descriptionMaxLines,
    double? contentSpacing,
    double? actionsSpacing,
    double? headerSpacing,
    double? footerSpacing,
    double? mediaIconSize,
    double? mediaIconContainerSize,
    double? mediaImageSize,
    BorderRadius? mediaRadius,
    Color? mediaBackgroundColor,
    Color? mediaBorderColor,
  }) {
    final _this = (this as ShadItemTheme);

    return ShadItemTheme(
      decoration: decoration ?? _this.decoration,
      backgroundColor: backgroundColor ?? _this.backgroundColor,
      hoverBackgroundColor: hoverBackgroundColor ?? _this.hoverBackgroundColor,
      cursor: cursor ?? _this.cursor,
      size: size ?? _this.size,
      padding: padding ?? _this.padding,
      gap: gap ?? _this.gap,
      titleStyle: titleStyle ?? _this.titleStyle,
      descriptionStyle: descriptionStyle ?? _this.descriptionStyle,
      descriptionMaxLines: descriptionMaxLines ?? _this.descriptionMaxLines,
      contentSpacing: contentSpacing ?? _this.contentSpacing,
      actionsSpacing: actionsSpacing ?? _this.actionsSpacing,
      headerSpacing: headerSpacing ?? _this.headerSpacing,
      footerSpacing: footerSpacing ?? _this.footerSpacing,
      mediaIconSize: mediaIconSize ?? _this.mediaIconSize,
      mediaIconContainerSize:
          mediaIconContainerSize ?? _this.mediaIconContainerSize,
      mediaImageSize: mediaImageSize ?? _this.mediaImageSize,
      mediaRadius: mediaRadius ?? _this.mediaRadius,
      mediaBackgroundColor: mediaBackgroundColor ?? _this.mediaBackgroundColor,
      mediaBorderColor: mediaBorderColor ?? _this.mediaBorderColor,
    );
  }

  ShadItemTheme merge(ShadItemTheme? other) {
    final _this = (this as ShadItemTheme);

    if (other == null || identical(_this, other)) {
      return _this;
    }

    if (!other.canMerge) {
      return other;
    }

    return copyWith(
      decoration: _this.decoration?.merge(other.decoration) ?? other.decoration,
      backgroundColor: other.backgroundColor,
      hoverBackgroundColor: other.hoverBackgroundColor,
      cursor: other.cursor,
      size: other.size,
      padding: other.padding,
      gap: other.gap,
      titleStyle: _this.titleStyle?.merge(other.titleStyle) ?? other.titleStyle,
      descriptionStyle:
          _this.descriptionStyle?.merge(other.descriptionStyle) ??
          other.descriptionStyle,
      descriptionMaxLines: other.descriptionMaxLines,
      contentSpacing: other.contentSpacing,
      actionsSpacing: other.actionsSpacing,
      headerSpacing: other.headerSpacing,
      footerSpacing: other.footerSpacing,
      mediaIconSize: other.mediaIconSize,
      mediaIconContainerSize: other.mediaIconContainerSize,
      mediaImageSize: other.mediaImageSize,
      mediaRadius: other.mediaRadius,
      mediaBackgroundColor: other.mediaBackgroundColor,
      mediaBorderColor: other.mediaBorderColor,
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

    final _this = (this as ShadItemTheme);
    final _other = (other as ShadItemTheme);

    return _other.decoration == _this.decoration &&
        _other.backgroundColor == _this.backgroundColor &&
        _other.hoverBackgroundColor == _this.hoverBackgroundColor &&
        _other.cursor == _this.cursor &&
        _other.size == _this.size &&
        _other.padding == _this.padding &&
        _other.gap == _this.gap &&
        _other.titleStyle == _this.titleStyle &&
        _other.descriptionStyle == _this.descriptionStyle &&
        _other.descriptionMaxLines == _this.descriptionMaxLines &&
        _other.contentSpacing == _this.contentSpacing &&
        _other.actionsSpacing == _this.actionsSpacing &&
        _other.headerSpacing == _this.headerSpacing &&
        _other.footerSpacing == _this.footerSpacing &&
        _other.mediaIconSize == _this.mediaIconSize &&
        _other.mediaIconContainerSize == _this.mediaIconContainerSize &&
        _other.mediaImageSize == _this.mediaImageSize &&
        _other.mediaRadius == _this.mediaRadius &&
        _other.mediaBackgroundColor == _this.mediaBackgroundColor &&
        _other.mediaBorderColor == _this.mediaBorderColor;
  }

  @override
  int get hashCode {
    final _this = (this as ShadItemTheme);

    return Object.hashAll([
      runtimeType,
      _this.decoration,
      _this.backgroundColor,
      _this.hoverBackgroundColor,
      _this.cursor,
      _this.size,
      _this.padding,
      _this.gap,
      _this.titleStyle,
      _this.descriptionStyle,
      _this.descriptionMaxLines,
      _this.contentSpacing,
      _this.actionsSpacing,
      _this.headerSpacing,
      _this.footerSpacing,
      _this.mediaIconSize,
      _this.mediaIconContainerSize,
      _this.mediaImageSize,
      _this.mediaRadius,
      _this.mediaBackgroundColor,
      _this.mediaBorderColor,
    ]);
  }
}
