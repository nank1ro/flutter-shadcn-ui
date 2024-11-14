import 'package:example/common/base_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class TimePickerPage extends StatelessWidget {
  const TimePickerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBarTitle: 'TimePicker',
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: const ShadTimePicker(),
        ),
      ],
    );
  }
}
