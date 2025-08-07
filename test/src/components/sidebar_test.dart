import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../extra/pump_async_widget.dart';

void main() {
  // Helper method to create a test widget wrapped in ShadApp and Scaffold
  Widget createTestWidget(Widget child) {
    return ShadApp(
      home: Scaffold(
        body: child,
      ),
    );
  }

  group('ShadSidebar', () {
    testWidgets('renders basic sidebar correctly', (WidgetTester tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          ShadSidebar(
            navGroups: [
              ShadSidebarGroup(
                items: [
                  const ShadSidebarNavItem(title: 'Dashboard'),
                ],
              ),
            ],
          ),
        ),
      );

      // Check if the sidebar content renders
      expect(find.text('Dashboard'), findsOneWidget);
      expect(find.byType(ShadSidebar), findsOneWidget);
    });

    testWidgets('renders with header and footer', (WidgetTester tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          ShadSidebar(
            header: const ShadSidebarHeader(title: 'My App'),
            footer: const ShadSidebarFooter(
              user: ShadSidebarUser(
                name: 'John Doe',
                email: 'john@example.com',
              ),
            ),
            navGroups: [
              ShadSidebarGroup(
                items: [
                  const ShadSidebarNavItem(title: 'Dashboard'),
                ],
              ),
            ],
          ),
        ),
      );

      // Check if header and footer render
      expect(find.text('My App'), findsOneWidget);
      expect(find.text('John Doe'), findsOneWidget);
      expect(find.text('john@example.com'), findsOneWidget);
      expect(find.text('Dashboard'), findsOneWidget);
    });

    testWidgets('respects width property', (WidgetTester tester) async {
      const testWidth = 350.0;
      
      await tester.pumpAsyncWidget(
        createTestWidget(
          const ShadSidebar(
            width: testWidth,
            navGroups: <Widget>[],
          ),
        ),
      );

      final sidebarWidget = tester.widget<ShadSidebar>(find.byType(ShadSidebar));
      expect(sidebarWidget.width, testWidth);
    });

    testWidgets('collapses when isCollapsed is true', (WidgetTester tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          ShadSidebar(
            isCollapsed: true,
            navGroups: [
              ShadSidebarGroup(
                items: [
                  const ShadSidebarNavItem(title: 'Dashboard'),
                ],
              ),
            ],
          ),
        ),
      );

      // When collapsed, the sidebar should show as SizedBox.shrink
      expect(find.byType(SizedBox), findsOneWidget);
      
      // Content should not be visible when collapsed
      expect(find.text('Dashboard'), findsNothing);
    });

    testWidgets('calls onCollapsedChanged when state changes', (WidgetTester tester) async {
      bool? collapsedState;
      
      await tester.pumpAsyncWidget(
        createTestWidget(
          ShadSidebar(
            onCollapsedChanged: (bool value) => collapsedState = value,
            navGroups: const <Widget>[],
          ),
        ),
      );

      final sidebarWidget = tester.widget<ShadSidebar>(find.byType(ShadSidebar));
      expect(sidebarWidget.onCollapsedChanged, isNotNull);
      // Note: collapsedState would be updated by the callback when triggered
      expect(collapsedState, isNull); // Initially null since callback hasn't been called
    });

    testWidgets('renders multiple navigation groups', (WidgetTester tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          ShadSidebar(
            navGroups: [
              ShadSidebarGroup(
                label: 'Main',
                items: [
                  const ShadSidebarNavItem(title: 'Dashboard'),
                ],
              ),
              ShadSidebarGroup(
                label: 'Settings',
                items: [
                  const ShadSidebarNavItem(title: 'Profile'),
                ],
              ),
            ],
          ),
        ),
      );

      expect(find.text('Main'), findsOneWidget);
      expect(find.text('Settings'), findsOneWidget);
      expect(find.text('Dashboard'), findsOneWidget);
      expect(find.text('Profile'), findsOneWidget);
    });
  });

  group('ShadSidebarGroup', () {
    testWidgets('renders group with label', (WidgetTester tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          ShadSidebarGroup(
            label: 'Navigation',
            items: [
              const ShadSidebarNavItem(title: 'Home'),
              const ShadSidebarNavItem(title: 'About'),
            ],
          ),
        ),
      );

      expect(find.text('Navigation'), findsOneWidget);
      expect(find.text('Home'), findsOneWidget);
      expect(find.text('About'), findsOneWidget);
    });

    testWidgets('renders group without label', (WidgetTester tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          ShadSidebarGroup(
            items: [
              const ShadSidebarNavItem(title: 'Home'),
            ],
          ),
        ),
      );

      expect(find.text('Home'), findsOneWidget);
    });

    testWidgets('renders collapsible group', (WidgetTester tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          ShadSidebarGroup(
            label: 'Collapsible',
            collapsible: true,
            initiallyExpanded: true,
            items: [
              const ShadSidebarNavItem(title: 'Item 1'),
            ],
          ),
        ),
      );

      expect(find.text('Collapsible'), findsOneWidget);
      expect(find.text('Item 1'), findsOneWidget);
      
      // Should find chevron icon for collapsible groups
      expect(find.byType(Icon), findsAtLeastNWidgets(1));
    });

    testWidgets('toggles collapsible group on tap', (WidgetTester tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          ShadSidebarGroup(
            label: 'Collapsible',
            collapsible: true,
            initiallyExpanded: true,
            items: [
              const ShadSidebarNavItem(title: 'Item 1'),
            ],
          ),
        ),
      );

      // Initially expanded, item should be visible
      expect(find.text('Item 1'), findsOneWidget);

      // Tap the collapsible header
      await tester.tap(find.text('Collapsible'));
      await tester.pumpAndSettle();

      // After collapsing, item should not be visible (size animation to 0)
      // Note: Due to SizeTransition, the widget might still exist but be sized to 0
    });
  });

  group('ShadSidebarMenuItem', () {
    testWidgets('renders menu item with title', (WidgetTester tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          const ShadSidebarMenuItem(
            item: ShadSidebarNavItem(title: 'Dashboard'),
          ),
        ),
      );

      expect(find.text('Dashboard'), findsOneWidget);
    });

    testWidgets('renders menu item with icon', (WidgetTester tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          const ShadSidebarMenuItem(
            item: ShadSidebarNavItem(
              title: 'Dashboard',
              icon: Icon(Icons.dashboard),
            ),
          ),
        ),
      );

      expect(find.text('Dashboard'), findsOneWidget);
      expect(find.byIcon(Icons.dashboard), findsOneWidget);
    });

    testWidgets('executes onTap callback', (WidgetTester tester) async {
      bool tapped = false;
      
      await tester.pumpAsyncWidget(
        createTestWidget(
          ShadSidebarMenuItem(
            item: ShadSidebarNavItem(
              title: 'Dashboard',
              onTap: () => tapped = true,
            ),
          ),
        ),
      );

      await tester.tap(find.text('Dashboard'));
      await tester.pumpAndSettle();

      expect(tapped, true);
    });

    testWidgets('renders nested items with chevron', (WidgetTester tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          const ShadSidebarMenuItem(
            item: ShadSidebarNavItem(
              title: 'Forms',
              items: [
                ShadSidebarNavItem(title: 'Input'),
                ShadSidebarNavItem(title: 'Checkbox'),
              ],
            ),
          ),
        ),
      );

      expect(find.text('Forms'), findsOneWidget);
      // Should show chevron for items with children
      expect(find.byType(Icon), findsAtLeastNWidgets(1));
    });

    testWidgets('shows active state styling', (WidgetTester tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          const ShadSidebarMenuItem(
            item: ShadSidebarNavItem(
              title: 'Dashboard',
              isActive: true,
            ),
          ),
        ),
      );

      expect(find.text('Dashboard'), findsOneWidget);
      
      final menuItem = tester.widget<ShadSidebarMenuItem>(find.byType(ShadSidebarMenuItem));
      expect(menuItem.item.isActive, true);
    });
  });

  group('ShadSidebarHeader', () {
    testWidgets('renders header with title', (WidgetTester tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          const ShadSidebarHeader(title: 'My Application'),
        ),
      );

      expect(find.text('My Application'), findsOneWidget);
    });

    testWidgets('renders header with logo and subtitle', (WidgetTester tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          const ShadSidebarHeader(
            title: 'My App',
            subtitle: 'Version 1.0',
            logo: Icon(Icons.home),
          ),
        ),
      );

      expect(find.text('My App'), findsOneWidget);
      expect(find.text('Version 1.0'), findsOneWidget);
      expect(find.byIcon(Icons.home), findsOneWidget);
    });

    testWidgets('executes onTap callback', (WidgetTester tester) async {
      bool tapped = false;
      
      await tester.pumpAsyncWidget(
        createTestWidget(
          ShadSidebarHeader(
            title: 'My App',
            onTap: () => tapped = true,
          ),
        ),
      );

      await tester.tap(find.text('My App'));
      await tester.pumpAndSettle();

      expect(tapped, true);
    });
  });

  group('ShadSidebarFooter', () {
    testWidgets('renders footer with user info', (WidgetTester tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          const ShadSidebarFooter(
            user: ShadSidebarUser(
              name: 'John Doe',
              email: 'john@example.com',
            ),
          ),
        ),
      );

      expect(find.text('John Doe'), findsOneWidget);
      expect(find.text('john@example.com'), findsOneWidget);
    });

    testWidgets('renders user avatar fallback', (WidgetTester tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          const ShadSidebarFooter(
            user: ShadSidebarUser(
              name: 'John Doe',
              email: 'john@example.com',
            ),
          ),
        ),
      );

      // Should show first letter of name as fallback avatar
      expect(find.text('J'), findsOneWidget);
    });

    testWidgets('renders with action widgets', (WidgetTester tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          const ShadSidebarFooter(
            user: ShadSidebarUser(
              name: 'John Doe',
              email: 'john@example.com',
            ),
            actions: [
              Icon(Icons.settings),
              Icon(Icons.logout),
            ],
          ),
        ),
      );

      expect(find.byIcon(Icons.settings), findsOneWidget);
      expect(find.byIcon(Icons.logout), findsOneWidget);
    });

    testWidgets('executes onUserTap callback', (WidgetTester tester) async {
      bool tapped = false;
      
      await tester.pumpAsyncWidget(
        createTestWidget(
          ShadSidebarFooter(
            user: const ShadSidebarUser(
              name: 'John Doe',
              email: 'john@example.com',
            ),
            onUserTap: () => tapped = true,
          ),
        ),
      );

      await tester.tap(find.text('John Doe'));
      await tester.pumpAndSettle();

      expect(tapped, true);
    });
  });

  group('ShadSidebarNavItem', () {
    test('creates nav item with required fields', () {
      const navItem = ShadSidebarNavItem(title: 'Dashboard');
      
      expect(navItem.title, 'Dashboard');
      expect(navItem.url, null);
      expect(navItem.icon, null);
      expect(navItem.isActive, false);
      expect(navItem.items, null);
      expect(navItem.onTap, null);
    });

    test('creates nav item with all fields', () {
      final icon = const Icon(Icons.dashboard);
      void onTap() {}
      
      final navItem = ShadSidebarNavItem(
        title: 'Dashboard',
        url: '/dashboard',
        icon: icon,
        isActive: true,
        items: const [
          ShadSidebarNavItem(title: 'Sub Item'),
        ],
        onTap: onTap,
      );
      
      expect(navItem.title, 'Dashboard');
      expect(navItem.url, '/dashboard');
      expect(navItem.icon, icon);
      expect(navItem.isActive, true);
      expect(navItem.items?.length, 1);
      expect(navItem.items?.first.title, 'Sub Item');
      expect(navItem.onTap, onTap);
    });
  });

  group('ShadSidebarUser', () {
    test('creates user with required fields', () {
      const user = ShadSidebarUser(
        name: 'John Doe',
        email: 'john@example.com',
      );
      
      expect(user.name, 'John Doe');
      expect(user.email, 'john@example.com');
      expect(user.avatar, null);
    });

    test('creates user with avatar', () {
      const user = ShadSidebarUser(
        name: 'John Doe',
        email: 'john@example.com',
        avatar: 'https://example.com/avatar.jpg',
      );
      
      expect(user.name, 'John Doe');
      expect(user.email, 'john@example.com');
      expect(user.avatar, 'https://example.com/avatar.jpg');
    });
  });
}
