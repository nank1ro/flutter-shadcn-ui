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
      actionsPadding: EdgeInsetsDirectional.only(start: 8),
      actions: [
        ShadButton.ghost(
          onPressed: () {
            themeModeProvider.of(context).updateValue((value) =>
                value == ShadThemeMode.light
                    ? ShadThemeMode.dark
                    : ShadThemeMode.light);
          },
          leading: SignalBuilder(
            builder: (context, child) {
              final themeMode = themeModeProvider.of(context).value;
              return Icon(
                themeMode == ShadThemeMode.light
                    ? Icons.light_mode
                    : Icons.dark_mode,
                semanticLabel: themeMode == ShadThemeMode.light
                    ? 'Switch to dark mode'
                    : 'Switch to light mode',
              );
            },
          ),
        ),
        ShadButton.ghost(
          onPressed: () {
            directionalityProvider.of(context).updateValue((value) =>
                value == TextDirection.ltr
                    ? TextDirection.rtl
                    : TextDirection.ltr);
          },
          leading: SignalBuilder(
            builder: (context, child) {
              final directionality = directionalityProvider.of(context).value;
              return Icon(
                directionality == TextDirection.ltr
                    ? Icons.format_textdirection_r_to_l
                    : Icons.format_textdirection_l_to_r,
                semanticLabel: directionality == TextDirection.ltr
                    ? 'Switch to RTL'
                    : 'Switch to LTR',
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
