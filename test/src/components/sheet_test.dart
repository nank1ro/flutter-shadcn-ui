import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

// Returns the Positioned widget that directly anchors the sheet's close
// ShadIconButton. find.ancestor yields ancestors nearest-first, so .first
// is the immediate Positioned parent — the one set by ShadDialog's
// `closeIcon.positionedWith(...)`, not an outer layout Positioned.
Positioned findClosePositioned(WidgetTester tester) {
  final iconButton = find.descendant(
    of: find.byType(ShadSheet),
    matching: find.byType(ShadIconButton),
  );
  final positioned = find.ancestor(
    of: iconButton,
    matching: find.byType(Positioned),
  );
  return tester.widget<Positioned>(positioned.first);
}

void main() {
  // Helper method to create a test widget wrapped in ShadApp and Scaffold
  Widget createTestWidget(Widget child) {
    return ShadApp(home: Scaffold(body: child));
  }

  // Fixes the test view to a known size so the ratio-based expandable
  // assertions resolve to stable pixel values. Pass [viewPadding] to
  // simulate safe-area insets (notch / home indicator).
  void setUpView(
    WidgetTester tester, {
    Size size = const Size(800, 1200),
    FakeViewPadding? viewPadding,
  }) {
    tester.view.physicalSize = size;
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    if (viewPadding != null) {
      tester.view.viewPadding = viewPadding;
      addTearDown(tester.view.resetViewPadding);
    }
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
    ShadSheetDragHandleBuilder? dragHandleBuilder,
    double? dragHandleExtent,
    bool? showDragHandle,
    double? snapFlingVelocity,
    ValueChanged<double>? onSizeChanged,
    ShadSheetController? controller,
    bool? draggable,
    bool isScrollControlled = false,
    double? disabledScrollControlMaxRatio,
    bool? useSafeArea,
    VoidCallback? onClosing,
    Widget? title,
    Widget? description,
    List<Widget> actions = const [],
    Widget? child,
    EdgeInsetsGeometry? padding,
    Widget? closeIcon,
    IconData? closeIconData,
    ShadPosition? closeIconPosition,
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
            snapFlingVelocity: snapFlingVelocity,
            dragHandle: dragHandle,
            dragHandleBuilder: dragHandleBuilder,
            dragHandleExtent: dragHandleExtent,
            showDragHandle: showDragHandle,
            onSizeChanged: onSizeChanged,
            controller: controller,
            draggable: draggable,
            isScrollControlled: isScrollControlled,
            disabledScrollControlMaxRatio: disabledScrollControlMaxRatio,
            useSafeArea: useSafeArea,
            onClosing: onClosing,
            title: title,
            description: description,
            actions: actions,
            padding: padding,
            closeIcon: closeIcon,
            closeIconData: closeIconData,
            closeIconPosition: closeIconPosition,
            child: child ?? const Text('Sheet Content'),
          ),
        ),
      ),
    );
  }

  // Rich visual content for golden tests so the captured images show
  // the handle, title, description, body, and actions — not just an
  // empty sheet.
  Widget goldenSheetBody() => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 40,
          decoration: BoxDecoration(
            color: const Color(0xFFE5E7EB),
            borderRadius: BorderRadius.circular(6),
          ),
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: const Text('Alexandru'),
        ),
        const SizedBox(height: 12),
        Container(
          height: 40,
          decoration: BoxDecoration(
            color: const Color(0xFFE5E7EB),
            borderRadius: BorderRadius.circular(6),
          ),
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: const Text('nank1ro'),
        ),
      ],
    ),
  );

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
    // No resize handle unless expandable is explicitly true (false and the
    // null default both omit it).
    for (final expandable in [false, null]) {
      testWidgets('no resize handle when expandable is $expandable', (
        tester,
      ) async {
        await tester.pumpWidget(sheetWidget(expandable: expandable));
        await tester.pump();
        expect(find.byType(ShadSheetResizeHandle), findsNothing);
      });
    }

    testWidgets('expandable=true renders at initialSize fraction of screen', (
      tester,
    ) async {
      setUpView(tester);

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
          .getSize(find.byType(ShadSheetResizeHandle))
          .height;
      expect(dialogHeight + handleHeight, closeTo(600, 2.0));
    });

    testWidgets('drag up on bottom sheet increases size, clamped at maxSize', (
      tester,
    ) async {
      setUpView(tester);

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
      final handleFinder = find.byType(ShadSheetResizeHandle);
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

    testWidgets(
      'drag down past minSize clamps at minSize, sheet stays visible',
      (tester) async {
        setUpView(tester);

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

        final handleFinder = find.byType(ShadSheetResizeHandle);

        // Drag way down (shrink direction for bottom sheet)
        await tester.drag(handleFinder, const Offset(0, 1200));
        await tester.pump();

        // Should clamp at minSize, not dismiss
        expect(controller.size, closeTo(0.25, 0.01));
        // Sheet should still be visible
        expect(find.byType(ShadSheet), findsOneWidget);
      },
    );

    for (final side in ShadSheetSide.values) {
      testWidgets('drag grow direction increases size for side=$side', (
        tester,
      ) async {
        setUpView(tester);

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

        final handleFinder = find.byType(ShadSheetResizeHandle);
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

    testWidgets('snap=true snaps to nearest stop on release', (tester) async {
      setUpView(tester);

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

      final handleFinder = find.byType(ShadSheetResizeHandle);

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

    testWidgets(
      'snap=true with null snapSizes defaults to [min, initial, max]',
      (tester) async {
        setUpView(tester);

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

        final handleFinder = find.byType(ShadSheetResizeHandle);

        // Drag to ≈ 0.6, nearest to 0.5 (initialSize) or 1.0 (maxSize)?
        // 0.6 - 0.5 = 0.1 vs 1.0 - 0.6 = 0.4 → snap to 0.5
        // 0.6 * 1200 = 720; drag from 0.5 (600px) up by 120px
        await tester.drag(handleFinder, const Offset(0, -120));
        await tester.pump();
        await tester.pumpAndSettle();

        // 0.6 is closest to 0.5 (diff 0.1) vs 0.25 (0.35) vs 1.0 (0.4);
        // snap must land on the initialSize stop.
        expect(controller.size, closeTo(0.5, 0.05));
      },
    );

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

    testWidgets('onSizeChanged fires on size change', (tester) async {
      setUpView(tester);

      final sizeChanges = <double>[];

      await tester.pumpWidget(
        sheetWidget(
          expandable: true,
          initialSize: 0.5,
          onSizeChanged: sizeChanges.add,
        ),
      );
      await tester.pump();

      final handleFinder = find.byType(ShadSheetResizeHandle);
      await tester.drag(handleFinder, const Offset(0, -100));
      await tester.pump();

      expect(sizeChanges, isNotEmpty);
      expect(sizeChanges.last, greaterThan(0.5));
    });

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

    testWidgets(
      'draggable and expandable can coexist: handle resizes, body can dismiss',
      (tester) async {
        setUpView(tester);

        final controller = ShadSheetController();
        addTearDown(controller.dispose);
        var closingCalls = 0;

        await tester.pumpWidget(
          sheetWidget(
            expandable: true,
            draggable: true,
            initialSize: 0.5,
            minSize: 0.25,
            maxSize: 0.9,
            controller: controller,
            onClosing: () => closingCalls++,
          ),
        );
        await tester.pump();

        // Handle drag should resize (increase size).
        final handleFinder = find.byType(ShadSheetResizeHandle);
        expect(handleFinder, findsOneWidget);

        await tester.drag(handleFinder, const Offset(0, -200));
        await tester.pump();
        expect(controller.size, greaterThan(0.5));
        expect(closingCalls, 0);

        // Body drag with sufficient fling velocity must dismiss the sheet
        // (triggers onClosing). Fling from the lower half of the fill area so
        // the drag origin is clear of the resize handle and bodyDragStrip
        // at the top edge (which would route to resize, not dismiss).
        final fillRect = tester.getRect(
          find.byKey(const ValueKey('shad_sheet_expandable_fill')),
        );
        final flingOrigin = fillRect.center + const Offset(0, 100);
        await tester.flingFrom(flingOrigin, const Offset(0, 600), 2000);
        await tester.pumpAndSettle();
        expect(closingCalls, greaterThanOrEqualTo(1));
      },
    );

    testWidgets(
      'expandable=true bypasses 9/16 cap even when isScrollControlled=false',
      (tester) async {
        setUpView(tester);

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
          setUpView(tester);

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
        setUpView(tester);

        await tester.pumpWidget(sheetWidget(expandable: true));
        await tester.pump();

        final handleSize = tester.getSize(
          find.byType(ShadSheetResizeHandle),
        );
        expect(handleSize.height, greaterThanOrEqualTo(44));
      },
    );

    testWidgets(
      'default drag handle meets 44px minimum touch target on left sheet',
      (tester) async {
        setUpView(tester, size: const Size(1200, 800));

        await tester.pumpWidget(
          sheetWidget(side: ShadSheetSide.left, expandable: true),
        );
        await tester.pump();

        final handleSize = tester.getSize(
          find.byType(ShadSheetResizeHandle),
        );
        expect(handleSize.width, greaterThanOrEqualTo(44));
      },
    );

    // Dragging from the padded edge of the handle (well away from
    // the 4px pill) must register — proves HitTestBehavior.opaque is set on
    // the GestureDetector.
    testWidgets('drag from handle padding edge registers (opaque hit test)', (
      tester,
    ) async {
      setUpView(tester);

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

      final handleFinder = find.byType(ShadSheetResizeHandle);
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
            find.byType(ShadSheetResizeHandle),
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

    // ShadSheetController.animateTo clamps to [0, 1] and
    // actually animates (not jumpTo fallback). We trigger a snap drag
    // first so the sheet wires up an AnimationController on the
    // controller, then animateTo exercises the animated-clamp path.
    testWidgets(
      'ShadSheetController.animateTo clamps out-of-range target',
      (tester) async {
        setUpView(tester);

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
          find.byType(ShadSheetResizeHandle),
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

    // DidUpdateWidget must NOT mutate a caller-owned controller
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

    // Composite (resize handle + sheet body) must fit within
    // the size ratio; the handle footprint should not cause overflow.
    testWidgets(
      'composite height equals size * screenDim (handle fits inside)',
      (tester) async {
        setUpView(tester);

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
            .getSize(find.byType(ShadSheetResizeHandle))
            .height;
        final dialogHeight = tester.getSize(find.byType(ShadDialog)).height;
        // Screen = 1200; initialSize 0.5 → expected composite 600.
        expect(
          handleHeight + dialogHeight,
          closeTo(600, 1.0),
        );
      },
    );

    // Themed initialSize is honoured when the widget does not
    // override it and no external controller is supplied.
    testWidgets(
      'themed initialSize seeds the owned controller',
      (tester) async {
        setUpView(tester);

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
            .getSize(find.byType(ShadSheetResizeHandle))
            .height;
        final dialogHeight = tester.getSize(find.byType(ShadDialog)).height;
        // 0.8 * 1200 = 960.
        expect(handleHeight + dialogHeight, closeTo(960, 1.0));
      },
    );

    // A caller-supplied controller is the single source of
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

    // Dragging the sheet's body-edge (not the pill) resizes the
    // sheet. Addresses the UX feedback that users naturally grab the top
    // of the sheet, not the small pill.
    testWidgets(
      'drag on sheet body-edge strip resizes (dragHandleExtent > 0)',
      (tester) async {
        setUpView(tester);

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

        // Drag deep INSIDE the dialog (well below the pill handle) —
        // the body-edge overlay strip should still grab the drag.
        final dialogCenterTop =
            tester.getTopLeft(find.byType(ShadDialog)) + const Offset(400, 20);
        await tester.dragFrom(dialogCenterTop, const Offset(0, -200));
        await tester.pump();

        expect(controller.size, greaterThan(0.5));
      },
    );

    // DragHandleBuilder wins over dragHandle and the default
    // pill; it also receives the current sheet side.
    testWidgets(
      'dragHandleBuilder is invoked with the current side and its '
      'widget is used',
      (tester) async {
        ShadSheetSide? capturedSide;
        await tester.pumpWidget(
          sheetWidget(
            side: ShadSheetSide.left,
            expandable: true,
            // Non-null `dragHandle` to prove the builder takes precedence.
            dragHandle: const SizedBox(
              key: ValueKey('unused_static_handle'),
            ),
            dragHandleBuilder: (context, side) {
              capturedSide = side;
              return const SizedBox(key: ValueKey('built_handle'));
            },
          ),
        );
        await tester.pump();

        expect(capturedSide, ShadSheetSide.left);
        expect(find.byKey(const ValueKey('built_handle')), findsOneWidget);
        expect(
          find.byKey(const ValueKey('unused_static_handle')),
          findsNothing,
        );
      },
    );

    // `dragHandleExtent: 0` disables the body-edge strip so only
    // the pill drags. Protects the opt-out path.
    testWidgets(
      'dragHandleExtent:0 leaves body drag to dismiss/scroll',
      (tester) async {
        setUpView(tester);

        final controller = ShadSheetController();
        addTearDown(controller.dispose);

        await tester.pumpWidget(
          sheetWidget(
            expandable: true,
            initialSize: 0.5,
            minSize: 0.25,
            maxSize: 0.9,
            dragHandleExtent: 0,
            controller: controller,
          ),
        );
        await tester.pump();

        final dialogCenterTop =
            tester.getTopLeft(find.byType(ShadDialog)) + const Offset(400, 20);
        await tester.dragFrom(dialogCenterTop, const Offset(0, -200));
        await tester.pump();

        // No resize: body drag without the strip does not move the
        // controller.
        expect(controller.size, closeTo(0.5, 0.01));
      },
    );

    // Expandable sheets split safe-area handling across two layers:
    // anchor-and-side insets are merged into the dialog's content
    // padding (so content doesn't sit under the home indicator / side
    // notches), and the free-edge inset is applied as outer padding
    // around the whole composite at full size — so the resize handle
    // stays reachable below the notch / Dynamic Island. The DecoratedBox
    // wraps both layers so the sheet still paints behind the notch.
    // Originally fix for issue #655 comment 4296947019; revisited for
    // comment 4366282508 where users couldn't grab the handle at full.
    testWidgets(
      'expandable sheet keeps dialog padding stable across sizes',
      (tester) async {
        setUpView(tester, viewPadding: const FakeViewPadding(top: 40));

        final controller = ShadSheetController();
        addTearDown(controller.dispose);

        await tester.pumpWidget(
          sheetWidget(
            expandable: true,
            initialSize: 0.5,
            maxSize: 1,
            controller: controller,
            useSafeArea: true,
          ),
        );
        await tester.pump();

        EdgeInsets dialogPadding() {
          final p = tester.widget<ShadDialog>(find.byType(ShadDialog)).padding;
          return p?.resolve(TextDirection.ltr) ?? EdgeInsets.zero;
        }

        final halfPad = dialogPadding();
        controller.jumpTo(1);
        await tester.pump();
        final fullPad = dialogPadding();

        // Free-edge top inset is now applied at the composite outer
        // (not merged into dialog padding), so the dialog padding does
        // not change between sizes for a bottom sheet.
        expect(fullPad, equals(halfPad));
      },
    );

    testWidgets(
      'expandable bottom sheet pushes resize handle below safe-area at full',
      (tester) async {
        setUpView(tester, viewPadding: const FakeViewPadding(top: 40));

        final controller = ShadSheetController();
        addTearDown(controller.dispose);

        await tester.pumpWidget(
          sheetWidget(
            expandable: true,
            initialSize: 0.5,
            maxSize: 1,
            controller: controller,
            useSafeArea: true,
          ),
        );
        await tester.pump();
        controller.jumpTo(1);
        await tester.pump();

        // Composite spans the whole screen at full size; the resize
        // handle must sit at y == viewPadding.top so the user can reach
        // it past the notch / Dynamic Island.
        final handleTop = tester
            .getTopLeft(find.byType(ShadSheetResizeHandle))
            .dy;
        expect(handleTop, closeTo(40, 0.01));
      },
    );

    testWidgets(
      'expandable sheet does not touch composite outer size with SafeArea',
      (tester) async {
        setUpView(tester, viewPadding: const FakeViewPadding(top: 40));

        await tester.pumpWidget(
          sheetWidget(
            expandable: true,
            initialSize: 0.5,
            useSafeArea: true,
          ),
        );
        await tester.pump();

        // No SafeArea widgets INSIDE the sheet (safe-area merged into
        // dialog padding instead).
        expect(
          find.descendant(
            of: find.byType(ShadSheet),
            matching: find.byType(SafeArea),
          ),
          findsNothing,
        );
      },
    );

    testWidgets(
      'expandable useSafeArea:false does not merge safe-area padding',
      (tester) async {
        setUpView(tester, viewPadding: const FakeViewPadding(top: 40));

        final controller = ShadSheetController();
        addTearDown(controller.dispose);

        await tester.pumpWidget(
          sheetWidget(
            expandable: true,
            initialSize: 0.5,
            maxSize: 1,
            controller: controller,
            useSafeArea: false,
          ),
        );
        await tester.pump();

        EdgeInsets dialogPadding() {
          final p = tester.widget<ShadDialog>(find.byType(ShadDialog)).padding;
          return p?.resolve(TextDirection.ltr) ?? EdgeInsets.zero;
        }

        final halfPad = dialogPadding();
        controller.jumpTo(1);
        await tester.pump();
        final fullPad = dialogPadding();

        // Padding never gets the safe-area bump when useSafeArea is false.
        expect(fullPad, equals(halfPad));
      },
    );

    // The expandable path inserts a `PrimaryScrollController
    // .none` directly above its ShadDialog so the dialog's internal
    // SingleChildScrollView cannot share a controller with a caller-
    // provided Scrollable. Sharing triggered the "ScrollController
    // attached to more than one ScrollPosition" assertion during snap
    // animations (issue #655 comment 4296947019).
    testWidgets(
      'expandable wraps ShadDialog in PrimaryScrollController.none',
      (tester) async {
        await tester.pumpWidget(
          sheetWidget(expandable: true, initialSize: 0.5),
        );
        await tester.pump();

        final ancestors = find.ancestor(
          of: find.byType(ShadDialog),
          matching: find.byWidgetPredicate(
            (w) => w is PrimaryScrollController && w.controller == null,
          ),
        );
        expect(
          ancestors,
          findsWidgets,
          reason:
              'expected at least one PrimaryScrollController(null) '
              'ancestor of ShadDialog',
        );

        // Verify the wrapper is inside the sheet (i.e. our isolation
        // was added by ShadSheet, not just ambient framework plumbing).
        final sheetScoped = find.descendant(
          of: find.byType(ShadSheet),
          matching: find.byWidgetPredicate(
            (w) => w is PrimaryScrollController && w.controller == null,
          ),
        );
        expect(sheetScoped, findsWidgets);
      },
    );

    // Golden: bottom sheet at initialSize=0.5
    testWidgets('golden: expandable bottom sheet at initial size', (
      tester,
    ) async {
      setUpView(tester);

      await tester.pumpWidget(
        sheetWidget(
          expandable: true,
          initialSize: 0.5,
          title: const Text('Edit profile'),
          description: const Text('Make changes to your profile here.'),
          actions: const [ShadButton(child: Text('Save'))],
          child: goldenSheetBody(),
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
      setUpView(tester);

      final controller = ShadSheetController();
      addTearDown(controller.dispose);

      await tester.pumpWidget(
        sheetWidget(
          expandable: true,
          initialSize: 0.5,
          maxSize: 0.9,
          controller: controller,
          title: const Text('Edit profile'),
          description: const Text('Make changes to your profile here.'),
          actions: const [ShadButton(child: Text('Save'))],
          child: goldenSheetBody(),
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
      setUpView(tester);

      await tester.pumpWidget(
        sheetWidget(
          side: ShadSheetSide.top,
          expandable: true,
          initialSize: 0.5,
          title: const Text('Notifications'),
          description: const Text('Manage your alerts.'),
          actions: const [ShadButton(child: Text('Done'))],
          child: goldenSheetBody(),
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
      setUpView(tester);

      await tester.pumpWidget(
        sheetWidget(
          side: ShadSheetSide.left,
          expandable: true,
          initialSize: 0.5,
          title: const Text('Navigation'),
          description: const Text('Jump anywhere.'),
          actions: const [ShadButton(child: Text('Close'))],
          child: goldenSheetBody(),
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
      setUpView(tester);

      await tester.pumpWidget(
        sheetWidget(
          side: ShadSheetSide.right,
          expandable: true,
          initialSize: 0.5,
          title: const Text('Filters'),
          description: const Text('Refine the list.'),
          actions: const [ShadButton(child: Text('Apply'))],
          child: goldenSheetBody(),
        ),
      );
      await tester.pump();

      await expectLater(
        find.byType(ShadSheet),
        matchesGoldenFile('goldens/sheet_expandable_right.png'),
      );
    });

    // Expandable decoration fills the entire composite (pill +
    // dialog) so the sheet background paints behind the resize handle
    // too — matching iOS/Material bottom-sheet visuals where the pill
    // sits on the sheet's surface, not floating against the modal
    // barrier.
    testWidgets('expandable decoration fills composite on bottom', (
      tester,
    ) async {
      setUpView(tester);

      await tester.pumpWidget(
        sheetWidget(expandable: true, initialSize: 0.5),
      );
      await tester.pump();

      final fillFinder = find.byKey(
        const ValueKey('shad_sheet_expandable_fill'),
      );
      expect(fillFinder, findsOneWidget);

      final handleRect = tester.getRect(find.byType(ShadSheetResizeHandle));
      final fillRect = tester.getRect(fillFinder);

      // Fill must contain the pill: pill is now inside the decoration.
      expect(fillRect.top, lessThanOrEqualTo(handleRect.top + 0.01));
      expect(fillRect.bottom, greaterThanOrEqualTo(handleRect.bottom - 0.01));
      // Fill bottom must reach the viewport bottom.
      expect(fillRect.bottom, closeTo(1200, 1.0));
      // Fill width must span the full viewport.
      expect(fillRect.width, closeTo(800, 1.0));
      // Fill height equals size * screenDim at half size.
      expect(fillRect.height, closeTo(600, 1.0));
    });

    for (final side in ShadSheetSide.values) {
      testWidgets(
        'expandable decoration fills composite for side=$side',
        (tester) async {
          final isVertical =
              side == ShadSheetSide.bottom || side == ShadSheetSide.top;
          final physicalSize = isVertical
              ? const Size(800, 1200)
              : const Size(1200, 800);
          tester.view.physicalSize = physicalSize;
          tester.view.devicePixelRatio = 1.0;
          addTearDown(tester.view.resetPhysicalSize);
          addTearDown(tester.view.resetDevicePixelRatio);

          await tester.pumpWidget(
            sheetWidget(side: side, expandable: true, initialSize: 0.5),
          );
          await tester.pump();

          final fillFinder = find.byKey(
            const ValueKey('shad_sheet_expandable_fill'),
          );
          expect(fillFinder, findsOneWidget);

          final handleRect = tester.getRect(find.byType(ShadSheetResizeHandle));
          final fillRect = tester.getRect(fillFinder);
          final vw = physicalSize.width;
          final vh = physicalSize.height;

          // Fill always contains the pill — the decoration wraps the whole
          // composite (pill + dialog).
          expect(fillRect.top, lessThanOrEqualTo(handleRect.top + 0.01));
          expect(
            fillRect.bottom,
            greaterThanOrEqualTo(handleRect.bottom - 0.01),
          );
          expect(fillRect.left, lessThanOrEqualTo(handleRect.left + 0.01));
          expect(
            fillRect.right,
            greaterThanOrEqualTo(handleRect.right - 0.01),
          );

          // At the anchor edge the fill must reach the viewport edge.
          switch (side) {
            case ShadSheetSide.bottom:
              expect(fillRect.bottom, closeTo(vh, 1.0));
            case ShadSheetSide.top:
              expect(fillRect.top, closeTo(0, 1.0));
            case ShadSheetSide.left:
              expect(fillRect.left, closeTo(0, 1.0));
            case ShadSheetSide.right:
              expect(fillRect.right, closeTo(vw, 1.0));
          }
        },
      );
    }

    testWidgets('expandable pill stays adjacent to sheet after drag', (
      tester,
    ) async {
      setUpView(tester);

      await tester.pumpWidget(
        sheetWidget(expandable: true, initialSize: 0.5, minSize: 0.25),
      );
      await tester.pump();

      // Drag the pill up by 200px.
      await tester.drag(
        find.byType(ShadSheetResizeHandle),
        const Offset(0, -200),
      );
      await tester.pump();

      final fillFinder = find.byKey(
        const ValueKey('shad_sheet_expandable_fill'),
      );
      expect(fillFinder, findsOneWidget);

      final handleRect = tester.getRect(find.byType(ShadSheetResizeHandle));
      final fillRect = tester.getRect(fillFinder);

      // After drag, the pill must still be inside the fill area.
      expect(fillRect.top, closeTo(handleRect.top, 1.0));
    });

    testWidgets('non-expandable path has no fill key', (tester) async {
      await tester.pumpWidget(sheetWidget(expandable: false));
      await tester.pump();

      expect(
        find.byKey(const ValueKey('shad_sheet_expandable_fill')),
        findsNothing,
      );
    });

    testWidgets('expandable + draggable: fill box contains the pill', (
      tester,
    ) async {
      setUpView(tester);

      await tester.pumpWidget(
        sheetWidget(expandable: true, draggable: true, initialSize: 0.5),
      );
      await tester.pump();

      final fillFinder = find.byKey(
        const ValueKey('shad_sheet_expandable_fill'),
      );
      expect(fillFinder, findsOneWidget);

      final handleRect = tester.getRect(find.byType(ShadSheetResizeHandle));
      final fillRect = tester.getRect(fillFinder);

      // Fill must contain the pill — decoration wraps the whole composite.
      expect(fillRect.top, lessThanOrEqualTo(handleRect.top + 0.01));
      expect(fillRect.bottom, greaterThanOrEqualTo(handleRect.bottom - 0.01));
      // Fill bottom must reach the viewport bottom.
      expect(fillRect.bottom, closeTo(1200, 1.0));

      // The sheet content must be anchored near the top of the fill area
      // (topCenter alignment), not drifting to the bottom (bottomCenter).
      // With the wrong alignment the text sits near fillRect.bottom;
      // with the correct alignment it sits near fillRect.top.
      final contentRect = tester.getRect(find.text('Sheet Content'));
      final distanceFromTop = (contentRect.top - fillRect.top).abs();
      final distanceFromBottom = (fillRect.bottom - contentRect.bottom).abs();
      expect(
        distanceFromTop,
        lessThan(distanceFromBottom),
        reason:
            'Sheet content should be anchored near the top of the fill area '
            '(topCenter), not the bottom (bottomCenter).',
      );
    });

    testWidgets(
      'expandable keeps default 24 content padding when widget.padding is null',
      (tester) async {
        setUpView(tester);

        await tester.pumpWidget(
          sheetWidget(
            expandable: true,
            initialSize: 0.5,
          ),
        );
        await tester.pump();

        final dialog = tester.widget<ShadDialog>(find.byType(ShadDialog));
        final padding = dialog.padding! as EdgeInsets;
        // Safe-area is zero in test env, so merged padding == dialog default.
        expect(padding.left, 24.0);
        expect(padding.right, 24.0);
      },
    );

    testWidgets(
      'expandable explicit padding overrides the 24 default',
      (tester) async {
        setUpView(tester);

        await tester.pumpWidget(
          sheetWidget(
            expandable: true,
            initialSize: 0.5,
            padding: const EdgeInsets.symmetric(horizontal: 40),
          ),
        );
        await tester.pump();

        final dialog = tester.widget<ShadDialog>(find.byType(ShadDialog));
        final padding = dialog.padding! as EdgeInsets;
        // Explicit 40px wins; must not be 40+24=64.
        expect(padding.left, 40.0);
        expect(padding.right, 40.0);
      },
    );

    // Tests for close icon safe-area handling (issue #655 comments
    // 4301645380 and 4366282508). With composite-outer safe-area, the
    // dialog already sits below the free-edge notch at full size, so
    // the close icon's `top` Positioned offset stays at its raw value
    // — only side-edge insets (left/right) still bump additively.
    testWidgets(
      'expandable sheet keeps default close icon top at raw value at full',
      (tester) async {
        setUpView(tester, viewPadding: const FakeViewPadding(top: 40));

        final controller = ShadSheetController();
        addTearDown(controller.dispose);

        await tester.pumpWidget(
          sheetWidget(
            expandable: true,
            initialSize: 0.5,
            maxSize: 1,
            controller: controller,
            useSafeArea: true,
            closeIconData: LucideIcons.x,
          ),
        );
        await tester.pump();

        // At partial size: raw 8 (bottom sheet doesn't touch top edge).
        expect(findClosePositioned(tester).top, 8);

        controller.jumpTo(1);
        await tester.pump();

        // At full size: still 8. The composite is pushed down by
        // viewPadding.top, so the icon lands below the notch in screen
        // space without needing a Positioned bump.
        expect(findClosePositioned(tester).top, 8);
        // Verify it's actually rendered below the notch in absolute coords.
        final iconTop = tester.getTopLeft(find.byIcon(LucideIcons.x)).dy;
        expect(iconTop, greaterThanOrEqualTo(40));
      },
    );

    testWidgets(
      'expandable sheet still bumps close icon by side-edge inset at full',
      (tester) async {
        setUpView(
          tester,
          viewPadding: const FakeViewPadding(top: 40, right: 10),
        );

        final controller = ShadSheetController();
        addTearDown(controller.dispose);

        await tester.pumpWidget(
          sheetWidget(
            expandable: true,
            maxSize: 1,
            controller: controller,
            useSafeArea: true,
            closeIconData: LucideIcons.x,
            closeIconPosition: const ShadPosition(top: 16, right: 16),
          ),
        );
        await tester.pump();
        controller.jumpTo(1);
        await tester.pump();

        // top: free edge — no bump (handled by composite outer instead).
        // right: side edge — still bumped additively (16 + 10 = 26).
        final positioned = findClosePositioned(tester);
        expect(positioned.top, 16);
        expect(positioned.right, 26);
      },
    );

    testWidgets(
      'non-expandable sheet does not explicitly bump close icon position',
      (tester) async {
        setUpView(tester, viewPadding: const FakeViewPadding(top: 40));

        await tester.pumpWidget(
          sheetWidget(
            closeIconData: LucideIcons.x,
          ),
        );
        await tester.pump();

        // SafeArea inside ShadDialog shifts the whole stack; Positioned
        // stays at 8.
        expect(findClosePositioned(tester).top, 8);
      },
    );

    testWidgets(
      'expandable with useSafeArea:false does not bump close icon',
      (tester) async {
        setUpView(tester, viewPadding: const FakeViewPadding(top: 40));

        final controller = ShadSheetController();
        addTearDown(controller.dispose);

        await tester.pumpWidget(
          sheetWidget(
            expandable: true,
            useSafeArea: false,
            closeIconData: LucideIcons.x,
            maxSize: 1,
            controller: controller,
          ),
        );
        await tester.pump();
        controller.jumpTo(1);
        await tester.pump();

        // useSafeArea:false — no bump expected.
        expect(findClosePositioned(tester).top, 8);
      },
    );

    // Golden: custom drag handle
    testWidgets('golden: expandable sheet with custom drag handle', (
      tester,
    ) async {
      setUpView(tester);

      await tester.pumpWidget(
        sheetWidget(
          expandable: true,
          initialSize: 0.5,
          dragHandle: Container(
            width: 60,
            height: 12,
            color: const Color(0xFFFF5733),
          ),
          title: const Text('Edit profile'),
          description: const Text('Make changes to your profile here.'),
          actions: const [ShadButton(child: Text('Save'))],
          child: goldenSheetBody(),
        ),
      );
      await tester.pump();

      await expectLater(
        find.byType(ShadSheet),
        matchesGoldenFile('goldens/sheet_expandable_custom_handle.png'),
      );
    });

    // ── Fling-snap tests (issue #655) ──────────────────────────────────────
    //
    // A 150px offset at 1500 px/s gives the velocity tracker ~100ms of samples,
    // which is needed for its least-squares fit. Smaller offsets flake out.

    ShadSheetController setUpFling(
      WidgetTester tester, {
      Size size = const Size(800, 1200),
    }) {
      tester.view.physicalSize = size;
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      final controller = ShadSheetController();
      addTearDown(controller.dispose);
      return controller;
    }

    // Reported bug: snap=false, fast flick → snaps to the bound in the flick
    // direction (up → maxSize, down → minSize).
    for (final c in [
      (
        name: 'up on bottom sheet snaps to maxSize',
        offset: const Offset(0, -150),
        expected: 1.0,
      ),
      (
        name: 'down on bottom sheet snaps to minSize',
        offset: const Offset(0, 150),
        expected: 0.25,
      ),
    ]) {
      testWidgets('fling ${c.name} (snap=false)', (tester) async {
        final controller = setUpFling(tester);
        await tester.pumpWidget(
          sheetWidget(
            expandable: true,
            initialSize: 0.5,
            minSize: 0.25,
            maxSize: 1,
            snap: false,
            snapAnimationDuration: const Duration(milliseconds: 200),
            controller: controller,
          ),
        );
        await tester.pump();

        await tester.fling(
          find.byType(ShadSheetResizeHandle),
          c.offset,
          1500,
        );
        await tester.pumpAndSettle();

        expect(controller.size, closeTo(c.expected, 0.05));
      });
    }

    // Test C (regression guard): snap=false, slow drag up → stays near lift.
    testWidgets(
      'slow drag on bottom sheet stays near lift position (snap=false)',
      (tester) async {
        final controller = setUpFling(tester);
        await tester.pumpWidget(
          sheetWidget(
            expandable: true,
            initialSize: 0.5,
            minSize: 0.25,
            maxSize: 1,
            snap: false,
            controller: controller,
          ),
        );
        await tester.pump();

        // Drag up 120px = +0.1 ratio on a 1200px screen → ~0.6, zero velocity.
        await tester.drag(
          find.byType(ShadSheetResizeHandle),
          const Offset(0, -120),
        );
        await tester.pump();

        expect(controller.size, closeTo(0.6, 0.05));
        expect(controller.size, lessThan(0.95));
      },
    );

    // snap=true at 0.5, fling → the bound in the flick direction.
    for (final c in [
      (
        name: 'up with snap=true snaps to maxSize',
        offset: const Offset(0, -150),
        expected: 0.9,
      ),
      (
        name: 'down with snap=true snaps to minSize',
        offset: const Offset(0, 150),
        expected: 0.25,
      ),
    ]) {
      testWidgets('fling ${c.name}', (tester) async {
        final controller = setUpFling(tester);
        controller.jumpTo(0.5);
        await tester.pumpWidget(
          sheetWidget(
            expandable: true,
            initialSize: 0.5,
            minSize: 0.25,
            maxSize: 0.9,
            snap: true,
            snapSizes: [0.25, 0.5, 0.9],
            snapAnimationDuration: const Duration(milliseconds: 200),
            controller: controller,
          ),
        );
        await tester.pump();

        await tester.fling(
          find.byType(ShadSheetResizeHandle),
          c.offset,
          1500,
        );
        await tester.pumpAndSettle();

        expect(controller.size, closeTo(c.expected, 0.05));
      });
    }

    // Test F (regression): snap=true, slow drag → nearest-snap still works.
    testWidgets(
      'slow drag with snap=true still snaps to nearest stop',
      (tester) async {
        final controller = setUpFling(tester);
        controller.jumpTo(0.5);
        await tester.pumpWidget(
          sheetWidget(
            expandable: true,
            initialSize: 0.5,
            minSize: 0.25,
            maxSize: 0.9,
            snap: true,
            snapSizes: [0.25, 0.5, 0.9],
            snapAnimationDuration: const Duration(milliseconds: 200),
            controller: controller,
          ),
        );
        await tester.pump();

        // drag up 84px = +0.07 ratio → ~0.57, nearest stop is 0.5.
        await tester.drag(
          find.byType(ShadSheetResizeHandle),
          const Offset(0, -84),
        );
        await tester.pumpAndSettle();

        expect(controller.size, closeTo(0.5, 0.05));
      },
    );

    // Test G: fling grow direction on top/left/right sides → snaps to maxSize.
    for (final config in [
      (side: ShadSheetSide.top, growOffset: const Offset(0, 150)),
      (side: ShadSheetSide.left, growOffset: const Offset(150, 0)),
      (side: ShadSheetSide.right, growOffset: const Offset(-150, 0)),
    ]) {
      testWidgets(
        'fling in grow direction on ${config.side.name} sheet snaps to maxSize',
        (tester) async {
          final controller = setUpFling(tester, size: const Size(1200, 800));
          await tester.pumpWidget(
            sheetWidget(
              side: config.side,
              expandable: true,
              initialSize: 0.5,
              minSize: 0.25,
              maxSize: 1,
              snap: false,
              snapAnimationDuration: const Duration(milliseconds: 200),
              controller: controller,
            ),
          );
          await tester.pump();

          await tester.fling(
            find.byType(ShadSheetResizeHandle),
            config.growOffset,
            1500,
          );
          await tester.pumpAndSettle();

          expect(controller.size, closeTo(1.0, 0.05));
        },
      );
    }

    // Custom snapFlingVelocity=2000 gates the fling path: a sub-threshold
    // flick stays near the lift, a super-threshold flick snaps to maxSize.
    for (final c in [
      (
        name: 'sub-threshold fling stays near lift',
        velocity: 1200.0,
        settle: false,
        check: (double size) => expect(size, lessThan(0.95)),
      ),
      (
        name: 'super-threshold fling snaps to max',
        velocity: 2500.0,
        settle: true,
        check: (double size) => expect(size, closeTo(1.0, 0.05)),
      ),
    ]) {
      testWidgets('custom snapFlingVelocity respected: ${c.name}', (
        tester,
      ) async {
        final controller = setUpFling(tester);
        await tester.pumpWidget(
          sheetWidget(
            expandable: true,
            initialSize: 0.5,
            minSize: 0.25,
            maxSize: 1,
            snap: false,
            snapFlingVelocity: 2000,
            snapAnimationDuration: const Duration(milliseconds: 200),
            controller: controller,
          ),
        );
        await tester.pump();

        await tester.fling(
          find.byType(ShadSheetResizeHandle),
          const Offset(0, -150),
          c.velocity,
        );
        if (c.settle) {
          await tester.pumpAndSettle();
        } else {
          await tester.pump();
        }

        c.check(controller.size);
      });
    }

    // Regression for the max-size constraint: snapSizes contains 1.0 but
    // maxSize is 0.9, so the fling must land in (0.8, 0.9] — never above the
    // ceiling.
    testWidgets(
      'fling never lands above maxSize even when snapSizes goes higher',
      (tester) async {
        final controller = setUpFling(tester);
        await tester.pumpWidget(
          sheetWidget(
            expandable: true,
            initialSize: 0.5,
            minSize: 0.25,
            maxSize: 0.9,
            snap: true,
            snapSizes: [0.25, 0.5, 0.9, 1.0],
            snapAnimationDuration: const Duration(milliseconds: 200),
            controller: controller,
          ),
        );
        await tester.pump();

        await tester.fling(
          find.byType(ShadSheetResizeHandle),
          const Offset(0, -150),
          1500,
        );
        await tester.pumpAndSettle();

        // Fling activated (size grew well past the 0.5 lift) but the 0.9
        // ceiling held even though snapSizes offered 1.0.
        expect(controller.size, greaterThan(0.8));
        expect(controller.size, lessThanOrEqualTo(0.9));
      },
    );
  });
}
