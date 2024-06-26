import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:shadcn_ui/src/theme/theme.dart';

class ShadBreakpoints {
  ShadBreakpoints({
    double tiny = 0,
    double small = 640,
    double medium = 768,
    double large = 1024,
    double xlarge = 1280,
    double xxlarge = 1536,
  })  : tn = ShadBreakpointTiny(tiny),
        sm = ShadBreakpointSmall(small),
        md = ShadBreakpointMedium(medium),
        l = ShadBreakpointLarge(large),
        xl = ShadBreakpointExtraLarge(xlarge),
        xxl = ShadBreakpointExtraExtraLarge(xxlarge);

  final ShadBreakpoint tn;
  final ShadBreakpoint sm;
  final ShadBreakpoint md;
  final ShadBreakpoint l;
  final ShadBreakpoint xl;
  final ShadBreakpoint xxl;

  ShadBreakpoint fromWidth(double width) {
    if (width < sm.value) return tn;
    if (width < md.value) return sm;
    if (width < l.value) return md;
    if (width < xl.value) return l;
    if (width < xxl.value) return xl;
    return xxl;
  }

  static ShadBreakpoints lerp(
    ShadBreakpoints? a,
    ShadBreakpoints? b,
    double t,
  ) {
    return ShadBreakpoints(
      tiny: ShadBreakpoint.lerp(a!.tn, b!.tn, t),
      small: ShadBreakpoint.lerp(a.sm, b.sm, t),
      medium: ShadBreakpoint.lerp(a.md, b.md, t),
      large: ShadBreakpoint.lerp(a.l, b.l, t),
      xlarge: ShadBreakpoint.lerp(a.xl, b.xl, t),
      xxlarge: ShadBreakpoint.lerp(a.xxl, b.xxl, t),
    );
  }
}

sealed class ShadBreakpoint {
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

  static double lerp(ShadBreakpoint a, ShadBreakpoint b, double t) {
    return lerpDouble(a.value, b.value, t)!;
  }
}

class ShadBreakpointTiny extends ShadBreakpoint {
  const ShadBreakpointTiny(super.value);
}

class ShadBreakpointSmall extends ShadBreakpoint {
  const ShadBreakpointSmall(super.value);
}

class ShadBreakpointMedium extends ShadBreakpoint {
  const ShadBreakpointMedium(super.value);
}

class ShadBreakpointLarge extends ShadBreakpoint {
  const ShadBreakpointLarge(super.value);
}

class ShadBreakpointExtraLarge extends ShadBreakpoint {
  const ShadBreakpointExtraLarge(super.value);
}

class ShadBreakpointExtraExtraLarge extends ShadBreakpoint {
  const ShadBreakpointExtraExtraLarge(super.value);
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
    final breakpoints = ShadTheme.of(context).breakpoints;
    final breakpoint = breakpoints.fromWidth(width);
    return builder(context, breakpoint);
  }
}
