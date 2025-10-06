import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:shadcn_ui/src/app.dart';
import 'package:shadcn_ui/src/components/avatar.dart'; // Adjust import path based on your project structure
import 'package:universal_image/universal_image.dart';

void main() {
  // Helper method to create a test widget wrapped in ShadApp and Scaffold
  Widget createTestWidget(Widget child) {
    return ShadApp(
      home: Scaffold(
        body: child,
      ),
    );
  }

  group('ShadAvatar', () {
    testWidgets('applies custom size correctly', (WidgetTester tester) async {
      const customSize = Size(60, 60);
      await tester.pumpWidget(
        createTestWidget(
          const ShadAvatar(
            'assets/test_image.png',
            size: customSize,
          ),
        ),
      );

      // Check Container applies custom size
      final containerFinder = find.byType(Container);
      expect(containerFinder, findsOneWidget);
      final container = tester.widget<Container>(containerFinder);
      expect(container.constraints?.maxWidth, customSize.width);
      expect(container.constraints?.maxHeight, customSize.height);

      // Check UniversalImage uses the custom size
      final universalImageFinder = find.byType(UniversalImage);
      expect(universalImageFinder, findsOneWidget);
      final universalImage =
          tester.widget<UniversalImage>(universalImageFinder);
      expect(universalImage.width, customSize.width);
      expect(universalImage.height, customSize.height);
    });

    testWidgets('applies custom shape correctly', (WidgetTester tester) async {
      const customShape = RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      );
      await tester.pumpWidget(
        createTestWidget(
          const ShadAvatar(
            'assets/test_image.png',
            shape: customShape,
          ),
        ),
      );

      // Check Container uses ShapeDecoration with custom shape
      final containerFinder = find.byType(Container);
      expect(containerFinder, findsOneWidget);
      final container = tester.widget<Container>(containerFinder);
      final decoration = container.decoration as ShapeDecoration?;
      expect(decoration?.shape, customShape);
    });

    testWidgets('applies custom background color correctly',
        (WidgetTester tester) async {
      const customBackgroundColor = Colors.blue;
      await tester.pumpWidget(
        createTestWidget(
          const ShadAvatar(
            'assets/test_image.png',
            backgroundColor: customBackgroundColor,
          ),
        ),
      );

      // Check Container uses ShapeDecoration with custom background color
      final containerFinder = find.byType(Container);
      expect(containerFinder, findsOneWidget);
      final container = tester.widget<Container>(containerFinder);
      final decoration = container.decoration as ShapeDecoration?;
      expect(decoration?.color, customBackgroundColor);
    });

    testWidgets('applies custom fit correctly', (WidgetTester tester) async {
      const customFit = BoxFit.cover;
      await tester.pumpWidget(
        createTestWidget(
          const ShadAvatar(
            'assets/test_image.png',
            fit: customFit,
          ),
        ),
      );

      // Check UniversalImage uses custom fit
      final universalImageFinder = find.byType(UniversalImage);
      expect(universalImageFinder, findsOneWidget);
      final universalImage =
          tester.widget<UniversalImage>(universalImageFinder);
      expect(universalImage.fit, customFit);
    });

    testWidgets('renders with default size when not specified',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        createTestWidget(
          const ShadAvatar('assets/test_image.png'),
        ),
      );

      // Check Container applies default size (40x40)
      final containerFinder = find.byType(Container);
      expect(containerFinder, findsOneWidget);
      final container = tester.widget<Container>(containerFinder);
      expect(container.constraints?.maxWidth, 40.0);
      expect(container.constraints?.maxHeight, 40.0);

      // Check UniversalImage uses default size
      final universalImageFinder = find.byType(UniversalImage);
      expect(universalImageFinder, findsOneWidget);
      final universalImage =
          tester.widget<UniversalImage>(universalImageFinder);
      expect(universalImage.width, 40.0);
      expect(universalImage.height, 40.0);
    });

    testWidgets('renders with default circular shape when not specified',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        createTestWidget(
          const ShadAvatar('assets/test_image.png'),
        ),
      );

      // Check Container uses ShapeDecoration with default CircleBorder
      final containerFinder = find.byType(Container);
      expect(containerFinder, findsOneWidget);
      final container = tester.widget<Container>(containerFinder);
      final decoration = container.decoration as ShapeDecoration?;
      expect(decoration?.shape, isA<CircleBorder>());
    });

    testWidgets('ShadAvatar matches goldens', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          const ShadAvatar(LucideIcons.mail),
        ),
      );

      expect(
        find.byType(ShadAvatar),
        matchesGoldenFile('goldens/avatar.png'),
      );
    });
  });
}
