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
  var size = ShadButtonSize.regular;
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
          values: ShadButtonSize.values,
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
        if (size != ShadButtonSize.icon) ...[
          ShadButton(
            focusNode: focusNode,
            size: size,
            onPressed: enabled ? () {} : null,
            text: const Text('Primary'),
          ),
          ShadButton.secondary(
            focusNode: focusNode,
            size: size,
            onPressed: enabled ? () {} : null,
            text: const Text('Secondary'),
          ),
          ShadButton.destructive(
            focusNode: focusNode,
            size: size,
            onPressed: enabled ? () {} : null,
            text: const Text('Destructive'),
          ),
          ShadButton.outline(
            focusNode: focusNode,
            size: size,
            onPressed: enabled ? () {} : null,
            text: const Text('Outline'),
          ),
          ShadButton.ghost(
            focusNode: focusNode,
            size: size,
            onPressed: enabled ? () {} : null,
            text: const Text('Ghost'),
          ),
          ShadButton.link(
            focusNode: focusNode,
            size: size,
            onPressed: enabled ? () {} : null,
            text: const Text('Link'),
          ),
          ShadButton(
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
          ShadButton(
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
          ShadButton(
            focusNode: focusNode,
            size: size,
            onPressed: enabled ? () {} : null,
            gradient: const LinearGradient(colors: [
              Colors.cyan,
              Colors.indigo,
            ]),
            shadows: [
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
        if (size == ShadButtonSize.icon)
          ComponentView(
            label: 'Icon',
            child: ShadButton.outline(
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
