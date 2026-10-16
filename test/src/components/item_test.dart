import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

void main() {
  Widget createTestWidget(
    Widget child, {
    ShadThemeData? theme,
    TextDirection textDirection = TextDirection.ltr,
  }) {
    return ShadApp(
      theme: theme,
      home: Directionality(
        textDirection: textDirection,
        child: Scaffold(
          body: Center(child: SizedBox(width: 400, child: child)),
        ),
      ),
    );
  }

  ShadDecorator itemDecorator(WidgetTester tester) {
    return tester.widget<ShadDecorator>(
      find
          .descendant(
            of: find.byType(ShadItem),
            matching: find.byType(ShadDecorator),
          )
          .first,
    );
  }

  final buttonSemantics = find.descendant(
    of: find.byType(ShadItem),
    matching: find.byWidgetPredicate(
      (widget) => widget is Semantics && widget.properties.button == true,
    ),
  );

  ShadThemeData themeOf(WidgetTester tester) {
    return ShadTheme.of(tester.element(find.byType(ShadItem).first));
  }

  group('ShadItem', () {
    testWidgets('renders all the slots', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          const ShadItem(
            header: Text('Header'),
            media: ShadItemMedia.icon(child: Icon(LucideIcons.user)),
            title: Text('Title'),
            description: Text('Description'),
            actions: Text('Action'),
            footer: Text('Footer'),
            child: Text('Child'),
          ),
        ),
      );

      for (final text in [
        'Header',
        'Title',
        'Description',
        'Child',
        'Action',
        'Footer',
      ]) {
        expect(find.text(text), findsOneWidget);
      }
      expect(find.byIcon(LucideIcons.user), findsOneWidget);
    });

    testWidgets('centers the media when there is no description', (
      tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(
          const ShadItem(
            media: ShadItemMedia.icon(child: Icon(LucideIcons.user)),
            title: Text('Title'),
          ),
        ),
      );

      final media = tester.getCenter(find.byType(ShadItemMedia));
      final title = tester.getCenter(find.text('Title'));
      expect(media.dy, title.dy);
    });

    testWidgets(
      'aligns the media to the top with a 2px offset when there is a '
      'description',
      (tester) async {
        await tester.pumpWidget(
          createTestWidget(
            const ShadItem(
              media: ShadItemMedia.icon(child: Icon(LucideIcons.user)),
              title: Text('Title'),
              description: Text('Description'),
              actions: SizedBox.square(
                dimension: 100,
                key: ValueKey('actions'),
              ),
            ),
          ),
        );

        final media = tester.getTopLeft(find.byType(ShadItemMedia));
        final content = tester.getTopLeft(find.byType(ShadItemContent));
        expect(media.dy, content.dy + 2);

        // The actions are taller than the content and the content is
        // centered with them.
        final actions = tester.getCenter(find.byKey(const ValueKey('actions')));
        final contentCenter = tester.getCenter(find.byType(ShadItemContent));
        expect(contentCenter.dy, actions.dy);
      },
    );

    testWidgets('header and footer span the full width', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          const ShadItem(
            header: SizedBox(height: 10, key: ValueKey('header')),
            title: Text('Title'),
            footer: SizedBox(height: 10, key: ValueKey('footer')),
          ),
        ),
      );

      // 400 - 2 * (16 padding + 1 border)
      expect(tester.getSize(find.byKey(const ValueKey('header'))).width, 366);
      expect(tester.getSize(find.byKey(const ValueKey('footer'))).width, 366);
    });

    testWidgets('clamps the description to two lines', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          const ShadItem(
            title: Text('Title'),
            description: Text('Description'),
          ),
        ),
      );

      final style = DefaultTextStyle.of(
        tester.element(find.text('Description')),
      );
      expect(style.maxLines, 2);
      expect(style.overflow, TextOverflow.ellipsis);
    });

    testWidgets('uses the title and description text styles', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          const ShadItem(
            title: Text('Title'),
            description: Text('Description'),
          ),
        ),
      );

      final theme = themeOf(tester);
      final title = DefaultTextStyle.of(
        tester.element(find.text('Title')),
      ).style;
      expect(title.fontSize, 14);
      expect(title.fontWeight, FontWeight.w500);
      expect(title.height, 1.375);
      expect(title.color, theme.colorScheme.foreground);

      final description = DefaultTextStyle.of(
        tester.element(find.text('Description')),
      ).style;
      expect(description.fontSize, 14);
      expect(description.height, 1.5);
      expect(description.color, theme.colorScheme.mutedForeground);
    });

    testWidgets('primary variant has a transparent border and no background', (
      tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(const ShadItem(title: Text('Title'))),
      );

      final decoration = itemDecorator(tester).decoration!;
      expect(decoration.color, isNull);
      expect(decoration.border?.top?.width, 1);
      expect(decoration.border?.top?.color, const Color(0x00000000));
    });

    testWidgets('outline variant uses the border color', (tester) async {
      await tester.pumpWidget(
        createTestWidget(const ShadItem.outline(title: Text('Title'))),
      );

      final decoration = itemDecorator(tester).decoration!;
      expect(decoration.color, isNull);
      expect(
        decoration.border?.top?.color,
        themeOf(tester).colorScheme.border,
      );
    });

    testWidgets('muted variant uses the muted background', (tester) async {
      await tester.pumpWidget(
        createTestWidget(const ShadItem.muted(title: Text('Title'))),
      );

      expect(
        itemDecorator(tester).decoration!.color,
        themeOf(tester).colorScheme.muted.withValues(alpha: .5),
      );
    });

    testWidgets('regular size uses 16px padding and gap', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          const ShadItem(
            media: SizedBox.square(dimension: 20, key: ValueKey('media')),
            title: Text('Title'),
          ),
        ),
      );

      final item = tester.getTopLeft(find.byType(ShadItem));
      final media = tester.getRect(find.byKey(const ValueKey('media')));
      final title = tester.getTopLeft(find.byType(ShadItemContent));
      // 16 padding + 1 border
      expect(media.left - item.dx, 17);
      expect(title.dx - media.right, 16);
    });

    testWidgets('sm size uses 16x12 padding and a 10px gap', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          const ShadItem(
            size: ShadItemSize.sm,
            media: SizedBox.square(dimension: 20, key: ValueKey('media')),
            title: Text('Title'),
          ),
        ),
      );

      final item = tester.getRect(find.byType(ShadItem));
      final media = tester.getRect(find.byKey(const ValueKey('media')));
      final title = tester.getTopLeft(find.byType(ShadItemContent));
      expect(media.left - item.left, 17);
      expect(media.top - item.top, 13);
      expect(title.dx - media.right, 10);
    });

    testWidgets('reads the defaults from the theme', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          theme: ShadThemeData(
            colorScheme: const ShadSlateColorScheme.light(),
            primaryItemTheme: const ShadItemTheme(
              backgroundColor: Colors.red,
              titleStyle: TextStyle(fontSize: 20),
              descriptionMaxLines: 3,
            ),
          ),
          const ShadItem(
            title: Text('Title'),
            description: Text('Description'),
          ),
        ),
      );

      expect(itemDecorator(tester).decoration!.color, Colors.red);
      expect(
        DefaultTextStyle.of(tester.element(find.text('Title'))).style.fontSize,
        20,
      );
      expect(
        DefaultTextStyle.of(tester.element(find.text('Description'))).maxLines,
        3,
      );
    });

    testWidgets('widget parameters override the theme', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          theme: ShadThemeData(
            colorScheme: const ShadSlateColorScheme.light(),
            primaryItemTheme: const ShadItemTheme(
              backgroundColor: Colors.red,
              titleStyle: TextStyle(fontSize: 20),
            ),
          ),
          const ShadItem(
            backgroundColor: Colors.blue,
            titleStyle: TextStyle(fontSize: 12),
            descriptionMaxLines: 1,
            title: Text('Title'),
            description: Text('Description'),
          ),
        ),
      );

      expect(itemDecorator(tester).decoration!.color, Colors.blue);
      expect(
        DefaultTextStyle.of(tester.element(find.text('Title'))).style.fontSize,
        12,
      );
      expect(
        DefaultTextStyle.of(tester.element(find.text('Description'))).maxLines,
        1,
      );
    });

    testWidgets('building blocks use the theme of the parent variant', (
      tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(
          theme: ShadThemeData(
            colorScheme: const ShadSlateColorScheme.light(),
            mutedItemTheme: const ShadItemTheme(
              mediaIconContainerSize: 48,
              titleStyle: TextStyle(fontSize: 20),
            ),
          ),
          const ShadItem.muted(
            media: ShadItemMedia.icon(child: Icon(LucideIcons.user)),
            child: ShadItemTitle(child: Text('Custom title')),
          ),
        ),
      );

      expect(tester.getSize(find.byType(ShadItemMedia)), const Size(48, 48));
      expect(
        DefaultTextStyle.of(
          tester.element(find.text('Custom title')),
        ).style.fontSize,
        20,
      );
    });

    testWidgets('raw picks the theme of the given variant', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          const ShadItem.raw(
            variant: ShadItemVariant.muted,
            title: Text('Title'),
          ),
        ),
      );

      expect(
        itemDecorator(tester).decoration!.color,
        themeOf(tester).colorScheme.muted.withValues(alpha: .5),
      );
    });

    testWidgets('theme padding and gap override the size defaults', (
      tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(
          theme: ShadThemeData(
            colorScheme: const ShadSlateColorScheme.light(),
            primaryItemTheme: const ShadItemTheme(
              padding: EdgeInsets.all(4),
              gap: 2,
            ),
          ),
          const ShadItem(
            media: SizedBox.square(dimension: 20, key: ValueKey('media')),
            title: Text('Title'),
          ),
        ),
      );

      final item = tester.getTopLeft(find.byType(ShadItem));
      final media = tester.getRect(find.byKey(const ValueKey('media')));
      final title = tester.getTopLeft(find.byType(ShadItemContent));
      expect(media.left - item.dx, 5);
      expect(title.dx - media.right, 2);
    });

    testWidgets('building blocks rebuild when the item theme changes', (
      tester,
    ) async {
      late StateSetter setState;
      var fontSize = 12.0;
      await tester.pumpWidget(
        createTestWidget(
          StatefulBuilder(
            builder: (context, setter) {
              setState = setter;
              return ShadItem(
                titleStyle: TextStyle(fontSize: fontSize),
                child: const ShadItemTitle(child: Text('Custom title')),
              );
            },
          ),
        ),
      );

      double titleFontSize() => DefaultTextStyle.of(
        tester.element(find.text('Custom title')),
      ).style.fontSize!;

      expect(titleFontSize(), 12);

      setState(() => fontSize = 20);
      await tester.pump();
      expect(titleFontSize(), 20);
    });

    testWidgets('is not interactive without onPressed', (tester) async {
      await tester.pumpWidget(
        createTestWidget(const ShadItem(title: Text('Title'))),
      );

      expect(
        find.descendant(
          of: find.byType(ShadItem),
          matching: find.byType(ShadGestureDetector),
        ),
        findsNothing,
      );
      expect(
        find.descendant(
          of: find.byType(ShadItem),
          matching: find.byType(Focus),
        ),
        findsNothing,
      );
      expect(buttonSemantics, findsNothing);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      var pressed = 0;
      await tester.pumpWidget(
        createTestWidget(
          ShadItem(
            onPressed: () => pressed++,
            title: const Text('Title'),
          ),
        ),
      );

      await tester.tap(find.byType(ShadItem));
      await tester.pump();
      expect(pressed, 1);
    });

    testWidgets('uses the hover background when hovered', (tester) async {
      final hovers = <bool>[];
      final statesController = ShadStatesController();
      addTearDown(statesController.dispose);
      await tester.pumpWidget(
        createTestWidget(
          ShadItem(
            onPressed: () {},
            onHoverChange: hovers.add,
            statesController: statesController,
            title: const Text('Title'),
          ),
        ),
      );

      expect(itemDecorator(tester).decoration!.color, isNull);

      final gesture = await tester.createGesture(kind: PointerDeviceKind.mouse);
      addTearDown(gesture.removePointer);
      await gesture.addPointer(location: Offset.zero);
      await gesture.moveTo(tester.getCenter(find.byType(ShadItem)));
      await tester.pumpAndSettle();

      expect(
        itemDecorator(tester).decoration!.color,
        themeOf(tester).colorScheme.accent.withValues(alpha: .5),
      );
      expect(statesController.value, contains(ShadState.hovered));
      expect(hovers, [true]);

      await gesture.moveTo(Offset.zero);
      await tester.pumpAndSettle();
      expect(itemDecorator(tester).decoration!.color, isNull);
      expect(hovers, [true, false]);
    });

    testWidgets('activates with Enter and Space when focused', (tester) async {
      var pressed = 0;
      final focusNode = FocusNode();
      addTearDown(focusNode.dispose);
      await tester.pumpWidget(
        createTestWidget(
          ShadItem(
            focusNode: focusNode,
            onPressed: () => pressed++,
            title: const Text('Title'),
          ),
        ),
      );

      focusNode.requestFocus();
      await tester.pump();

      await tester.sendKeyEvent(LogicalKeyboardKey.enter);
      await tester.sendKeyEvent(LogicalKeyboardKey.space);
      await tester.pump();
      expect(pressed, 2);
    });

    testWidgets('reports focus changes to the decorator and onFocusChange', (
      tester,
    ) async {
      final focusChanges = <bool>[];
      final focusNode = FocusNode();
      addTearDown(focusNode.dispose);
      await tester.pumpWidget(
        createTestWidget(
          ShadItem(
            focusNode: focusNode,
            onFocusChange: focusChanges.add,
            onPressed: () {},
            title: const Text('Title'),
          ),
        ),
      );

      expect(itemDecorator(tester).focused, isFalse);

      focusNode.requestFocus();
      await tester.pump();

      expect(itemDecorator(tester).focused, isTrue);
      expect(focusChanges, [true]);
    });

    for (final disableSecondaryBorder in [false, true]) {
      testWidgets(
        'paints a ring colored border without layout shift when focused '
        '(disableSecondaryBorder: $disableSecondaryBorder)',
        (tester) async {
          final focusNode = FocusNode();
          addTearDown(focusNode.dispose);
          await tester.pumpWidget(
            createTestWidget(
              theme: ShadThemeData(
                colorScheme: const ShadSlateColorScheme.light(),
                disableSecondaryBorder: disableSecondaryBorder,
              ),
              ShadItem.outline(
                focusNode: focusNode,
                onPressed: () {},
                title: const Text('Title'),
              ),
            ),
          );

          Border paintedBorder() {
            final container = tester.widget<Container>(
              find
                  .descendant(
                    of: find.byType(ShadDecorator),
                    matching: find.byType(Container),
                  )
                  .first,
            );
            return (container.decoration! as BoxDecoration).border! as Border;
          }

          final titleBefore = tester.getTopLeft(find.text('Title'));
          final colorScheme = themeOf(tester).colorScheme;
          expect(paintedBorder().top.color, colorScheme.border);

          focusNode.requestFocus();
          await tester.pump();

          expect(paintedBorder().top.color, colorScheme.ring);
          expect(paintedBorder().top.width, 1);
          expect(tester.getTopLeft(find.text('Title')), titleBefore);
        },
      );
    }

    testWidgets('clears the hover state when it stops being pressable', (
      tester,
    ) async {
      final statesController = ShadStatesController();
      addTearDown(statesController.dispose);

      Widget build({required bool pressable}) => createTestWidget(
        ShadItem(
          statesController: statesController,
          onPressed: pressable ? () {} : null,
          title: const Text('Title'),
        ),
      );

      await tester.pumpWidget(build(pressable: true));
      final gesture = await tester.createGesture(kind: PointerDeviceKind.mouse);
      addTearDown(gesture.removePointer);
      await gesture.addPointer(location: Offset.zero);
      await gesture.moveTo(tester.getCenter(find.byType(ShadItem)));
      await tester.pumpAndSettle();
      expect(statesController.value, contains(ShadState.hovered));

      await tester.pumpWidget(build(pressable: false));
      expect(statesController.value, isNot(contains(ShadState.hovered)));

      await gesture.moveTo(Offset.zero);
      await tester.pumpWidget(build(pressable: true));
      expect(itemDecorator(tester).decoration!.color, isNull);
    });

    testWidgets('uses the click cursor when pressable', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          ShadItem(onPressed: () {}, title: const Text('Title')),
        ),
      );

      expect(
        tester
            .widget<ShadGestureDetector>(
              find.descendant(
                of: find.byType(ShadItem),
                matching: find.byType(ShadGestureDetector),
              ),
            )
            .cursor,
        SystemMouseCursors.click,
      );
    });

    testWidgets('does not call onPressed when disabled', (tester) async {
      var pressed = 0;
      final focusNode = FocusNode();
      addTearDown(focusNode.dispose);
      await tester.pumpWidget(
        createTestWidget(
          ShadItem(
            enabled: false,
            focusNode: focusNode,
            onPressed: () => pressed++,
            title: const Text('Title'),
          ),
        ),
      );

      await tester.tap(find.byType(ShadItem), warnIfMissed: false);
      focusNode.requestFocus();
      await tester.pump();
      await tester.sendKeyEvent(LogicalKeyboardKey.enter);
      await tester.pump();

      expect(pressed, 0);
      expect(focusNode.hasFocus, isFalse);
      expect(
        tester
            .widget<Opacity>(
              find.descendant(
                of: find.byType(ShadItem),
                matching: find.byType(Opacity),
              ),
            )
            .opacity,
        .5,
      );
    });

    testWidgets('has button semantics when pressable', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          ShadItem(onPressed: () {}, title: const Text('Title')),
        ),
      );

      expect(buttonSemantics, findsOneWidget);
      expect(
        tester.getSemantics(find.text('Title')),
        isSemantics(
          label: 'Title',
          hasTapAction: true,
          isFocusable: true,
        ),
      );
    });

    testWidgets('places the media at the end in RTL', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          textDirection: TextDirection.rtl,
          const ShadItem(
            media: ShadItemMedia.icon(child: Icon(LucideIcons.user)),
            title: Text('Title'),
            actions: Text('Action'),
          ),
        ),
      );

      final media = tester.getCenter(find.byType(ShadItemMedia));
      final title = tester.getCenter(find.text('Title'));
      final action = tester.getCenter(find.text('Action'));
      expect(media.dx, greaterThan(title.dx));
      expect(title.dx, greaterThan(action.dx));
    });

    testWidgets('ShadItem matches goldens', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          const ShadItem.outline(
            media: ShadItemMedia.icon(
              child: Icon(LucideIcons.badgeCheck),
            ),
            title: Text('Basic Item'),
            description: Text(
              'A simple item with title and description.',
            ),
            actions: ShadButton.outline(
              size: ShadButtonSize.sm,
              child: Text('Action'),
            ),
          ),
        ),
      );

      expect(
        find.byType(ShadItem),
        matchesGoldenFile('goldens/item.png'),
      );
    });

    testWidgets('ShadItem.muted sm matches goldens', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          const ShadItem.muted(
            size: ShadItemSize.sm,
            media: Icon(LucideIcons.badgeCheck, size: 20),
            title: Text('Your profile has been verified.'),
            actions: Icon(LucideIcons.chevronRight, size: 16),
          ),
        ),
      );

      expect(
        find.byType(ShadItem),
        matchesGoldenFile('goldens/item_muted_sm.png'),
      );
    });
  });

  group('ShadItemMedia', () {
    testWidgets('icon variant is a 32px muted square with a 16px icon', (
      tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(
          const Align(
            child: ShadItemMedia.icon(child: Icon(LucideIcons.user)),
          ),
        ),
      );

      expect(tester.getSize(find.byType(ShadItemMedia)), const Size(32, 32));
      expect(tester.getSize(find.byIcon(LucideIcons.user)), const Size(16, 16));

      final decoration =
          tester
                  .widget<DecoratedBox>(
                    find.descendant(
                      of: find.byType(ShadItemMedia),
                      matching: find.byType(DecoratedBox),
                    ),
                  )
                  .decoration
              as BoxDecoration;
      final colorScheme = ShadTheme.of(
        tester.element(find.byType(ShadItemMedia)),
      ).colorScheme;
      expect(decoration.color, colorScheme.muted);
      expect((decoration.border! as Border).top.color, colorScheme.border);
      expect(
        decoration.borderRadius,
        const BorderRadius.all(Radius.circular(4)),
      );
    });

    testWidgets('image variant is a clipped 40px square', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          const Align(
            child: ShadItemMedia.image(
              child: ColoredBox(color: Colors.red, key: ValueKey('image')),
            ),
          ),
        ),
      );

      expect(tester.getSize(find.byType(ShadItemMedia)), const Size(40, 40));
      expect(
        tester.getSize(find.byKey(const ValueKey('image'))),
        const Size(40, 40),
      );
      expect(
        find.descendant(
          of: find.byType(ShadItemMedia),
          matching: find.byType(ClipRRect),
        ),
        findsOneWidget,
      );
    });
  });

  group('ShadItemGroup', () {
    testWidgets('stacks full width items with a separator without margin', (
      tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(
          const ShadItemGroup(
            children: [
              ShadItem(title: Text('First')),
              ShadItemSeparator(),
              ShadItem(title: Text('Second')),
            ],
          ),
        ),
      );

      final first = tester.getRect(find.byType(ShadItem).first);
      final separator = tester.getRect(find.byType(ShadItemSeparator));
      final second = tester.getRect(find.byType(ShadItem).last);
      expect(first.width, 400);
      expect(second.width, 400);
      expect(separator.height, 1);
      expect(separator.top, first.bottom);
      expect(second.top, separator.bottom);
    });
  });
}
