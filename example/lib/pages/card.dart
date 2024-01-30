import 'package:example/common/base_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

const frameworks = {
  'next': 'Next.js',
  'react': 'React',
  'astro': 'Astro',
  'nuxt': 'Nuxt.js',
};

class CardPage extends StatelessWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ShadcnTheme.of(context);
    return BaseScaffold(
      appBarTitle: 'Card',
      children: [
        SizedBox(
          width: 350,
          child: ShadcnCard(
            title: Text('Create project', style: theme.textTheme.h4),
            description: const Text('Deploy your new project in one-click.'),
            content: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text('Name'),
                  const ShadcnInput(placeholder: 'Name of your project'),
                  const SizedBox(height: 6),
                  const Text('Framework'),
                  ShadcnSelect<String>(
                    placeholder: const Text('Select'),
                    options: frameworks.entries
                        .map((e) =>
                            ShadcnOption(value: e.key, child: Text(e.value)))
                        .toList(),
                    selectedOptionBuilder: (context, value) {
                      return Text(frameworks[value]!);
                    },
                    onChanged: (value) {},
                  ),
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
