import 'package:flutter/widgets.dart';

import 'package:lucide_icons_flutter/lucide_icons.dart';

import 'package:shadcn_ui/src/components/icon_button.dart';
import 'package:shadcn_ui/src/components/sidebar/sidebar_scaffold.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/utils/border.dart';

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
      onPressed: () => ShadSidebarScaffold.of(context).toggleSidebar(),
      icon: const Icon(LucideIcons.panelLeft, size: 16),
      decoration: ShadDecoration(
        border: ShadBorder.all(
          radius: BorderRadius.circular(8),
        ),
      ),
      backgroundColor: const Color(0x00000000),
      foregroundColor: cs.foreground,
      hoverBackgroundColor: cs.accent,
      hoverForegroundColor: cs.accentForeground,
    );
  }
}
