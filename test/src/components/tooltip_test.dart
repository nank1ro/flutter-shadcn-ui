import 'package:flutter/material.dart';
import 'package:golden_matrix/golden_matrix.dart';
import 'package:shadcn_ui/src/components/tooltip.dart';

import '_golden_helpers.dart';

void main() {
  screenMatrixGolden(
    'tooltip',
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
        'default',
        builder: () => ShadTooltip(
          builder: (context) => const Text('Tooltip'),
          child: const Text('trigger'),
        ),
      ),
    ],
  );
}
