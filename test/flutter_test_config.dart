import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  TestWidgetsFlutterBinding.ensureInitialized();

  // Disable runtime fetching - fonts are bundled in pubspec.yaml
  // Google Fonts will use the bundled Geist and GeistMono fonts from test/fonts/
  GoogleFonts.config.allowRuntimeFetching = false;

  await testMain();
}
