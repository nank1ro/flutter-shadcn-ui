import 'package:flutter/widgets.dart';

import 'package:shadcn_ui/src/components/sidebar/sidebar_controller.dart';
import 'package:shadcn_ui/src/components/sidebar/sidebar_scope.dart';
import 'package:shadcn_ui/src/theme/theme.dart';

/// A button that toggles the sidebar open / closed.
///
/// By default, finds the nearest [ShadSidebarScope] and toggles its
/// controller. For **dual-sidebar** setups, pass an explicit [controller]
/// to target a specific sidebar:
///
/// ```dart
/// ShadSidebarTrigger()                              // nearest sidebar
/// ShadSidebarTrigger(controller: startController)   // specific sidebar
/// ```
class ShadSidebarTrigger extends StatelessWidget {
  const ShadSidebarTrigger({
    super.key,
    this.controller,
    this.child,
    this.size,
    this.padding,
    this.onPressed,
  });

  /// If provided, this controller is toggled instead of looking up
  /// the nearest [ShadSidebarScope].
  ///
  /// Useful in dual-sidebar setups where the trigger is placed in the
  /// main content area and needs to target a specific sidebar.
  final ShadSidebarController? controller;

  /// Custom content for the trigger button.
  /// Defaults to a panel-left icon.
  final Widget? child;

  /// Size (width & height) of the trigger button.
  final double? size;

  /// Padding around the trigger button.
  final EdgeInsetsGeometry? padding;

  /// Optional callback invoked **in addition** to toggling the sidebar.
  final VoidCallback? onPressed;

  ShadSidebarController _resolveController(BuildContext context) {
    if (controller != null) return controller!;
    return ShadSidebarScope.of(context).controller;
  }

  bool _resolveIsOpen(BuildContext context) {
    if (controller != null) return controller!.isOpen;
    return ShadSidebarScope.of(context).isOpen;
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final sidebarTheme = theme.sidebarTheme;

    final effectiveSize = size ?? sidebarTheme.triggerSize ?? 36.0;
    final effectivePadding =
        padding ?? sidebarTheme.triggerPadding ?? EdgeInsets.zero;

    final resolvedController = _resolveController(context);
    final isOpen = _resolveIsOpen(context);

    return Padding(
      padding: effectivePadding,
      child: Semantics(
        button: true,
        label: isOpen ? 'Close sidebar' : 'Open sidebar',
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              resolvedController.toggle();
              onPressed?.call();
            },
            child: SizedBox(
              width: effectiveSize,
              height: effectiveSize,
              child: Center(
                child: child ?? _DefaultTriggerIcon(size: effectiveSize * 0.5),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _DefaultTriggerIcon extends StatelessWidget {
  const _DefaultTriggerIcon({required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _PanelLeftPainter(color: theme.colorScheme.foreground),
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
