import 'package:example/common/base_scaffold.dart';
import 'package:example/common/properties/bool_property.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

const presets = {
  0: 'Today',
  1: 'Tomorrow',
  3: 'In 3 days',
  7: 'In a week',
};

class DatePickerPage extends StatefulWidget {
  const DatePickerPage({super.key});

  @override
  State<DatePickerPage> createState() => _DatePickerPageState();
}

class _DatePickerPageState extends State<DatePickerPage> {
  bool closeOnSelection = false;
  bool allowDeselection = true;
  final today = DateTime.now().startOfDay;
  final groupId = UniqueKey();

  DateTime? selected;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return BaseScaffold(
      appBarTitle: 'DatePicker',
      editable: [
        MyBoolProperty(
          label: 'closeOnSelection',
          value: closeOnSelection,
          onChanged: (value) => setState(() => closeOnSelection = value),
        ),
        MyBoolProperty(
          label: 'allowDeselection',
          value: allowDeselection,
          onChanged: (value) => setState(() => allowDeselection = value),
        ),
      ],
      children: [
        Text('Single', style: theme.textTheme.h4),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: ShadDatePicker(
            closeOnSelection: closeOnSelection,
            allowDeselection: allowDeselection,
          ),
        ),
        const Divider(),
        Text('Range', style: theme.textTheme.h4),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: ShadDatePicker.range(
            closeOnSelection: closeOnSelection,
            allowDeselection: allowDeselection,
          ),
        ),
        const Divider(),
        Text('With Presets', style: theme.textTheme.h4),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: ShadDatePicker(
            // Using the same groupId to keep the date picker popover open when the
            // select popover is closed.
            groupId: groupId,
            header: ShadSelect<int>(
              groupId: groupId,
              minWidth: 284,
              placeholder: const Text('Select'),
              options: presets.entries
                  .map((e) => ShadOption(value: e.key, child: Text(e.value)))
                  .toList(),
              selectedOptionBuilder: (context, value) {
                return Text(presets[value]!);
              },
              onChanged: (value) {
                if (value == null) return;
                setState(() {
                  selected = today.add(Duration(days: value));
                });
              },
            ),
            closeOnSelection: closeOnSelection,
            allowDeselection: allowDeselection,
            selected: selected,
            calendarDecoration: theme.calendarTheme.decoration,
            popoverPadding: const EdgeInsets.all(8),
          ),
        ),
      ],
    );
  }
}
