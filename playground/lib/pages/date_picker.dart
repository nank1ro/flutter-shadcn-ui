import 'package:flutter/material.dart';

import 'package:shadcn_ui/shadcn_ui.dart';

enum ShadDatePickerVariantPlayground {
  single,
  range,
  presets,
}

class DatePickerPage extends StatelessWidget {
  const DatePickerPage({
    super.key,
    required this.style,
  });

  final ShadDatePickerVariantPlayground style;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
          child: switch (style) {
            ShadDatePickerVariantPlayground.single => const SingleDatePicker(),
            ShadDatePickerVariantPlayground.range => const RangeDatePicker(),
            ShadDatePickerVariantPlayground.presets =>
              const PresetsDatePicker(),
          },
        ),
      ),
    );
  }
}

class SingleDatePicker extends StatelessWidget {
  const SingleDatePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 600),
      child: const ShadDatePicker(),
    );
  }
}

class RangeDatePicker extends StatelessWidget {
  const RangeDatePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 600),
      child: const ShadDatePicker.range(),
    );
  }
}

const presets = {
  0: 'Today',
  1: 'Tomorrow',
  3: 'In 3 days',
  7: 'In a week',
};

class PresetsDatePicker extends StatefulWidget {
  const PresetsDatePicker({super.key});

  @override
  State<PresetsDatePicker> createState() => _PresetsDatePickerState();
}

class _PresetsDatePickerState extends State<PresetsDatePicker> {
  final groupId = UniqueKey();
  final today = DateTime.now().startOfDay;
  DateTime? selected;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 600),
      child: ShadDatePicker(
        // Using the same groupId to keep the date picker popover open when the
        // select popover is closed.
        groupId: groupId,
        header: Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: ShadSelect<int>(
            groupId: groupId,
            minWidth: 276,
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
        ),
        selected: selected,
        calendarDecoration: theme.calendarTheme.decoration,
        popoverPadding: const EdgeInsets.all(4),
      ),
    );
  }
}
