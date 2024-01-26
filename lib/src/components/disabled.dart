import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/utils/debug_check.dart';

class ShadDisabled extends StatelessWidget {
  const ShadDisabled({
    super.key,
    required this.disabled,
    required this.child,
  });

  final bool disabled;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasShadcnTheme(context));
    final theme = ShadcnTheme.of(context);
    return Opacity(
      opacity: disabled ? theme.disabledOpacity : 1,
      child: AbsorbPointer(
        absorbing: disabled,
        child: child,
      ),
    );
  }
}
