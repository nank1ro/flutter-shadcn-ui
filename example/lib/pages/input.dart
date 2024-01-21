import 'package:example/common/base_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class InputPage extends StatelessWidget {
  const InputPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScaffold(
      appBarTitle: 'Input',
      children: [
        ShadcnInput(
          placeholder: 'Email',
        ),
      ],
    );
  }
}
