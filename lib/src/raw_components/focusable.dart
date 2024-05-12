import 'package:flutter/widgets.dart';

typedef FocusWidgetBuilder = Widget Function(
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
  });

  final bool canRequestFocus;
  final bool autofocus;
  final FocusNode? focusNode;
  final FocusWidgetBuilder builder;
  final Widget? child;

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
    isFocused.value = focusNode.hasFocus;
  }

  @override
  void dispose() {
    _internal?.dispose();
    isFocused.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      autofocus: widget.autofocus,
      canRequestFocus: widget.canRequestFocus,
      onFocusChange: (value) => isFocused.value = value,
      focusNode: focusNode,
      child: ValueListenableBuilder(
        valueListenable: isFocused,
        builder: (context, value, child) =>
            widget.builder(context, value, child),
        child: widget.child,
      ),
    );
  }
}
