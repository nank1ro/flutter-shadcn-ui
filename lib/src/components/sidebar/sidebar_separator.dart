import 'package:flutter/widgets.dart';

import 'package:shadcn_ui/src/theme/theme.dart';

/// A horizontal divider line used inside a [ShadSidebar] to visually
/// separate groups or items.
///
/// This is a thin wrapper that applies sidebar-specific padding and
/// styling. Customization follows the three-tier cascade:

class ShadSidebarSeparator extends StatelessWidget {
  const ShadSidebarSeparator({
    super.key,
    this.padding,
    this.color,
    this.thickness,
  });

  /// Padding around the separator line.
  final EdgeInsetsGeometry? padding;

  /// Color of the separator line.
  final Color? color;

  /// Thickness of the separator line. Defaults to 1.
  final double? thickness;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final sidebarTheme = theme.sidebarTheme;
    final colorScheme = theme.colorScheme;

    final effectivePadding =
        padding ??
        sidebarTheme.separatorPadding ??
        const EdgeInsets.symmetric(horizontal: 12, vertical: 4);

    final effectiveColor =
        color ??
        sidebarTheme.separatorColor ??
        colorScheme.sidebarBorder ??
        colorScheme.border;

    final effectiveThickness =
        thickness ?? sidebarTheme.separatorThickness ?? 1.0;

    return Padding(
      padding: effectivePadding,
      child: CustomPaint(
        size: Size(double.infinity, effectiveThickness),
        painter: _SeparatorPainter(
          color: effectiveColor,
          thickness: effectiveThickness,
        ),
      ),
    );
  }
}

class _SeparatorPainter extends CustomPainter {
  _SeparatorPainter({
    required this.color,
    required this.thickness,
  });

  final Color color;
  final double thickness;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = thickness
      ..style = PaintingStyle.stroke;

    final y = size.height / 2;
    canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
  }

  @override
  bool shouldRepaint(_SeparatorPainter oldDelegate) {
    return oldDelegate.color != color || oldDelegate.thickness != thickness;
  }
}
