import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

void main() {
  group('ShadSkeleton', () {
    testWidgets('uses theme skeleton color', (tester) async {
      const skeletonTheme = ShadSkeletonTheme(
        color: Color(0xFFF44336),
      );

      await tester.pumpWidget(
        ShadApp(
          theme: ShadThemeData(
            brightness: Brightness.light,
            skeletonTheme: skeletonTheme,
          ),
          home: const MediaQuery(
            data: MediaQueryData(disableAnimations: true),
            child: ShadSkeleton(width: 40, height: 12),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is ColoredBox && widget.color == const Color(0xFFF44336),
        ),
        findsOne,
      );
    });

    testWidgets('constructor parameters override theme', (tester) async {
      const skeletonTheme = ShadSkeletonTheme(
        color: Color(0xFFF44336),
      );

      await tester.pumpWidget(
        ShadApp(
          theme: ShadThemeData(
            brightness: Brightness.light,
            skeletonTheme: skeletonTheme,
          ),
          home: const MediaQuery(
            data: MediaQueryData(disableAnimations: true),
            child: ShadSkeleton(
              width: 40,
              height: 12,
              color: Color(0xFF2196F3),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is ColoredBox && widget.color == const Color(0xFF2196F3),
        ),
        findsOne,
      );
    });

    testWidgets('respects fixed width and height', (tester) async {
      await tester.pumpWidget(
        const ShadApp(
          home: MediaQuery(
            data: MediaQueryData(disableAnimations: true),
            child: ShadSkeleton(width: 100, height: 20),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(
        tester.getSize(find.byType(ShadSkeleton)),
        const Size(100, 20),
      );
    });
  });
}
