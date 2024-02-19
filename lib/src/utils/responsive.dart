import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:shadcn_ui/src/theme/theme.dart';

class ShadBreakpoints {
  ShadBreakpoints({
    double tiny = 0,
    double sm = 640,
    double md = 768,
    double lg = 1024,
    double xl = 1280,
    double xxl = 1536,
  })  : tiny = ShadBreakpointTiny(tiny),
        sm = ShadBreakpointSmall(sm),
        md = ShadBreakpointMedium(md),
        lg = ShadBreakpointLarge(lg),
        xl = ShadBreakpointExtraLarge(xl),
        xxl = ShadBreakpointExtraExtraLarge(xxl);

  final ShadBreakpoint tiny;
  final ShadBreakpoint sm;
  final ShadBreakpoint md;
  final ShadBreakpoint lg;
  final ShadBreakpoint xl;
  final ShadBreakpoint xxl;

  ShadBreakpoint fromWidth(double width) {
    if (width < sm.value) return tiny;
    if (width < md.value) return sm;
    if (width < lg.value) return md;
    if (width < xl.value) return lg;
    if (width < xxl.value) return xl;
    return xxl;
  }

  static ShadBreakpoints lerp(
    ShadBreakpoints? a,
    ShadBreakpoints? b,
    double t,
  ) {
    return ShadBreakpoints(
      tiny: ShadBreakpoint.lerp(a!.tiny, b!.tiny, t),
      sm: ShadBreakpoint.lerp(a.sm, b.sm, t),
      md: ShadBreakpoint.lerp(a.md, b.md, t),
      lg: ShadBreakpoint.lerp(a.lg, b.lg, t),
      xl: ShadBreakpoint.lerp(a.xl, b.xl, t),
      xxl: ShadBreakpoint.lerp(a.xxl, b.xxl, t),
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
