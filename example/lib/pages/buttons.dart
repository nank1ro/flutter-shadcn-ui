import 'package:example/common/base_scaffold.dart';
import 'package:example/common/component_view.dart';
import 'package:example/common/enum_property.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ButtonsPage extends StatefulWidget {
  const ButtonsPage({super.key});

  @override
  State<ButtonsPage> createState() => _ButtonsPageState();
}

class _ButtonsPageState extends State<ButtonsPage> {
  var size = ShadcnButtonSize.$default;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBarTitle: 'Buttons',
      editable: [
        MyEnumProperty(
          label: 'Size',
          value: size,
          values: ShadcnButtonSize.values,
          onChanged: (value) => setState(() => size = value),
        ),
      ],
      children: [
        if (size != ShadcnButtonSize.icon) ...[
          ComponentView(
            label: 'Primary',
            child: ShadcnButton(
              size: size,
              onPressed: () {},
              text: const Text('Button'),
            ),
          ),
          ComponentView(
            label: 'Secondary',
            child: ShadcnButton.secondary(
              size: size,
              onPressed: () {},
              text: const Text('Button'),
            ),
          ),
          ComponentView(
            label: 'Destructive',
            child: ShadcnButton.destructive(
              size: size,
              onPressed: () {},
              text: const Text('Button'),
            ),
          ),
          ComponentView(
            label: 'Outline',
            child: ShadcnButton.outline(
              size: size,
              onPressed: () {},
              text: const Text('Button'),
            ),
          ),
          ComponentView(
            label: 'Ghost',
            child: ShadcnButton.ghost(
              size: size,
              onPressed: () {},
              text: const Text('Button'),
            ),
          ),
          ComponentView(
            label: 'Link',
            child: ShadcnButton.link(
              size: size,
              onPressed: () {},
              text: const Text('Button'),
            ),
          ),
        ],
        if (size == ShadcnButtonSize.icon)
          ComponentView(
            label: 'Icon',
            child: ShadcnButton(
              size: size,
              onPressed: () {},
              icon: const Icon(Icons.chevron_right),
            ),
          ),
      ],
    );
  }
}
