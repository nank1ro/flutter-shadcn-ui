import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:example/common/app_bar.dart';
import 'package:example/common/component_view.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ButtonsPage extends StatelessWidget {
  const ButtonsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'Buttons',
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ComponentView(
                label: 'Primary',
                child: ShadcnButton(
                  onPressed: () {},
                  text: 'Button',
                ),
              ),
              ComponentView(
                label: 'Secondary',
                child: ShadcnButton.secondary(
                  onPressed: () {},
                  text: 'Button',
                ),
              ),
              ComponentView(
                label: 'Destructive',
                child: ShadcnButton.destructive(
                  onPressed: () {},
                  text: 'Button',
                ),
              ),
              ComponentView(
                label: 'Outline',
                child: ShadcnButton.outline(
                  onPressed: () {},
                  text: 'Button',
                ),
              ),
              ComponentView(
                label: 'Ghost',
                child: ShadcnButton.ghost(
                  onPressed: () {},
                  text: 'Button',
                ),
              ),
              ComponentView(
                label: 'Link',
                child: ShadcnButton.link(
                  onPressed: () {},
                  text: 'Button',
                ),
              ),
            ].separatedBy(const SizedBox(height: 8)),
          ),
        ),
      ),
    );
  }
}
