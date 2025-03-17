import 'package:example/common/base_scaffold.dart';
import 'package:example/common/properties/enum_property.dart';
import 'package:example/pages/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class SonnerPage extends StatefulWidget {
  const SonnerPage({super.key});

  @override
  State<SonnerPage> createState() => _SonnerPageState();
}

class _SonnerPageState extends State<SonnerPage> {
  var alignment = Alignm.bottomRight;
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBarTitle: 'Sonner',
      editable: [
        MyEnumProperty<Alignm>(
            label: 'Alignment',
            value: alignment,
            values: Alignm.values,
            onChanged: (v) {
              if (v != null) {
                setState(() {
                  alignment = v;
                });
              }
            })
      ],
      children: [
        ShadButton.outline(
          child: const Text('Add to calendar'),
          onPressed: () {
            final sonner = ShadSonner.of(context);
            sonner.show(
              ShadToast(
                alignment: alignment.toAlignment(),
                title: const Text('Scheduled: Catch up'),
                description: const Text('Friday, February 10, 2023 at 5:57 PM'),
                action: ShadButton.outline(
                  child: const Text('Undo'),
                  // onPressed: () => sonner.hide(),
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
