import 'package:flutter/material.dart';

import 'package:shadcn_ui/shadcn_ui.dart';

class MenubarPage extends StatelessWidget {
  const MenubarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(40),
        child: Align(
          alignment: Alignment.topCenter,
          child: MenubarExample(),
        ),
      ),
    );
  }
}

class MenubarExample extends StatelessWidget {
  const MenubarExample({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final square = SizedBox.square(
      dimension: 16,
      child: Center(
        child: SizedBox.square(
          dimension: 8,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: theme.colorScheme.foreground,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
    final divider = ShadSeparator.horizontal(
      margin: const EdgeInsets.symmetric(vertical: 4),
      color: theme.colorScheme.muted,
    );
    return ShadMenubar(
      items: [
        ShadMenubarItem(
          items: [
            const ShadContextMenuItem(child: Text('New Tab')),
            const ShadContextMenuItem(child: Text('New Window')),
            const ShadContextMenuItem(
              enabled: false,
              child: Text('New Incognito Window'),
            ),
            divider,
            const ShadContextMenuItem(
              trailing: Icon(LucideIcons.chevronRight),
              items: [
                ShadContextMenuItem(child: Text('Email Link')),
                ShadContextMenuItem(child: Text('Messages')),
                ShadContextMenuItem(child: Text('Notes')),
              ],
              child: Text('Share'),
            ),
            divider,
            const ShadContextMenuItem(child: Text('Print...')),
          ],
          child: const Text('File'),
        ),
        ShadMenubarItem(
          items: [
            const ShadContextMenuItem(child: Text('Undo')),
            const ShadContextMenuItem(child: Text('Redo')),
            divider,
            ShadContextMenuItem(
              trailing: const Icon(LucideIcons.chevronRight),
              items: [
                const ShadContextMenuItem(child: Text('Search the web')),
                divider,
                const ShadContextMenuItem(child: Text('Find...')),
                const ShadContextMenuItem(child: Text('Find Next')),
                const ShadContextMenuItem(child: Text('Find Previous')),
              ],
              child: const Text('Find'),
            ),
            divider,
            const ShadContextMenuItem(child: Text('Cut')),
            const ShadContextMenuItem(child: Text('Copy')),
            const ShadContextMenuItem(child: Text('Paste')),
          ],
          child: const Text('Edit'),
        ),
        ShadMenubarItem(
          items: [
            const ShadContextMenuItem.inset(
              child: Text('Always Show Bookmarks Bar'),
            ),
            const ShadContextMenuItem(
              leading: Icon(LucideIcons.check),
              child: Text('Always Show Full URLs'),
            ),
            divider,
            const ShadContextMenuItem.inset(child: Text('Reload')),
            const ShadContextMenuItem.inset(
                enabled: false, child: Text('Force Reload')),
            divider,
            const ShadContextMenuItem.inset(
              child: Text('Toggle Full Screen'),
            ),
            divider,
            const ShadContextMenuItem.inset(child: Text('Hide Sidebar')),
          ],
          child: const Text('View'),
        ),
        ShadMenubarItem(items: [
          const ShadContextMenuItem.inset(child: Text('Andy')),
          ShadContextMenuItem(leading: square, child: const Text('Benoit')),
          const ShadContextMenuItem.inset(child: Text('Luis')),
          divider,
          const ShadContextMenuItem.inset(child: Text('Edit...')),
          divider,
          const ShadContextMenuItem.inset(child: Text('Add Profile...')),
        ], child: const Text('Profiles')),
      ],
    );
  }
}
