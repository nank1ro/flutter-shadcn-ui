import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

enum ToastStyle {
  schedule,
  simple,
  withTitle,
  withAction,
  destructive,
}

class ToastPage extends StatelessWidget {
  const ToastPage({
    super.key,
    required this.style,
  });

  final ToastStyle style;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return Scaffold(
      body: Center(
        child: switch (style) {
          ToastStyle.schedule => ShadButton.outline(
              child: const Text('Add to calendar'),
              onPressed: () {
                ShadToaster.of(context).show(
                  ShadToast(
                    title: const Text('Scheduled: Catch up'),
                    description:
                        const Text('Friday, February 10, 2023 at 5:57 PM'),
                    action: ShadButton.outline(
                      child: const Text('Undo'),
                      onPressed: () => ShadToaster.of(context).hide(),
                    ),
                  ),
                );
              },
            ),
          ToastStyle.destructive => ShadButton.outline(
              child: const Text('Show Toast'),
              onPressed: () {
                ShadToaster.of(context).show(
                  ShadToast.destructive(
                    title: const Text('Uh oh! Something went wrong'),
                    description:
                        const Text('There was a problem with your request'),
                    action: ShadButton.destructive(
                      decoration: ShadDecoration(
                        border: ShadBorder.all(
                          color: theme.colorScheme.destructiveForeground,
                        ),
                      ),
                      onPressed: () => ShadToaster.of(context).hide(),
                      child: const Text('Try again'),
                    ),
                  ),
                );
              },
            ),
          ToastStyle.simple => ShadButton.outline(
              child: const Text('Show Toast'),
              onPressed: () {
                ShadToaster.of(context).show(
                  const ShadToast(
                    description: Text('Your message has been sent.'),
                  ),
                );
              },
            ),
          ToastStyle.withTitle => ShadButton.outline(
              child: const Text('Show Toast'),
              onPressed: () {
                ShadToaster.of(context).show(
                  const ShadToast(
                    title: Text('Uh oh! Something went wrong'),
                    description: Text('There was a problem with your request'),
                  ),
                );
              },
            ),
          ToastStyle.withAction => ShadButton.outline(
              child: const Text('Show Toast'),
              onPressed: () {
                ShadToaster.of(context).show(
                  ShadToast(
                    title: const Text('Uh oh! Something went wrong'),
                    description:
                        const Text('There was a problem with your request'),
                    action: ShadButton.outline(
                      child: const Text('Try again'),
                      onPressed: () => ShadToaster.of(context).hide(),
                    ),
                  ),
                );
              },
            ),
        },
      ),
    );
  }
}
