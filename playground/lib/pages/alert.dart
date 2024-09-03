import 'package:flutter/material.dart';

import 'package:shadcn_ui/shadcn_ui.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({
    super.key,
    required this.style,
  });

  final ShadAlertVariant style;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: switch (style) {
            ShadAlertVariant.primary => const ShadAlert(
                iconSrc: LucideIcons.terminal,
                title: Text('Heads up!'),
                description:
                    Text('You can add components to your app using the cli.'),
              ),
            ShadAlertVariant.destructive => const ShadAlert.destructive(
                iconSrc: LucideIcons.circleAlert,
                title: Text('Error'),
                description:
                    Text('Your session has expired. Please log in again.'),
              ),
          },
        ),
      ),
    );
  }
}
