import 'package:example/common/base_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class CardPage extends StatelessWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBarTitle: 'Card',
      children: [
        SizedBox(
          width: 350,
          child: ShadcnCard(
            title: const Text('Create project'),
            description: const Text('Deploy your new project in one-click.'),
            content: const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // TODO: use ShadcnInputFormField
                  Text('Name'),
                  ShadcnInput(placeholder: 'Name of your project'),

                  SizedBox(height: 6),
                  // TODO: use ShadcnSelect
                  Text('Framework'),
                  ShadcnInput(placeholder: 'Select'),
                ],
              ),
            ),
            footer: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ShadcnButton.outline(
                  text: const Text('Cancel'),
                  onPressed: () {},
                ),
                ShadcnButton(
                  text: const Text('Deploy'),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
