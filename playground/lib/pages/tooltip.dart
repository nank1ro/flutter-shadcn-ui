import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class TooltipPage extends StatefulWidget {
  const TooltipPage({
    super.key,
  });

  @override
  State<TooltipPage> createState() => _TooltipPageState();
}

class _TooltipPageState extends State<TooltipPage> {
  final focusNode = FocusNode();

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ShadTooltip(
          focusNode: focusNode,
          builder: (context) => const Text('Add to library'),
          child: ShadButton.outline(
            focusNode: focusNode,
            child: const Text('Hover/Focus'),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
