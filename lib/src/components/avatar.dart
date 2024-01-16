import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:shadcn_ui/src/utils/debug_check.dart';

class ShadcnAvatar extends StatelessWidget {
  const ShadcnAvatar(
    this.src, {
    super.key,
    this.fallback,
    this.size,
    this.shape,
    this.backgroundColor,
    this.package,
    this.fit,
  });

  final String src;
  final Widget? fallback;
  final Size? size;
  final ShapeBorder? shape;
  final Color? backgroundColor;
  final String? package;
  final BoxFit? fit;

  bool get isRemote => Uri.tryParse(src)?.host.isNotEmpty ?? false;

  Size effectiveSize(ShadcnThemeData theme) {
    return size ?? theme.avatarTheme.size ?? const Size.square(40);
  }

  ShapeBorder effectiveShape(ShadcnThemeData theme) {
    return shape ?? theme.avatarTheme.shape ?? const CircleBorder();
  }

  Color? effectiveBackgroundColor(ShadcnThemeData theme) {
    return backgroundColor ??
        theme.avatarTheme.backgroundColor ??
        theme.colorScheme.muted;
  }

  BoxFit? effectiveFit(ShadcnThemeData theme) {
    return fit ?? theme.avatarTheme.fit;
  }

  Widget frameBuilder(
    BuildContext context,
    Widget child,
    int? frame,
    bool wasSynchronouslyLoaded,
  ) {
    return frame == null ? fallback ?? const SizedBox.shrink() : child;
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasShadcnTheme(context));
    final theme = ShadcnTheme.of(context);

    final child = isRemote
        ? Image.network(
            src,
            frameBuilder: frameBuilder,
            fit: effectiveFit(theme),
          )
        : Image.asset(
            src,
            package: package,
            fit: effectiveFit(theme),
            frameBuilder: frameBuilder,
          );

    final size = effectiveSize(theme);

    return Container(
      width: size.width,
      height: size.height,
      clipBehavior: Clip.antiAlias,
      alignment: Alignment.center,
      decoration: ShapeDecoration(
        shape: effectiveShape(theme),
        color: effectiveBackgroundColor(theme),
      ),
      child: child,
    );
  }
}
