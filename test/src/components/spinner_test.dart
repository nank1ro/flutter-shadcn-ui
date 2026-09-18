import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

void main() {
  Widget createTestWidget(Widget child, {ShadThemeData? theme}) {
    return ShadApp(
      theme: theme,
      home: Scaffold(body: child),
    );
  }

  group('ShadSpinner', () {
    testWidgets('renders the default loader icon', (tester) async {
      await tester.pumpWidget(createTestWidget(const ShadSpinner()));

      expect(find.byType(ShadSpinner), findsOneWidget);
      final icon = tester.widget<Icon>(
        find.descendant(
          of: find.byType(ShadSpinner),
          matching: find.byType(Icon),
        ),
      );
      expect(icon.icon, LucideIcons.loaderCircle);
    });

    testWidgets('applies custom size to the box and the icon', (tester) async {
      await tester.pumpWidget(createTestWidget(const ShadSpinner(size: 48)));

      final box = tester.widget<SizedBox>(
        find
            .descendant(
              of: find.byType(ShadSpinner),
              matching: find.byType(SizedBox),
            )
            .first,
      );
      expect(box.width, 48);
      expect(box.height, 48);

      final icon = tester.widget<Icon>(
        find.descendant(
          of: find.byType(ShadSpinner),
          matching: find.byType(Icon),
        ),
      );
      expect(icon.size, 48);
    });

    testWidgets('applies custom color', (tester) async {
      await tester.pumpWidget(
        createTestWidget(const ShadSpinner(color: Color(0xFFFF0000))),
      );

      final icon = tester.widget<Icon>(
        find.descendant(
          of: find.byType(ShadSpinner),
          matching: find.byType(Icon),
        ),
      );
      expect(icon.color, const Color(0xFFFF0000));
    });

    testWidgets('applies custom icon', (tester) async {
      await tester.pumpWidget(
        createTestWidget(const ShadSpinner(icon: LucideIcons.loader)),
      );

      final icon = tester.widget<Icon>(
        find.descendant(
          of: find.byType(ShadSpinner),
          matching: find.byType(Icon),
        ),
      );
      expect(icon.icon, LucideIcons.loader);
    });

    testWidgets('rotates while animating', (tester) async {
      await tester.pumpWidget(createTestWidget(const ShadSpinner()));

      final transition = tester.widget<RotationTransition>(
        find.descendant(
          of: find.byType(ShadSpinner),
          matching: find.byType(RotationTransition),
        ),
      );
      final initial = transition.turns.value;

      await tester.pump(const Duration(milliseconds: 500));
      expect(transition.turns.value, isNot(initial));

      // Leave no running animation behind.
      await tester.pumpWidget(createTestWidget(const SizedBox()));
    });

    testWidgets('does not rotate when animate is false', (tester) async {
      await tester.pumpWidget(
        createTestWidget(const ShadSpinner(animate: false)),
      );

      expect(
        find.descendant(
          of: find.byType(ShadSpinner),
          matching: find.byType(RotationTransition),
        ),
        findsNothing,
      );
      expect(
        find.descendant(
          of: find.byType(ShadSpinner),
          matching: find.byType(Icon),
        ),
        findsOneWidget,
      );
    });

    testWidgets('exposes the semantics label to screen readers',
        (tester) async {
      final handle = tester.ensureSemantics();

      await tester.pumpWidget(
        createTestWidget(const ShadSpinner(semanticsLabel: 'Loading')),
      );

      expect(find.bySemanticsLabel('Loading'), findsOneWidget);

      await tester.pumpWidget(createTestWidget(const SizedBox()));
      handle.dispose();
    });

    testWidgets('has no semantics label by default', (tester) async {
      final handle = tester.ensureSemantics();

      await tester.pumpWidget(createTestWidget(const ShadSpinner()));

      expect(find.bySemanticsLabel('Loading'), findsNothing);

      await tester.pumpWidget(createTestWidget(const SizedBox()));
      handle.dispose();
    });

    testWidgets('falls back to the theme values', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          const ShadSpinner(),
          theme: ShadThemeData(
            brightness: Brightness.light,
            colorScheme: const ShadSlateColorScheme.light(),
            spinnerTheme: const ShadSpinnerTheme(
              size: 32,
              color: Color(0xFF00FF00),
              icon: LucideIcons.loader,
            ),
          ),
        ),
      );

      final icon = tester.widget<Icon>(
        find.descendant(
          of: find.byType(ShadSpinner),
          matching: find.byType(Icon),
        ),
      );
      expect(icon.size, 32);
      expect(icon.color, const Color(0xFF00FF00));
      expect(icon.icon, LucideIcons.loader);
    });

    testWidgets('takes the rotation duration from the theme', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          const ShadSpinner(),
          theme: ShadThemeData(
            brightness: Brightness.light,
            colorScheme: const ShadSlateColorScheme.light(),
            spinnerTheme: const ShadSpinnerTheme(
              duration: Duration(seconds: 4),
            ),
          ),
        ),
      );

      final transition = tester.widget<RotationTransition>(
        find.descendant(
          of: find.byType(ShadSpinner),
          matching: find.byType(RotationTransition),
        ),
      );
      expect(
        (transition.turns as AnimationController).duration,
        const Duration(seconds: 4),
      );

      await tester.pumpWidget(createTestWidget(const SizedBox()));
    });

    testWidgets('applies a changed duration to the running rotation',
        (tester) async {
      Widget build(Duration d) => createTestWidget(ShadSpinner(duration: d));

      await tester.pumpWidget(build(const Duration(seconds: 1)));
      final controller =
          tester.widget<RotationTransition>(
                find.descendant(
                  of: find.byType(ShadSpinner),
                  matching: find.byType(RotationTransition),
                ),
              ).turns
              as AnimationController;

      await tester.pump(const Duration(milliseconds: 500));

      // repeat() captures the duration when it starts, so the repetition has
      // to be restarted for a new duration to take effect. It resumes from the
      // current value, so the spinner speeds up without visually jumping.
      await tester.pumpWidget(build(const Duration(seconds: 3)));
      expect(controller.duration, const Duration(seconds: 3));
      expect(controller.isAnimating, isTrue);

      // The new duration is actually in force: at 1s/turn the rotation would
      // have wrapped past 0.5 after 900ms, at 3s/turn it advances ~0.3.
      await tester.pump(const Duration(milliseconds: 900));
      expect(controller.value, closeTo(0.8, 0.05));

      await tester.pumpWidget(createTestWidget(const SizedBox()));
    });

    test('rejects a negative size', () {
      expect(() => ShadSpinner(size: -1), throwsAssertionError);
    });

    test('rejects a non-positive duration', () {
      expect(
        () => ShadSpinner(duration: Duration.zero),
        throwsAssertionError,
      );
      expect(
        () => ShadSpinner(duration: const Duration(seconds: -1)),
        throwsAssertionError,
      );
    });

    testWidgets('rejects a non-positive duration from the theme',
        (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          const ShadSpinner(),
          theme: ShadThemeData(
            brightness: Brightness.light,
            colorScheme: const ShadSlateColorScheme.light(),
            spinnerTheme: const ShadSpinnerTheme(duration: Duration.zero),
          ),
        ),
      );

      expect(tester.takeException(), isAssertionError);
      await tester.pumpWidget(createTestWidget(const SizedBox()));
    });

    testWidgets('constructor values win over the theme', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          const ShadSpinner(size: 10, color: Color(0xFF0000FF)),
          theme: ShadThemeData(
            brightness: Brightness.light,
            colorScheme: const ShadSlateColorScheme.light(),
            spinnerTheme: const ShadSpinnerTheme(
              size: 32,
              color: Color(0xFF00FF00),
            ),
          ),
        ),
      );

      final icon = tester.widget<Icon>(
        find.descendant(
          of: find.byType(ShadSpinner),
          matching: find.byType(Icon),
        ),
      );
      expect(icon.size, 10);
      expect(icon.color, const Color(0xFF0000FF));
    });
  });
}
