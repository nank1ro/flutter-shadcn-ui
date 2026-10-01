import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/components/separator.dart';

import 'package:shadcn_ui/src/theme/theme.dart';

/// A horizontal divider line used inside a `ShadSidebar` to visually
/// separate groups or items.
class ShadSidebarSeparator extends StatelessWidget {
  const ShadSidebarSeparator({
    super.key,
    this.margin,
    this.color,
    this.thickness,
  });

  /// {@template ShadSidebarSeparator.margin}
  /// The space around the separator line.
  /// {@endtemplate}
  final EdgeInsetsGeometry? margin;

  /// {@template ShadSidebarSeparator.color}
  /// Color of the separator line.
  /// {@endtemplate}
  final Color? color;

  /// {@template ShadSidebarSeparator.thickness}
  /// Thickness of the separator line. Defaults to 1.
  /// {@endtemplate}
  final double? thickness;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final sidebarTheme = theme.sidebarTheme;
    final colorScheme = theme.colorScheme;

    final effectiveMargin =
        margin ??
        sidebarTheme.separatorMargin ??
        const EdgeInsets.symmetric(horizontal: 12, vertical: 4);

    final effectiveColor =
        color ??
        sidebarTheme.separatorColor ??
        colorScheme.sidebarBorder ??
        colorScheme.border;

    final effectiveThickness =
        thickness ?? sidebarTheme.separatorThickness ?? 1.0;

    return ShadSeparator.horizontal(
      thickness: effectiveThickness,
      margin: effectiveMargin,
      color: effectiveColor,
    );
  }
}
