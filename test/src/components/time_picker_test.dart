import 'package:flutter/material.dart';
import 'package:golden_matrix/golden_matrix.dart';
import 'package:shadcn_ui/src/components/time_picker.dart';

import '_golden_helpers.dart';

void main() {
  screenMatrixGolden(
    'time_picker',
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
        builder: () => const ShadTimePicker(),
      ),
    ],
  );
}
