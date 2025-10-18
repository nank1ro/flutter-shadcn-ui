import 'package:example/common/base_scaffold.dart';
import 'package:example/common/properties/bool_property.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ResizablePage extends StatefulWidget {
  const ResizablePage({super.key});

  @override
  State<ResizablePage> createState() => _ResizablePageState();
}

class _ResizablePageState extends State<ResizablePage> {
  var visible = true;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return BaseScaffold(
      appBarTitle: 'Resizable',
      editable: [
        MyBoolProperty(
          value: visible,
          onChanged: (v) => setState(() => visible = v),
          label: 'One Visible',
        ),
      ],
      children: [
        SizedBox(
          width: 300,
          height: 200,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: theme.radius,
              border: Border.all(
                color: theme.colorScheme.border,
              ),
            ),
            child: ClipRRect(
              borderRadius: theme.radius,
              child: ShadResizablePanelGroup(
                mainAxisSize: MainAxisSize.min,
                showHandle: true,
                children: [
                  if (visible)
                    ShadResizablePanel(
                      id: 0,
                      defaultSize: .5,
                      minSize: 0.1,
                      maxSize: 0.8,
                      child: Container(
                        color: Colors.red,
                        alignment: Alignment.center,
                        child: Text(
                          'One',
                          style: theme.textTheme.large,
                        ),
                      ),
                    ),
                  ShadResizablePanel(
                    defaultSize: 0.5,
                    id: 1,
                    child: ShadResizablePanelGroup(
                      axis: Axis.vertical,
                      showHandle: true,
                      children: [
                        ShadResizablePanel(
                          id: 0,
                          defaultSize: 0.4,
                          child: Container(
                            color: Colors.blue,
                            alignment: Alignment.center,
                            child: Text(
                              'Two',
                              style: theme.textTheme.large,
                            ),
                          ),
                        ),
                        ShadResizablePanel(
                          id: 1,
                          defaultSize: 0.6,
                          child: Container(
                            color: Colors.green,
                            alignment: Alignment.center,
                            child: Text(
                              'Three',
                              style: theme.textTheme.large,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
