import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../extra/diagnosticable_mixin.dart';

// Create a Mock class for SvgPicture using mocktail
class MockSvgPicture extends Mock
    with DiagnosticableToStringMixin
    implements SvgPicture {}

Future<void> main() async {
  setUpAll(() async {});

  testWidgets('renders jpg image correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ShadImage('test/assets/image.jpg'),
        ),
      ),
    );

    expect(find.byType(Image), findsOneWidget);
    expect(find.byType(SvgPicture), findsNothing);
  });

  testWidgets('renders svg image correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ShadImage('test/assets/image.svg'),
        ),
      ),
    );

    expect(find.byType(SvgPicture), findsOneWidget);
    expect(find.byType(Image), findsNothing);
  });

  testWidgets('renders svg.vec image correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ShadImage('test/assets/image.svg.vec'),
        ),
      ),
    );

    expect(find.byType(SvgPicture), findsOneWidget);
    expect(find.byType(Image), findsNothing);
  });

  testWidgets('renders icon correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ShadImage(Icons.star, width: 50, height: 50),
        ),
      ),
    );

    expect(find.byType(Icon), findsOneWidget);
  });

  testWidgets('applies gradient correctly', (WidgetTester tester) async {
    const gradient = LinearGradient(colors: [Colors.red, Colors.blue]);

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ShadImage(LucideIcons.mail, gradient: gradient),
        ),
      ),
    );

    expect(find.byType(ShaderMask), findsOneWidget);
  });
  testWidgets('renders ShadImage with specified width and height',
      (WidgetTester tester) async {
    const testWidth = 150.0;
    const testHeight = 200.0;

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ShadImage(
            'test/assets/image.jpg',
            width: testWidth,
            height: testHeight,
          ),
        ),
      ),
    );

    // Verify that the rendered Image widget has the correct dimensions.
    final imageWidget = tester.widget<Image>(find.byType(Image));
    expect(imageWidget.width, testWidth);
    expect(imageWidget.height, testHeight);
  });

  testWidgets('renders ShadImage with specified color',
      (WidgetTester tester) async {
    const testColor = Colors.red;

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ShadImage(
            'test/assets/image.jpg',
            color: testColor,
          ),
        ),
      ),
    );

    final imageWidget = tester.widget<Image>(find.byType(Image));
    final color = imageWidget.color;

    expect(color, equals(testColor));
  });

  testWidgets('renders ShadImage with inherited color',
      (WidgetTester tester) async {
    const testColor = Colors.red;

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ShadProvider(
            data: ShadImageData(color: testColor),
            child: ShadImage(
              'test/assets/image.jpg',
            ),
          ),
        ),
      ),
    );

    final imageWidget = tester.widget<Image>(find.byType(Image));
    final color = imageWidget.color;

    expect(color, equals(testColor));
  });

  testWidgets('renders ShadImage with correct colorFilter for SvgPicture',
      (WidgetTester tester) async {
    const testColor = Colors.green;

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ShadImage(
            'test/assets/image.svg',
            color: testColor,
          ),
        ),
      ),
    );

    // Verify that an SvgPicture widget is rendered.
    final svgPicture = tester.widget<SvgPicture>(find.byType(SvgPicture));

    // Expect the SvgPicture to have a ColorFilter applied.
    expect(svgPicture.colorFilter, isA<ColorFilter>());

    // Verify that the ColorFilter is correctly set up with the provided color.
    expect(
      svgPicture.colorFilter,
      equals(const ColorFilter.mode(testColor, BlendMode.srcIn)),
    );
  });
}
