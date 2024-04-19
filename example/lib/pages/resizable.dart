import 'package:example/common/base_scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ResizablePage extends StatefulWidget {
  const ResizablePage({super.key});

  @override
  State<ResizablePage> createState() => _ResizablePageState();
}

class _ResizablePageState extends State<ResizablePage> {
  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return BaseScaffold(
      appBarTitle: 'Resizable',
      children: [
        ShadDecorator(
          decoration: ShadDecoration(
            border: ShadBorder(
              width: 1,
              color: theme.colorScheme.border,
              radius: theme.radius,
            ),
          ),
          child: ClipRRect(
            borderRadius: theme.radius,
            child: ShadResizablePanelGroup(
              mainAxisSize: MainAxisSize.min,
              children: [
                ShadResizablePanel(
                  initialSize: 200,
                  child: Center(
                    child: Text('One', style: theme.textTheme.large),
                  ),
                ),
                const ShadResizableHandle(),
                ShadResizablePanel(
                  initialSize: 200,
                  child: ShadResizablePanelGroup(
                    axis: Axis.vertical,
                    children: [
                      ShadResizablePanel(
                        initialSize: 50,
                        child: Center(
                            child: Text('Two', style: theme.textTheme.large)),
                      ),
                      const ShadResizableHandle(),
                      ShadResizablePanel(
                        initialSize: 100,
                        child: Align(
                            child: Text('Three', style: theme.textTheme.large)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
