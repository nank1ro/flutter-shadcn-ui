import 'package:flutter/material.dart';
import 'package:golden_matrix/golden_matrix.dart';
import 'package:shadcn_ui/src/components/popover.dart';

import '_golden_helpers.dart';

void main() {
  screenMatrixGolden(
    'popover',
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
        builder: () => ShadPopover(
          visible: true,
          popover: (context) => const Text('Popover'),
          child: const Text('Child'),
        ),
      ),
    ],
  );
}
