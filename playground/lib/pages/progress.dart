import 'package:flutter/material.dart';

import 'package:shadcn_ui/shadcn_ui.dart';

class ProgressPage extends StatelessWidget {
  const ProgressPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.sizeOf(context).width * 0.6,
          ),
          child: const ShadProgress(value: 0.5),
        ),
      ),
    );
  }
}
