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
  final focusNode = FocusNode();
  var size = ShadcnButtonSize.$default;
  var enabled = true;

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

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
        MyBoolProperty(
          label: 'Focused',
          value: focusNode.hasFocus,
          onChanged: enabled
              ? (value) {
                  setState(() {
                    if (value) {
                      focusNode.requestFocus();
                    } else {
                      focusNode.unfocus();
                    }
                  });
                }
              : null,
        ),
      ],
      children: [
        if (size != ShadcnButtonSize.icon) ...[
          ShadcnButton(
            focusNode: focusNode,
            size: size,
            onPressed: enabled ? () {} : null,
            text: const Text('Primary'),
          ),
          ShadcnButton.secondary(
            focusNode: focusNode,
            size: size,
            onPressed: enabled ? () {} : null,
            text: const Text('Secondary'),
          ),
          ShadcnButton.destructive(
            focusNode: focusNode,
            size: size,
            onPressed: enabled ? () {} : null,
            text: const Text('Destructive'),
          ),
          ShadcnButton.outline(
            focusNode: focusNode,
            size: size,
            onPressed: enabled ? () {} : null,
            text: const Text('Outline'),
          ),
          ShadcnButton.ghost(
            focusNode: focusNode,
            size: size,
            onPressed: enabled ? () {} : null,
            text: const Text('Ghost'),
          ),
          ShadcnButton.link(
            focusNode: focusNode,
            size: size,
            onPressed: enabled ? () {} : null,
            text: const Text('Link'),
          ),
          ShadcnButton(
            focusNode: focusNode,
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
            focusNode: focusNode,
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
          const SizedBox(height: 100),
          ShadcnButton(
            focusNode: focusNode,
            size: size,
            onPressed: enabled ? () {} : null,
            gradient: const LinearGradient(colors: [
              Colors.cyan,
              Colors.indigo,
            ]),
            boxShadow: [
              BoxShadow(
                color: Colors.blue.withOpacity(.4),
                spreadRadius: 4,
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
            text: const Text('Gradient with Shadow'),
          ),
        ],
        if (size == ShadcnButtonSize.icon)
          ComponentView(
            label: 'Icon',
            child: ShadcnButton.outline(
              focusNode: focusNode,
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
