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

    testWidgets(
      'tap opens menu by default on mobile platforms',
      (tester) async {
        final controller = ShadContextMenuController();
        addTearDown(controller.dispose);
        await tester.pumpWidget(buildRegion(controller: controller));

        expect(controller.isOpen, false);
        await tester.tap(
          find.byKey(const Key('target')),
          warnIfMissed: false,
        );
        await tester.pump();
        expect(controller.isOpen, true);
      },
      variant: const TargetPlatformVariant({
        TargetPlatform.android,
        TargetPlatform.iOS,
      }),
    );

    testWidgets(
      'tap does not open menu by default on desktop platforms',
      (tester) async {
        final controller = ShadContextMenuController();
        addTearDown(controller.dispose);
        await tester.pumpWidget(buildRegion(controller: controller));

        expect(controller.isOpen, false);
        await tester.tap(
          find.byKey(const Key('target')),
          warnIfMissed: false,
        );
        await tester.pump();
        expect(controller.isOpen, false);
      },
      variant: const TargetPlatformVariant({
        TargetPlatform.macOS,
        TargetPlatform.linux,
        TargetPlatform.windows,
      }),
    );

    testWidgets(
      'tapEnabled: true opens menu on desktop',
      (tester) async {
        final controller = ShadContextMenuController();
        addTearDown(controller.dispose);
        await tester.pumpWidget(
          buildRegion(controller: controller, tapEnabled: true),
        );

        expect(controller.isOpen, false);
        await tester.tap(
          find.byKey(const Key('target')),
          warnIfMissed: false,
        );
        await tester.pump();
        expect(controller.isOpen, true);
      },
      variant: const TargetPlatformVariant({
        TargetPlatform.macOS,
        TargetPlatform.linux,
        TargetPlatform.windows,
      }),
    );

    testWidgets(
      'tapEnabled: false prevents tap from opening menu on mobile',
      (tester) async {
        final controller = ShadContextMenuController();
        addTearDown(controller.dispose);
        await tester.pumpWidget(
          buildRegion(controller: controller, tapEnabled: false),
        );

        expect(controller.isOpen, false);
        await tester.tap(
          find.byKey(const Key('target')),
          warnIfMissed: false,
        );
        await tester.pump();
        expect(controller.isOpen, false);
      },
      variant: const TargetPlatformVariant({
        TargetPlatform.android,
        TargetPlatform.iOS,
      }),
    );

    testWidgets(
      'tap toggles menu closed when already open',
      (tester) async {
        final controller = ShadContextMenuController();
        addTearDown(controller.dispose);
        await tester.pumpWidget(buildRegion(controller: controller));

        // Open via tap
        await tester.tap(
          find.byKey(const Key('target')),
          warnIfMissed: false,
        );
        await tester.pump();
        expect(controller.isOpen, true);

        // Tap again to close
        await tester.tap(
          find.byKey(const Key('target')),
          warnIfMissed: false,
        );
        await tester.pump();
        expect(controller.isOpen, false);
      },
      variant: const TargetPlatformVariant({
        TargetPlatform.android,
        TargetPlatform.iOS,
      }),
    );
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
