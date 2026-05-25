import 'package:flutter/material.dart';
import 'package:golden_matrix/golden_matrix.dart';
import 'package:shadcn_ui/src/components/progress.dart';

import '_golden_helpers.dart';

void main() {
  screenMatrixGolden(
    'progress',
    reportFormats: const {},
    axes: goldenAxes,
    freezeAnimations: true,
    appBuilder: (combination) => shadAppForCombination(
      combination,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Center(child: combination.scenario.builder()),
        ),
      ),
    ),
    states: [
      MatrixScenario(
        'indeterminate_and_determinate',
        builder: () => const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ShadProgress(),
            SizedBox(height: 16),
            ShadProgress(value: 0.5),
          ],
        ),
      ),
    ],
  );
}
