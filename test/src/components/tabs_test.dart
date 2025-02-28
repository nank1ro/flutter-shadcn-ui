import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shadcn_ui/src/app.dart';
import 'package:shadcn_ui/src/components/button.dart';
import 'package:shadcn_ui/src/components/card.dart';
import 'package:shadcn_ui/src/components/form/fields/input.dart';
import 'package:shadcn_ui/src/components/tabs.dart';

import '../../extra/pump_async_widget.dart';

void main() {
  // Helper method to create a test widget wrapped in ShadApp and Scaffold
  Widget createTestWidget(Widget child) {
    return ShadApp(home: Scaffold(body: child));
  }

  group('ShadTabs', () {
    testWidgets('ShadTabs matches goldens', (tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          ShadTabs<String>(
            value: 'account',
            tabBarConstraints: const BoxConstraints(maxWidth: 400),
            contentConstraints: const BoxConstraints(maxWidth: 400),
            tabs: [
              ShadTab(
                value: 'account',
                content: ShadCard(
                  title: const Text('Account'),
                  description: const Text(
                    """Make changes to your account here. Click save when you're done.""",
                  ),
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
                    """Change your password here. After saving, you'll be logged out.""",
                  ),
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
        ),
      );

      expect(
        find.byType(ShadTabs<String>),
        matchesGoldenFile('goldens/tabs.png'),
      );
      await tester.pumpAndSettle();
    });
  });
}
