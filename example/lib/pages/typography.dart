import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:example/common/base_scaffold.dart';
import 'package:example/common/component_view.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class TypographyPage extends StatelessWidget {
  const TypographyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBarTitle: 'Typography',
      children: [
        ComponentView(
          label: 'h1 Large',
          child: Text(
            'Taxing Laughter: The Joke Tax Chronicles',
            style: ShadTheme.of(context).textTheme.h1Large,
          ),
        ),
        ComponentView(
          label: 'h1',
          child: Text(
            'Taxing Laughter: The Joke Tax Chronicles',
            style: ShadTheme.of(context).textTheme.h1,
          ),
        ),
        ComponentView(
          label: 'h2',
          child: Text(
            'The People of the Kingdom',
            style: ShadTheme.of(context).textTheme.h2,
          ),
        ),
        ComponentView(
          label: 'h3',
          child: Text(
            'The Joke Tax',
            style: ShadTheme.of(context).textTheme.h3,
          ),
        ),
        ComponentView(
          label: 'h4',
          child: Text(
            'People stopped telling jokes',
            style: ShadTheme.of(context).textTheme.h4,
          ),
        ),
        ComponentView(
          label: 'p',
          child: Text(
            'The king, seeing how much happier his subjects were, realized the error of his ways and repealed the joke tax.',
            style: ShadTheme.of(context).textTheme.p,
          ),
        ),
        ComponentView(
          label: 'blockquote',
          child: Text(
            '"After all," he said, "everyone enjoys a good joke, so it\'s only fair that they should pay for the privilege."',
            style: ShadTheme.of(context).textTheme.blockquote,
          ),
        ),
        ComponentView(
          label: 'table',
          child: Text(
            "King's Treasury",
            style: ShadTheme.of(context).textTheme.table,
          ),
        ),
        ComponentView(
          label: 'list',
          child: Text(
            '1st level of puns: 5 gold coins',
            style: ShadTheme.of(context).textTheme.list,
          ),
        ),
        ComponentView(
          label: 'lead',
          child: Text(
            'A modal dialog that interrupts the user with important content and expects a response.',
            style: ShadTheme.of(context).textTheme.lead,
          ),
        ),
        ComponentView(
          label: 'large',
          child: Text(
            'Are you absolutely sure?',
            style: ShadTheme.of(context).textTheme.large,
          ),
        ),
        ComponentView(
          label: 'small',
          child: Text(
            'Email address',
            style: ShadTheme.of(context).textTheme.small,
          ),
        ),
        ComponentView(
          label: 'muted',
          child: Text(
            'Enter your email address.',
            style: ShadTheme.of(context).textTheme.muted,
          ),
        ),
      ].separatedBy(const Divider()),
    );
  }
}
