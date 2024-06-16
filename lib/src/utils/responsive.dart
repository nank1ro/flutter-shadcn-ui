import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/theme/theme.dart';

class ShadBreakpoints {
  ShadBreakpoints({
    double tiny = 0,
    double small = 640,
    double medium = 768,
    double large = 1024,
    double extraLarge = 1280,
    double extraExtraLarge = 1536,
  })  : tiny = ShadBreakpointTiny(tiny),
        small = ShadBreakpointSmall(small),
        medium = ShadBreakpointMedium(medium),
        large = ShadBreakpointLarge(large),
        extraLarge = ShadBreakpointExtraLarge(extraLarge),
        extraExtraLarge = ShadBreakpointExtraExtraLarge(extraExtraLarge);

  final ShadBreakpoint tiny;
  final ShadBreakpoint small;
  final ShadBreakpoint medium;
  final ShadBreakpoint large;
  final ShadBreakpoint extraLarge;
  final ShadBreakpoint extraExtraLarge;

  ShadBreakpoint fromWidth(double width) {
    if (width < small.value) return tiny;
    if (width < medium.value) return small;
    if (width < large.value) return medium;
    if (width < extraLarge.value) return large;
    if (width < extraExtraLarge.value) return extraLarge;
    return extraExtraLarge;
  }

  static ShadBreakpoints lerp(
    ShadBreakpoints? a,
    ShadBreakpoints? b,
    double t,
  ) {
    return ShadBreakpoints(
      tiny: ShadBreakpoint.lerp(a!.tiny, b!.tiny, t),
      small: ShadBreakpoint.lerp(a.small, b.small, t),
      medium: ShadBreakpoint.lerp(a.medium, b.medium, t),
      large: ShadBreakpoint.lerp(a.large, b.large, t),
      extraLarge: ShadBreakpoint.lerp(a.extraLarge, b.extraLarge, t),
      extraExtraLarge:
          ShadBreakpoint.lerp(a.extraExtraLarge, b.extraExtraLarge, t),
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
