import 'package:example/common/base_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ContextMenuPage extends StatelessWidget {
  const ContextMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    const divider = ShadDivider.horizontal(
      margin: EdgeInsets.symmetric(vertical: 4),
    );
    return BaseScaffold(
      appBarTitle: 'ContextMenu',
      children: [
        ShadContextMenuRegion(
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
              trailing: Icon(LucideIcons.chevronRight),
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
                divider,
                ShadContextMenuItem(
                  child: Text('Developer Tools'),
                ),
              ],
              child: Text('More Tools'),
            ),
            divider,
            const ShadContextMenuItem(
              leading: Icon(LucideIcons.check),
              child: Text('Show Bookmarks Bar'),
            ),
            const ShadContextMenuItem.inset(child: Text('Show Full URLs')),
            divider,
            Padding(
              padding: const EdgeInsets.fromLTRB(36, 8, 8, 8),
              child: Text('People', style: theme.textTheme.small),
            ),
            divider,
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
      ],
    );
  }
}
