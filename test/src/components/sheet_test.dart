import 'package:flutter/material.dart';
import 'package:golden_matrix/golden_matrix.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import '_golden_helpers.dart';

void main() {
  screenMatrixGolden(
    'sheet',
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
        builder: () => const ShadSheetInheritedWidget(
          side: ShadSheetSide.right,
          child: ShadSheet(
            title: Text('Title'),
            description: Text('Description'),
            actions: [
              ShadIconButton(icon: Icon(Icons.cloud_off)),
            ],
            child: Text('Child'),
          ),
        ),
      ),
    ],
  );
}
