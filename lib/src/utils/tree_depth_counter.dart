import 'package:flutter/material.dart';
import 'package:shadcn_ui/src/utils/provider.dart';

class ShadDepthCounter {
  const ShadDepthCounter(this.depth);

  final int depth;
}

class ShadTreeDepthCounter extends StatelessWidget {
  const ShadTreeDepthCounter({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final depthCounter =
        context.maybeRead<ShadDepthCounter>() ?? const ShadDepthCounter(-1);

    return ShadProvider(
      data: ShadDepthCounter(depthCounter.depth + 1),
      child: child,
    );
  }
}
