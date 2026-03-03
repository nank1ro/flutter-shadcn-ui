import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:shadcn_ui/src/app.dart';
import 'package:shadcn_ui/src/components/context_menu.dart';

void main() {
  // Helper method to create a test widget wrapped in ShadApp and Scaffold
  Widget createTestWidget(Widget child) {
    return ShadApp(home: Scaffold(body: child));
  }

  group('ShadContextMenuRegion tapEnabled', () {
    Widget buildRegion({
      ShadContextMenuController? controller,
      bool? tapEnabled,
    }) {
      return ShadApp(
        home: Scaffold(
          body: ShadContextMenuRegion(
            controller: controller,
            tapEnabled: tapEnabled,
            items: const [ShadContextMenuItem(child: Text('Item'))],
            child: const SizedBox(width: 200, height: 200, key: Key('target')),
          ),
        ),
      );
    }

    testWidgets('tap opens menu on Android by default', (tester) async {
      debugDefaultTargetPlatformOverride = TargetPlatform.android;
      addTearDown(() => debugDefaultTargetPlatformOverride = null);

      final controller = ShadContextMenuController();
      addTearDown(controller.dispose);
      await tester.pumpWidget(buildRegion(controller: controller));

      expect(controller.isOpen, false);
      await tester.tap(find.byKey(const Key('target')));
      await tester.pump();
      expect(controller.isOpen, true);
    });

    testWidgets('tap opens menu on iOS by default', (tester) async {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
      addTearDown(() => debugDefaultTargetPlatformOverride = null);

      final controller = ShadContextMenuController();
      addTearDown(controller.dispose);
      await tester.pumpWidget(buildRegion(controller: controller));

      expect(controller.isOpen, false);
      await tester.tap(find.byKey(const Key('target')));
      await tester.pump();
      expect(controller.isOpen, true);
    });

    testWidgets('tap does not open menu on macOS by default', (tester) async {
      debugDefaultTargetPlatformOverride = TargetPlatform.macOS;
      addTearDown(() => debugDefaultTargetPlatformOverride = null);

      final controller = ShadContextMenuController();
      addTearDown(controller.dispose);
      await tester.pumpWidget(buildRegion(controller: controller));

      expect(controller.isOpen, false);
      await tester.tap(find.byKey(const Key('target')));
      await tester.pump();
      expect(controller.isOpen, false);
    });

    testWidgets('tapEnabled: true opens menu on desktop', (tester) async {
      debugDefaultTargetPlatformOverride = TargetPlatform.macOS;
      addTearDown(() => debugDefaultTargetPlatformOverride = null);

      final controller = ShadContextMenuController();
      addTearDown(controller.dispose);
      await tester.pumpWidget(
        buildRegion(controller: controller, tapEnabled: true),
      );

      expect(controller.isOpen, false);
      await tester.tap(find.byKey(const Key('target')));
      await tester.pump();
      expect(controller.isOpen, true);
    });

    testWidgets('tapEnabled: false prevents tap from opening menu on mobile', (
      tester,
    ) async {
      debugDefaultTargetPlatformOverride = TargetPlatform.android;
      addTearDown(() => debugDefaultTargetPlatformOverride = null);

      final controller = ShadContextMenuController();
      addTearDown(controller.dispose);
      await tester.pumpWidget(
        buildRegion(controller: controller, tapEnabled: false),
      );

      expect(controller.isOpen, false);
      await tester.tap(find.byKey(const Key('target')));
      await tester.pump();
      expect(controller.isOpen, false);
    });

    testWidgets('tap toggles menu closed when already open on mobile', (
      tester,
    ) async {
      debugDefaultTargetPlatformOverride = TargetPlatform.android;
      addTearDown(() => debugDefaultTargetPlatformOverride = null);

      final controller = ShadContextMenuController();
      addTearDown(controller.dispose);
      await tester.pumpWidget(buildRegion(controller: controller));

      // Open via tap
      await tester.tap(find.byKey(const Key('target')));
      await tester.pump();
      expect(controller.isOpen, true);

      // Tap again to close
      await tester.tap(find.byKey(const Key('target')));
      await tester.pump();
      expect(controller.isOpen, false);
    });
  });

  group('ShadContextMenu', () {
    testWidgets('ShadContextMenu matches goldens', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          ShadContextMenuRegion(
            constraints: const BoxConstraints(minWidth: 300),
            items: [
              const ShadContextMenuItem.inset(
                child: Text('Back'),
              ),
              const ShadContextMenuItem.inset(
                enabled: false,
                child: Text('Forward'),
              ),
              const ShadContextMenuItem.inset(
                child: Text('Reload'),
              ),
              const ShadContextMenuItem.inset(
                trailing: Icon(LucideIcons.chevronRight),
                items: [
                  ShadContextMenuItem(
                    child: Text('Save Page As...'),
                  ),
                  ShadContextMenuItem(
                    child: Text('Create Shortcut...'),
                  ),
                  ShadContextMenuItem(
                    child: Text('Name Window...'),
                  ),
                  ShadContextMenuItem(
                    child: Text('Developer Tools'),
                  ),
                ],
                child: Text('More Tools'),
              ),
              const ShadContextMenuItem(
                leading: Icon(LucideIcons.check),
                child: Text('Show Bookmarks Bar'),
              ),
              const ShadContextMenuItem.inset(child: Text('Show Full URLs')),
              const Padding(
                padding: EdgeInsets.fromLTRB(36, 8, 8, 8),
                child: Text('People'),
              ),
              ShadContextMenuItem(
                leading: SizedBox.square(
                  dimension: 16,
                  child: Center(
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
                child: const Text('Pedro Duarte'),
              ),
              const ShadContextMenuItem.inset(child: Text('Colm Tuite')),
            ],
            child: Container(
              width: 300,
              height: 200,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text('Right click here'),
            ),
          ),
        ),
      );

      expect(
        find.byType(ShadContextMenuRegion),
        matchesGoldenFile('goldens/context_menu_region.png'),
      );
    });
  });
}
