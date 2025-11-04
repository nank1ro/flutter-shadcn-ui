import 'package:flutter/widgets.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:shadcn_ui/src/components/button.dart';
import 'package:shadcn_ui/src/components/icon_button.dart';
import 'package:shadcn_ui/src/theme/theme.dart';

/// {@template ShadDefaultKeyboardToolbar}
/// A default keyboard toolbar with "Previous", "Next", and "Done" buttons.
/// {@endtemplate}
class ShadDefaultKeyboardToolbar extends StatelessWidget {
  /// {@macro ShadDefaultKeyboardToolbar}
  const ShadDefaultKeyboardToolbar({
    super.key,
    this.backgroundColor,
    this.doneText,
    this.showPreviousButton,
    this.showNextButton,
    this.showDoneButton,
  });

  /// {@template ShadDefaultKeyboardToolbar.backgroundColor}
  /// The background color of the toolbar, defaults to ShadColorScheme.accent.
  /// {@endtemplate}
  final Color? backgroundColor;

  /// {@template ShadDefaultKeyboardToolbar.doneText}
  /// The text of the "Done" button, defaults to "Done".
  /// {@endtemplate}
  final String? doneText;

  /// {@template ShadDefaultKeyboardToolbar.showPreviousButton}
  /// Whether to show the "Previous" focus button, defaults to true.
  /// {@endtemplate}
  final bool? showPreviousButton;

  /// {@template ShadDefaultKeyboardToolbar.showNextButton}
  /// Whether to show the "Next" focus button, defaults to true.
  /// {@endtemplate}
  final bool? showNextButton;

  /// {@template ShadDefaultKeyboardToolbar.showDoneButton}
  /// Whether to show the "Done" button, defaults to true.
  /// {@endtemplate}
  final bool? showDoneButton;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    final effectiveBackgroundColor =
        backgroundColor ??
        theme.defaultKeyboardToolbarTheme.backgroundColor ??
        theme.colorScheme.accent;

    final effectiveDoneText =
        doneText ?? theme.defaultKeyboardToolbarTheme.doneText ?? 'Done';

    final effectiveShowPreviousButton =
        showPreviousButton ??
        theme.defaultKeyboardToolbarTheme.showPreviousButton ??
        true;

    final effectiveShowNextButton =
        showNextButton ??
        theme.defaultKeyboardToolbarTheme.showNextButton ??
        true;

    final effectiveShowDoneButton =
        showDoneButton ??
        theme.defaultKeyboardToolbarTheme.showDoneButton ??
        true;

    return ColoredBox(
      color: effectiveBackgroundColor,
      child: FocusTraversalGroup(
        descendantsAreFocusable: false,
        descendantsAreTraversable: false,
        child: Row(
          children: [
            if (effectiveShowPreviousButton)
              ShadIconButton.ghost(
                icon: const Icon(LucideIcons.chevronUp),
                onPressed: () {
                  FocusScope.of(context).previousFocus();
                },
              ),
            if (effectiveShowNextButton)
              ShadIconButton.ghost(
                icon: const Icon(LucideIcons.chevronDown),
                onPressed: () {
                  FocusScope.of(context).nextFocus();
                },
              ),
            const Spacer(),
            if (effectiveShowDoneButton)
              ShadButton.link(
                child: Text(effectiveDoneText),
                onPressed: () {
                  FocusScope.of(context).unfocus();
                },
              ),
          ],
        ),
      ),
    );
  }
}
