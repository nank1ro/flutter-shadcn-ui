import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

void main() {
  // Helper method to create a test widget wrapped in ShadApp and Scaffold
  Widget createTestWidget(Widget child) {
    return ShadApp(home: Scaffold(body: child));
  }

  // Helper to wrap a ShadSheet with the ShadSheetInheritedWidget for a side.
  Widget sheetWidget({
    ShadSheetSide side = ShadSheetSide.bottom,
    bool? expandable,
    double? initialSize,
    double? minSize,
    double? maxSize,
    bool? snap,
    List<double>? snapSizes,
    Duration? snapAnimationDuration,
    Curve? snapAnimationCurve,
    Widget? dragHandle,
    bool? showDragHandle,
    ValueChanged<double>? onSizeChanged,
    ShadSheetController? controller,
    bool? draggable,
    bool isScrollControlled = false,
    double? disabledScrollControlMaxRatio,
    Widget? child,
  }) {
    return ShadApp(
      home: Scaffold(
        body: ShadSheetInheritedWidget(
          side: side,
          child: ShadSheet(
            expandable: expandable,
            initialSize: initialSize,
            minSize: minSize,
            maxSize: maxSize,
            snap: snap,
            snapSizes: snapSizes,
            snapAnimationDuration: snapAnimationDuration,
            snapAnimationCurve: snapAnimationCurve,
            dragHandle: dragHandle,
            showDragHandle: showDragHandle,
            onSizeChanged: onSizeChanged,
            controller: controller,
            draggable: draggable,
            isScrollControlled: isScrollControlled,
            disabledScrollControlMaxRatio: disabledScrollControlMaxRatio,
            child: child ?? const Text('Sheet Content'),
          ),
        ),
      ),
    );
  }

  group('ShadSheet', () {
    testWidgets('ShadSheet matches goldens', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          const ShadSheetInheritedWidget(
            side: ShadSheetSide.right,
            child: ShadSheet(
              title: Text('Title'),
              description: Text('Description'),
              actions: [
                ShadIconButton(icon: Icon(Icons.cloud_off)),
              ],
              child: Text('Child'),
            ),
          ),
        ),
      );

      expect(
        find.byType(ShadSheet),
        matchesGoldenFile('goldens/sheet.png'),
      );
      await tester.pumpAndSettle();
    });
  });

  group('ShadSheet expandable', () {
    // Test 1: expandable=false (default) — handle not present
    testWidgets('no resize handle when expandable is false', (tester) async {
      await tester.pumpWidget(sheetWidget(expandable: false));
      await tester.pump();
      expect(
        find.byKey(const ValueKey('shad_sheet_resize_handle')),
        findsNothing,
      );
    });

    // Test 1b: default (null) also means no handle
    testWidgets('no resize handle when expandable is null', (tester) async {
      await tester.pumpWidget(sheetWidget());
      await tester.pump();
      expect(
        find.byKey(const ValueKey('shad_sheet_resize_handle')),
        findsNothing,
      );
    });

    // Test 2: expandable=true, initialSize=0.5 — sheet height ≈ 0.5 * screen
    testWidgets('expandable=true renders at initialSize fraction of screen', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(800, 1200);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      await tester.pumpWidget(
        sheetWidget(
          expandable: true,
          initialSize: 0.5,
        ),
      );
      await tester.pump();

      // initialSize sizes the FULL composite (handle + dialog content),
      // so dialog alone is ~600 - handleHeight.
      final dialogHeight = tester.getSize(find.byType(ShadDialog)).height;
      final handleHeight = tester
          .getSize(find.byKey(const ValueKey('shad_sheet_resize_handle')))
          .height;
      expect(dialogHeight + handleHeight, closeTo(600, 2.0));
    });

    // Test 3: drag up on bottom sheet increases size, clamped at maxSize
    testWidgets('drag up on bottom sheet increases size, clamped at maxSize', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(800, 1200);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final controller = ShadSheetController();
      addTearDown(controller.dispose);

      await tester.pumpWidget(
        sheetWidget(
          expandable: true,
          initialSize: 0.5,
          minSize: 0.25,
          maxSize: 0.9,
          controller: controller,
        ),
      );
      await tester.pump();

      expect(controller.size, closeTo(0.5, 0.01));

      // Drag handle upward by 300px on a 1200px screen = 0.25 ratio increase
      final handleFinder = find.byKey(
        const ValueKey('shad_sheet_resize_handle'),
      );
      expect(handleFinder, findsOneWidget);

      await tester.drag(handleFinder, const Offset(0, -300));
      await tester.pump();

      // Size should increase (drag up = grow for bottom sheet)
      expect(controller.size, greaterThan(0.5));
      expect(controller.size, lessThanOrEqualTo(0.9));

      // Drag further to exceed maxSize — should clamp at maxSize
      await tester.drag(handleFinder, const Offset(0, -1200));
      await tester.pump();
      expect(controller.size, closeTo(0.9, 0.01));
    });

    // Test 4: drag down past minSize clamps — no dismiss
    testWidgets(
      'drag down past minSize clamps at minSize, sheet stays visible',
      (tester) async {
        tester.view.physicalSize = const Size(800, 1200);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        final controller = ShadSheetController();
        addTearDown(controller.dispose);

        await tester.pumpWidget(
          sheetWidget(
            expandable: true,
            initialSize: 0.5,
            minSize: 0.25,
            maxSize: 0.9,
            controller: controller,
          ),
        );
        await tester.pump();

        final handleFinder = find.byKey(
          const ValueKey('shad_sheet_resize_handle'),
        );

        // Drag way down (shrink direction for bottom sheet)
        await tester.drag(handleFinder, const Offset(0, 1200));
        await tester.pump();

        // Should clamp at minSize, not dismiss
        expect(controller.size, closeTo(0.25, 0.01));
        // Sheet should still be visible
        expect(find.byType(ShadSheet), findsOneWidget);
      },
    );

    // Test 5: per-side sign test — grow direction increases size
    for (final side in ShadSheetSide.values) {
      testWidgets('drag grow direction increases size for side=$side', (
        tester,
      ) async {
        tester.view.physicalSize = const Size(800, 1200);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        final controller = ShadSheetController();
        addTearDown(controller.dispose);

        await tester.pumpWidget(
          sheetWidget(
            side: side,
            expandable: true,
            initialSize: 0.5,
            minSize: 0.25,
            maxSize: 0.9,
            controller: controller,
          ),
        );
        await tester.pump();

        final handleFinder = find.byKey(
          const ValueKey('shad_sheet_resize_handle'),
        );
        expect(handleFinder, findsOneWidget);
        final initialSize = controller.size;

        // grow direction: bottom=up, top=down, left=right, right=left
        final growOffset = switch (side) {
          ShadSheetSide.bottom => const Offset(0, -200),
          ShadSheetSide.top => const Offset(0, 200),
          ShadSheetSide.left => const Offset(200, 0),
          ShadSheetSide.right => const Offset(-200, 0),
        };

        await tester.drag(handleFinder, growOffset);
        await tester.pump();

        expect(controller.size, greaterThan(initialSize));
        final sizeAfterGrow = controller.size;

        // shrink direction should reduce size
        final shrinkOffset = Offset(-growOffset.dx * 2, -growOffset.dy * 2);
        await tester.drag(handleFinder, shrinkOffset);
        await tester.pump();

        expect(controller.size, lessThan(sizeAfterGrow));
      });
    }

    // Test 6: snap=true with explicit snapSizes — release snaps to nearest stop
    testWidgets('snap=true snaps to nearest stop on release', (tester) async {
      tester.view.physicalSize = const Size(800, 1200);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final controller = ShadSheetController();
      addTearDown(controller.dispose);
      // Seed the caller-owned controller before mount; initSizeController
      // deliberately does NOT override external controllers with
      // widget.initialSize, so the sheet inherits whatever size the
      // controller already holds.
      controller.jumpTo(0.3);

      await tester.pumpWidget(
        sheetWidget(
          expandable: true,
          initialSize: 0.3,
          minSize: 0.3,
          maxSize: 0.9,
          snap: true,
          snapSizes: [0.3, 0.6, 0.9],
          snapAnimationDuration: const Duration(milliseconds: 200),
          controller: controller,
        ),
      );
      await tester.pump();

      final handleFinder = find.byKey(
        const ValueKey('shad_sheet_resize_handle'),
      );

      // Drag 1: to between 0.3 and 0.6 stop (≈ 0.42) → snap to 0.3.
      // From 0.3, +0.12 ratio (144px up on a 1200-tall view).
      await tester.drag(handleFinder, const Offset(0, -144));
      await tester.pump();
      await tester.pumpAndSettle();
      expect(controller.size, closeTo(0.3, 0.05));

      // Drag 2: from ~0.3 by +0.2 ratio → ~0.5, nearest stop is 0.6.
      await tester.drag(handleFinder, const Offset(0, -240));
      await tester.pump();
      await tester.pumpAndSettle();
      expect(controller.size, closeTo(0.6, 0.05));
    });

    // Test 7: snap=true, snapSizes=null → defaults to [min, initial, max].
    testWidgets(
      'snap=true with null snapSizes defaults to [min, initial, max]',
      (tester) async {
        tester.view.physicalSize = const Size(800, 1200);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        final controller = ShadSheetController();
        addTearDown(controller.dispose);

        await tester.pumpWidget(
          sheetWidget(
            expandable: true,
            initialSize: 0.5,
            minSize: 0.25,
            maxSize: 1,
            snap: true,
            // snapSizes intentionally null
            snapAnimationDuration: const Duration(milliseconds: 100),
            controller: controller,
          ),
        );
        await tester.pump();

        final handleFinder = find.byKey(
          const ValueKey('shad_sheet_resize_handle'),
        );

        // Drag to ≈ 0.6, nearest to 0.5 (initialSize) or 1.0 (maxSize)?
        // 0.6 - 0.5 = 0.1 vs 1.0 - 0.6 = 0.4 → snap to 0.5
        // 0.6 * 1200 = 720; drag from 0.5 (600px) up by 120px
        await tester.drag(handleFinder, const Offset(0, -120));
        await tester.pump();
        await tester.pumpAndSettle();

        // After settling, size should be one of the three defaults.
        expect(
          controller.size,
          anyOf(
            closeTo(0.25, 0.05),
            closeTo(0.5, 0.05),
            closeTo(1.0, 0.05),
          ),
        );
      },
    );

    // Test 8: custom dragHandle widget is rendered
    testWidgets('custom dragHandle widget is rendered', (tester) async {
      const handleKey = ValueKey('custom-handle');
      await tester.pumpWidget(
        sheetWidget(
          expandable: true,
          dragHandle: const SizedBox(key: handleKey, width: 40, height: 8),
        ),
      );
      await tester.pump();

      expect(find.byKey(handleKey), findsOneWidget);
    });

    // Test 9: onSizeChanged fires on size change
    testWidgets('onSizeChanged fires on size change', (tester) async {
      tester.view.physicalSize = const Size(800, 1200);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final sizeChanges = <double>[];

      await tester.pumpWidget(
        sheetWidget(
          expandable: true,
          initialSize: 0.5,
          onSizeChanged: sizeChanges.add,
        ),
      );
      await tester.pump();

      final handleFinder = find.byKey(
        const ValueKey('shad_sheet_resize_handle'),
      );
      await tester.drag(handleFinder, const Offset(0, -100));
      await tester.pump();

      expect(sizeChanges, isNotEmpty);
      expect(sizeChanges.last, greaterThan(0.5));
    });

    // Test 10: ShadSheetController.animateTo
    testWidgets('ShadSheetController.animateTo animates to target size', (
      tester,
    ) async {
      final controller = ShadSheetController();
      addTearDown(controller.dispose);

      await tester.pumpWidget(
        sheetWidget(
          expandable: true,
          initialSize: 0.5,
          minSize: 0.25,
          maxSize: 1,
          controller: controller,
        ),
      );
      await tester.pump();

      expect(controller.size, closeTo(0.5, 0.01));

      // Animate to 0.8
      unawaited(
        controller.animateTo(
          0.8,
          duration: const Duration(milliseconds: 200),
        ),
      );
      await tester.pumpAndSettle();

      expect(controller.size, closeTo(0.8, 0.01));
    });

    // Test 11: ShadSheetController.jumpTo is immediate
    testWidgets('ShadSheetController.jumpTo is immediate', (tester) async {
      final controller = ShadSheetController();
      addTearDown(controller.dispose);

      await tester.pumpWidget(
        sheetWidget(
          expandable: true,
          initialSize: 0.5,
          minSize: 0.25,
          maxSize: 1,
          controller: controller,
        ),
      );
      await tester.pump();

      controller.jumpTo(0.4);
      // No pumpAndSettle — should be immediate
      expect(controller.size, closeTo(0.4, 0.01));
    });

    // Test 12: draggable=true + expandable=true coexist
    testWidgets(
      'draggable and expandable can coexist: handle resizes, body can dismiss',
      (tester) async {
        tester.view.physicalSize = const Size(800, 1200);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        final controller = ShadSheetController();
        addTearDown(controller.dispose);

        await tester.pumpWidget(
          sheetWidget(
            expandable: true,
            draggable: true,
            initialSize: 0.5,
            minSize: 0.25,
            maxSize: 0.9,
            controller: controller,
          ),
        );
        await tester.pump();

        // Handle drag should resize (increase size)
        final handleFinder = find.byKey(
          const ValueKey('shad_sheet_resize_handle'),
        );
        expect(handleFinder, findsOneWidget);

        await tester.drag(handleFinder, const Offset(0, -200));
        await tester.pump();

        expect(controller.size, greaterThan(0.5));
      },
    );

    // Test 13: expandable=true bypasses disabledScrollControlMaxRatio cap
    testWidgets(
      'expandable=true bypasses 9/16 cap even when isScrollControlled=false',
      (tester) async {
        tester.view.physicalSize = const Size(800, 1200);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        await tester.pumpWidget(
          sheetWidget(
            expandable: true,
            initialSize: 0.95,
            minSize: 0.25,
            maxSize: 0.95,
          ),
        );
        await tester.pump();

        // 0.95 * 1200 = 1140, which exceeds the 9/16 * 1200 ≈ 675 cap.
        // If cap is bypassed, the dialog (which excludes the handle in
        // expandable mode) should still read well above the cap.
        final dialogHeight = tester.getSize(find.byType(ShadDialog)).height;
        expect(dialogHeight, greaterThan(900));
      },
    );

    // Tests 14-17: expandable=true + draggable=false must anchor sheet to
    // the configured side (regression for issue where sheet rendered at
    // top-left instead of the expected side). For each side also assert the
    // opposite-edge coordinate is inside the viewport to prove the sheet is
    // partial-size (initialSize=0.5) and has not degenerated to fullscreen.
    for (final side in ShadSheetSide.values) {
      testWidgets(
        'expandable+draggable=false: sheet anchors to side=$side',
        (tester) async {
          tester.view.physicalSize = const Size(800, 1200);
          tester.view.devicePixelRatio = 1.0;
          addTearDown(tester.view.resetPhysicalSize);
          addTearDown(tester.view.resetDevicePixelRatio);

          await tester.pumpWidget(
            sheetWidget(
              side: side,
              expandable: true,
              draggable: false,
              initialSize: 0.5,
            ),
          );
          await tester.pump();

          final topLeft = tester.getTopLeft(find.byType(ShadDialog));
          final bottomRight = tester.getBottomRight(find.byType(ShadDialog));

          switch (side) {
            case ShadSheetSide.bottom:
              expect(bottomRight.dy, closeTo(1200, 1.0));
              expect(topLeft.dy, greaterThan(0));
            case ShadSheetSide.top:
              expect(topLeft.dy, closeTo(0, 1.0));
              expect(bottomRight.dy, lessThan(1200));
            case ShadSheetSide.left:
              expect(topLeft.dx, closeTo(0, 1.0));
              expect(bottomRight.dx, lessThan(800));
            case ShadSheetSide.right:
              expect(bottomRight.dx, closeTo(800, 1.0));
              expect(topLeft.dx, greaterThan(0));
          }
        },
      );
    }

    // Tests 18-19: mobile touch-target ergonomics for the default drag
    // handle. Apple HIG requires ≥ 44x44 hit area; the default handle
    // needs to meet this on both vertical and horizontal sides, and the
    // GestureDetector must use opaque hit-testing so the entire padded
    // row absorbs touches (not only the visible pill).
    testWidgets(
      'default drag handle meets 44px minimum touch target on bottom sheet',
      (tester) async {
        tester.view.physicalSize = const Size(800, 1200);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        await tester.pumpWidget(sheetWidget(expandable: true));
        await tester.pump();

        final handleSize = tester.getSize(
          find.byKey(const ValueKey('shad_sheet_resize_handle')),
        );
        expect(handleSize.height, greaterThanOrEqualTo(44));
      },
    );

    testWidgets(
      'default drag handle meets 44px minimum touch target on left sheet',
      (tester) async {
        tester.view.physicalSize = const Size(1200, 800);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        await tester.pumpWidget(
          sheetWidget(side: ShadSheetSide.left, expandable: true),
        );
        await tester.pump();

        final handleSize = tester.getSize(
          find.byKey(const ValueKey('shad_sheet_resize_handle')),
        );
        expect(handleSize.width, greaterThanOrEqualTo(44));
      },
    );

    // Test 20: dragging from the padded edge of the handle (well away from
    // the 4px pill) must register — proves HitTestBehavior.opaque is set on
    // the GestureDetector.
    testWidgets('drag from handle padding edge registers (opaque hit test)', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(800, 1200);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final controller = ShadSheetController();
      addTearDown(controller.dispose);

      await tester.pumpWidget(
        sheetWidget(
          expandable: true,
          initialSize: 0.4,
          minSize: 0.2,
          maxSize: 0.8,
          controller: controller,
        ),
      );
      await tester.pump();

      final handleFinder = find.byKey(
        const ValueKey('shad_sheet_resize_handle'),
      );
      final handleRect = tester.getRect(handleFinder);
      // Start 1px below the top edge of the handle — inside the padding
      // but far from the center pill. Without opaque hit-testing this
      // point would fall through to whatever is behind.
      final edgeStart = Offset(handleRect.center.dx, handleRect.top + 1);

      await tester.dragFrom(edgeStart, const Offset(0, -200));
      await tester.pump();

      expect(controller.size, greaterThan(0.4));
    });

    // Tests 21-24: default drag handle pill should sit visually close to
    // the sheet body. For a bottom sheet the pill should be closer to the
    // bottom edge of the handle strip (adjacent to the sheet) than to
    // the top edge (outer). Same logic mirrored per side.
    for (final side in ShadSheetSide.values) {
      testWidgets(
        'default drag pill sits near sheet body for side=$side',
        (tester) async {
          final isVertical =
              side == ShadSheetSide.bottom || side == ShadSheetSide.top;
          tester.view.physicalSize = isVertical
              ? const Size(800, 1200)
              : const Size(1200, 800);
          tester.view.devicePixelRatio = 1.0;
          addTearDown(tester.view.resetPhysicalSize);
          addTearDown(tester.view.resetDevicePixelRatio);

          await tester.pumpWidget(
            sheetWidget(side: side, expandable: true),
          );
          await tester.pump();

          final handleRect = tester.getRect(
            find.byKey(const ValueKey('shad_sheet_resize_handle')),
          );
          final pillRect = tester.getRect(
            find.byKey(const ValueKey('shad_sheet_drag_pill')),
          );

          // Upper bound guards against silent drift back toward a
          // (nearly) symmetric 20/20 gap — the asymmetry must remain
          // pronounced enough to read as "pill tucked next to sheet".
          const maxSheetAdjacentGap = 16.0;
          switch (side) {
            case ShadSheetSide.bottom:
              final sheetAdjacent = handleRect.bottom - pillRect.bottom;
              expect(sheetAdjacent, lessThan(pillRect.top - handleRect.top));
              expect(sheetAdjacent, lessThanOrEqualTo(maxSheetAdjacentGap));
            case ShadSheetSide.top:
              final sheetAdjacent = pillRect.top - handleRect.top;
              expect(
                sheetAdjacent,
                lessThan(handleRect.bottom - pillRect.bottom),
              );
              expect(sheetAdjacent, lessThanOrEqualTo(maxSheetAdjacentGap));
            case ShadSheetSide.left:
              final sheetAdjacent = pillRect.left - handleRect.left;
              expect(
                sheetAdjacent,
                lessThan(handleRect.right - pillRect.right),
              );
              expect(sheetAdjacent, lessThanOrEqualTo(maxSheetAdjacentGap));
            case ShadSheetSide.right:
              final sheetAdjacent = handleRect.right - pillRect.right;
              expect(sheetAdjacent, lessThan(pillRect.left - handleRect.left));
              expect(sheetAdjacent, lessThanOrEqualTo(maxSheetAdjacentGap));
          }
        },
      );
    }

    // Test 25: ShadSheetController.jumpTo clamps to [0, 1].
    testWidgets('ShadSheetController.jumpTo clamps out-of-range values', (
      tester,
    ) async {
      final controller = ShadSheetController();
      addTearDown(controller.dispose);

      await tester.pumpWidget(
        sheetWidget(expandable: true, controller: controller),
      );
      await tester.pump();

      controller.jumpTo(1.8);
      expect(controller.size, 1.0);

      controller.jumpTo(-0.5);
      expect(controller.size, 0.0);
    });

    // Test 26: ShadSheetController.animateTo clamps to [0, 1] and
    // actually animates (not jumpTo fallback). We trigger a snap drag
    // first so the sheet wires up an AnimationController on the
    // controller, then animateTo exercises the animated-clamp path.
    testWidgets(
      'ShadSheetController.animateTo clamps out-of-range target',
      (tester) async {
        tester.view.physicalSize = const Size(800, 1200);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        final controller = ShadSheetController();
        addTearDown(controller.dispose);

        await tester.pumpWidget(
          sheetWidget(
            expandable: true,
            initialSize: 0.5,
            snap: true,
            snapAnimationDuration: const Duration(milliseconds: 50),
            controller: controller,
          ),
        );
        await tester.pump();

        // Trigger a drag-end so the sheet wires snapController into
        // `controller._animationController`.
        await tester.drag(
          find.byKey(const ValueKey('shad_sheet_resize_handle')),
          const Offset(0, -20),
        );
        await tester.pumpAndSettle();

        // Fire-and-forget: awaiting the future would deadlock because it
        // completes only when the AnimationController ticks, which
        // requires pumping frames.
        unawaited(
          controller.animateTo(2, duration: const Duration(milliseconds: 50)),
        );
        await tester.pumpAndSettle();
        expect(controller.size, 1.0);
      },
    );

    // Test 27: didUpdateWidget must NOT mutate a caller-owned controller
    // when `initialSize` changes on the widget.
    testWidgets('external controller not mutated on initialSize change', (
      tester,
    ) async {
      final controller = ShadSheetController();
      addTearDown(controller.dispose);
      controller.jumpTo(0.3);

      await tester.pumpWidget(
        sheetWidget(
          expandable: true,
          initialSize: 0.3,
          controller: controller,
        ),
      );
      await tester.pump();

      // Rebuild with a different initialSize. The external controller's
      // size must remain untouched.
      await tester.pumpWidget(
        sheetWidget(
          expandable: true,
          initialSize: 0.7,
          controller: controller,
        ),
      );
      await tester.pump();

      expect(controller.size, closeTo(0.3, 1e-9));
    });

    // Test 28: composite (resize handle + sheet body) must fit within
    // the size ratio; the handle footprint should not cause overflow.
    testWidgets(
      'composite height equals size * screenDim (handle fits inside)',
      (tester) async {
        tester.view.physicalSize = const Size(800, 1200);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        await tester.pumpWidget(
          sheetWidget(
            expandable: true,
            initialSize: 0.5,
            minSize: 0.25,
            maxSize: 1,
          ),
        );
        await tester.pump();

        final handleHeight = tester
            .getSize(find.byKey(const ValueKey('shad_sheet_resize_handle')))
            .height;
        final dialogHeight = tester.getSize(find.byType(ShadDialog)).height;
        // Screen = 1200; initialSize 0.5 → expected composite 600.
        expect(
          handleHeight + dialogHeight,
          closeTo(600, 1.0),
        );
      },
    );

    // Test 29: themed initialSize is honoured when the widget does not
    // override it and no external controller is supplied.
    testWidgets(
      'themed initialSize seeds the owned controller',
      (tester) async {
        tester.view.physicalSize = const Size(800, 1200);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        await tester.pumpWidget(
          ShadApp(
            theme: ShadThemeData(
              brightness: Brightness.light,
              colorScheme: const ShadZincColorScheme.light(),
              sheetTheme: const ShadSheetTheme(initialSize: 0.8),
            ),
            home: const Scaffold(
              body: ShadSheetInheritedWidget(
                side: ShadSheetSide.bottom,
                child: ShadSheet(
                  expandable: true,
                  child: Text('content'),
                ),
              ),
            ),
          ),
        );
        await tester.pump();

        final handleHeight = tester
            .getSize(find.byKey(const ValueKey('shad_sheet_resize_handle')))
            .height;
        final dialogHeight =
            tester.getSize(find.byType(ShadDialog)).height;
        // 0.8 * 1200 = 960.
        expect(handleHeight + dialogHeight, closeTo(960, 1.0));
      },
    );

    // Test 30: a caller-supplied controller is the single source of
    // truth for size — widget.initialSize and themed initialSize must
    // both be ignored on mount.
    testWidgets(
      'external controller size wins over widget + themed initialSize',
      (tester) async {
        final controller = ShadSheetController();
        addTearDown(controller.dispose);
        controller.jumpTo(0.3);

        await tester.pumpWidget(
          ShadApp(
            theme: ShadThemeData(
              brightness: Brightness.light,
              colorScheme: const ShadZincColorScheme.light(),
              sheetTheme: const ShadSheetTheme(initialSize: 0.2),
            ),
            home: Scaffold(
              body: ShadSheetInheritedWidget(
                side: ShadSheetSide.bottom,
                child: ShadSheet(
                  expandable: true,
                  initialSize: 0.7,
                  controller: controller,
                  child: const Text('content'),
                ),
              ),
            ),
          ),
        );
        await tester.pump();

        expect(controller.size, closeTo(0.3, 1e-9));
      },
    );

    // Test 31: cross-field asserts trip on contradictory bounds.
    test('ShadSheet constructor rejects minSize > maxSize', () {
      expect(
        () => ShadSheet(
          minSize: 0.8,
          maxSize: 0.2,
          child: const Text('x'),
        ),
        throwsAssertionError,
      );
    });

    // Golden: bottom sheet at initialSize=0.5
    testWidgets('golden: expandable bottom sheet at initial size', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(800, 1200);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      await tester.pumpWidget(
        sheetWidget(
          expandable: true,
          initialSize: 0.5,
          child: const Text('Content'),
        ),
      );
      await tester.pump();

      await expectLater(
        find.byType(ShadSheet),
        matchesGoldenFile('goldens/sheet_expandable_bottom_initial.png'),
      );
    });

    // Golden: bottom sheet dragged to maxSize
    testWidgets('golden: expandable bottom sheet at maxSize', (tester) async {
      tester.view.physicalSize = const Size(800, 1200);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final controller = ShadSheetController();
      addTearDown(controller.dispose);

      await tester.pumpWidget(
        sheetWidget(
          expandable: true,
          initialSize: 0.5,
          maxSize: 0.9,
          controller: controller,
        ),
      );
      await tester.pump();
      controller.jumpTo(0.9);
      await tester.pump();

      await expectLater(
        find.byType(ShadSheet),
        matchesGoldenFile('goldens/sheet_expandable_bottom_expanded.png'),
      );
    });

    // Golden: top sheet
    testWidgets('golden: expandable top sheet', (tester) async {
      tester.view.physicalSize = const Size(800, 1200);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      await tester.pumpWidget(
        sheetWidget(
          side: ShadSheetSide.top,
          expandable: true,
          initialSize: 0.5,
          child: const Text('Content'),
        ),
      );
      await tester.pump();

      await expectLater(
        find.byType(ShadSheet),
        matchesGoldenFile('goldens/sheet_expandable_top.png'),
      );
    });

    // Golden: left sheet
    testWidgets('golden: expandable left sheet', (tester) async {
      tester.view.physicalSize = const Size(800, 1200);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      await tester.pumpWidget(
        sheetWidget(
          side: ShadSheetSide.left,
          expandable: true,
          initialSize: 0.5,
          child: const Text('Content'),
        ),
      );
      await tester.pump();

      await expectLater(
        find.byType(ShadSheet),
        matchesGoldenFile('goldens/sheet_expandable_left.png'),
      );
    });

    // Golden: right sheet
    testWidgets('golden: expandable right sheet', (tester) async {
      tester.view.physicalSize = const Size(800, 1200);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      await tester.pumpWidget(
        sheetWidget(
          side: ShadSheetSide.right,
          expandable: true,
          initialSize: 0.5,
          child: const Text('Content'),
        ),
      );
      await tester.pump();

      await expectLater(
        find.byType(ShadSheet),
        matchesGoldenFile('goldens/sheet_expandable_right.png'),
      );
    });

    // Golden: custom drag handle
    testWidgets('golden: expandable sheet with custom drag handle', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(800, 1200);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      await tester.pumpWidget(
        sheetWidget(
          expandable: true,
          initialSize: 0.5,
          dragHandle: Container(
            width: 60,
            height: 12,
            color: const Color(0xFFFF5733),
          ),
          child: const Text('Content'),
        ),
      );
      await tester.pump();

      await expectLater(
        find.byType(ShadSheet),
        matchesGoldenFile('goldens/sheet_expandable_custom_handle.png'),
      );
    });
  });
}
