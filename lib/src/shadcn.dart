import 'package:flutter/material.dart';
import 'package:shadcn_ui/src/theme.dart';

class Shadcn extends StatelessWidget {
  const Shadcn({
    super.key,
    required this.child,
    this.textDirection = TextDirection.ltr,
    this.themeData,
  });

  final TextDirection textDirection;
  final Widget child;
  final ShadcnThemeData? themeData;

  @override
  Widget build(BuildContext context) {
    final effectiveThemeData = themeData ?? ShadcnThemeData();
    return AnimatedShadcnTheme(
      data: effectiveThemeData,
      child: Directionality(
        textDirection: textDirection,
        child: child,
      ),
    );
  }
}
