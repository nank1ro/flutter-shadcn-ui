import 'package:flutter/material.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:shadcn_ui/src/theme/theme.dart';

/// Renders a set of custom keyboard actions for input fields.
class ShadKeyboardActions extends StatelessWidget {
  const ShadKeyboardActions({
    super.key,
    required this.actions,
    required this.child,
    this.keyboardBarColor,
  });

  /// List of keyboard actions
  final List<ShadKeyboardAction> actions;

  /// The widget wrapped by the keyboard actions
  final Widget child;

  // ignore: comment_references
  /// The color of the keyboard action bar, defaults to [ShadColorScheme.card].
  final Color? keyboardBarColor;

  @override
  Widget build(BuildContext context) {
    return KeyboardActions(
      disableScroll: true,
      config: KeyboardActionsConfig(
        keyboardBarColor: ShadTheme.of(context).colorScheme.card,
        actions: [
          for (final action in actions)
            KeyboardActionsItem(
              focusNode: action.focusNode,
              displayArrows: false,
              displayDoneButton: false,
              toolbarButtons: [
                (node) => SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      child: Row(
                        children: action.children(node),
                      ),
                    ),
              ],
            ),
        ],
      ),
      child: child,
    );
  }
}

/// The configuration for a single keyboard action.
class ShadKeyboardAction {
  const ShadKeyboardAction({required this.focusNode, required this.children});

  /// The focus node of the input field associated with this action.
  final FocusNode focusNode;

  /// A function that returns a list of widgets to be displayed in the action
  /// bar.
  final List<Widget> Function(FocusNode) children;
}
