import 'dart:ui';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shadcn_ui/src/components/button.dart';
import 'package:shadcn_ui/src/components/context_menu.dart';
import 'package:shadcn_ui/src/components/popover.dart';
import 'package:shadcn_ui/src/raw_components/portal.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/utils/provider.dart';
import 'package:shadcn_ui/src/utils/provider_index.dart';

class ShadMenubarController extends ChangeNotifier {
  int? _selectedIndex;

  int? get selectedIndex => _selectedIndex;

  set selectedIndex(int? value) {
    if (_selectedIndex == value) return;
    _selectedIndex = value;
    notifyListeners();
  }

  final _focusNodes = <FocusNode>[];

  FocusNode getFocusNodeForIndex(int index) {
    if (index >= _focusNodes.length) {
      for (var i = _focusNodes.length; i <= index; i++) {
        _focusNodes.add(FocusNode());
      }
    }
    return _focusNodes[index];
  }

  @override
  void dispose() {
    for (final node in _focusNodes) {
      node.dispose();
    }
    _focusNodes.clear();

    super.dispose();
  }
}

class ShadMenubar extends StatefulWidget {
  const ShadMenubar({
    super.key,
    required this.items,
    this.radius,
    this.controller,
  });

  final Iterable<Widget> items;
  final BorderRadiusGeometry? radius;
  final ShadMenubarController? controller;

  @override
  State<ShadMenubar> createState() => _ShadMenubarState();
}

class _ShadMenubarState extends State<ShadMenubar> {
  int? focusedIndex;
  ShadMenubarController? _controller;

  ShadMenubarController get controller => widget.controller ?? _controller!;

  @override
  void initState() {
    super.initState();
    if (widget.controller == null) {
      _controller = ShadMenubarController();
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final effectiveRadius = widget.radius ?? theme.radius;
    return ShadProvider(
      data: controller,
      notifyUpdate: (oldState) {
        return oldState.data != controller;
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(
            color: theme.colorScheme.border,
          ),
          borderRadius: effectiveRadius,
        ),
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: widget.items
                .mapIndexed(
                  (i, item) => ShadIndexProvider(index: i, child: item),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}

class ShadMenubarItem extends StatefulWidget {
  const ShadMenubarItem({
    super.key,
    required this.child,
    required this.items,
    this.constraints,
    this.onHoverArea,
    this.padding,
    this.groupId,
    this.effects,
    this.shadows,
    this.decoration,
    this.filter,
    this.controller,
  });

  final Widget child;

  /// {@macro ShadContextMenu.items}
  final List<Widget> items;

  /// {@macro ShadContextMenu.constraints}
  final BoxConstraints? constraints;

  /// {@macro ShadContextMenu.onHoverArea}
  final ValueChanged<bool>? onHoverArea;

  /// {@macro ShadContextMenu.padding}
  final EdgeInsetsGeometry? padding;

  /// {@macro ShadMouseArea.groupId}
  final Object? groupId;

  /// {@macro ShadPopover.effects}
  final List<Effect<dynamic>>? effects;

  /// {@macro ShadPopover.shadows}
  final List<BoxShadow>? shadows;

  /// {@macro ShadPopover.decoration}
  final ShadDecoration? decoration;

  /// {@macro ShadPopover.filter}
  final ImageFilter? filter;

  /// {@macro ShadPopover.controller}
  final ShadPopoverController? controller;

  @override
  State<ShadMenubarItem> createState() => _ShadMenubarItemState();
}

class _ShadMenubarItemState extends State<ShadMenubarItem> {
  ShadPopoverController? _popoverController;

  ShadPopoverController get popoverController =>
      widget.controller ?? _popoverController!;

  @override
  void initState() {
    super.initState();
    if (widget.controller == null) {
      _popoverController = ShadPopoverController();
    }
  }

  @override
  void dispose() {
    _popoverController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final controller = context.watch<ShadMenubarController>();
    final index = context.watch<ShadProviderIndex>().index;
    final focusNode = controller.getFocusNodeForIndex(index);

    return ListenableBuilder(
      listenable: controller,
      builder: (context, child) {
        final selected = controller.selectedIndex == index;
        popoverController.setOpen(selected);
        return ShadContextMenu(
          anchor: const ShadAnchor(offset: Offset(-8, 8)),
          controller: popoverController,
          items: widget.items,
          constraints: widget.constraints,
          onHoverArea: widget.onHoverArea,
          padding: widget.padding,
          groupId: widget.groupId,
          effects: widget.effects,
          shadows: widget.shadows,
          decoration: widget.decoration,
          filter: widget.filter,
          onTapUpInside: (_) {
            FocusScope.of(context).unfocus();
            controller.selectedIndex = null;
          },
          child: ShadButton.ghost(
            height: 32,
            backgroundColor: selected ? theme.colorScheme.accent : null,
            focusNode: focusNode,
            onFocusChange: (focused) {
              if (!focused) return;
              controller.selectedIndex = index;
            },
            onHoverChange: (hovered) {
              if (!hovered) return;
              focusNode.requestFocus();
            },
            decoration: const ShadDecoration(
              disableSecondaryBorder: true,
            ),
            onPressed: () {
              if (!popoverController.isOpen && selected) {
                popoverController.show();
              } else {
                controller.selectedIndex = selected ? null : index;
              }
            },
            child: child,
          ),
        );
      },
      child: widget.child,
    );
  }
}
