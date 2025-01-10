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
  var size = ShadButtonSize.regular;
  var enabled = true;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return FocusTraversalGroup(
      policy: WidgetOrderTraversalPolicy(),
      child: BaseScaffold(
        appBarTitle: 'Button',
        editable: [
          MyEnumProperty(
            label: 'Size',
            value: size,
            values: ShadButtonSize.values,
            onChanged: (value) {
              if (value != null) {
                setState(() => size = value);
              }
            },
          ),
          MyBoolProperty(
            label: 'Enabled',
            value: enabled,
            onChanged: (value) => setState(() => enabled = value),
          ),
        ],
        children: [
          ShadButton(
            size: size,
            enabled: enabled,
            child: const Text('Primary'),
            onPressed: () => print('Primary'),
          ),
          ShadButton.secondary(
            size: size,
            enabled: enabled,
            child: const Text('Secondary'),
            onPressed: () => print('Secondary'),
          ),
          ShadButton.destructive(
            size: size,
            enabled: enabled,
            child: const Text('Destructive'),
          ),
          ShadButton.outline(
            size: size,
            enabled: enabled,
            child: const Text('Outline'),
          ),
          ShadButton.ghost(
            size: size,
            enabled: enabled,
            child: const Text('Ghost'),
          ),
          ShadButton.link(
            size: size,
            enabled: enabled,
            child: const Text('Link'),
          ),
          ShadButton(
            size: size,
            enabled: enabled,
            icon: const Icon(LucideIcons.mail),
            child: const Text('Login with Email'),
          ),
          ShadButton(
            size: size,
            enabled: enabled,
            icon: SizedBox.square(
              dimension: 16,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: theme.colorScheme.primaryForeground,
              ),
            ),
            child: const Text('Please wait'),
          ),
          ShadButton(
            size: size,
            enabled: enabled,
            gradient: const LinearGradient(colors: [
              Colors.cyan,
              Colors.indigo,
            ]),
            shadows: [
              BoxShadow(
                color: Colors.blue.withValues(alpha: .4),
                spreadRadius: 4,
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
            child: const Text('Gradient with Shadow'),
          ),
          ComponentView(
            label: 'Icon',
            child: ShadButton.outline(
              size: size,
              enabled: enabled,
              icon: const Icon(LucideIcons.chevronRight),
            ),
          ),
        ],
      ),
    );
  }
}
