import 'package:flutter/material.dart';

import 'package:shadcn_ui/shadcn_ui.dart';

class ShadMouseCursorController extends ChangeNotifier {
  ShadMouseCursorController({MouseCursor cursor = MouseCursor.defer})
      : _cursor = cursor;

  late MouseCursor _cursor;

  MouseCursor get cursor => _cursor;

  set cursor(MouseCursor cursor) {
    if (cursor == _cursor) return;
    _cursor = cursor;
    notifyListeners();
  }
}

class ShadMouseCursorProvider extends StatefulWidget {
  const ShadMouseCursorProvider({
    super.key,
    this.controller,
    required this.child,
  });

  final Widget child;
  final ShadMouseCursorController? controller;

  @override
  State<ShadMouseCursorProvider> createState() =>
      ShadMouseCursorProviderState();
}

class ShadMouseCursorProviderState extends State<ShadMouseCursorProvider> {
  ShadMouseCursorController? _internalController;

  ShadMouseCursorController get controller {
    if (widget.controller != null) return widget.controller!;
    return _internalController ??= ShadMouseCursorController();
  }

  @override
  void dispose() {
    _internalController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ShadProvider(
      data: controller,
      child: ListenableBuilder(
        listenable: controller,
        builder: (context, child) {
          return MouseRegion(
            cursor: controller.cursor,
            child: child,
          );
        },
        child: widget.child,
      ),
    );
  }
}
