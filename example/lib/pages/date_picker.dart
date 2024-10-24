import 'package:example/common/base_scaffold.dart';
import 'package:example/common/properties/bool_property.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class DatePickerPage extends StatefulWidget {
  const DatePickerPage({super.key});

  @override
  State<DatePickerPage> createState() => _DatePickerPageState();
}

class _DatePickerPageState extends State<DatePickerPage> {
  bool closeOnSelection = false;
  bool allowDeselection = true;

  @override
  Widget build(BuildContext context) {
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
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: ShadDatePicker(
            closeOnSelection: closeOnSelection,
            allowDeselection: allowDeselection,
          ),
        ),
      ],
    );
  }
}
