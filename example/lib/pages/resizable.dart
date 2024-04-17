import 'package:example/common/base_scaffold.dart';
import 'package:example/common/properties/enum_property.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ResizablePage extends StatefulWidget {
  const ResizablePage({super.key});

  @override
  State<ResizablePage> createState() => _ResizablePageState();
}

class _ResizablePageState extends State<ResizablePage> {
  var axis = Axis.horizontal;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBarTitle: 'Resizable',
      editable: [
        MyEnumProperty(
          label: 'Axis',
          value: axis,
          values: Axis.values,
          onChanged: (v) => setState(() => axis = v),
        ),
      ],
      children: [
        ShadResizablePanelGroup(
          mainAxisSize: MainAxisSize.min,
          axis: axis,
          children: [
            ShadResizablePanel(
              child: Container(
                width: 100,
                height: 100,
                color: Colors.red,
              ),
            ),
            ShadResizablePanel(
              child: Container(
                width: 100,
                height: 100,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
