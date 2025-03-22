import 'dart:math';

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
      AnimationController(vsync: this, duration: Duration(milliseconds: 400));
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
            ColoredBox(
              color: Colors.red,
              child: ListenableBuilder(
                  listenable: animationController,
                  builder: (context, _) {
                    return CustomBoxy(
                      delegate: MyBoxy(
                        gap: 8,
                        animation: animationController,
                      ),
                      children: [
                        BoxyId(
                          id: 'toast0',
                          child: ShadToast(
                            title: Text('Title0'),
                            description: Text('description0'),
                          ),
                        ),
                        BoxyId(
                          id: 'toast1',
                          child: ShadToast(
                            title: Text('Title1'),
                            description: Text('description1'),
                          ),
                        ),
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
    // return BaseScaffold(
    //   appBarTitle: 'Sonner',
    //   editable: [
    //     MyEnumProperty<Alignm>(
    //         label: 'Alignment',
    //         value: alignment,
    //         values: Alignm.values,
    //         onChanged: (v) {
    //           if (v != null) {
    //             setState(() {
    //               alignment = v;
    //             });
    //           }
    //         })
    //   ],
    //   children: [
    //     CustomBoxy
    //     // ShadButton.outline(
    //     //   child: const Text('Add to calendar'),
    //     //   onPressed: () {
    //     //     final sonner = ShadSonner.of(context);
    //     //     final randomId = Random().nextInt(1000000);
    //     //     sonner.show(
    //     //       ShadToast(
    //     //         id: randomId,
    //     //         alignment: alignment.toAlignment(),
    //     //         title: const Text('Scheduled: Catch up'),
    //     //         description: Text(DateTime.now().toString()),
    //     //         action: ShadButton(
    //     //           padding: const EdgeInsets.symmetric(horizontal: 8),
    //     //           height: 24,
    //     //           child: const Text('Undo',
    //     //               style:
    //     //                   TextStyle(fontSize: 12, fontWeight: FontWeight.w400)),
    //     //           onPressed: () => sonner.hide(randomId),
    //     //         ),
    //     //       ),
    //     //     );
    //     //   },
    //     // )
    //   ],
    // );
  }
}

class MyBoxy extends BoxyDelegate {
  MyBoxy({
    required this.gap,
    required this.animation,
  }) : super(relayout: animation);

  final double gap;
  final Animation<double> animation;

  @override
  Size layout() {
    print('animation.value: ${animation.value}');

// Find the max intrinsic width of each child
    //
    // Intrinsics are a little scary but `getMaxIntrinsicWidth(double.infinity)`
    // just calculates the width of the child as if its maximum height is
    // infinite
    var childWidth = 0.0;
    for (final child in children) {
      childWidth = max(
        childWidth,
        child.render.getMaxIntrinsicWidth(double.infinity),
      );
    }

    // Find the max intrinsic height
    //
    // We calculate childHeight after childWidth because the height of text
    // depends on its width (i.e. wrapping), `getMinIntrinsicHeight(childWidth)`
    // calculates what the child's height would be if it's width is childWidth.
    var consumedHeight = 0.0;
    for (final child in children) {
      consumedHeight += child.render.getMinIntrinsicHeight(childWidth);
    }
    print('consumedWitdh: $childWidth');
    print('consumedHeight: $consumedHeight');
    final gapOffset = Offset(0, gap);
    // Get handles
    final toast0 = getChild('toast0');
    final toast1 = getChild('toast1');
    // final toast2 = getChild('toast2');
    // Layout and position
    toast0.layout(constraints);
    toast1.layout(constraints);
    Offset newOffset = toast0.rect.bottomLeft + gapOffset;
    print('oldOffset: $newOffset');
    toast1.position(newOffset);
    // newOffset = Offset(newOffset.dx, newOffset.dy * animation.value);
    print('newOffset: $newOffset');
    // toast1.position(newOffset);
    // toast2.layout(constraints);
    // final middle = toast0.size.height - toast2.size.height / 2;
    // toast2.position(Offset(0, middle));
    // Return size
    return toast0.size + Offset(0, toast1.size.height) + gapOffset;
  }
}
