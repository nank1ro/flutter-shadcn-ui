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
        child: () {
          return switch (style) {
            ToastStyle.schedule => ShadButton.outline(
                text: const Text('Add to calendar'),
                onPressed: () {
                  ShadToaster.of(context).show(
                    ShadToast(
                      title: const Text('Scheduled: Catch up'),
                      description:
                          const Text('Friday, February 10, 2023 at 5:57 PM'),
                      action: ShadButton.outline(
                        text: const Text('Undo'),
                        onPressed: () => ShadToaster.of(context).hide(),
                      ),
                    ),
                  );
                },
              ),
            ToastStyle.destructive => ShadButton.outline(
                text: const Text('Show Toast'),
                onPressed: () {
                  ShadToaster.of(context).show(
                    ShadToast.destructive(
                      title: const Text('Uh oh! Something went wrong'),
                      description:
                          const Text('There was a problem with your request'),
                      action: ShadButton.destructive(
                        text: const Text('Try again'),
                        decoration: ShadDecoration(
                          border: ShadBorder(
                            color: theme.colorScheme.destructiveForeground,
                          ),
                        ),
                        onPressed: () => ShadToaster.of(context).hide(),
                      ),
                    ),
                  );
                },
              ),
            ToastStyle.simple => ShadButton.outline(
                text: const Text('Show Toast'),
                onPressed: () {
                  ShadToaster.of(context).show(
                    const ShadToast(
                      description: Text('Your message has been sent.'),
                    ),
                  );
                },
              ),
            ToastStyle.withTitle => ShadButton.outline(
                text: const Text('Show Toast'),
                onPressed: () {
                  ShadToaster.of(context).show(
                    const ShadToast(
                      title: Text('Uh oh! Something went wrong'),
                      description:
                          Text('There was a problem with your request'),
                    ),
                  );
                },
              ),
            ToastStyle.withAction => ShadButton.outline(
                text: const Text('Show Toast'),
                onPressed: () {
                  ShadToaster.of(context).show(
                    ShadToast(
                      title: const Text('Uh oh! Something went wrong'),
                      description:
                          const Text('There was a problem with your request'),
                      action: ShadButton.outline(
                        text: const Text('Try again'),
                        onPressed: () => ShadToaster.of(context).hide(),
                      ),
                    ),
                  );
                },
              ),
          };
        }(),
      ),
    );
  }
}
