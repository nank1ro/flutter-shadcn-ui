import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class PopoverPage extends StatefulWidget {
  const PopoverPage({super.key});

  @override
  State<PopoverPage> createState() => _PopoverPageState();
}

class _PopoverPageState extends State<PopoverPage> {
  final popoverController = ShadPopoverController();

  final List<({String name, String initialValue})> layer = [
    (name: 'Width', initialValue: '100%'),
    (name: 'Max. width', initialValue: '300px'),
    (name: 'Height', initialValue: '25px'),
    (name: 'Max. height', initialValue: 'none'),
  ];

  @override
  void dispose() {
    popoverController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = ShadTheme.of(context).textTheme;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 24),
        child: Align(
          alignment: Alignment.topCenter,
          child: ShadPopover(
            controller: popoverController,
            popover: (_) => SizedBox(
              width: 288,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Dimensions',
                    style: textTheme.h4,
                  ),
                  Text(
                    'Set the dimensions for the layer.',
                    style: textTheme.p,
                  ),
                  const SizedBox(height: 4),
                  ...layer.map(
                    (e) => Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Text(
                          e.name,
                          textAlign: TextAlign.start,
                        )),
                        Expanded(
                          flex: 2,
                          child: ShadInput(
                            initialValue: e.initialValue,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            child: ShadButton.outline(
              onPressed: popoverController.toggle,
              child: const Text('Open popover'),
            ),
          ),
        ),
      ),
    );
  }
}
