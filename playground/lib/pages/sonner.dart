import 'dart:math';

import 'package:flutter/material.dart';

import 'package:shadcn_ui/shadcn_ui.dart';

class SonnerPage extends StatelessWidget {
  const SonnerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: ShadButton.outline(
            child: const Text('Show Toast'),
            onPressed: () {
              final sonner = ShadSonner.of(context);
              final id = Random().nextInt(1000);
              final now = DateTime.now();
              sonner.show(
                ShadToast(
                  id: id,
                  title: const Text('Event has been created'),
                  description: Text(DateFormat.yMd().add_jms().format(now)),
                  action: ShadButton(
                    child: const Text('Undo'),
                    onPressed: () => sonner.hide(id),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
