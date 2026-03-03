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
    if (identical(a, b)) {
      return a;
    }

    if (a == null) {
      return t == 1.0 ? b : null;
    }

    if (b == null) {
      return t == 0.0 ? a : null;
    }

    return ShadDefaultKeyboardToolbarTheme(
      backgroundColor: Color.lerp(a.backgroundColor, b.backgroundColor, t),
      doneText: t < 0.5 ? a.doneText : b.doneText,
      showPreviousButton: t < 0.5 ? a.showPreviousButton : b.showPreviousButton,
      showNextButton: t < 0.5 ? a.showNextButton : b.showNextButton,
      showDoneButton: t < 0.5 ? a.showDoneButton : b.showDoneButton,
      hideThreshold: lerpDouble$(a.hideThreshold, b.hideThreshold, t),
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
    final _this = (this as ShadDefaultKeyboardToolbarTheme);

    return ShadDefaultKeyboardToolbarTheme(
      backgroundColor: backgroundColor ?? _this.backgroundColor,
      doneText: doneText ?? _this.doneText,
      showPreviousButton: showPreviousButton ?? _this.showPreviousButton,
      showNextButton: showNextButton ?? _this.showNextButton,
      showDoneButton: showDoneButton ?? _this.showDoneButton,
      hideThreshold: hideThreshold ?? _this.hideThreshold,
    );
  }

  ShadDefaultKeyboardToolbarTheme merge(
    ShadDefaultKeyboardToolbarTheme? other,
  ) {
    final _this = (this as ShadDefaultKeyboardToolbarTheme);

    if (other == null || identical(_this, other)) {
      return _this;
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

    if (other.runtimeType != runtimeType) {
      return false;
    }

    final _this = (this as ShadDefaultKeyboardToolbarTheme);
    final _other = (other as ShadDefaultKeyboardToolbarTheme);

    return _other.backgroundColor == _this.backgroundColor &&
        _other.doneText == _this.doneText &&
        _other.showPreviousButton == _this.showPreviousButton &&
        _other.showNextButton == _this.showNextButton &&
        _other.showDoneButton == _this.showDoneButton &&
        _other.hideThreshold == _this.hideThreshold;
  }

  @override
  int get hashCode {
    final _this = (this as ShadDefaultKeyboardToolbarTheme);

    return Object.hash(
      runtimeType,
      _this.backgroundColor,
      _this.doneText,
      _this.showPreviousButton,
      _this.showNextButton,
      _this.showDoneButton,
      _this.hideThreshold,
    );
  }
}
