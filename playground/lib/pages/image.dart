import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

enum ImageStyle {
  local,
  remote,
  remoteWithHeaders,
  svg,
}

class ImagePage extends StatelessWidget {
  const ImagePage({
    super.key,
    required this.style,
  });

  final ImageStyle style;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: () {
          return switch (style) {
            ImageStyle.local => const ShadImage(
                'assets/banner.png',
                height: 100,
                fit: BoxFit.fitHeight,
              ),
            ImageStyle.remote => const ShadImage.square(
                'https://avatars.githubusercontent.com/u/124599?v=4',
                size: 50,
              ),
            ImageStyle.remoteWithHeaders => const ShadImage.square(
                'https://avatars.githubusercontent.com/u/124599?v=4',
                size: 50,
                headers: {
                  'User-Agent': 'Mozilla/5.0',
                },
              ),
            ImageStyle.svg => const ShadImage.square(
                'assets/flutter.svg',
                size: 50,
              ),
          };
        }(),
      ),
    );
  }
}
