import 'package:flutter/widgets.dart';
import 'package:theme_extensions_builder_annotation/theme_extensions_builder_annotation.dart';

part 'default_keyboard_toolbar.g.theme.dart';

@themeGen
@immutable
class ShadDefaultKeyboardToolbarTheme with _$ShadDefaultKeyboardToolbarTheme {
  const ShadDefaultKeyboardToolbarTheme({
    bool canMerge = true,
    this.backgroundColor,
    this.doneText,
    this.showPreviousButton,
    this.showNextButton,
    this.showDoneButton,
    this.hideThreshold,
  }) : _canMerge = canMerge;

  @ignore
  final bool _canMerge;

  @override
  bool get canMerge => _canMerge;

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

  /// {@macro ShadKeyboardToolbar.hideThreshold}
  final double? hideThreshold;

  static ShadDefaultKeyboardToolbarTheme? lerp(
    ShadDefaultKeyboardToolbarTheme? a,
    ShadDefaultKeyboardToolbarTheme? b,
    double t,
  ) =>
      _$ShadDefaultKeyboardToolbarTheme.lerp(a, b, t);
}
