import 'package:flutter/widgets.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import 'package:shadcn_ui/src/components/button.dart';
import 'package:shadcn_ui/src/components/sidebar/controller.dart';
import 'package:shadcn_ui/src/components/sidebar/scope.dart';
import 'package:shadcn_ui/src/theme/theme.dart';

/// A button that toggles the sidebar open / closed.
///
/// By default, finds the nearest [ShadSidebarScope] and toggles its
/// controller. For dual-sidebar setups, pass an explicit [controller].
///
/// ```dart
/// ShadSidebarTrigger()                              // nearest sidebar
/// ShadSidebarTrigger(controller: startController)   // specific sidebar
/// ```
class ShadSidebarTrigger extends StatelessWidget {
  const ShadSidebarTrigger({
    super.key,
    this.controller,
    this.icon,
    this.onPressed,
    this.padding,
    this.size,
  }) : variant = ShadButtonVariant.ghost;

  const ShadSidebarTrigger.primary({
    super.key,
    this.controller,
    this.icon,
    this.onPressed,
    this.padding,
    this.size,
  }) : variant = ShadButtonVariant.primary;

  const ShadSidebarTrigger.outline({
    super.key,
    this.controller,
    this.icon,
    this.onPressed,
    this.padding,
    this.size,
  }) : variant = ShadButtonVariant.outline;

  const ShadSidebarTrigger.secondary({
    super.key,
    this.controller,
    this.icon,
    this.onPressed,
    this.padding,
    this.size,
  }) : variant = ShadButtonVariant.secondary;

  const ShadSidebarTrigger.raw({
    super.key,
    required this.variant,
    this.controller,
    this.icon,
    this.onPressed,
    this.padding,
    this.size,
  });

  /// If provided, this controller is toggled instead of the nearest scope.
  final ShadSidebarController? controller;

  /// Custom icon for the trigger button.
  /// Defaults to a panel-left icon.
  final Widget? icon;

  /// Size (width & height) of the trigger button.
  final double? size;

  /// Padding around the trigger button.
  final EdgeInsetsGeometry? padding;

  /// Optional callback invoked **in addition** to toggling the sidebar.
  final VoidCallback? onPressed;

  /// Defaults to `ShadButtonVariant.ghost`.
  final ShadButtonVariant variant;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final sidebarTheme = theme.sidebarTheme;
    final scope = ShadSidebarScope.maybeOf(context);

    final resolvedController = controller ?? scope?.controller;
    final isOpen = controller?.isOpen ?? scope?.isOpen ?? true;

    final effectiveSize = size ?? sidebarTheme.triggerSize ?? 36.0;
    final effectivePadding =
        padding ?? sidebarTheme.triggerPadding ?? EdgeInsets.zero;

    final effectiveIcon =
        icon ??
        Icon(
          LucideIcons.panelLeft,
          color: theme.colorScheme.foreground,
        );

    return Semantics(
      button: true,
      label: isOpen ? 'Close sidebar' : 'Open sidebar',
      child: Padding(
        padding: effectivePadding,
        child: ShadButton.raw(
          variant: variant,
          onPressed: () {
            resolvedController?.toggle();
            onPressed?.call();
          },
          width: effectiveSize,
          height: effectiveSize,
          padding: EdgeInsets.zero,
          leading: effectiveIcon,
        ),
      ),
    );
  }
}
