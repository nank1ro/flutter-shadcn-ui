import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/src/utils/provider.dart';

/// {@template ShadKeyboardToolbar}
/// Renders a toolbar above the keyboard fully customizable.
/// {@endtemplate}
class ShadKeyboardToolbar extends StatefulWidget {
  /// {@macro ShadKeyboardToolbar}
  const ShadKeyboardToolbar({
    super.key,
    this.toolbarBuilder,
    required this.child,
    required this.focusNode,
    this.hideThreshold = 20,
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
  /// The focus node of the child widget that will trigger the keyboard toolbar.
  /// {@endtemplate}
  final FocusNode focusNode;

  /// {@template ShadKeyboardToolbar.hideThreshold}
  /// The threshold in pixels for hiding the toolbar when the keyboard is
  /// dismissed. Defaults to 10 pixels.
  /// {@endtemplate}
  final double hideThreshold;

  @override
  State<ShadKeyboardToolbar> createState() => _ShadKeyboardToolbarState();
}

class _ShadKeyboardToolbarState extends State<ShadKeyboardToolbar> {
  final controller = OverlayPortalController();

  bool get keyboardSupported {
    if (widget.toolbarBuilder == null ||
        defaultTargetPlatform != TargetPlatform.iOS &&
            defaultTargetPlatform != TargetPlatform.android) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    if (!keyboardSupported) {
      return widget.child;
    }
    final mediaQuery = context.watch<MediaQueryData>();

    return ListenableBuilder(
      listenable: widget.focusNode,
      builder: (context, child) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!mounted) return;
          if (mediaQuery.viewInsets.bottom > widget.hideThreshold &&
              widget.focusNode.hasFocus) {
            controller.show();
          } else {
            controller.hide();
          }
        });
        return OverlayPortal(
          overlayChildBuilder: (context) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                widget.toolbarBuilder!(context),
                SizedBox(
                  height: mediaQuery.viewInsets.bottom,
                ),
              ],
            );
          },
          controller: controller,
          child: widget.child,
        );
      },
    );
  }
}
