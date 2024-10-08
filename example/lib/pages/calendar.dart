import 'package:example/common/base_scaffold.dart';
import 'package:example/common/properties/bool_property.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime? selected = DateTime.now();
  bool reverseMonths = false;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return BaseScaffold(
      appBarTitle: 'Calendar',
      editable: [
        MyBoolProperty(
          label: 'Reverse months',
          value: reverseMonths,
          onChanged: (value) {
            setState(() {
              reverseMonths = value;
            });
          },
        )
      ],
      children: [
        Text('Single', style: theme.textTheme.h4),
        ShadCalendar(
          selected: selected,
          fromMonth: DateTime(2024),
          toMonth: DateTime(2024, 12),
          // selectableDayPredicate: (date) {
          //   return date.day % 2 == 0;
          // },
          onChanged: (date) {
            setState(() {
              selected = date;
            });
          },
          onMonthChanged: (date) {
            print('month changed to ${date.month}');
          },
        ),
        const Divider(),
        Text('Multiple', style: theme.textTheme.h4),
        ShadCalendar.multiple(
          selected: [if (selected != null) selected!],
          numberOfMonths: 2,
          fromMonth: DateTime(2024),
          toMonth: DateTime(2024, 12),
          onChanged: (dates) {},
          min: 5,
          max: 10,
          reverseMonths: reverseMonths,
        ),
        const Divider(),
        Text('Range', style: theme.textTheme.h4),
        const ShadCalendar.range(onChanged: print),
      ],
    );
  }
}
