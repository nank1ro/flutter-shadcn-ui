import 'dart:math';
import 'dart:ui';

import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:boxy/boxy.dart';
import 'package:example/common/base_scaffold.dart';
import 'package:example/common/properties/enum_property.dart';
import 'package:example/pages/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class SonnerPage extends StatefulWidget {
  const SonnerPage({super.key});

  @override
  State<SonnerPage> createState() => _SonnerPageState();
}

class _SonnerPageState extends State<SonnerPage>
    with SingleTickerProviderStateMixin {
  var alignment = Alignm.bottomRight;
  late final animationController =
      AnimationController(vsync: this, duration: Duration(milliseconds: 200));
  late final animation =
      Tween<double>(begin: 0, end: 1).animate(animationController);

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sonner'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ShadButton(
              child: Text('Animate'),
              onPressed: () {
                if (animationController.isCompleted) {
                  animationController.reverse();
                } else {
                  animationController.forward();
                }
              },
            ),
            ListenableBuilder(
                listenable: animationController,
                builder: (context, _) {
                  return CustomBoxy(
                      delegate: MyBoxy(
                        animation: animationController,
                      ),
                      children: List.generate(3, (index) {
                        return BoxyId(
                          id: 'toast$index',
                          child: ShadToast(
                            title: Text('Title$index'),
                            description: Text('description$index'),
                            // backgroundColor: Colors.white10,
                          ),
                        );
                      }) //.separatedBy(Container(height: 8, color: Colors.blue)),
                      );
                }),
          ],
        ),
      ),
    );
  }
}

class MyBoxy extends BoxyDelegate {
  MyBoxy({
    required this.animation,
  }) : super(relayout: animation);

  final Animation<double> animation;
  static const double gap = 8.0; // Gap between toasts in expanded state
  static const double collapseOffset =
      16.0; // Offset between toasts in collapsed state

  @override
  Size layout() {
    // Step 1: Calculate the intrinsic sizes of all children
    final widths = <double>[];
    final heights = <double>[];
    for (final child in children) {
      final width = child.render.getMaxIntrinsicWidth(double.infinity);
      widths.add(width);
      final height = child.render.getMinIntrinsicHeight(width);
      heights.add(height);
      child.layout(constraints); // Layout each child with the given constraints
    }

    // Step 2: Determine the total size of the layout
    final maxWidth = widths.reduce(max); // Maximum width of all toasts
    final totalHeightExpanded = heights.fold<double>(0, (a, b) => a + b) +
        gap * (heights.length - 1); // Total height in expanded state with gaps

    // Step 3: Position the children based on the animation value
    final numChildren = children.length;
    final lastChildHeight = heights.last; // Height of the bottom-most toast
    final lastChildY = totalHeightExpanded -
        lastChildHeight; // Y position of the last toast (fixed)

    for (final (i, child) in children.indexed) {
      final childHeight = heights[i];
      double targetY;

      if (i == numChildren - 1) {
        // The last child always stays at the bottom
        targetY = lastChildY;
      } else {
        // Calculate the expanded Y position (stacked vertically with gaps)
        final expandedY =
            heights.sublist(0, i).fold<double>(0, (a, b) => a + b) + gap * i;

        // In the collapsed state, each toast should be offset slightly above the one below it
        // The last toast is at lastChildY, the second-to-last is at lastChildY - collapseOffset,
        // the third-to-last is at lastChildY - 2 * collapseOffset, and so on.
        final collapsedY = lastChildY - (numChildren - 1 - i) * collapseOffset;

        // Interpolate between expanded and collapsed positions
        targetY = collapsedY + (expandedY - collapsedY) * animation.value;
      }

      // Position the child
      child.position(Offset(0, targetY));
    }

    // Step 4: Return the total size of the layout
    return Size(maxWidth, totalHeightExpanded);
  }
  /*
  @override
  Size layout() {
    print('animation.value: ${animation.value}');

    print('constraints: $constraints');

// Find the max intrinsic width of each child
    //
    // Intrinsics are a little scary but `getMaxIntrinsicWidth(double.infinity)`
    // just calculates the width of the child as if its maximum height is
    // infinite
    final widths = <double>[];
    final heights = <double>[];
    for (final child in children.reversed) {
      final width = child.render.getMaxIntrinsicWidth(double.infinity);
      widths.add(width);
      final height = child.render.getMinIntrinsicHeight(width);
      heights.add(height);
      child.layout(constraints);
    }
    print('widths: $widths');
    final consumedWidth = widths.reduce(max);

    // Find the max intrinsic height
    //
    // We calculate childHeight after childWidth because the height of text
    // depends on its width (i.e. wrapping), `getMinIntrinsicHeight(childWidth)`
    // calculates what the child's height would be if it's width is childWidth.
    print('heights: $heights');

    var consumedHeight = heights.fold<double>(0, (v, e) => v + e);

    // for (final (i, child) in children.indexed) {
    //   child.layout(constraints);
    //
    //   final previousHeights =
    //       heights.sublist(0, i).fold<double>(0, (a, b) => a + b);
    //   child.position(Offset(0, previousHeights));
    // }

    double bottomToastY = 0;
    for (final (i, child) in children.reversed.indexed) {
      final previousHeights =
          heights.sublist(i + 1).fold<double>(0, (a, b) => a + b);
      print('previousHeights: $previousHeights for $i');
      if (i == 0) {
        bottomToastY = consumedHeight - child.size.height;
        child.position(Offset(0, consumedHeight - child.size.height));
        continue;
      }

      child.position(
          Offset(0, previousHeights + ((heights[i] - 16) * animation.value)));
    }

    return Size(consumedWidth, consumedHeight);
    // Get handles
    // final toast0 = getChild('toast0');
    // final toast1 = getChild('toast1');
    // final toast2 = getChild('toast2');
    // Layout and position
    // toast0.layout(constraints);
    // toast1.layout(constraints);
    // Offset newOffset = toast0.rect.bottomLeft + gapOffset;
    // print('oldOffset: $newOffset');
    // toast1.position(newOffset);
    // newOffset = Offset(newOffset.dx, newOffset.dy * animation.value);
    // print('newOffset: $newOffset');
    // toast1.position(newOffset);
    // toast2.layout(constraints);
    // final middle = toast0.size.height - toast2.size.height / 2;
    // toast2.position(Offset(0, middle));
    // Return size
    // return toast0.size + Offset(0, toast1.size.height) + gapOffset;
  }*/
}
