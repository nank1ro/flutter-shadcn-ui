import 'package:flutter/material.dart';
import 'package:golden_matrix/golden_matrix.dart';
import 'package:shadcn_ui/src/components/slider.dart';

import '_golden_helpers.dart';

void main() {
  screenMatrixGolden(
    'slider',
    reportFormats: const {},
    axes: goldenAxes,
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
        'default',
        builder: () => const ShadSlider(initialValue: 33, max: 100),
      ),
    ],
  );
}
