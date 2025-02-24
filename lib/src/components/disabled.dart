import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/utils/debug_check.dart';

/// A widget that disables its child by preventing interaction and applying
/// visual cues.
///
/// The [ShadDisabled] widget wraps a child widget to make it non-interactive
/// when [disabled] is true, optionally adjusting its opacity and cursor to
/// indicate the disabled state. It integrates with [ShadTheme] for consistent
/// styling across the application.
class ShadDisabled extends StatelessWidget {
  /// Creates a widget that conditionally disables its child.
  const ShadDisabled({
    super.key,
    required this.disabled,
    required this.child,
    this.showForbiddenCursor = false,
    this.disabledOpacity,
  });

  /// {@template ShadDisabled.disabled}
  /// Whether the child widget is disabled.
  /// When true, the child becomes non-interactive and may be visually altered.
  /// {@endtemplate}
  final bool disabled;

  /// {@template ShadDisabled.child}
  /// The widget to be conditionally disabled.
  /// Receives the disabled behavior and styling applied by this widget.
  /// {@endtemplate}
  final Widget child;

  /// {@template ShadDisabled.showForbiddenCursor}
  /// Whether to display a forbidden cursor when the widget is disabled and
  /// hovered. Defaults to false; when true, uses
  /// [SystemMouseCursors.forbidden].
  /// {@endtemplate}
  final bool showForbiddenCursor;

  /// {@template ShadDisabled.disabledOpacity}
  /// The opacity applied to the child when disabled.
  /// Defaults to the theme’s [disabledOpacity] if not specified; ranges from
  /// 0.0 (transparent) to 1.0 (opaque).
  /// {@endtemplate}
  final double? disabledOpacity;

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

    final effectiveDisabledOpacity = disabledOpacity ?? theme.disabledOpacity;

    return Opacity(
      opacity: disabled ? effectiveDisabledOpacity : 1,
      child: view,
    );
  }
}
