import 'package:flutter/material.dart';
import 'package:golden_matrix/golden_matrix.dart';
import 'package:shadcn_ui/src/components/dialog.dart';

import '_golden_helpers.dart';

void main() {
  screenMatrixGolden(
    'dialog',
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
        builder: () => const ShadDialog(
          title: Text('Title'),
          description: Text('Description'),
          child: Text('Child'),
        ),
      ),
    ],
  );
}
