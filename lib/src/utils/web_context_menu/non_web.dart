import 'package:flutter/widgets.dart';

class WebContextMenu extends StatelessWidget {
  const WebContextMenu({
    super.key,
    required this.child,
    this.identifier,
    this.onContextMenu,
  });

  final String? identifier;
  final Widget child;
  final void Function(Offset offset)? onContextMenu;

  @override
  Widget build(BuildContext context) {
    // no-op on non-web platforms
    return child;
  }
}
