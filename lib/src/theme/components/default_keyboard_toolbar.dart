import 'package:flutter/widgets.dart';

@immutable
class ShadDefaultKeyboardToolbarTheme {
  const ShadDefaultKeyboardToolbarTheme({
    this.merge = true,
    this.backgroundColor,
    this.doneText,
    this.showPreviousButton,
    this.showNextButton,
    this.showDoneButton,
  });

  final bool merge;

  /// {@macro ShadDefaultKeyboardToolbar.backgroundColor}
  final Color? backgroundColor;

  /// {@macro ShadDefaultKeyboardToolbar.doneText}
  final String? doneText;

  /// {@macro ShadDefaultKeyboardToolbar.showPreviousButton}
  final bool? showPreviousButton;

  /// {@macro ShadDefaultKeyboardToolbar.showNextButton}
  final bool? showNextButton;

  /// {@macro ShadDefaultKeyboardToolbar.showDoneButton}
  final bool? showDoneButton;

  static ShadDefaultKeyboardToolbarTheme lerp(
    ShadDefaultKeyboardToolbarTheme a,
    ShadDefaultKeyboardToolbarTheme b,
    double t,
  ) {
    if (identical(a, b)) return a;
    return ShadDefaultKeyboardToolbarTheme(
      merge: b.merge,
      backgroundColor: Color.lerp(a.backgroundColor, b.backgroundColor, t),
      doneText: t < 0.5 ? a.doneText : b.doneText,
      showPreviousButton: t < 0.5 ? a.showPreviousButton : b.showPreviousButton,
      showNextButton: t < 0.5 ? a.showNextButton : b.showNextButton,
      showDoneButton: t < 0.5 ? a.showDoneButton : b.showDoneButton,
    );
  }

  ShadDefaultKeyboardToolbarTheme mergeWith(
    ShadDefaultKeyboardToolbarTheme? other,
  ) {
    if (other == null) return this;
    if (!other.merge) return other;
    return copyWith(
      backgroundColor: other.backgroundColor,
      doneText: other.doneText,
      showPreviousButton: other.showPreviousButton,
      showNextButton: other.showNextButton,
      showDoneButton: other.showDoneButton,
    );
  }

  ShadDefaultKeyboardToolbarTheme copyWith({
    bool? merge,
    Color? backgroundColor,
    String? doneText,
    bool? showPreviousButton,
    bool? showNextButton,
    bool? showDoneButton,
  }) {
    return ShadDefaultKeyboardToolbarTheme(
      merge: merge ?? this.merge,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      doneText: doneText ?? this.doneText,
      showPreviousButton: showPreviousButton ?? this.showPreviousButton,
      showNextButton: showNextButton ?? this.showNextButton,
      showDoneButton: showDoneButton ?? this.showDoneButton,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShadDefaultKeyboardToolbarTheme &&
        other.merge == merge &&
        other.backgroundColor == backgroundColor &&
        other.doneText == doneText &&
        other.showPreviousButton == showPreviousButton &&
        other.showNextButton == showNextButton &&
        other.showDoneButton == showDoneButton;
  }

  @override
  int get hashCode {
    return merge.hashCode ^
        backgroundColor.hashCode ^
        doneText.hashCode ^
        showPreviousButton.hashCode ^
        showNextButton.hashCode ^
        showDoneButton.hashCode;
  }
}
