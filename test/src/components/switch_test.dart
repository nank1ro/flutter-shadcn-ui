import 'package:flutter/material.dart';
import 'package:golden_matrix/golden_matrix.dart';
import 'package:shadcn_ui/src/components/switch.dart';

import '_golden_helpers.dart';

void main() {
  screenMatrixGolden(
    'switch',
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
        'on_off',
        builder: () => const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ShadSwitch(value: true),
            SizedBox(width: 16),
            ShadSwitch(value: false),
          ],
        ),
      ),
    ],
  );
}
