import 'package:flutter/material.dart';
import 'package:golden_matrix/golden_matrix.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:shadcn_ui/src/components/input_otp.dart';

import '_golden_helpers.dart';

void main() {
  screenMatrixGolden(
    'input_otp',
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
        builder: () => const ShadInputOTP(
          maxLength: 6,
          children: [
            ShadInputOTPGroup(
              children: [
                ShadInputOTPSlot(),
                ShadInputOTPSlot(),
                ShadInputOTPSlot(),
              ],
            ),
            Icon(LucideIcons.dot),
            ShadInputOTPGroup(
              children: [
                ShadInputOTPSlot(),
                ShadInputOTPSlot(),
                ShadInputOTPSlot(),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}
