import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';

import 'package:shadcn_ui/src/theme/theme.dart';

/// A pinned slot at the top of a [ShadSidebar].
///
/// Typically used for a logo, app name, workspace switcher, or a
/// search input. The header does **not** scroll with [ShadSidebarContent].
class ShadSidebarHeader extends StatelessWidget {
  const ShadSidebarHeader({
    super.key,
    required this.child,
    this.padding,
    this.decoration,
  });

  /// The content of the header.
  final Widget child;

  /// Padding inside the header.
  final EdgeInsetsGeometry? padding;

  /// Optional decoration (border, background, etc.) for the header container.
  final ShadDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final sidebarTheme = theme.sidebarTheme;

    final effectivePadding =
        padding ??
        sidebarTheme.headerPadding ??
        const EdgeInsets.symmetric(horizontal: 12, vertical: 8);

    final effectiveDecoration = decoration ?? sidebarTheme.headerDecoration;

    return ShadDecorator(
      decoration: effectiveDecoration,
      child: Padding(
        padding: effectivePadding,
        child: child,
      ),
    );
  }
}
