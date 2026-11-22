import 'package:flutter_test/flutter_test.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

void main() {
  group('ShadLocale', () {
    // A deferred locale is a separate .part.js on the web, which a tab opened
    // before a deploy fetches from the next build.
    test('every locale builds synchronously', () {
      for (final locale in ShadLocale.values) {
        expect(locale.buildSync().$meta.locale, locale, reason: locale.name);
      }
    });
  });
}
