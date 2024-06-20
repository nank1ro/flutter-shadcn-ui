import 'package:example/common/base_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class TabBarDemo extends StatelessWidget {
  const TabBarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit)),
                Tab(icon: Icon(Icons.directions_bike)),
              ],
            ),
            title: const Text('Tabs Demo'),
          ),
          body: const TabBarView(
            children: [
              Icon(Icons.directions_car),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }
}

class TabPage extends StatelessWidget {
  const TabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBarTitle: "Tab",
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: ShadTabs<String>(
            defaultValue: 'account',
            tabs: [
              ShadTab(
                value: 'account',
                content: ShadCard(
                  title: const Text('Account'),
                  description: const Text(
                      "Make changes to your account here. Click save when you're done."),
                  content: Column(
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
                  footer: const ShadButton(text: Text('Save changes')),
                ),
                child: const Text('Account'),
              ),
              ShadTab(
                value: 'password',
                content: ShadCard(
                  title: const Text('Password'),
                  description: const Text(
                      "Change your password here. After saving, you'll be logged out."),
                  content: Column(
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
                  footer: const ShadButton(text: Text('Save password')),
                ),
                child: const Text('Password'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
