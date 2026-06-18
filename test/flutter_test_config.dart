import 'dart:async';

import 'package:golden_matrix/golden_matrix.dart';

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  await loadAppFonts(textFonts: false);
  return testMain();
}
