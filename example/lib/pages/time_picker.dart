import 'package:example/common/base_scaffold.dart';
import 'package:example/common/properties/bool_property.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class TimePickerPage extends StatefulWidget {
  const TimePickerPage({super.key});

  @override
  State<TimePickerPage> createState() => _TimePickerPageState();
}

class _TimePickerPageState extends State<TimePickerPage> {
  bool showHours = true;
  bool showMinutes = true;
  bool showSeconds = true;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBarTitle: 'TimePicker',
      editable: [
        MyBoolProperty(
          label: ' Show Hours',
          value: showHours,
          enabled: showMinutes || showSeconds,
          onChanged: (v) => setState(() => showHours = v),
        ),
        MyBoolProperty(
          label: ' Show Minutes',
          value: showMinutes,
          enabled: showHours || showSeconds,
          onChanged: (v) => setState(() => showMinutes = v),
        ),
        MyBoolProperty(
          label: ' Show Seconds',
          enabled: showHours || showMinutes,
          value: showSeconds,
          onChanged: (v) => setState(() => showSeconds = v),
        ),
      ],
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: ShadTimePicker(
            showHours: showHours,
            showMinutes: showMinutes,
            showSeconds: showSeconds,
            trailing: const Padding(
              padding: EdgeInsets.only(left: 8, top: 14),
              child: Icon(LucideIcons.clock4),
            ),
            onChanged: (time) {
              print('time: $time');
            },
          ),
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: ShadTimePicker.period(
            showHours: showHours,
            showMinutes: showMinutes,
            showSeconds: showSeconds,
            crossAxisAlignment: WrapCrossAlignment.end,
            onChanged: (time) {
              print('time: $time');
            },
          ),
        ),
      ],
    );
  }
}
