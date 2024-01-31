import 'package:example/common/base_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScaffold(
      appBarTitle: 'Avatar',
      children: [
        ShadAvatar(
          'https://avatars.githubusercontent.com/u/124599?v=4',
          placeholder: Text('CN'),
        ),
      ],
    );
  }
}
