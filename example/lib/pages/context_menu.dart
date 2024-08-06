import 'package:example/common/base_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ContextMenuPage extends StatelessWidget {
  const ContextMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBarTitle: 'ContextMenu',
      children: [
        ShadContextMenu(
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
            child: const Text('Right click me'),
          ),
          children: const [
            ShadContextMenuItem(
              child: Text('More tools'),
              children: [
                ShadContextMenuItem(
                  child: Text('Save Page As'),
                ),
              ],
            ),
          ],
          constraints: const BoxConstraints(minWidth: 300),
        ),
      ],
    );
  }
}
