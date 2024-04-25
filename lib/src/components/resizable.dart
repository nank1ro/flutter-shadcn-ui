import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:shadcn_ui/src/components/image.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/utils/mouse_region_provider.dart';

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
    this.height,
  }) : assert(
          axis == Axis.vertical || height != null,
          'Height must be set for horizontal panels',
        );

  final Axis axis;
  final List<Widget> children;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisSize? mainAxisSize;
  final TextDirection? textDirection;
  final VerticalDirection? verticalDirection;
  final double? height;

  @override
  ShadResizablePanelGroupState createState() => ShadResizablePanelGroupState();
}

class ShadResizablePanelGroupState extends State<ShadResizablePanelGroup> {
  final panelsToSizeMap = <Key, double>{};

  /// Contains the keys of all the panels and handles, the order is important
  /// for the resize logic
  final resizableWidgets = <Key>[];

  final dragging = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();

    final mouseCursorInherited = context.read<ShadMouseRegionProviderState>();

    dragging.addListener(() {
      if (!dragging.value) mouseCursorInherited.setCursor(MouseCursor.defer);
    });
  }

  @override
  void dispose() {
    dragging.dispose();
    super.dispose();
  }

  void registerPanel({
    required Key key,
    required double size,
  }) {
    resizableWidgets.add(key);
    panelsToSizeMap[key] = size;
  }

  void registerHandle({required Key key}) {
    resizableWidgets.add(key);
  }

  double getPanelSize(Key key) {
    final size = panelsToSizeMap[key];
    if (size == null) throw Exception('Panel size not found for key: $key');
    return size;
  }

  void onHandleDrag({required Key key, required Offset offset}) {
    final indexOfHandle = resizableWidgets.indexOf(key);
    final indexOfLeadingPanel = indexOfHandle - 1;
    final indexOfTrailingPanel = indexOfHandle + 1;

    final leadingPanelKey = resizableWidgets[indexOfLeadingPanel];
    final trailingPanelKey = resizableWidgets[indexOfTrailingPanel];

    final sizeOfLeadingPanel = getPanelSize(leadingPanelKey);
    final sizeOfTrailingPanel = getPanelSize(trailingPanelKey);

    final axisOffset = widget.axis == Axis.horizontal ? offset.dx : offset.dy;

    final newLeadingSize = sizeOfLeadingPanel + axisOffset;
    final newTrailingSize = sizeOfTrailingPanel - axisOffset;
    // cannot resize, the panel size cannot be lower than 0
    final mouseCursorProvider = context.read<ShadMouseRegionProviderState>();
    if (newLeadingSize < 0) {
      final cursor = switch (widget.axis) {
        Axis.horizontal => SystemMouseCursors.resizeRight,
        Axis.vertical => SystemMouseCursors.resizeDown,
      };
      mouseCursorProvider.setCursor(cursor);
      return;
    }
    if (newTrailingSize < 0) {
      final cursor = switch (widget.axis) {
        Axis.horizontal => SystemMouseCursors.resizeLeft,
        Axis.vertical => SystemMouseCursors.resizeUp,
      };
      mouseCursorProvider.setCursor(cursor);
      return;
    }

    final cursor = switch (widget.axis) {
      Axis.horizontal => SystemMouseCursors.resizeLeftRight,
      Axis.vertical => SystemMouseCursors.resizeUpDown,
    };
    mouseCursorProvider.setCursor(cursor);

    panelsToSizeMap[leadingPanelKey] = newLeadingSize;
    panelsToSizeMap[trailingPanelKey] = newTrailingSize;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Widget child = Flex(
      direction: widget.axis,
      mainAxisAlignment: widget.mainAxisAlignment ?? MainAxisAlignment.start,
      crossAxisAlignment:
          widget.crossAxisAlignment ?? CrossAxisAlignment.center,
      mainAxisSize: widget.mainAxisSize ?? MainAxisSize.max,
      textDirection: widget.textDirection,
      verticalDirection: widget.verticalDirection ?? VerticalDirection.down,
      children: widget.children,
    );

    if (widget.height != null) {
      child = SizedBox(
        height: widget.height,
        child: child,
      );
    }

    // child = ValueListenableBuilder(
    //   valueListenable: dragging,
    //   builder: (context, value, child) {
    //     return MouseRegion(
    //       cursor: value
    //           ? switch (widget.axis) {
    //               Axis.horizontal => SystemMouseCursors.resizeColumn,
    //               Axis.vertical => SystemMouseCursors.resizeRow,
    //             }
    //           : SystemMouseCursors.basic,
    //       child: child,
    //     );
    //   },
    //   child: child,
    // );

    return ShadProvider(
      data: this,
      notifyUpdate: (_) => true,
      child: child,
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
    this.icon,
    this.iconSrc,
  });

  final double? size;
  final Widget? icon;
  final ShadImageSrc? iconSrc;

  @override
  State<ShadResizableHandle> createState() => _ShadResizableHandleState();
}

