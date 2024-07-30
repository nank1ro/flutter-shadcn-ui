import 'package:example/common/base_scaffold.dart';
import 'package:example/common/properties/enum_property.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

enum Alignm {
  topRight,
  topLeft,
  bottomRight,
  bottomLeft,
  centerRight,
  centerLeft,
  center,
  topCenter,
  bottomCenter;

  Alignment toAlignment() {
    return switch (this) {
      topRight => Alignment.topRight,
      topLeft => Alignment.topLeft,
      bottomRight => Alignment.bottomRight,
      bottomLeft => Alignment.bottomLeft,
      centerRight => Alignment.centerRight,
      centerLeft => Alignment.centerLeft,
      center => Alignment.center,
      topCenter => Alignment.topCenter,
      bottomCenter => Alignment.bottomCenter,
    };
  }
}

class ToastPage extends StatefulWidget {
  const ToastPage({super.key});

  @override
  State<ToastPage> createState() => _ToastPageState();
}

class _ToastPageState extends State<ToastPage> {
  var alignment = Alignm.bottomRight;
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBarTitle: 'Toast',
      editable: [
        MyEnumProperty<Alignm>(
            label: 'Alignment',
            value: alignment,
            values: Alignm.values,
            onChanged: (v) {
              setState(() {
                alignment = v;
              });
            })
      ],
      children: [
        ShadButton.outline(
          child: const Text('Add to calendar'),
          onPressed: () {
            final toaster = ShadToaster.of(context);
            toaster.show(
              ShadToast(
                alignment: alignment.toAlignment(),
                title: const Text('Scheduled: Catch up'),
                description: const Text('Friday, February 10, 2023 at 5:57 PM'),
                action: ShadButton.outline(
                  child: const Text('Undo'),
                  onPressed: () => toaster.hide(),
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
