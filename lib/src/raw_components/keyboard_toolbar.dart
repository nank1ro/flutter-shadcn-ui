import 'package:flutter/material.dart';
import 'package:shadcn_ui/src/raw_components/portal.dart';

/// {@template ShadKeyboardToolbar}
/// Renders a toolbar above the keyboard fully customizable.
/// {@endtemplate}
class ShadKeyboardToolbar extends StatelessWidget {
  /// {@macro ShadKeyboardToolbar}
  const ShadKeyboardToolbar({
    super.key,
    this.toolbarBuilder,
    required this.child,
    required this.focusNode,
  });

  /// {@template ShadKeyboardToolbar.child}
  /// The child widget that will trigger the keyboard toolbar, typically and
  /// input field.
  /// {@endtemplate}
  final Widget child;

  /// {@template ShadKeyboardToolbar.toolbarBuilder}
  /// A builder function that returns the toolbar widget.
  /// {@endtemplate}
  final WidgetBuilder? toolbarBuilder;

  /// {@template ShadKeyboardToolbar.focusNode}
  /// The focus node of the input field used to trigger the toolbar visibility.
  /// {@endtemplate}
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    if (toolbarBuilder == null) {
      return child;
    }

    return ListenableBuilder(
      listenable: focusNode,
      builder: (context, child) {
        return ShadPortal(
          anchor: const ShadAnchor(),
          portalBuilder: toolbarBuilder!,
          visible: focusNode.hasFocus,
          child: child!,
        );
      },
      child: child,
    );
  }
}
