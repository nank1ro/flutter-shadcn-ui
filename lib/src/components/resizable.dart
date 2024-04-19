import 'package:flutter/material.dart';
import 'package:shadcn_ui/src/theme/theme.dart';

import 'package:shadcn_ui/src/utils/provider.dart';

class ShadResizablePanelGroup extends StatefulWidget {
  const ShadResizablePanelGroup({
    super.key,
    required this.children,
    this.axis = Axis.horizontal,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.mainAxisSize,
    this.textDirection,
    this.verticalDirection,
  });

  final Axis axis;
  final List<Widget> children;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisSize? mainAxisSize;
  final TextDirection? textDirection;
  final VerticalDirection? verticalDirection;

  @override
  ShadResizablePanelGroupState createState() => ShadResizablePanelGroupState();
}

class ShadResizablePanelGroupState extends State<ShadResizablePanelGroup> {
  final resizableWidgetToSizeMap = <Key, double>{};

  /// Contains the keys of all the panels and handles, the order is important
  /// for the resize logic
  final resizableWidgets = <Key>[];

  void registerPanel({
    required Key key,
    required double size,
  }) {
    resizableWidgets.add(key);
    resizableWidgetToSizeMap[key] = size;
  }

  void registerHandle({required Key key, required double size}) {
    resizableWidgets.add(key);
    resizableWidgetToSizeMap[key] = size;
  }

  double getPanelSize(Key key) {
    final size = resizableWidgetToSizeMap[key];
    if (size == null) throw Exception('Panel size not found for key: $key');
    return size;
  }

  void onHandleDrag({required Key key, required Offset offset}) {
    final indexOfHandle = resizableWidgets.indexOf(key);
    final indexOfLeadingPanel = indexOfHandle - 1;
    final indexOfTrailingPanel = indexOfHandle + 1;

    final leadingPanelKey = resizableWidgets[indexOfLeadingPanel];
    final trailingPanelKey = resizableWidgets[indexOfTrailingPanel];

    final sizeOfLeadingPanel = resizableWidgetToSizeMap[leadingPanelKey]!;
    final sizeOfTrailingPanel = resizableWidgetToSizeMap[trailingPanelKey]!;

    final axisOffset = widget.axis == Axis.horizontal ? offset.dx : offset.dy;

    final newLeadingSize = sizeOfLeadingPanel + axisOffset;
    final newTrailingSize = sizeOfTrailingPanel - axisOffset;
    // cannot resize, the panel size cannot be lower than 0
    if (newLeadingSize < 0 || newTrailingSize < 0) return;

    setState(() {
      resizableWidgetToSizeMap[leadingPanelKey] = newLeadingSize;
      resizableWidgetToSizeMap[trailingPanelKey] = newTrailingSize;
    });
  }

  @override
  Widget build(BuildContext context) {
    final child = Flex(
      direction: widget.axis,
      mainAxisAlignment: widget.mainAxisAlignment ?? MainAxisAlignment.start,
      crossAxisAlignment:
          widget.crossAxisAlignment ?? CrossAxisAlignment.center,
      mainAxisSize: widget.mainAxisSize ?? MainAxisSize.max,
      textDirection: widget.textDirection,
      verticalDirection: widget.verticalDirection ?? VerticalDirection.down,
      children: widget.children,
    );

    return ShadProvider(
      data: this,
      notifyUpdate: (_) => true,
      child: switch (widget.axis) {
        Axis.horizontal => IntrinsicHeight(child: child),
        Axis.vertical => child,
      },
    );
  }
}

class ShadResizablePanel extends StatefulWidget {
  const ShadResizablePanel({
    super.key,
    required this.child,
    required this.initialSize,
  });

  final Widget child;
  final double initialSize;

  @override
  State<ShadResizablePanel> createState() => _ShadResizablePanelState();
}

class _ShadResizablePanelState extends State<ShadResizablePanel> {
  final panelKey = UniqueKey();

  @override
  void initState() {
    super.initState();
    context
        .read<ShadResizablePanelGroupState>()
        .registerPanel(key: panelKey, size: widget.initialSize);
  }

  @override
  Widget build(BuildContext context) {
    final inherited = context.watch<ShadResizablePanelGroupState>();
    final axis = inherited.widget.axis;
    final theme = ShadTheme.of(context);

    final panelSize = inherited.getPanelSize(panelKey);
    final effectiveChild = SizedBox(
      width: axis == Axis.horizontal ? panelSize : null,
      height: axis == Axis.vertical ? panelSize : null,
      child: widget.child,
    );

    return ColoredBox(
      color: theme.colorScheme.background,
      child: effectiveChild,
    );
  }
}

class ShadResizableHandle extends StatefulWidget {
  const ShadResizableHandle({
    super.key,
    this.size,
  });

  final double? size;

  @override
  State<ShadResizableHandle> createState() => _ShadResizableHandleState();
}

class _ShadResizableHandleState extends State<ShadResizableHandle> {
  final handleKey = UniqueKey();

  @override
  void initState() {
    super.initState();
    context
        .read<ShadResizablePanelGroupState>()
        .registerHandle(key: handleKey, size: widget.size ?? 1);
  }

  void onHandleDrag(Offset offset) {
    context
        .read<ShadResizablePanelGroupState>()
        .onHandleDrag(key: handleKey, offset: offset);
  }

  @override
  Widget build(BuildContext context) {
    final inherited = context.watch<ShadResizablePanelGroupState>();
    final theme = ShadTheme.of(context);

    final axis = inherited.widget.axis;
    final effectiveSize = widget.size ?? 1;

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onHorizontalDragUpdate: axis == Axis.horizontal
          ? (details) {
              onHandleDrag(details.delta);
            }
          : null,
      onVerticalDragUpdate: axis == Axis.vertical
          ? (details) {
              onHandleDrag(details.delta);
            }
          : null,
      child: MouseRegion(
        cursor: switch (axis) {
          Axis.horizontal => SystemMouseCursors.resizeColumn,
          Axis.vertical => SystemMouseCursors.resizeRow,
        },
        child: switch (axis) {
          Axis.horizontal => VerticalDivider(
              indent: 0,
              endIndent: 0,
              thickness: effectiveSize,
              width: effectiveSize,
              color: theme.colorScheme.border,
            ),
          Axis.vertical => Divider(
              indent: 0,
              endIndent: 0,
              height: effectiveSize,
              thickness: effectiveSize,
              color: theme.colorScheme.border,
            ),
        },
      ),
    );
  }
}
