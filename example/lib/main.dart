import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Shadcn(
      child: Scaffold(
        body: Center(
          child: ShadcnButton(
            child: const Text('Hello'),
            onPressed: () {
              print(ShadcnTheme.of(context).background);
              print('hello');
            },
          ),
        ),
      ),
    );
  }
}
