import 'package:example/common/base_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class TabsPage extends StatelessWidget {
  const TabsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBarTitle: "Tabs",
      wrapChildrenInScrollable: false,
      wrapSingleChildInColumn: false,
      alignment: Alignment.topCenter,
      children: [
        ShadTabs(
          value: 'account',
          tabBarConstraints: const BoxConstraints(maxWidth: 400),
          contentConstraints: const BoxConstraints(maxWidth: 400),
          onChanged: (value) => print(value),
          tabs: [
            ShadTab(
              value: 'account',
              content: ShadCard(
                title: const Text('Account'),
                description: const Text(
                    "Make changes to your account here. Click save when you're done."),
                footer: const ShadButton(child: Text('Save changes')),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 16),
                    ShadInputFormField(
                      label: const Text('Name'),
                      initialValue: 'Ale',
                    ),
                    const SizedBox(height: 8),
                    ShadInputFormField(
                      label: const Text('Username'),
                      initialValue: 'nank1ro',
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
              child: const Text('Account'),
            ),
            ShadTab(
              value: 'password',
              content: ShadCard(
                title: const Text('Password'),
                description: const Text(
                    "Change your password here. After saving, you'll be logged out."),
                footer: const ShadButton(child: Text('Save password')),
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    ShadInputFormField(
                      label: const Text('Current password'),
                      obscureText: true,
                    ),
                    const SizedBox(height: 8),
                    ShadInputFormField(
                      label: const Text('New password'),
                      obscureText: true,
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
              child: const Text('Password'),
            ),
          ],
        ),
      ],
    );
  }
}
