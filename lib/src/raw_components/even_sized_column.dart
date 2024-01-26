import 'dart:math';

import 'package:boxy/boxy.dart';
import 'package:flutter/widgets.dart';

class ShadEvenSizedColumn extends StatelessWidget {
  const ShadEvenSizedColumn({
    super.key,
    required this.children,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return CustomBoxy(
      delegate: _EvenSizedColumnBoxy(),
      children: children,
    );
  }
}

class _EvenSizedColumnBoxy extends BoxyDelegate {
  @override
  Size layout() {
    var childWidth = constraints.widthConstraints().minWidth;
    for (final child in children) {
      childWidth = max(
        childWidth,
        child.render.getMaxIntrinsicWidth(double.infinity),
      );
    }

    var childHeight = constraints.heightConstraints().minHeight;
    for (final child in children) {
      childHeight = max(
        childHeight,
        child.render.getMinIntrinsicHeight(childWidth),
      );
    }

    final childConstraints = BoxConstraints.tight(
      Size(childWidth, childHeight),
    );

    var x = 0.0;
    for (final child in children) {
      child
        ..layout(childConstraints)
        ..position(Offset(0, x));
      x += childHeight;
    }

    return Size(childWidth, childHeight * children.length);
  }
}
