import 'dart:math';

import 'package:boxy/boxy.dart';
import 'package:flutter/widgets.dart';

class ShadSameWidthColumn extends StatelessWidget {
  const ShadSameWidthColumn({
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
    var childrenHeight = 0.0;
    var y = 0.0;
    for (final child in children) {
      final childHeight = max(
        constraints.heightConstraints().minHeight,
        child.render.getMinIntrinsicHeight(childWidth),
      );
      childrenHeight += childHeight;
      final childConstraints = BoxConstraints.tight(
        Size(childWidth, childHeight),
      );
      child
        ..layout(childConstraints)
        ..position(Offset(0, y));
      y += childHeight;
    }
    return Size(childWidth, childrenHeight);
  }
}
