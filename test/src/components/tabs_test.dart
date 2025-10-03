import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shadcn_ui/src/app.dart';
import 'package:shadcn_ui/src/components/button.dart';
import 'package:shadcn_ui/src/components/card.dart';
import 'package:shadcn_ui/src/components/form/fields/input.dart';
import 'package:shadcn_ui/src/components/tabs.dart';
import 'package:shadcn_ui/src/theme/color_scheme/green.dart';
import 'package:shadcn_ui/src/theme/components/tabs.dart';
import 'package:shadcn_ui/src/theme/data.dart';

import '../../extra/pump_async_widget.dart';

void main() {
  // Helper method to create a test widget wrapped in ShadApp and Scaffold
  Widget createTestWidget(Widget child) {
    return ShadApp(home: Scaffold(body: child));
  }

  Widget createColorTestWidget({
    ({Color selected, Color unselected})? themeForegroundColor,
    ({Color selected, Color unselected})? tabForegroundColor,
  }) {
    return ShadApp(
      theme: ShadThemeData(
        colorScheme: const ShadGreenColorScheme.light(),
        brightness: Brightness.light,
        tabsTheme: themeForegroundColor == null
            ? null
            : ShadTabsTheme(
                tabSelectedForegroundColor: themeForegroundColor.selected,
                tabForegroundColor: themeForegroundColor.unselected,
              ),
      ),
      home: Scaffold(
        body: ShadTabs<String>(
          value: 'account',
          tabBarConstraints: const BoxConstraints(maxWidth: 400),
          contentConstraints: const BoxConstraints(maxWidth: 400),
          tabs: [
            ShadTab(
              value: 'account',
              foregroundColor: tabForegroundColor?.unselected,
              selectedForegroundColor: tabForegroundColor?.selected,
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
              child: const Text('AccountTab'),
            ),
            ShadTab(
              value: 'password',
              foregroundColor: tabForegroundColor?.unselected,
              selectedForegroundColor: tabForegroundColor?.selected,
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
              child: const Text('PasswordTab'),
            ),
          ],
        ),
      ),
    );
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

    testWidgets(
        'ShadTab applies the correct color to the button when provided from ShadTab',
        (tester) async {
      const redColor = Color(0xFFFF0000);
      const blueColor = Color(0xFF0000FF);
      await tester.pumpAsyncWidget(
        createColorTestWidget(
          tabForegroundColor: (selected: blueColor, unselected: redColor),
        ),
      );

      // Test the color of the tab buttons
      final accountTextStyle = tester.widget<DefaultTextStyle>(
        find.widgetWithText(DefaultTextStyle, 'AccountTab').first,
      );
      final passwordTextStyle = tester.widget<DefaultTextStyle>(
        find.widgetWithText(DefaultTextStyle, 'PasswordTab').first,
      );
      expect(accountTextStyle.style.color, blueColor);
      expect(passwordTextStyle.style.color, redColor);

      await tester.pumpAndSettle();
    });

    testWidgets(
        'ShadTab applies the correct color to the button when provided from ShadTheme',
        (tester) async {
      const redColor = Color(0xFFFF0000);
      const blueColor = Color(0xFF0000FF);
      await tester.pumpAsyncWidget(
        createColorTestWidget(
          themeForegroundColor: (selected: blueColor, unselected: redColor),
        ),
      );

      // Test the color of the tab buttons
      final accountTextStyle = tester.widget<DefaultTextStyle>(
        find.widgetWithText(DefaultTextStyle, 'AccountTab').first,
      );
      final passwordTextStyle = tester.widget<DefaultTextStyle>(
        find.widgetWithText(DefaultTextStyle, 'PasswordTab').first,
      );
      expect(accountTextStyle.style.color, blueColor);
      expect(passwordTextStyle.style.color, redColor);

      await tester.pumpAndSettle();
    });

    testWidgets('ShadTab provided color overrides ShadTheme color',
        (tester) async {
      const redColor = Color(0xFFFF0000);
      const blueColor = Color(0xFF0000FF);
      const greenColor = Color(0xFF00FF00);
      await tester.pumpAsyncWidget(
        createColorTestWidget(
          themeForegroundColor: (selected: redColor, unselected: redColor),
          tabForegroundColor: (selected: blueColor, unselected: greenColor),
        ),
      );

      // Test the color of the tab buttons
      final accountTextStyle = tester.widget<DefaultTextStyle>(
        find.widgetWithText(DefaultTextStyle, 'AccountTab').first,
      );
      final passwordTextStyle = tester.widget<DefaultTextStyle>(
        find.widgetWithText(DefaultTextStyle, 'PasswordTab').first,
      );
      expect(accountTextStyle.style.color, blueColor);
      expect(passwordTextStyle.style.color, greenColor);

      await tester.pumpAndSettle();
    });
  });
}
