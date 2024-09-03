import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/utils/responsive.dart';

extension ShadBreakpointsExt on BuildContext {
  ShadBreakpoint get breakpoint {
    final width = MediaQuery.sizeOf(this).width;
    final breakpoints = ShadTheme.of(this).breakpoints;
    return breakpoints.fromWidth(width);
  }
}
