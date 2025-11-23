// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'default_keyboard_toolbar.dart';

// **************************************************************************
// ThemeGenGenerator
// **************************************************************************

mixin _$ShadDefaultKeyboardToolbarTheme {
  bool get canMerge => true;

  static ShadDefaultKeyboardToolbarTheme? lerp(
    ShadDefaultKeyboardToolbarTheme? a,
    ShadDefaultKeyboardToolbarTheme? b,
    double t,
  ) {
    if (a == null && b == null) {
      return null;
    }

    return ShadDefaultKeyboardToolbarTheme(
      backgroundColor: Color.lerp(a?.backgroundColor, b?.backgroundColor, t),
      doneText: t < 0.5 ? a?.doneText : b?.doneText,
      showPreviousButton: t < 0.5
          ? a?.showPreviousButton
          : b?.showPreviousButton,
      showNextButton: t < 0.5 ? a?.showNextButton : b?.showNextButton,
      showDoneButton: t < 0.5 ? a?.showDoneButton : b?.showDoneButton,
      hideThreshold: lerpDouble$(a?.hideThreshold, b?.hideThreshold, t),
    );
  }

  ShadDefaultKeyboardToolbarTheme copyWith({
    Color? backgroundColor,
    String? doneText,
    bool? showPreviousButton,
    bool? showNextButton,
    bool? showDoneButton,
    double? hideThreshold,
  }) {
    final a = (this as ShadDefaultKeyboardToolbarTheme);

    return ShadDefaultKeyboardToolbarTheme(
      backgroundColor: backgroundColor ?? a.backgroundColor,
      doneText: doneText ?? a.doneText,
      showPreviousButton: showPreviousButton ?? a.showPreviousButton,
      showNextButton: showNextButton ?? a.showNextButton,
      showDoneButton: showDoneButton ?? a.showDoneButton,
      hideThreshold: hideThreshold ?? a.hideThreshold,
    );
  }

  ShadDefaultKeyboardToolbarTheme merge(
    ShadDefaultKeyboardToolbarTheme? other,
  ) {
    final current = (this as ShadDefaultKeyboardToolbarTheme);

    if (other == null) {
      return current;
    }

    if (!other.canMerge) {
      return other;
    }

    return copyWith(
      backgroundColor: other.backgroundColor,
      doneText: other.doneText,
      showPreviousButton: other.showPreviousButton,
      showNextButton: other.showNextButton,
      showDoneButton: other.showDoneButton,
      hideThreshold: other.hideThreshold,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    if (other is! ShadDefaultKeyboardToolbarTheme) {
      return false;
    }

    final value = (this as ShadDefaultKeyboardToolbarTheme);

    return other.backgroundColor == value.backgroundColor &&
        other.doneText == value.doneText &&
        other.showPreviousButton == value.showPreviousButton &&
        other.showNextButton == value.showNextButton &&
        other.showDoneButton == value.showDoneButton &&
        other.hideThreshold == value.hideThreshold;
  }

  @override
  int get hashCode {
    final value = (this as ShadDefaultKeyboardToolbarTheme);

    return Object.hash(
      runtimeType,
      value.backgroundColor,
      value.doneText,
      value.showPreviousButton,
      value.showNextButton,
      value.showDoneButton,
      value.hideThreshold,
    );
  }
}
