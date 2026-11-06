import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

enum PlaygroundToggleStyle {
  bookmark,
  outline,
  withText,
  small,
  large,
  disabled,
}

class TogglePage extends StatefulWidget {
  const TogglePage({super.key, required this.style});

  final PlaygroundToggleStyle style;

  @override
  State<TogglePage> createState() => _TogglePageState();
}

class _TogglePageState extends State<TogglePage> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    void onChanged(bool v) => setState(() => value = v);

    return Scaffold(
      body: Center(
        child: switch (widget.style) {
          PlaygroundToggleStyle.bookmark => ShadToggle.outline(
            value: value,
            onChanged: onChanged,
            size: ShadButtonSize.sm,
            selectedBackgroundColor: Colors.transparent,
            selectedHoverBackgroundColor: Colors.transparent,
            leading: BookmarkIcon(
              filled: value,
              color: value ? blue500 : null,
            ),
            child: const Text('Bookmark'),
          ),
          PlaygroundToggleStyle.outline => ShadToggle.outline(
            value: value,
            onChanged: onChanged,
            child: const Icon(
              LucideIcons.italic,
              semanticLabel: 'Toggle italic',
            ),
          ),
          PlaygroundToggleStyle.withText => ShadToggle(
            value: value,
            onChanged: onChanged,
            leading: const Icon(LucideIcons.italic),
            child: const Text('Italic'),
          ),
          PlaygroundToggleStyle.small => ShadToggle(
            value: value,
            onChanged: onChanged,
            size: ShadButtonSize.sm,
            child: const Icon(
              LucideIcons.italic,
              semanticLabel: 'Toggle italic',
            ),
          ),
          PlaygroundToggleStyle.large => ShadToggle(
            value: value,
            onChanged: onChanged,
            size: ShadButtonSize.lg,
            child: const Icon(
              LucideIcons.italic,
              semanticLabel: 'Toggle italic',
            ),
          ),
          PlaygroundToggleStyle.disabled => ShadToggle(
            value: value,
            onChanged: onChanged,
            enabled: false,
            child: const Icon(
              LucideIcons.underline,
              semanticLabel: 'Toggle underline',
            ),
          ),
        },
      ),
    );
  }
}

/// Lucide's bookmark icon, filled when [filled].
///
/// The Lucide icon font only has outlined glyphs, so the SVG is used to fill
/// it.
class BookmarkIcon extends StatelessWidget {
  const BookmarkIcon({super.key, required this.filled, this.color});

  final bool filled;

  /// The color of the icon, defaults to the icon theme color.
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final iconTheme = IconTheme.of(context);
    final size = iconTheme.size ?? 16;
    return SvgPicture.string(
      '''
<svg viewBox="0 0 24 24" fill="${filled ? 'currentColor' : 'none'}" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
  <path d="M17 3a2 2 0 0 1 2 2v15a1 1 0 0 1-1.496.868l-4.512-2.578a2 2 0 0 0-1.984 0l-4.512 2.578A1 1 0 0 1 5 20V5a2 2 0 0 1 2-2z"/>
</svg>''',
      width: size,
      height: size,
      theme: SvgTheme(
        currentColor: color ?? iconTheme.color ?? const Color(0xFF000000),
      ),
    );
  }
}

/// Tailwind's blue-500, used by the shadcn/ui toggle demo.
const blue500 = Color(0xFF2B7FFF);
