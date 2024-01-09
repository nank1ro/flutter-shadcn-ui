import 'package:example/common/base_scaffold.dart';
import 'package:example/common/component_view.dart';
import 'package:example/common/properties/bool_property.dart';
import 'package:example/common/properties/enum_property.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ButtonPage extends StatefulWidget {
  const ButtonPage({super.key});

  @override
  State<ButtonPage> createState() => _ButtonPageState();
}

class _ButtonPageState extends State<ButtonPage> {
  var size = ShadcnButtonSize.$default;
  var enabled = true;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBarTitle: 'Button',
      editable: [
        MyEnumProperty(
          label: 'Size',
          value: size,
          values: ShadcnButtonSize.values,
          onChanged: (value) => setState(() => size = value),
        ),
        MyBoolProperty(
          label: 'Enabled',
          value: enabled,
          onChanged: (value) => setState(() => enabled = value),
        ),
      ],
      children: [
        if (size != ShadcnButtonSize.icon) ...[
          ShadcnButton(
            size: size,
            onPressed: enabled ? () {} : null,
            text: const Text('Primary'),
          ),
          ShadcnButton.secondary(
            size: size,
            onPressed: enabled ? () {} : null,
            text: const Text('Secondary'),
          ),
          ShadcnButton.destructive(
            size: size,
            onPressed: enabled ? () {} : null,
            text: const Text('Destructive'),
          ),
          ShadcnButton.outline(
            size: size,
            onPressed: enabled ? () {} : null,
            text: const Text('Outline'),
          ),
          ShadcnButton.ghost(
            size: size,
            onPressed: enabled ? () {} : null,
            text: const Text('Ghost'),
          ),
          ShadcnButton.link(
            size: size,
            onPressed: enabled ? () {} : null,
            text: const Text('Link'),
          ),
          ShadcnButton(
            size: size,
            onPressed: enabled ? () {} : null,
            text: const Text('Login with Email'),
            icon: const Padding(
              padding: EdgeInsets.only(right: 8),
              child: Icon(
                Icons.mail_outlined,
                size: 16,
              ),
            ),
          ),
          ShadcnButton(
            size: size,
            onPressed: enabled ? () {} : null,
            text: const Text('Please wait'),
            icon: const Padding(
              padding: EdgeInsets.only(right: 8),
              child: SizedBox.square(
                dimension: 16,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              ),
            ),
          ),
        ],
        if (size == ShadcnButtonSize.icon)
          ComponentView(
            label: 'Icon',
            child: ShadcnButton.outline(
              size: size,
              onPressed: enabled ? () {} : null,
              icon: const Icon(
                Icons.chevron_right,
                size: 16,
              ),
            ),
          ),
      ],
    );
  }
}
