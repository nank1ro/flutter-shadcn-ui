import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';

import 'package:shadcn_ui/src/theme/theme.dart';

/// A pinned slot at the bottom of a `ShadSidebar`.
///
/// Typically used for user profile info, settings links, or sign-out
/// actions. The footer does **not** scroll with `ShadSidebarContent`.
class ShadSidebarFooter extends StatelessWidget {
  const ShadSidebarFooter({
    super.key,
    required this.child,
    this.padding,
    this.decoration,
  });

  /// The content of the footer.
  final Widget child;

  /// Padding inside the footer.
  final EdgeInsetsGeometry? padding;

  /// Optional decoration (border, background, etc.) for the footer container.
  final ShadDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final sidebarTheme = theme.sidebarTheme;

    final effectivePadding =
        padding ??
        sidebarTheme.footerPadding ??
        const EdgeInsets.symmetric(horizontal: 12, vertical: 8);

    final effectiveDecoration = decoration ?? sidebarTheme.footerDecoration;

    return ShadDecorator(
      decoration: effectiveDecoration,
      child: Padding(
        padding: effectivePadding,
        child: child,
      ),
    );
  }
}
