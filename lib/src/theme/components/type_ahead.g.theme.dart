// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'type_ahead.dart';

// **************************************************************************
// ThemeGenGenerator
// **************************************************************************

mixin _$ShadTypeAheadTheme {
  bool get canMerge => true;

  static ShadTypeAheadTheme? lerp(
    ShadTypeAheadTheme? a,
    ShadTypeAheadTheme? b,
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

    return ShadTypeAheadTheme(
      decoration: ShadDecoration.lerp(a.decoration, b.decoration, t),
      placeholderStyle: TextStyle.lerp(
        a.placeholderStyle,
        b.placeholderStyle,
        t,
      ),
      minWidth: lerpDouble$(a.minWidth, b.minWidth, t),
      maxWidth: lerpDouble$(a.maxWidth, b.maxWidth, t),
      maxHeight: lerpDouble$(a.maxHeight, b.maxHeight, t),
      padding: EdgeInsetsGeometry.lerp(a.padding, b.padding, t),
      optionsPadding: EdgeInsetsGeometry.lerp(
        a.optionsPadding,
        b.optionsPadding,
        t,
      ),
      showScrollToTopChevron: t < 0.5
          ? a.showScrollToTopChevron
          : b.showScrollToTopChevron,
      showScrollToBottomChevron: t < 0.5
          ? a.showScrollToBottomChevron
          : b.showScrollToBottomChevron,
      anchor: t < 0.5 ? a.anchor : b.anchor,
      effects: t < 0.5 ? a.effects : b.effects,
      shadows: t < 0.5 ? a.shadows : b.shadows,
      filter: t < 0.5 ? a.filter : b.filter,
      popoverReverseDuration: lerpDuration$(
        a.popoverReverseDuration,
        b.popoverReverseDuration,
        t,
      ),
      debounceDuration: lerpDuration$(
        a.debounceDuration,
        b.debounceDuration,
        t,
      ),
    );
  }

  ShadTypeAheadTheme copyWith({
    ShadDecoration? decoration,
    TextStyle? placeholderStyle,
    double? minWidth,
    double? maxWidth,
    double? maxHeight,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? optionsPadding,
    bool? showScrollToTopChevron,
    bool? showScrollToBottomChevron,
    ShadAnchorBase? anchor,
    List<Effect<dynamic>>? effects,
    List<BoxShadow>? shadows,
    ImageFilter? filter,
    Duration? popoverReverseDuration,
    Duration? debounceDuration,
  }) {
    final _this = (this as ShadTypeAheadTheme);

    return ShadTypeAheadTheme(
      decoration: decoration ?? _this.decoration,
      placeholderStyle: placeholderStyle ?? _this.placeholderStyle,
      minWidth: minWidth ?? _this.minWidth,
      maxWidth: maxWidth ?? _this.maxWidth,
      maxHeight: maxHeight ?? _this.maxHeight,
      padding: padding ?? _this.padding,
      optionsPadding: optionsPadding ?? _this.optionsPadding,
      showScrollToTopChevron:
          showScrollToTopChevron ?? _this.showScrollToTopChevron,
      showScrollToBottomChevron:
          showScrollToBottomChevron ?? _this.showScrollToBottomChevron,
      anchor: anchor ?? _this.anchor,
      effects: effects ?? _this.effects,
      shadows: shadows ?? _this.shadows,
      filter: filter ?? _this.filter,
      popoverReverseDuration:
          popoverReverseDuration ?? _this.popoverReverseDuration,
      debounceDuration: debounceDuration ?? _this.debounceDuration,
    );
  }

  ShadTypeAheadTheme merge(ShadTypeAheadTheme? other) {
    final _this = (this as ShadTypeAheadTheme);

    if (other == null || identical(_this, other)) {
      return _this;
    }

    if (!other.canMerge) {
      return other;
    }

    return copyWith(
      decoration: _this.decoration?.merge(other.decoration) ?? other.decoration,
      placeholderStyle:
          _this.placeholderStyle?.merge(other.placeholderStyle) ??
          other.placeholderStyle,
      minWidth: other.minWidth,
      maxWidth: other.maxWidth,
      maxHeight: other.maxHeight,
      padding: other.padding,
      optionsPadding: other.optionsPadding,
      showScrollToTopChevron: other.showScrollToTopChevron,
      showScrollToBottomChevron: other.showScrollToBottomChevron,
      anchor: other.anchor,
      effects: other.effects,
      shadows: other.shadows,
      filter: other.filter,
      popoverReverseDuration: other.popoverReverseDuration,
      debounceDuration: other.debounceDuration,
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

    final _this = (this as ShadTypeAheadTheme);
    final _other = (other as ShadTypeAheadTheme);

    return _other.decoration == _this.decoration &&
        _other.placeholderStyle == _this.placeholderStyle &&
        _other.minWidth == _this.minWidth &&
        _other.maxWidth == _this.maxWidth &&
        _other.maxHeight == _this.maxHeight &&
        _other.padding == _this.padding &&
        _other.optionsPadding == _this.optionsPadding &&
        _other.showScrollToTopChevron == _this.showScrollToTopChevron &&
        _other.showScrollToBottomChevron == _this.showScrollToBottomChevron &&
        _other.anchor == _this.anchor &&
        _other.effects == _this.effects &&
        _other.shadows == _this.shadows &&
        _other.filter == _this.filter &&
        _other.popoverReverseDuration == _this.popoverReverseDuration &&
        _other.debounceDuration == _this.debounceDuration;
  }

  @override
  int get hashCode {
    final _this = (this as ShadTypeAheadTheme);

    return Object.hash(
      runtimeType,
      _this.decoration,
      _this.placeholderStyle,
      _this.minWidth,
      _this.maxWidth,
      _this.maxHeight,
      _this.padding,
      _this.optionsPadding,
      _this.showScrollToTopChevron,
      _this.showScrollToBottomChevron,
      _this.anchor,
      _this.effects,
      _this.shadows,
      _this.filter,
      _this.popoverReverseDuration,
      _this.debounceDuration,
    );
  }
}
