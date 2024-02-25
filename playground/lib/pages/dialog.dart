import 'package:flutter/material.dart';

import 'package:shadcn_ui/shadcn_ui.dart';

final profile = [
  (title: 'Name', value: 'Alexandru'),
  (title: 'Username', value: 'nank1ro'),
];

class DialogPage extends StatelessWidget {
  const DialogPage({
    super.key,
    required this.style,
  });

  final ShadDialogVariant style;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return Scaffold(
      body: Center(
        child: () {
          return switch (style) {
            ShadDialogVariant.primary => ShadButton.outline(
                text: const Text('Edit Profile'),
                onPressed: () {
                  showDialog(
                    context: context,
                    barrierColor: Colors.black.withOpacity(.8),
                    builder: (context) => ShadDialog(
                      title: const Text('Edit Profile'),
                      description: const Text(
                          "Make changes to your profile here. Click save when you're done"),
                      content: Container(
                        width: 375,
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: profile
                              .map(
                                (p) => Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        p.title,
                                        textAlign: TextAlign.end,
                                        style: theme.textTheme.small,
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      flex: 3,
                                      child: ShadInput(initialValue: p.value),
                                    ),
                                  ],
                                ),
                              )
                              .toList(),
                        ),
                      ),
                      actions: const [ShadButton(text: Text('Save changes'))],
                    ),
                  );
                },
              ),
            ShadDialogVariant.alert => ShadButton.outline(
                text: const Text('Show Dialog'),
                onPressed: () {
                  showDialog(
                    context: context,
                    barrierColor: Colors.black.withOpacity(.8),
                    builder: (context) => ShadDialog.alert(
                      title: const Text('Are you absolutely sure?'),
                      description: const Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Text(
                          'This action cannot be undone. This will permanently delete your account and remove your data from our servers.',
                        ),
                      ),
                      actions: [
                        ShadButton.outline(
                          text: const Text('Cancel'),
                          onPressed: () => Navigator.of(context).pop(false),
                        ),
                        ShadButton(
                          text: const Text('Continue'),
                          onPressed: () => Navigator.of(context).pop(true),
                        ),
                      ],
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
