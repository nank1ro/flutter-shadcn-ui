import 'package:example/common/base_scaffold.dart';
import 'package:example/common/properties/bool_property.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class SelectPage extends StatefulWidget {
  const SelectPage({super.key});

  @override
  State<SelectPage> createState() => _SelectPageState();
}

class _SelectPageState extends State<SelectPage> {
  bool enabled = true;
  final focusNode = FocusNode();

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadcnTheme.of(context);
    return BaseScaffold(
      appBarTitle: 'Select',
      editable: [
        MyBoolProperty(
          label: 'Enabled',
          value: enabled,
          onChanged: (value) => setState(() => enabled = value),
        ),
        MyBoolProperty(
          label: 'Focused',
          value: focusNode.hasFocus,
          onChanged: (value) => setState(
            () => value ? focusNode.requestFocus() : focusNode.unfocus(),
          ),
        ),
      ],
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(minWidth: 180),
          child: ShadcnSelect<String>(
            enabled: enabled,
            focusNode: focusNode,
            placeholder: const Text('Select a fruit'),
            options: [
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 6, 6, 6),
                child: Text(
                  'Fruits',
                  style: theme.textTheme.muted.copyWith(
                    fontWeight: FontWeight.w600,
                    color: theme.colorScheme.popoverForeground,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              const ShadcnOption(value: 'Apple', child: Text('Apple')),
              const ShadcnOption(value: 'Banana', child: Text('Banana')),
              const ShadcnOption(value: 'Blueberry', child: Text('Blueberry')),
              const ShadcnOption(value: 'Grapes', child: Text('Grapes')),
              const ShadcnOption(value: 'Pineapple', child: Text('Pineapple')),
            ],
            selectedOptionBuilder: (context, value) => Text(value),
          ),
        ),
      ],
    );
  }
}
