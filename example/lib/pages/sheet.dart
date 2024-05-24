import 'package:example/common/base_scaffold.dart';
import 'package:example/common/properties/enum_property.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

final profile = [
  (title: 'Name', value: 'Alexandru'),
  (title: 'Username', value: 'nank1ro'),
];

class SheetPage extends StatefulWidget {
  const SheetPage({super.key});

  @override
  State<SheetPage> createState() => _SheetPageState();
}

class _SheetPageState extends State<SheetPage> {
  var side = ShadSheetSide.bottom;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return BaseScaffold(
      appBarTitle: 'Sheet',
      editable: [
        MyEnumProperty(
          label: 'Side',
          value: side,
          values: ShadSheetSide.values,
          onChanged: (value) => setState(() => side = value),
        ),
      ],
      children: [
        ShadButton.outline(
          text: const Text('Open'),
          onPressed: () {
            showShadSheet(
              context: context,
              side: side,
              builder: (context) {
                return ShadSheet(
                  constraints:
                      side == ShadSheetSide.left || side == ShadSheetSide.right
                          ? const BoxConstraints(maxWidth: 512)
                          : null,
                  title: const Text('Edit Profile'),
                  description: const Text(
                      "Make changes to your profile here. Click save when you're done"),
                  content: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: profile
                          .map(
                            (p) => Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    p.title,
                                    textAlign: TextAlign.end,
                                    style: theme.textTheme.small,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  flex: 5,
                                  child: ShadInput(initialValue: p.value),
                                ),
                              ],
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  actions: const [ShadButton(text: Text('Save changes'))],
                );
              },
            );
          },
        )
      ],
    );
  }
}
