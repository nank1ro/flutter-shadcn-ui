import 'package:flutter/cupertino.dart';

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
  State<ShadResizablePanelGroup> createState() =>
      ShadResizablePanelGroupState();
}

class ShadResizablePanelGroupState extends State<ShadResizablePanelGroup> {
  @override
  Widget build(BuildContext context) {
    return ShadProvider(
      data: this,
      child: Flex(
        direction: widget.axis,
        mainAxisAlignment: widget.mainAxisAlignment ?? MainAxisAlignment.start,
        crossAxisAlignment:
            widget.crossAxisAlignment ?? CrossAxisAlignment.center,
        mainAxisSize: widget.mainAxisSize ?? MainAxisSize.max,
        textDirection: widget.textDirection,
        verticalDirection: widget.verticalDirection ?? VerticalDirection.down,
        children: widget.children,
      ),
    );
  }
}

class ShadResizablePanel extends StatelessWidget {
  const ShadResizablePanel({
    super.key,
    required this.child,
  });

  final Widget child;
  @override
  Widget build(BuildContext context) {
    final inherited = ShadProvider.of<ShadResizablePanelGroupState>(context);
    print(inherited.widget.axis);
    return child;
  }
}
