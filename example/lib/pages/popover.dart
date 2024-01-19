import 'package:example/common/base_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class PopoverPage extends StatefulWidget {
  const PopoverPage({super.key});

  @override
  State<PopoverPage> createState() => _PopoverPageState();
}

class _PopoverPageState extends State<PopoverPage> {
  final popoverController = ShadcnPopoverController();

  @override
  void dispose() {
    popoverController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBarTitle: 'Popover',
      children: [
        ShadcnPopover(
          controller: popoverController,
          popover: Container(
            width: 288,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Builder(builder: (context) {
                  return Text(
                    'Dimensions',
                    style: Theme.of(context).textTheme.titleMedium,
                  );
                }),
                Text('Set the dimensions for the layer.'),
                Row(
                  children: [
                    Expanded(child: Text('Width')),
                    Expanded(
                      flex: 2,
                      child: TextField(),
                    )
                  ],
                )
              ],
            ),
          ),
          child: ShadcnButton.outline(
            text: const Text('Open popover'),
            onPressed: popoverController.toggle,
          ),
        ),
      ],
    );
  }
}
