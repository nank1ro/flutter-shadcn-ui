// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'select.dart';

// **************************************************************************
// ThemeGenGenerator
// **************************************************************************

mixin _$ShadSelectTheme {
  bool get canMerge => true;

  static ShadSelectTheme? lerp(
    ShadSelectTheme? a,
    ShadSelectTheme? b,
    double t,
  ) {
    if (a == null && b == null) {
      return null;
    }

    return ShadSelectTheme(
      popoverReverseDuration: lerpDuration$(
        a?.popoverReverseDuration,
        b?.popoverReverseDuration,
        t,
      ),
      decoration: ShadDecoration.lerp(a?.decoration, b?.decoration, t),
      placeholderStyle: TextStyle.lerp(
        a?.placeholderStyle,
        b?.placeholderStyle,
        t,
      ),
      minWidth: lerpDouble$(a?.minWidth, b?.minWidth, t),
      maxWidth: lerpDouble$(a?.maxWidth, b?.maxWidth, t),
      maxHeight: lerpDouble$(a?.maxHeight, b?.maxHeight, t),
      padding: EdgeInsetsGeometry.lerp(a?.padding, b?.padding, t),
      optionsPadding: EdgeInsetsGeometry.lerp(
        a?.optionsPadding,
        b?.optionsPadding,
        t,
      ),
      showScrollToTopChevron:
          t < 0.5 ? a?.showScrollToTopChevron : b?.showScrollToTopChevron,
      showScrollToBottomChevron:
          t < 0.5 ? a?.showScrollToBottomChevron : b?.showScrollToBottomChevron,
      anchor: t < 0.5 ? a?.anchor : b?.anchor,
      searchPadding: EdgeInsetsGeometry.lerp(
        a?.searchPadding,
        b?.searchPadding,
        t,
      ),
      clearSearchOnClose:
          t < 0.5 ? a?.clearSearchOnClose : b?.clearSearchOnClose,
      filter: t < 0.5 ? a?.filter : b?.filter,
      effects: t < 0.5 ? a?.effects : b?.effects,
      shadows: t < 0.5 ? a?.shadows : b?.shadows,
    );
  }

  ShadSelectTheme copyWith({
    Duration? popoverReverseDuration,
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
    EdgeInsetsGeometry? searchPadding,
    bool? clearSearchOnClose,
    ImageFilter? filter,
    List<Effect<dynamic>>? effects,
    List<BoxShadow>? shadows,
  }) {
    final _this = (this as ShadSelectTheme);

    return ShadSelectTheme(
      popoverReverseDuration:
          popoverReverseDuration ?? _this.popoverReverseDuration,
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
      searchPadding: searchPadding ?? _this.searchPadding,
      clearSearchOnClose: clearSearchOnClose ?? _this.clearSearchOnClose,
      filter: filter ?? _this.filter,
      effects: effects ?? _this.effects,
      shadows: shadows ?? _this.shadows,
    );
  }

  ShadSelectTheme merge(ShadSelectTheme? other) {
    final _this = (this as ShadSelectTheme);

    if (other == null) {
      return _this;
    }

    if (!other.canMerge) {
      return other;
    }

    return copyWith(
      popoverReverseDuration: other.popoverReverseDuration,
      decoration: other.decoration,
      placeholderStyle: _this.placeholderStyle?.merge(other.placeholderStyle) ??
          other.placeholderStyle,
      minWidth: other.minWidth,
      maxWidth: other.maxWidth,
      maxHeight: other.maxHeight,
      padding: other.padding,
      optionsPadding: other.optionsPadding,
      showScrollToTopChevron: other.showScrollToTopChevron,
      showScrollToBottomChevron: other.showScrollToBottomChevron,
      anchor: other.anchor,
      searchPadding: other.searchPadding,
      clearSearchOnClose: other.clearSearchOnClose,
      filter: other.filter,
      effects: other.effects,
      shadows: other.shadows,
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

    final _this = (this as ShadSelectTheme);
    final _other = (other as ShadSelectTheme);

    return _other.popoverReverseDuration == _this.popoverReverseDuration &&
        _other.decoration == _this.decoration &&
        _other.placeholderStyle == _this.placeholderStyle &&
        _other.minWidth == _this.minWidth &&
        _other.maxWidth == _this.maxWidth &&
        _other.maxHeight == _this.maxHeight &&
        _other.padding == _this.padding &&
        _other.optionsPadding == _this.optionsPadding &&
        _other.showScrollToTopChevron == _this.showScrollToTopChevron &&
        _other.showScrollToBottomChevron == _this.showScrollToBottomChevron &&
        _other.anchor == _this.anchor &&
        _other.searchPadding == _this.searchPadding &&
        _other.clearSearchOnClose == _this.clearSearchOnClose &&
        _other.filter == _this.filter &&
        _other.effects == _this.effects &&
        _other.shadows == _this.shadows;
  }

  @override
  int get hashCode {
    final _this = (this as ShadSelectTheme);

    return Object.hash(
      runtimeType,
      _this.popoverReverseDuration,
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
      _this.searchPadding,
      _this.clearSearchOnClose,
      _this.filter,
      _this.effects,
      _this.shadows,
    );
  }
}
