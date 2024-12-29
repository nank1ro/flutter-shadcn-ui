import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class DecorationPage extends StatelessWidget {
  const DecorationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ShadDecorator(
        decoration: ShadDecoration(),
        child: Text('DecorationPage'),
      ),
    );
  }
}
