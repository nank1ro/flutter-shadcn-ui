import 'package:example/common/base_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBarTitle: 'Calendar',
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 280),
          child: const ShadCalendar(),
        ),
      ],
    );
  }
}
