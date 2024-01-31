import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/utils/debug_check.dart';

class ShadDisabled extends StatelessWidget {
  const ShadDisabled({
    super.key,
    required this.disabled,
    required this.child,
    this.showForbiddenCursor = false,
  });

  final bool disabled;
  final Widget child;
  final bool showForbiddenCursor;

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasShadTheme(context));
    final theme = ShadTheme.of(context);

    Widget view = AbsorbPointer(
      absorbing: disabled,
      child: child,
    );

    if (showForbiddenCursor && disabled) {
      view = MouseRegion(cursor: SystemMouseCursors.forbidden, child: view);
    }

    return Opacity(opacity: disabled ? theme.disabledOpacity : 1, child: view);
  }
}
