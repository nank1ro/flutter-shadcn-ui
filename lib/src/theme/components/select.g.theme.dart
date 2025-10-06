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
      decoration: ShadDecoration.lerp(a?.decoration, b?.decoration, t),
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
      searchPadding: EdgeInsetsGeometry.lerp(
        a?.searchPadding,
        b?.searchPadding,
        t,
      ),
      clearSearchOnClose:
          t < 0.5 ? a?.clearSearchOnClose : b?.clearSearchOnClose,
      popoverTheme: ShadPopoverTheme.lerp(a?.popoverTheme, b?.popoverTheme, t),
      optionTheme: ShadOptionTheme.lerp(a?.optionTheme, b?.optionTheme, t),
    );
  }

  ShadSelectTheme copyWith({
    ShadDecoration? decoration,
    double? minWidth,
    double? maxWidth,
    double? maxHeight,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? optionsPadding,
    bool? showScrollToTopChevron,
    bool? showScrollToBottomChevron,
    EdgeInsetsGeometry? searchPadding,
    bool? clearSearchOnClose,
    ShadPopoverTheme? popoverTheme,
    ShadOptionTheme? optionTheme,
  }) {
    final a = (this as ShadSelectTheme);

    return ShadSelectTheme(
      decoration: decoration ?? a.decoration,
      minWidth: minWidth ?? a.minWidth,
      maxWidth: maxWidth ?? a.maxWidth,
      maxHeight: maxHeight ?? a.maxHeight,
      padding: padding ?? a.padding,
      optionsPadding: optionsPadding ?? a.optionsPadding,
      showScrollToTopChevron:
          showScrollToTopChevron ?? a.showScrollToTopChevron,
      showScrollToBottomChevron:
          showScrollToBottomChevron ?? a.showScrollToBottomChevron,
      searchPadding: searchPadding ?? a.searchPadding,
      clearSearchOnClose: clearSearchOnClose ?? a.clearSearchOnClose,
      popoverTheme: popoverTheme ?? a.popoverTheme,
      optionTheme: optionTheme ?? a.optionTheme,
    );
  }

  ShadSelectTheme merge(ShadSelectTheme? other) {
    final current = (this as ShadSelectTheme);

    if (other == null) {
      return current;
    }

    if (!other.canMerge) {
      return other;
    }

    return copyWith(
      decoration: other.decoration,
      minWidth: other.minWidth,
      maxWidth: other.maxWidth,
      maxHeight: other.maxHeight,
      padding: other.padding,
      optionsPadding: other.optionsPadding,
      showScrollToTopChevron: other.showScrollToTopChevron,
      showScrollToBottomChevron: other.showScrollToBottomChevron,
      searchPadding: other.searchPadding,
      clearSearchOnClose: other.clearSearchOnClose,
      popoverTheme: other.popoverTheme,
      optionTheme: other.optionTheme,
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

    final value = (this as ShadSelectTheme);

    return other is ShadSelectTheme &&
        other.decoration == value.decoration &&
        other.minWidth == value.minWidth &&
        other.maxWidth == value.maxWidth &&
        other.maxHeight == value.maxHeight &&
        other.padding == value.padding &&
        other.optionsPadding == value.optionsPadding &&
        other.showScrollToTopChevron == value.showScrollToTopChevron &&
        other.showScrollToBottomChevron == value.showScrollToBottomChevron &&
        other.searchPadding == value.searchPadding &&
        other.clearSearchOnClose == value.clearSearchOnClose &&
        other.popoverTheme == value.popoverTheme &&
        other.optionTheme == value.optionTheme;
  }

  @override
  int get hashCode {
    final value = (this as ShadSelectTheme);

    return Object.hash(
      runtimeType,
      value.decoration,
      value.minWidth,
      value.maxWidth,
      value.maxHeight,
      value.padding,
      value.optionsPadding,
      value.showScrollToTopChevron,
      value.showScrollToBottomChevron,
      value.searchPadding,
      value.clearSearchOnClose,
      value.popoverTheme,
      value.optionTheme,
    );
  }
}