class _ShadResizableHandleState extends State<ShadResizableHandle> {
  final handleKey = UniqueKey();

  @override
  void initState() {
    super.initState();
    context.read<ShadResizablePanelGroupState>().registerHandle(key: handleKey);
  }

  void onHandleDrag(Offset offset) {
    context
        .read<ShadResizablePanelGroupState>()
        .onHandleDrag(key: handleKey, offset: offset);
  }

  @override
  Widget build(BuildContext context) {
    final inherited = context.watch<ShadResizablePanelGroupState>();
    final mouseCursorInherited = context.read<ShadMouseRegionProviderState>();
    final theme = ShadTheme.of(context);

    final axis = inherited.widget.axis;
    final effectiveSize = widget.size ?? 1;

    final divider = switch (axis) {
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
    };

    return GridPaper(
      divisions: 3,
      subdivisions: 10,
      color: Colors.blue,
      child: ClipPath(
        clipBehavior: Clip.hardEdge,
        clipper: MyClipper(
          dividerSize: effectiveSize,
          iconSize: const Size(30, 30),
          axis: axis,
        ),
        child: GridPaper(
          divisions: 3,
          subdivisions: 10,
          color: Colors.red,
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onVerticalDragStart: axis == Axis.horizontal
                ? null
                : (_) => inherited.dragging.value = true,
            onVerticalDragCancel: axis == Axis.horizontal
                ? null
                : () => inherited.dragging.value = false,
            onVerticalDragEnd: axis == Axis.horizontal
                ? null
                : (_) => inherited.dragging.value = false,
            onHorizontalDragStart: axis == Axis.vertical
                ? null
                : (_) => inherited.dragging.value = true,
            onHorizontalDragEnd: axis == Axis.vertical
                ? null
                : (_) => inherited.dragging.value = false,
            onHorizontalDragCancel: axis == Axis.vertical
                ? null
                : () => inherited.dragging.value = false,
            onHorizontalDragUpdate: (details) => onHandleDrag(details.delta),
            onVerticalDragUpdate: (details) => onHandleDrag(details.delta),
            child: MouseRegion(
              onEnter: (_) {
                final cursor = switch (axis) {
                  Axis.horizontal => SystemMouseCursors.resizeLeftRight,
                  Axis.vertical => SystemMouseCursors.resizeUpDown,
                };

                context.read<ShadMouseRegionProviderState>().setCursor(cursor);
              },
              onExit: (details) async {
                // the GestureDetector is fired after onExit, so we need to wait a
                // little bit
                Future.delayed(const Duration(milliseconds: 100), () {
                  if (!mounted) return;
                  if (inherited.dragging.value) return;
                  mouseCursorInherited.setCursor(MouseCursor.defer);
                });
              },
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  divider,
                  if (widget.icon != null || widget.iconSrc != null)
                    widget.icon ??
                        DecoratedBox(
                          decoration: BoxDecoration(
                            // color: theme.colorScheme.border,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(4)),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: axis == Axis.vertical ? 3 : 1,
                              vertical: axis == Axis.vertical ? 1 : 3,
                            ),
                            child: ShadImage.square(
                              widget.iconSrc!,
                              size: 24,
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  MyClipper({
    super.reclip,
    required this.dividerSize,
    required this.iconSize,
    required this.axis,
  });

  final double dividerSize;
  final Size iconSize;
  final Axis axis;

  @override
  Path getClip(Size size) {
    print(size);
    final path = Path();

    final centerX = size.width / 2;
    final centerY = size.height / 2;

    if (axis == Axis.horizontal) {
      //  divider path
      path
        ..moveTo(centerX - dividerSize / 2, 0)
        ..lineTo(centerX - dividerSize / 2, size.height)
        ..lineTo(centerX + dividerSize / 2, size.height)
        ..lineTo(centerX + dividerSize / 2, 0)
        ..close()

        // icon path
        ..moveTo(0, centerY - iconSize.height / 2)
        ..lineTo(0, centerY + iconSize.height / 2)
        ..lineTo(iconSize.width, centerY + iconSize.height / 2)
        ..lineTo(iconSize.width, centerY - iconSize.height / 2)
        ..close();
    } else {
      //  divider path
      path
        ..moveTo(0, centerY - dividerSize / 2)
        ..lineTo(size.width, centerY - dividerSize / 2)
        ..lineTo(size.width, centerY + dividerSize / 2)
        ..lineTo(0, centerY + dividerSize / 2)
        ..close()

        // icon path
        ..moveTo(centerX - iconSize.width / 2, 0)
        ..lineTo(centerX + iconSize.width / 2, 0)
        ..lineTo(centerX + iconSize.width / 2, size.height)
        ..lineTo(centerX - iconSize.width / 2, size.height)
        ..close();
    }

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
