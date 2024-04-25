import 'package:flutter/material.dart';

import 'package:shadcn_ui/shadcn_ui.dart';

class ShadMouseRegionProvider extends StatefulWidget {
  const ShadMouseRegionProvider({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<ShadMouseRegionProvider> createState() =>
      ShadMouseRegionProviderState();
}

class ShadMouseRegionProviderState extends State<ShadMouseRegionProvider> {
  var _cursor = MouseCursor.defer;

  MouseCursor get cursor => _cursor;

  void setCursor(MouseCursor cursor) {
    if (cursor == _cursor) return;
    setState(() => _cursor = cursor);
  }

  @override
  Widget build(BuildContext context) {
    return ShadProvider(
      data: this,
      child: MouseRegion(
        cursor: _cursor,
        child: widget.child,
      ),
    );
  }
}
