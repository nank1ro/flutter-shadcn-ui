// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'sticky_section_list.dart';

// **************************************************************************
// ThemeGenGenerator
// **************************************************************************

mixin _$ShadStickySectionListTheme {
  bool get canMerge => true;

  static ShadStickySectionListTheme? lerp(
    ShadStickySectionListTheme? a,
    ShadStickySectionListTheme? b,
    double t,
  ) {
    if (identical(a, b)) {
      return a;
    }

    if (a == null) {
      return t == 1.0 ? b : null;
    }

    if (b == null) {
      return t == 0.0 ? a : null;
    }

    return ShadStickySectionListTheme(
      padding: EdgeInsetsGeometry.lerp(a.padding, b.padding, t),
      headerPadding: EdgeInsetsGeometry.lerp(
        a.headerPadding,
        b.headerPadding,
        t,
      ),
      headerBackgroundColor: Color.lerp(
        a.headerBackgroundColor,
        b.headerBackgroundColor,
        t,
      ),
      headerBorder: ShadBorder.lerp(a.headerBorder, b.headerBorder, t),
      inlineHeaderPadding: EdgeInsetsGeometry.lerp(
        a.inlineHeaderPadding,
        b.inlineHeaderPadding,
        t,
      ),
      inlineHeaderBackgroundColor: Color.lerp(
        a.inlineHeaderBackgroundColor,
        b.inlineHeaderBackgroundColor,
        t,
      ),
      clipBehavior: t < 0.5 ? a.clipBehavior : b.clipBehavior,
    );
  }

  ShadStickySectionListTheme copyWith({
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? headerPadding,
    Color? headerBackgroundColor,
    ShadBorder? headerBorder,
    EdgeInsetsGeometry? inlineHeaderPadding,
    Color? inlineHeaderBackgroundColor,
    Clip? clipBehavior,
  }) {
    final _this = (this as ShadStickySectionListTheme);

    return ShadStickySectionListTheme(
      padding: padding ?? _this.padding,
      headerPadding: headerPadding ?? _this.headerPadding,
      headerBackgroundColor:
          headerBackgroundColor ?? _this.headerBackgroundColor,
      headerBorder: headerBorder ?? _this.headerBorder,
      inlineHeaderPadding: inlineHeaderPadding ?? _this.inlineHeaderPadding,
      inlineHeaderBackgroundColor:
          inlineHeaderBackgroundColor ?? _this.inlineHeaderBackgroundColor,
      clipBehavior: clipBehavior ?? _this.clipBehavior,
    );
  }

  ShadStickySectionListTheme merge(ShadStickySectionListTheme? other) {
    final _this = (this as ShadStickySectionListTheme);

    if (other == null || identical(_this, other)) {
      return _this;
    }

    if (!other.canMerge) {
      return other;
    }

    return copyWith(
      padding: other.padding,
      headerPadding: other.headerPadding,
      headerBackgroundColor: other.headerBackgroundColor,
      headerBorder:
          _this.headerBorder?.merge(other.headerBorder) ?? other.headerBorder,
      inlineHeaderPadding: other.inlineHeaderPadding,
      inlineHeaderBackgroundColor: other.inlineHeaderBackgroundColor,
      clipBehavior: other.clipBehavior,
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

    final _this = (this as ShadStickySectionListTheme);
    final _other = (other as ShadStickySectionListTheme);

    return _other.padding == _this.padding &&
        _other.headerPadding == _this.headerPadding &&
        _other.headerBackgroundColor == _this.headerBackgroundColor &&
        _other.headerBorder == _this.headerBorder &&
        _other.inlineHeaderPadding == _this.inlineHeaderPadding &&
        _other.inlineHeaderBackgroundColor ==
            _this.inlineHeaderBackgroundColor &&
        _other.clipBehavior == _this.clipBehavior;
  }

  @override
  int get hashCode {
    final _this = (this as ShadStickySectionListTheme);

    return Object.hash(
      runtimeType,
      _this.padding,
      _this.headerPadding,
      _this.headerBackgroundColor,
      _this.headerBorder,
      _this.inlineHeaderPadding,
      _this.inlineHeaderBackgroundColor,
      _this.clipBehavior,
    );
  }
}
