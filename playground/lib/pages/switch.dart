import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class SwitchPage extends StatefulWidget {
  const SwitchPage({
    super.key,
  });

  @override
  State<SwitchPage> createState() => _SwitchPageState();
}

class _SwitchPageState extends State<SwitchPage> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ShadSwitch(
          value: value,
          onChanged: (v) => setState(() => value = v),
          label: const Text('Airplane Mode'),
        ),
      ),
    );
  }
}
