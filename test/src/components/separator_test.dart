import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

void main() {
  group('ShadSeparator', () {
    group('.horizontal', () {
      testWidgets('correctly reads theme data', (tester) async {
        const shaSeparatorTheme = ShadSeparatorTheme(
          thickness: 12,
          horizontalMargin: EdgeInsets.symmetric(vertical: 100), // really wide
          color: Color(0xFFF44336), // red
        );

        final widget = ShadApp(
          theme: ShadThemeData(
            colorScheme: const ShadBlueColorScheme.dark(),
            brightness: Brightness.light,
            separatorTheme: shaSeparatorTheme,
          ),
          home: const Column(
            children: [SizedBox(width: 40), ShadSeparator.horizontal()],
          ),
        );

        await tester.pumpWidget(widget);
        await tester.pumpAndSettle();

        expect(
          find.byWidgetPredicate(
            (widget) =>
                widget is Padding &&
                widget.padding == const EdgeInsets.symmetric(vertical: 100),
          ),
          findsOne,
        );

        expect(
          find.byWidgetPredicate(
            (widget) =>
                widget is DecoratedBox &&
                (widget.decoration as BoxDecoration).border!.bottom.color ==
                    const Color(0xFFF44336),
          ),
          findsOne,
        );

        expect(
          find.byWidgetPredicate(
            (widget) => widget is SizedBox && widget.height == 12,
          ),
          findsOne,
        );
      });

      testWidgets('correctly uses parameters', (tester) async {
        const widget = ShadApp(
          home: Column(
            children: [
              SizedBox(width: 40),
              ShadSeparator.horizontal(
                thickness: 12,
                margin: EdgeInsets.symmetric(vertical: 100),
                color: Color(0xFFF44336),
              ),
            ],
          ),
        );

        await tester.pumpWidget(widget);
        await tester.pumpAndSettle();

        expect(
          find.byWidgetPredicate(
            (widget) =>
                widget is Padding &&
                widget.padding == const EdgeInsets.symmetric(vertical: 100),
          ),
          findsOne,
        );

        expect(
          find.byWidgetPredicate(
            (widget) =>
                widget is DecoratedBox &&
                (widget.decoration as BoxDecoration).border!.bottom.color ==
                    const Color(0xFFF44336),
          ),
          findsOne,
        );

        expect(
          find.byWidgetPredicate(
            (widget) => widget is SizedBox && widget.height == 12,
          ),
          findsOne,
        );
      });

      testWidgets('matches goldens', (tester) async {
        const widget = ShadApp(
          home: Column(
            children: [
              SizedBox(width: 40),
              ShadSeparator.horizontal(),
            ],
          ),
        );

        await tester.pumpWidget(widget);
        await tester.pumpAndSettle();

        expect(
          find.byType(ShadSeparator),
          matchesGoldenFile('goldens/horizontal_separator.png'),
        );
      });
    });

    group('.vertical', () {
      testWidgets('correctly reads theme data', (tester) async {
        const shadSeparatorTheme = ShadSeparatorTheme(
          thickness: 12,
          verticalMargin: EdgeInsets.symmetric(horizontal: 100), // really tall
          color: Color(0xFFF44336), // red
        );

        final widget = ShadApp(
          theme: ShadThemeData(
            colorScheme: const ShadBlueColorScheme.dark(),
            brightness: Brightness.light,
            separatorTheme: shadSeparatorTheme,
          ),
          home: const Row(
            children: [SizedBox(height: 40), ShadSeparator.vertical()],
          ),
        );

        await tester.pumpWidget(widget);
        await tester.pumpAndSettle();

        expect(
          find.byWidgetPredicate(
            (widget) =>
                widget is Padding &&
                widget.padding == const EdgeInsets.symmetric(horizontal: 100),
          ),
          findsOne,
        );

        expect(
          find.byWidgetPredicate(
            (widget) =>
                widget is DecoratedBox &&
                ((widget.decoration as BoxDecoration).border! as Border)
                        .left
                        .color ==
                    const Color(0xFFF44336),
          ),
          findsOne,
        );

        expect(
          find.byWidgetPredicate(
            (widget) => widget is SizedBox && widget.width == 12,
          ),
          findsOne,
        );
      });

      testWidgets('correctly uses parameters', (tester) async {
        const widget = ShadApp(
          home: Row(
            children: [
              SizedBox(height: 40),
              ShadSeparator.vertical(
                thickness: 12,
                margin: EdgeInsets.symmetric(horizontal: 100),
                color: Color(0xFFF44336),
              ),
            ],
          ),
        );

        await tester.pumpWidget(widget);
        await tester.pumpAndSettle();

        expect(
          find.byWidgetPredicate(
            (widget) =>
                widget is Padding &&
                widget.padding == const EdgeInsets.symmetric(horizontal: 100),
          ),
          findsOne,
        );

        expect(
          find.byWidgetPredicate(
            (widget) =>
                widget is DecoratedBox &&
                ((widget.decoration as BoxDecoration).border! as Border)
                        .left
                        .color ==
                    const Color(0xFFF44336),
          ),
          findsOne,
        );

        expect(
          find.byWidgetPredicate(
            (widget) => widget is SizedBox && widget.width == 12,
          ),
          findsOne,
        );
      });

      testWidgets('matches goldens', (tester) async {
        const widget = ShadApp(
          home: Row(
            children: [
              SizedBox(height: 40),
              ShadSeparator.vertical(),
            ],
          ),
        );

        await tester.pumpWidget(widget);
        await tester.pumpAndSettle();

        expect(
          find.byType(ShadSeparator),
          matchesGoldenFile('goldens/vertical_separator.png'),
        );
      });
    });
  });
}
