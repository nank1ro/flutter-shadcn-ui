import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ShadContextMenu extends StatefulWidget {
  const ShadContextMenu({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<ShadContextMenu> createState() => _ShadContextMenuState();
}

class _ShadContextMenuState extends State<ShadContextMenu> {
  bool visible = false;

  @override
  Widget build(BuildContext context) {
    return ShadPopover(
      visible: visible,
      popover: (context) {
        return Text('ContextMenu');
      },
      child: CallbackShortcuts(bindings: {
        const SingleActivator(LogicalKeyboardKey.enter): () {},
        const SingleActivator(LogicalKeyboardKey.escape): () {},
      }, child: widget.child),
    );
  }
}
