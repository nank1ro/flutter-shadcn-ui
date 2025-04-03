import 'dart:math';

import 'package:example/common/base_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class SonnerPage extends StatefulWidget {
  const SonnerPage({super.key});

  @override
  State<SonnerPage> createState() => _SonnerPageState();
}

class _SonnerPageState extends State<SonnerPage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBarTitle: 'Sonner',
      children: [
        ShadButton.outline(
          child: const Text('Add to calendar'),
          onPressed: () {
            final sonner = ShadSonner.of(context);
            final id = Random().nextInt(1000);
            final now = DateTime.now();
            sonner.show(
              ShadToast(
                id: id,
                title: const Text('Scheduled: Catch up'),
                description: Text(now.toString()),
                action: ShadButton.outline(
                  child: const Text('Undo'),
                  onPressed: () => sonner.hide(id),
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
