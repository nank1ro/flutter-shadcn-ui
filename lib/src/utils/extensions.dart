import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/utils/responsive.dart';

extension ShadDuration on Duration {
  Duration operator +(Duration other) {
    return Duration(
      microseconds: inMicroseconds + other.inMicroseconds,
    );
  }

  Duration operator -(Duration other) {
    return Duration(
      microseconds: inMicroseconds - other.inMicroseconds,
    );
  }

  Duration operator *(Duration other) {
    return Duration(
      microseconds: inMicroseconds * other.inMicroseconds,
    );
  }

  Duration times(int by) {
    return Duration(
      microseconds: inMicroseconds * by,
    );
  }

  Duration operator /(Duration other) {
    return Duration(
      microseconds: inMicroseconds ~/ other.inMicroseconds,
    );
  }

  Duration divide(int by) {
    return Duration(
      microseconds: inMicroseconds ~/ by,
    );
  }
}

extension ShadBreakpoints on BuildContext {
  ShadBreakpoint get breakpoint {
    final width = MediaQuery.sizeOf(this).width;
    final breakpoints = ShadTheme.of(this).breakpoints;
    return breakpoints.fromWidth(width);
  }
}
