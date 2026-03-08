import 'package:flutter/widgets.dart';

import 'package:shadcn_ui/src/components/button.dart';
import 'package:shadcn_ui/src/components/sidebar/sidebar_controller.dart';
import 'package:shadcn_ui/src/components/sidebar/sidebar_scope.dart';
import 'package:shadcn_ui/src/theme/theme.dart';

/// A button that toggles the sidebar open / closed.
///
/// By default, finds the nearest [ShadSidebarScope] and toggles its
/// controller. For dual-sidebar setups, pass an explicit [controller].
///
/// ```dart
/// ShadSidebarTrigger()                              // nearest sidebar
/// ShadSidebarTrigger(controller: startController)   // specific sidebar
/// ```
class ShadSidebarTrigger extends StatelessWidget {
  const ShadSidebarTrigger({
    super.key,
    this.controller,
    this.icon,
    this.size,
    this.padding,
    this.onPressed,
  });

  /// If provided, this controller is toggled instead of the nearest scope.
  final ShadSidebarController? controller;

  /// Custom icon for the trigger button.
  /// Defaults to a panel-left icon.
  final Widget? icon;

  /// Size (width & height) of the trigger button.
  final double? size;

  /// Padding around the trigger button.
  final EdgeInsetsGeometry? padding;

  /// Optional callback invoked **in addition** to toggling the sidebar.
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final sidebarTheme = theme.sidebarTheme;
    final scope = ShadSidebarScope.maybeOf(context);

    final resolvedController = controller ?? scope?.controller;
    final isOpen = controller?.isOpen ?? scope?.isOpen ?? true;

    final effectiveSize = size ?? sidebarTheme.triggerSize ?? 36.0;
    final effectivePadding =
        padding ?? sidebarTheme.triggerPadding ?? EdgeInsets.zero;

    final effectiveIcon =
        icon ??
        _DefaultTriggerIcon(
          size: effectiveSize * 0.5,
          color: theme.colorScheme.foreground,
        );

    return Semantics(
      button: true,
      label: isOpen ? 'Close sidebar' : 'Open sidebar',
      child: Padding(
        padding: effectivePadding,
        child: ShadButton.ghost(
          onPressed: () {
            resolvedController?.toggle();
            onPressed?.call();
          },
          width: effectiveSize,
          height: effectiveSize,
          padding: EdgeInsets.zero,
          leading: effectiveIcon,
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Default trigger icon
// ---------------------------------------------------------------------------

class _DefaultTriggerIcon extends StatelessWidget {
  const _DefaultTriggerIcon({
    required this.size,
    required this.color,
  });

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _PanelLeftPainter(color: color),
      ),
    );
  }
}

class _PanelLeftPainter extends CustomPainter {
  _PanelLeftPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final rect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      const Radius.circular(2),
    );
    canvas.drawRRect(rect, paint);

    final dividerX = size.width * 0.33;
    canvas.drawLine(
      Offset(dividerX, 0),
      Offset(dividerX, size.height),
      paint,
    );
  }

  @override
  bool shouldRepaint(_PanelLeftPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}
