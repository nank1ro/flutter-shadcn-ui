import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_matrix/golden_matrix.dart';
import 'package:shadcn_ui/src/app.dart';
import 'package:shadcn_ui/src/components/icon_button.dart';
import '_golden_helpers.dart';

void main() {
  // Helper method to create a test widget wrapped in ShadApp and Scaffold
  Widget createTestWidget(Widget child) {
    return ShadApp(home: Scaffold(body: child));
  }

  group('ShadIconButton', () {
    testWidgets('ShadIconButton.iconSize updates icon size', (tester) async {
      const customIconSize = 10.0;
      await tester.pumpWidget(
        createTestWidget(
          const ShadIconButton(
            icon: Icon(Icons.add),
            iconSize: customIconSize,
          ),
        ),
      );

      final iconSize = tester.getSize(find.byType(Icon));
      expect(iconSize, const Size.square(customIconSize));
    });
  });

  screenMatrixGolden(
    'icon_button',
    reportFormats: const {},
    axes: goldenAxes,
    appBuilder: (combination) => shadAppForCombination(
      combination,
      home: Scaffold(
        body: Center(child: combination.scenario.builder()),
      ),
    ),
    states: [
      MatrixScenario(
        'variants',
        builder: () => const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ShadIconButton(icon: Icon(Icons.add)),
            SizedBox(width: 8),
            ShadIconButton.destructive(icon: Icon(Icons.add)),
            SizedBox(width: 8),
            ShadIconButton.outline(icon: Icon(Icons.add)),
            SizedBox(width: 8),
            ShadIconButton.secondary(icon: Icon(Icons.add)),
            SizedBox(width: 8),
            ShadIconButton.ghost(icon: Icon(Icons.add)),
          ],
        ),
      ),
    ],
  );
}
