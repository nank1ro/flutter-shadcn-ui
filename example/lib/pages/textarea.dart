import 'package:example/common/base_scaffold.dart';
import 'package:example/common/properties/bool_property.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class TextareaPage extends StatefulWidget {
  const TextareaPage({super.key});

  @override
  State<TextareaPage> createState() => _TextareaPageState();
}

class _TextareaPageState extends State<TextareaPage> {
  bool enabled = true;
  bool resizable = true;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBarTitle: 'Textarea',
      editable: [
        MyBoolProperty(
          label: 'Enabled',
          value: enabled,
          onChanged: (v) => setState(() => enabled = v),
        ),
        MyBoolProperty(
          label: 'Resizable',
          value: resizable,
          onChanged: (v) => setState(() => resizable = v),
        ),
      ],
      children: [
        ShadTextarea(
          scrollPadding: EdgeInsets.zero,
          // padding: EdgeInsets.only(bottom: 8 + 1),
          // inputPadding: EdgeInsets.zero,
          placeholder: const Text('Type your message here...'),
          enabled: enabled,
          resizable: resizable,
          onChanged: (v) => print('Value changed: $v'),
        ),
        TextField(
          minLines: 5,
          maxLines: 5,
          scrollPadding: const EdgeInsets.all(200),
        ),
      ],
    );
  }
}
