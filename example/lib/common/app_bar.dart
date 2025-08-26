import 'package:example/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_solidart/flutter_solidart.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    super.key,
    this.title,
    this.titleWidget,
  }) : assert((title != null) ^ (titleWidget != null),
            'Must provide either title or titleWidget');

  final String? title;
  final Widget? titleWidget;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: titleWidget ?? Text(title!),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: ShadButton.ghost(
            onPressed: () {
              themeModeProvider.of(context).updateValue((value) =>
                  value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light);
            },
            leading: SignalBuilder(
              builder: (context, child) {
                final themeMode = themeModeProvider.of(context).value;
                return Icon(
                  themeMode == ThemeMode.light
                      ? Icons.light_mode
                      : Icons.dark_mode,
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
