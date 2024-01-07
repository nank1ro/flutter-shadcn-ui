import 'package:flutter/material.dart';

class ShadcnButton extends StatelessWidget {
  const ShadcnButton({
    super.key,
    required this.child,
    this.onPressed,
  });

  final VoidCallback? onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: onPressed == null ? .5 : 1,
      child: Material(
        child: InkWell(
          onTap: onPressed,
          child: child,
        ),
      ),
    );
  }
}
