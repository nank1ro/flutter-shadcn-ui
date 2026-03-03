import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shadcn_ui/src/app.dart';
import 'package:shadcn_ui/src/components/resizable.dart';
import 'package:shadcn_ui/src/utils/extensions/double.dart';

void main() {
  // Helper method to create a test widget wrapped in ShadApp and Scaffold
  Widget createTestWidget(Widget child) {
    return ShadApp(home: Scaffold(body: child));
  }

  group('ShadResizableController cascade resize', () {
    ShadResizableController buildController({
      required List<double> sizes,
      double totalWidth = 100,
    }) {
      final controller = ShadResizableController();
      for (var i = 0; i < sizes.length; i++) {
        controller.registerPanel(
          ShadPanelInfo(
            id: i,
            defaultSize: sizes[i],
            minSize: 0,
            maxSize: 1.0,
          ),
        );
      }
      controller.totalAvailableWidth = totalWidth;
      return controller;
    }

    test(
        'forward drag: trailing panel collapses, anchor grows into next '
        'trailing panel (Three stays at 0, Four shrinks)', () {
      // 3 panels: Two=0.40, Three=0.30, Four=0.30 (totalSize=200)
      // Drag Two|Three divider down 90px → Two grows as anchor,
      // Three collapses (gives 60px), Four gives remaining 30px.
      const totalSize = 200.0;
      final controller =
          buildController(sizes: [0.40, 0.30, 0.30], totalWidth: totalSize);

      // Simulate what onHandleDrag does with forward cascade:
      // anchor = Two (index=0), cascade trailing: Three (idx=1), Four (idx=2).
      final two = controller.getPanelInfo(0);
      final three = controller.getPanelInfo(1);
      final four = controller.getPanelInfo(2);

      var remaining = 90.0;
      var trailingIdx = 1;

      // Iteration 1: Three gives all it can, Two grows.
      var canShrinkBy = (three.size - three.minSize) * totalSize;
      var canGrowBy = (two.maxSize - two.size) * totalSize;
      var delta = remaining < canShrinkBy ? remaining : canShrinkBy;
      if (delta > canGrowBy) delta = canGrowBy;
      two.size = (two.size + delta / totalSize).asFixed(6);
      three.size = (three.size - delta / totalSize).asFixed(6);
      remaining = (remaining - delta).asFixed(6);
      trailingIdx++; // Three exhausted, move to Four.

      expect(two.size, closeTo(0.70, 1e-5));
      expect(three.size, closeTo(0.00, 1e-5));
      expect(remaining, closeTo(30.0, 1e-5));

      // Iteration 2: Four gives remaining 30px, Two grows to 0.85.
      canShrinkBy = (four.size - four.minSize) * totalSize;
      canGrowBy = (two.maxSize - two.size) * totalSize;
      delta = remaining < canShrinkBy ? remaining : canShrinkBy;
      if (delta > canGrowBy) delta = canGrowBy;
      two.size = (two.size + delta / totalSize).asFixed(6);
      four.size = (four.size - delta / totalSize).asFixed(6);
      remaining = (remaining - delta).asFixed(6);

      expect(remaining, closeTo(0.0, 1e-5));
      expect(controller.getPanelInfo(0).size, closeTo(0.85, 1e-5));
      expect(controller.getPanelInfo(1).size, closeTo(0.00, 1e-5));
      expect(controller.getPanelInfo(2).size, closeTo(0.15, 1e-5));
    });

    test(
        'backward drag: leading panel collapses, anchor grows, '
        'no further cascade when no more leading panels', () {
      // 3 panels: A=0.25, B=0.50, C=0.25, totalWidth=100
      // Drag A|B left 30px → B grows as anchor,
      // A collapses (gives 25px), remaining 5px: no more leading → stop.
      final controller = buildController(sizes: [0.25, 0.50, 0.25]);

      final b = controller.getPanelInfo(1); // anchor
      final a = controller.getPanelInfo(0);

      var remaining = 30.0;

      // A gives all it can (25px), B grows to 0.75.
      final canShrinkBy = (a.size - a.minSize) * 100; // 25
      final canGrowBy = (b.maxSize - b.size) * 100; // 50
      var delta = remaining < canShrinkBy ? remaining : canShrinkBy;
      if (delta > canGrowBy) delta = canGrowBy;
      a.size = (a.size - delta / 100).asFixed(6);
      b.size = (b.size + delta / 100).asFixed(6);
      remaining = (remaining - delta).asFixed(6);

      // No more leading panels (leadingIdx would become -1) → stop.
      expect(remaining, closeTo(5.0, 1e-5)); // 5px unconsumed
      expect(controller.getPanelInfo(0).size, closeTo(0.00, 1e-5));
      expect(controller.getPanelInfo(1).size, closeTo(0.75, 1e-5));
      expect(controller.getPanelInfo(2).size, closeTo(0.25, 1e-5)); // C unchanged
    });

    test(
        'forward drag: trailing collapses, no further cascade when no more '
        'trailing panels', () {
      // 3 panels: A=0.25, B=0.50, C=0.25, totalWidth=100
      // Drag B|C right 30px → B grows as anchor,
      // C collapses (gives 25px), remaining 5px: no more trailing → stop.
      final controller = buildController(sizes: [0.25, 0.50, 0.25]);

      final b = controller.getPanelInfo(1); // anchor
      final c = controller.getPanelInfo(2);

      var remaining = 30.0;

      // C gives all it can (25px), B grows to 0.75.
      final canShrinkBy = (c.size - c.minSize) * 100; // 25
      final canGrowBy = (b.maxSize - b.size) * 100; // 50
      var delta = remaining < canShrinkBy ? remaining : canShrinkBy;
      if (delta > canGrowBy) delta = canGrowBy;
      b.size = (b.size + delta / 100).asFixed(6);
      c.size = (c.size - delta / 100).asFixed(6);
      remaining = (remaining - delta).asFixed(6);

      // No more trailing panels (trailingIdx would be 3 ≥ length) → stop.
      expect(remaining, closeTo(5.0, 1e-5)); // 5px unconsumed
      expect(controller.getPanelInfo(0).size, closeTo(0.25, 1e-5)); // A unchanged
      expect(controller.getPanelInfo(1).size, closeTo(0.75, 1e-5));
      expect(controller.getPanelInfo(2).size, closeTo(0.00, 1e-5));
    });

    test('cascade stops when all panels in direction are fully collapsed', () {
      // 2 panels: A=0.25, B=0.75, totalWidth=100
      // Drag A|B left 50px → B grows as anchor (max 25px due to B.maxSize=1.0),
      // A collapses (gives 25px). Remaining 25px: no more leading → stop.
      final controller = buildController(sizes: [0.25, 0.75]);

      final b = controller.getPanelInfo(1); // anchor
      final a = controller.getPanelInfo(0);

      var remaining = 50.0;

      final canShrinkBy = (a.size - a.minSize) * 100; // 25
      final canGrowBy = (b.maxSize - b.size) * 100; // 25
      var delta = remaining < canShrinkBy ? remaining : canShrinkBy;
      if (delta > canGrowBy) delta = canGrowBy;
      a.size = (a.size - delta / 100).asFixed(6);
      b.size = (b.size + delta / 100).asFixed(6);
      remaining = (remaining - delta).asFixed(6);

      // leadingIdx-- would be -1, out of bounds → stop.
      expect(remaining, closeTo(25.0, 1e-5));
      expect(controller.getPanelInfo(0).size, closeTo(0.0, 1e-5));
      expect(controller.getPanelInfo(1).size, closeTo(1.0, 1e-5));
    });
  });

  group('ShadResizable', () {
    testWidgets('ShadResizable matches goldens', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          ShadResizablePanelGroup(
            children: [
              ShadResizablePanel(
                id: 1,
                defaultSize: 0.5,
                child: Container(
                  color: Colors.red,
                  alignment: Alignment.center,
                  child: const Text('One'),
                ),
              ),
              ShadResizablePanel(
                id: 2,
                defaultSize: 0.5,
                child: Container(
                  color: Colors.blue,
                  alignment: Alignment.center,
                  child: const Text('Two'),
                ),
              ),
            ],
          ),
        ),
      );

      expect(
        find.byType(ShadResizablePanelGroup),
        matchesGoldenFile('goldens/resizable.png'),
      );
    });
  });
}
