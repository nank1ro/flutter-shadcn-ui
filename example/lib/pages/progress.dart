import 'package:example/common/base_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ProgressPage extends StatefulWidget {
  const ProgressPage({super.key});

  @override
  State<ProgressPage> createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  var value = 50;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBarTitle: 'Progress',
      children: [
        ShadProgress(
          value: value / 100,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ShadButton.ghost(
              enabled: value != 0,
              onPressed: () => setState(() => value -= 10),
              icon: const Icon(Icons.remove),
            ),
            ShadButton.ghost(
              enabled: value != 100,
              onPressed: () => setState(() => value += 10),
              icon: const Icon(Icons.add),
            ),
          ],
        )
      ],
    );
  }
}
