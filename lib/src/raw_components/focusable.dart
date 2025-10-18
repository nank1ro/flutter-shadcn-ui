import 'package:flutter/widgets.dart';

typedef FocusWidgetBuilder =
    Widget Function(
      BuildContext context,
      bool focused,
      Widget? child,
    );

class ShadFocusable extends StatefulWidget {
  const ShadFocusable({
    super.key,
    required this.builder,
    this.focusNode,
    this.canRequestFocus = true,
    this.autofocus = false,
    this.child,
    this.onFocusChange,
    this.onKeyEvent,
    this.skipTraversal,
    this.descendantsAreFocusable,
    this.descendantsAreTraversable,
    this.includeSemantics = true,
    this.debugLabel,
  });

  final bool canRequestFocus;
  final bool autofocus;
  final FocusNode? focusNode;
  final FocusWidgetBuilder builder;
  final Widget? child;
  final ValueChanged<bool>? onFocusChange;
  final FocusOnKeyEventCallback? onKeyEvent;
  final bool? skipTraversal;
  final bool? descendantsAreFocusable;
  final bool? descendantsAreTraversable;
  final bool includeSemantics;
  final String? debugLabel;

  @override
  State<ShadFocusable> createState() => _ShadFocusableState();
}

class _ShadFocusableState extends State<ShadFocusable> {
  FocusNode? _internal;

  final isFocused = ValueNotifier(false);

  FocusNode get focusNode => widget.focusNode ?? _internal!;

  @override
  void initState() {
    super.initState();
    if (widget.focusNode == null) _internal = FocusNode();
    isFocused
      ..value = focusNode.hasFocus
      ..addListener(onFocusChange);
  }

  @override
  void dispose() {
    isFocused.removeListener(onFocusChange);
    _internal?.dispose();
    isFocused.dispose();
    super.dispose();
  }

  void onFocusChange() {
    widget.onFocusChange?.call(isFocused.value);
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      autofocus: widget.autofocus,
      canRequestFocus: widget.canRequestFocus,
      onFocusChange: (value) => isFocused.value = value,
      focusNode: focusNode,
      onKeyEvent: widget.onKeyEvent,
      skipTraversal: widget.skipTraversal,
      descendantsAreFocusable: widget.descendantsAreFocusable,
      descendantsAreTraversable: widget.descendantsAreTraversable,
      includeSemantics: widget.includeSemantics,
      debugLabel: widget.debugLabel,
      child: ValueListenableBuilder(
        valueListenable: isFocused,
        builder: (context, value, child) =>
            widget.builder(context, value, child),
        child: widget.child,
      ),
    );
  }
}
