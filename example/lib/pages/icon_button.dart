import 'package:example/common/base_scaffold.dart';
import 'package:example/common/properties/bool_property.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class IconButtonPage extends StatefulWidget {
  const IconButtonPage({super.key});

  @override
  State<IconButtonPage> createState() => _IconButtonPageState();
}

class _IconButtonPageState extends State<IconButtonPage> {
  var enabled = true;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return FocusTraversalGroup(
      policy: WidgetOrderTraversalPolicy(),
      child: BaseScaffold(
        appBarTitle: 'IconButton',
        editable: [
          MyBoolProperty(
            label: 'Enabled',
            value: enabled,
            onChanged: (value) => setState(() => enabled = value),
          ),
        ],
        children: [
          ShadIconButton(
            enabled: enabled,
            onPressed: () => print('Primary'),
            icon: const Icon(LucideIcons.rocket),
          ),
          ShadIconButton.secondary(
            enabled: enabled,
            icon: const Icon(LucideIcons.rocket),
            onPressed: () => print('Secondary'),
          ),
          ShadIconButton.destructive(
            enabled: enabled,
            icon: const Icon(LucideIcons.rocket),
            onPressed: () => print('Destructive'),
          ),
          ShadIconButton.outline(
            enabled: enabled,
            icon: const Icon(LucideIcons.rocket),
            onPressed: () => print('Outline'),
          ),
          ShadIconButton.ghost(
            enabled: enabled,
            icon: const Icon(LucideIcons.rocket),
            onPressed: () => print('Ghost'),
          ),
          ShadIconButton(
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
            icon: const Icon(LucideIcons.rocket),
          ),
          ShadIconButton(
            enabled: enabled,
            icon: SizedBox.square(
              dimension: 16,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: theme.colorScheme.primaryForeground,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
