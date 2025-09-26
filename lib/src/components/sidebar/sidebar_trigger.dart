import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// A button that toggles the sidebar.
///
/// This widget is typically placed inside the
/// [ShadSidebarScaffold.body].
class ShadSidebarTrigger extends StatelessWidget {
  /// Creates a [ShadSidebarTrigger].
  const ShadSidebarTrigger({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = ShadTheme.of(context).colorScheme;
    return ShadIconButton.ghost(
      onPressed: () => ShadSidebarScaffold.of(context).toggle(),
      icon: const Icon(LucideIcons.panelLeft, size: 16),
      decoration: ShadDecoration(
        border: ShadBorder.all(
          radius: BorderRadius.circular(8),
        ),
      ),
      backgroundColor: Colors.transparent,
      foregroundColor: cs.foreground,
      hoverBackgroundColor: cs.accent,
      hoverForegroundColor: cs.accentForeground,
    );
  }
}
