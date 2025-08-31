import 'package:example/common/base_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class KeyboardToolbarPage extends StatelessWidget {
  const KeyboardToolbarPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return BaseScaffold(
      appBarTitle: 'KeyboardToolbar',
      children: [
        ShadInput(
          placeholder:
              const Text('Focus on mobile to show keyboard and toolbar'),
          keyboardType: TextInputType.emailAddress,
          toolbarBuilder: (context) {
            return Container(
              color: theme.colorScheme.accent,
              child: FocusTraversalGroup(
                descendantsAreFocusable: false,
                descendantsAreTraversable: false,
                child: Row(
                  children: [
                    ShadIconButton.ghost(
                      icon: Icon(LucideIcons.chevronUp),
                      onPressed: () {
                        FocusScope.of(context).previousFocus();
                      },
                    ),
                    ShadIconButton.ghost(
                      icon: Icon(LucideIcons.chevronDown),
                      onPressed: () {
                        FocusScope.of(context).nextFocus();
                      },
                    ),
                    Spacer(),
                    ShadButton.link(
                      child: Text('Done'),
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        ShadInput(
          placeholder:
              const Text('Without toolbar, just to show how the chevron works'),
          keyboardType: TextInputType.emailAddress,
        ),
      ],
    );
  }
}
