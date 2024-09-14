import 'package:flutter/material.dart';

class ShadTextSelectionMenu extends StatefulWidget {
  const ShadTextSelectionMenu({
    super.key,
    required this.child,
    required this.controller,
    this.enableInteractiveSelection = true,
  });

  final Widget child;
  final TextEditingController controller;
  final bool enableInteractiveSelection;

  @override
  State<ShadTextSelectionMenu> createState() => _ShadTextSelectionMenuState();
}

class _ShadTextSelectionMenuState extends State<ShadTextSelectionMenu> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onSelectionChanged);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onSelectionChanged);
    super.dispose();
  }

  void _onSelectionChanged() {
    final selection = widget.controller.selection;
    final text = widget.controller.text;

    if (!selection.isValid || selection.isCollapsed) {
      // No selection or invalid selection
      return;
    }

    final selectedText = selection.textInside(text);
    print('Selected text: $selectedText');
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
