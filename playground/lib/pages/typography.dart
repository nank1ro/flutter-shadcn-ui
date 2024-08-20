import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

enum TypographyStyle {
  h1Large,
  h1,
  h2,
  h3,
  h4,
  p,
  blockquote,
  table,
  list,
  lead,
  large,
  small,
  muted,
}

class TypographyPage extends StatelessWidget {
  const TypographyPage({
    super.key,
    required this.style,
  });

  final TypographyStyle style;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: switch (style) {
            TypographyStyle.h1Large => Text(
                'Taxing Laughter: The Joke Tax Chronicles',
                style: ShadTheme.of(context).textTheme.h1Large,
              ),
            TypographyStyle.h1 => Text(
                'Taxing Laughter: The Joke Tax Chronicles',
                style: ShadTheme.of(context).textTheme.h1,
              ),
            TypographyStyle.h2 => Text(
                'The People of the Kingdom',
                style: ShadTheme.of(context).textTheme.h2,
              ),
            TypographyStyle.h3 => Text(
                'The Joke Tax',
                style: ShadTheme.of(context).textTheme.h3,
              ),
            TypographyStyle.h4 => Text(
                'People stopped telling jokes',
                style: ShadTheme.of(context).textTheme.h4,
              ),
            TypographyStyle.p => Text(
                'The king, seeing how much happier his subjects were, realized the error of his ways and repealed the joke tax.',
                style: ShadTheme.of(context).textTheme.p,
              ),
            TypographyStyle.blockquote => Text(
                '"After all," he said, "everyone enjoys a good joke, so it\'s only fair that they should pay for the privilege."',
                style: ShadTheme.of(context).textTheme.blockquote,
              ),
            TypographyStyle.table => Text(
                "King's Treasury",
                style: ShadTheme.of(context).textTheme.table,
              ),
            TypographyStyle.list => Text(
                '1st level of puns: 5 gold coins',
                style: ShadTheme.of(context).textTheme.list,
              ),
            TypographyStyle.lead => Text(
                'A modal dialog that interrupts the user with important content and expects a response.',
                style: ShadTheme.of(context).textTheme.lead,
              ),
            TypographyStyle.large => Text(
                'Are you absolutely sure?',
                style: ShadTheme.of(context).textTheme.large,
              ),
            TypographyStyle.small => Text(
                'Email address',
                style: ShadTheme.of(context).textTheme.small,
              ),
            TypographyStyle.muted => Text(
                'Enter your email address.',
                style: ShadTheme.of(context).textTheme.muted,
              ),
          },
        ),
      ),
    );
  }
}
