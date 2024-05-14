import 'package:example/common/assets.dart';
import 'package:example/common/base_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ImagePage extends StatelessWidget {
  const ImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScaffold(
      appBarTitle: 'Image',
      children: [
        ShadImage.square(
          'https://avatars.githubusercontent.com/u/124599?v=4',
          size: 50,
        ),
        ShadImage.square(
          Assets.flutter,
          size: 50,
        ),
        ShadImage(
          Assets.banner,
          height: 100,
          fit: BoxFit.fitHeight,
        ),
      ],
    );
  }
}
