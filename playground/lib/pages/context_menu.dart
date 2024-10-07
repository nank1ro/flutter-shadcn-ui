import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ContextMenuPage extends StatelessWidget {
  const ContextMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ShadContextMenuRegion(
          constraints: const BoxConstraints(minWidth: 300),
          items: [
            const ShadContextMenuItem.inset(
              child: Text('Back'),
            ),
            const ShadContextMenuItem.inset(
              enabled: false,
              child: Text('Forward'),
            ),
            const ShadContextMenuItem.inset(
              child: Text('Reload'),
            ),
            const ShadContextMenuItem.inset(
              trailing: ShadImage.square(
                LucideIcons.chevronRight,
                size: 16,
              ),
              items: [
                ShadContextMenuItem(
                  child: Text('Save Page As...'),
                ),
                ShadContextMenuItem(
                  child: Text('Create Shortcut...'),
                ),
                ShadContextMenuItem(
                  child: Text('Name Window...'),
                ),
                Divider(height: 8),
                ShadContextMenuItem(
                  child: Text('Developer Tools'),
                ),
              ],
              child: Text('More Tools'),
            ),
            const Divider(height: 8),
            const ShadContextMenuItem(
              leading: ShadImage.square(LucideIcons.check, size: 16),
              child: Text('Show Bookmarks Bar'),
            ),
            const ShadContextMenuItem.inset(child: Text('Show Full URLs')),
            const Divider(height: 8),
            Padding(
              padding: const EdgeInsets.fromLTRB(36, 8, 8, 8),
              child: Text('People', style: theme.textTheme.small),
            ),
            const Divider(height: 8),
            ShadContextMenuItem(
              leading: SizedBox.square(
                dimension: 16,
                child: Center(
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.foreground,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
              child: const Text('Pedro Duarte'),
            ),
            const ShadContextMenuItem.inset(child: Text('Colm Tuite')),
          ],
          child: Container(
            width: 300,
            height: 200,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(color: theme.colorScheme.border),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text('Right click here'),
          ),
        ),
      ),
    );
  }
}
