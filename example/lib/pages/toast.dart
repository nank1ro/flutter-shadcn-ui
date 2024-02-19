import 'package:example/common/base_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ToastPage extends StatelessWidget {
  const ToastPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBarTitle: 'Toast',
      children: [
        ShadButton.outline(
          text: const Text('Add to calendar'),
          onPressed: () {
            ShadToaster.of(context).show(
              ShadToast(
                title: const Text('Scheduled: Catch up'),
                description: const Text('Friday, February 10, 2023 at 5:57 PM'),
                action: ShadButton.outline(
                  text: const Text('Undo'),
                  onPressed: () => ShadToaster.of(context).hide(),
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
