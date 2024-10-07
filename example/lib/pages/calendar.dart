import 'package:example/common/base_scaffold.dart';
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
  bool usePredicate = false;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBarTitle: 'Calendar',
      children: [
        ShadCalendar(
          selected: selected,
          numberOfMonths: 2,
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
          reverseMonths: true,
        ),
        ShadCalendar.multiple(
          selected: [if (selected != null) selected!],
          numberOfMonths: 2,
          fromMonth: DateTime(2024),
          toMonth: DateTime(2024, 12),
          onChanged: (dates) {},
          min: 5,
          max: 10,
          onMonthChanged: (date) {
            print('month changed to ${date.month}');
          },
          reverseMonths: true,
        ),
      ],
    );
  }
}
