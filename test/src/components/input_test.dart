import 'package:flutter/material.dart';
import 'package:golden_matrix/golden_matrix.dart';
import 'package:shadcn_ui/src/components/input.dart';

import '_golden_helpers.dart';

void main() {
  screenMatrixGolden(
    'input',
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
        builder: () => const ShadInput(placeholder: Text('Email')),
      ),
    ],
  );
}
