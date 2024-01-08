import 'package:flutter/material.dart';
import 'package:flutter_solidart/flutter_solidart.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    super.key,
    required this.title,
  });

  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: IconButton(
            onPressed: () {
              context.update<Brightness>(
                (value) => value == Brightness.light
                    ? Brightness.dark
                    : Brightness.light,
              );
            },
            icon: SignalBuilder(
              signal: context.get<Signal<Brightness>>(),
              builder: (context, brightness, child) {
                return Icon(
                  brightness == Brightness.light
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
