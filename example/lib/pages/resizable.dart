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
        SizedBox(
          width: 300,
          height: 200,
          child: ShadDecorator(
            decoration: ShadDecoration(
              merge: false,
              border: ShadBorder.all(
                color: theme.colorScheme.border,
                radius: theme.radius,
              ),
            ),
            child: ClipRRect(
              borderRadius: theme.radius,
              child: ShadResizablePanelGroup(
                mainAxisSize: MainAxisSize.min,
                showHandle: true,
                children: [
                  ShadResizablePanel(
                    defaultSize: .5,
                    minSize: 0.1,
                    maxSize: 0.8,
                    child: Center(
                      child: Text('One', style: theme.textTheme.large),
                    ),
                  ),
                  ShadResizablePanel(
                    defaultSize: 0.5,
                    child: ShadResizablePanelGroup(
                      axis: Axis.vertical,
                      showHandle: true,
                      children: [
                        ShadResizablePanel(
                          defaultSize: 0.4,
                          child: Center(
                              child: Text('Two', style: theme.textTheme.large)),
                        ),
                        ShadResizablePanel(
                          defaultSize: 0.6,
                          child: Align(
                              child:
                                  Text('Three', style: theme.textTheme.large)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
