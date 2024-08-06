import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ShadContextMenu extends StatefulWidget {
  const ShadContextMenu({
    super.key,
    required this.child,
    required this.children,
    this.anchor,
    this.visible,
    this.constraints,
  });

  final Widget child;
  final List<Widget> children;
  final ShadAnchor? anchor;
  final bool? visible;
  final BoxConstraints? constraints;

  @override
  State<ShadContextMenu> createState() => _ShadContextMenuState();
}

class _ShadContextMenuState extends State<ShadContextMenu> {
  late bool visible = widget.visible ?? false;
  Offset? offset;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant ShadContextMenu oldWidget) {
    super.didUpdateWidget(oldWidget);
    visible = widget.visible ?? visible;
  }

  @override
  Widget build(BuildContext context) {
    final effectiveConstraints =
        widget.constraints ?? const BoxConstraints(minWidth: 150);

    return ShadGestureDetector(
      onTapDown: (_) {
        if (visible) setState(() => visible = false);
      },
      onSecondaryTapDown: (d) {
        setState(() {
          offset = d.globalPosition;
          visible = true;
        });
      },
      child: ShadPopover(
        visible: visible,
        padding: EdgeInsets.zero,
        anchor: widget.anchor ??
            (offset != null ? ShadGlobalAnchor(offset!) : null),
        popover: (context) {
          return ConstrainedBox(
            constraints: effectiveConstraints,
            child: IntrinsicWidth(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: widget.children,
              ),
            ),
          );
        },
        child: widget.child,
      ),
    );
  }
}

class ShadContextMenuItem extends StatefulWidget {
  const ShadContextMenuItem({
    super.key,
    required this.child,
    this.children = const [],
  });

  final Widget child;
  final List<Widget> children;

  @override
  State<ShadContextMenuItem> createState() => _ShadContextMenuItemState();
}

class _ShadContextMenuItemState extends State<ShadContextMenuItem> {
  bool visible = false;
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final hasTrailingIcon = widget.children.isNotEmpty;

    return ShadContextMenu(
      visible: visible,
      anchor: const ShadAnchor(
        childAlignment: Alignment.centerLeft,
        overlayAlignment: Alignment.centerRight,
        offset: Offset(0, 2),
      ),
      child: ShadButton.raw(
        height: 32,
        variant: ShadButtonVariant.ghost,
        width: double.infinity,
        icon: hasTrailingIcon
            ? const ShadImage.square(LucideIcons.chevronRight, size: 16)
            : null,
        textDirection: hasTrailingIcon ? TextDirection.rtl : null,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        backgroundColor: visible ? theme.colorScheme.accent : null,
        onHoverChange: (hovered) {
          if (pressed) return;
          print(hovered);
          setState(() {
            visible = hovered;
          });
        },
        child: widget.child,
      ),
      children: widget.children,
    );
  }
}
