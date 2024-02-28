import 'package:flutter/material.dart';

import 'package:shadcn_ui/shadcn_ui.dart';

class SliderPage extends StatelessWidget {
  const SliderPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: ShadSlider(
            initialValue: 33,
            max: 100,
          ),
        ),
      ),
    );
  }
}
