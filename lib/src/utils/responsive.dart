import 'package:flutter/cupertino.dart';

enum ShadBreakpoint {
  tiny(0),
  sm(640),
  md(768),
  lg(1024),
  xl(1280),
  xxl(1536);

  const ShadBreakpoint(this.value);
  final double value;

  bool operator <(ShadBreakpoint other) {
    return value < other.value;
  }

  bool operator >(ShadBreakpoint other) {
    return value > other.value;
  }

  bool operator <=(ShadBreakpoint other) {
    return value <= other.value;
  }

  bool operator >=(ShadBreakpoint other) {
    return value >= other.value;
  }

  static ShadBreakpoint fromWidth(double width) {
    return switch (width) {
      < 640 => ShadBreakpoint.tiny,
      < 768 => ShadBreakpoint.sm,
      < 1024 => ShadBreakpoint.md,
      < 1280 => ShadBreakpoint.lg,
      < 1536 => ShadBreakpoint.xl,
      _ => ShadBreakpoint.xxl,
    };
  }
}

typedef ResponsiveWidgetBuilder = Widget Function(
  BuildContext context,
  ShadBreakpoint breakpoint,
);

class ShadResponsiveBuilder extends StatelessWidget {
  const ShadResponsiveBuilder({
    super.key,
    required this.builder,
  });

  final ResponsiveWidgetBuilder builder;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return builder(context, ShadBreakpoint.fromWidth(width));
  }
}
