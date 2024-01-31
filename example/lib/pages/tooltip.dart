import 'package:example/common/base_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class TooltipPage extends StatefulWidget {
  const TooltipPage({super.key});

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
    return BaseScaffold(
      appBarTitle: 'Tooltip',
      children: [
        ShadTooltip(
          focusNode: focusNode,
          builder: (context) => const Text('Add to library'),
          child: ShadButton.outline(
            focusNode: focusNode,
            text: const Text('Hover/Focus'),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
