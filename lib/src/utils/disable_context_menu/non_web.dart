import 'package:flutter/widgets.dart';

class DisableWebContextMenu extends StatelessWidget {
  const DisableWebContextMenu({
    super.key,
    required this.child,
    this.identifier,
  });

  final String? identifier;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    // no-op on non-web platforms
    return child;
  }
}
