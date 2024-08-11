import 'package:example/common/base_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ContextMenuPage extends StatefulWidget {
  const ContextMenuPage({super.key});

  @override
  State<ContextMenuPage> createState() => _ContextMenuPageState();
}

class _ContextMenuPageState extends State<ContextMenuPage> {
  bool visible = false;
  ShadAnchorBase? anchor;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return BaseScaffold(
      appBarTitle: 'ContextMenu',
      children: [
        ShadContextMenu(
          anchor: anchor,
          visible: visible,
          child: ShadGestureDetector(
            onTapDown: (_) {
              if (visible) setState(() => visible = false);
            },
            onSecondaryTapDown: (d) {
              setState(() {
                anchor = ShadGlobalAnchor(d.globalPosition);
                visible = true;
              });
            },
            child: Container(
              width: 300,
              height: 200,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text('Right click here'),
            ),
          ),
          children: [
            const ShadContextMenuItem.inset(
              trailing: Text('⌘['),
              child: Text('Back'),
            ),
            const ShadContextMenuItem.inset(
              enabled: false,
              trailing: Text('⌘]'),
              child: Text('Forward'),
            ),
            const ShadContextMenuItem.inset(
                trailing: Text('⌘R'), child: Text('Reload')),
            const ShadContextMenuItem.inset(
              child: Text('More Tools'),
              trailing: ShadImage.square(
                LucideIcons.chevronRight,
                size: 16,
              ),
              children: [
                ShadContextMenuItem(
                  trailing: Text('⇧⌘S'),
                  child: Text('Save Page As...'),
                ),
                ShadContextMenuItem(child: Text('Create Shortcut...')),
                ShadContextMenuItem(child: Text('Name Window...')),
                Divider(height: 8),
                ShadContextMenuItem(child: Text('Developer Tools')),
              ],
            ),
            const Divider(height: 8),
            const ShadContextMenuItem(
              leading: ShadImage.square(LucideIcons.check, size: 16),
              trailing: Text('⌘⇧B'),
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
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
              child: const Text('Pedro Duarte'),
            ),
            const ShadContextMenuItem.inset(child: Text('Colm Tuite')),
          ],
          constraints: const BoxConstraints(minWidth: 300),
        ),
      ],
    );
  }
}
