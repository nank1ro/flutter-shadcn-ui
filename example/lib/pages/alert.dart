import 'package:example/common/base_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBarTitle: 'Alert',
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: const ShadAlert(
            iconSrc: LucideIcons.terminal,
            title: Text('Heads up!'),
            description:
                Text('You can add components to your app using the cli.'),
          ),
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: const ShadAlert.destructive(
            iconSrc: LucideIcons.circleAlert,
            title: Text('Error'),
            description: Text('Your session has expired. Please log in again.'),
          ),
        ),
      ],
    );
  }
}
