import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

void main() {
  group('GlobalShadLocalizations', () {
    testWidgets('a non-English locale is ready on the first frame', (
      tester,
    ) async {
      await tester.pumpWidget(
        ShadApp(
          locale: const Locale('it'),
          supportedLocales: const [Locale('it')],
          home: Builder(
            builder: (context) =>
                Text(ShadLocalizations.of(context).input.copy),
          ),
        ),
      );

      expect(find.text('Copia'), findsOneWidget);
    });
  });
}
