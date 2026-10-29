import 'package:example/common/base_scaffold.dart';
import 'package:example/common/properties/bool_property.dart';
import 'package:example/common/properties/enum_property.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class TogglePage extends StatefulWidget {
  const TogglePage({super.key});

  @override
  State<TogglePage> createState() => _TogglePageState();
}

class _TogglePageState extends State<TogglePage> {
  bool enabled = true;
  ShadToggleVariant variant = ShadToggleVariant.primary;
  ShadButtonSize size = ShadButtonSize.regular;
  bool bookmark = false;
  bool italic = true;
  bool bold = false;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBarTitle: 'Toggle',
      editable: [
        MyBoolProperty(
          label: 'Enabled',
          value: enabled,
          onChanged: (value) => setState(() => enabled = value),
        ),
        MyEnumProperty(
          label: 'Variant',
          value: variant,
          values: ShadToggleVariant.values,
          onChanged: (value) {
            if (value != null) setState(() => variant = value);
          },
        ),
        MyEnumProperty(
          label: 'Size',
          value: size,
          values: ShadButtonSize.values,
          onChanged: (value) {
            if (value != null) setState(() => size = value);
          },
        ),
      ],
      children: [
        ShadToggle.raw(
          variant: variant,
          size: size,
          enabled: enabled,
          value: bookmark,
          onChanged: (value) => setState(() => bookmark = value),
          // Like the shadcn/ui demo: no background and a blue icon when on.
          selectedBackgroundColor: Colors.transparent,
          selectedHoverBackgroundColor: Colors.transparent,
          leading: BookmarkIcon(
            filled: bookmark,
            color: bookmark ? blue500 : null,
          ),
          child: const Text('Bookmark'),
        ),
        ShadToggle.raw(
          variant: variant,
          size: size,
          enabled: enabled,
          value: italic,
          onChanged: (value) => setState(() => italic = value),
          leading: const Icon(LucideIcons.italic),
          child: const Text('Italic'),
        ),
        ShadToggle.raw(
          variant: variant,
          size: size,
          enabled: enabled,
          value: bold,
          onChanged: (value) => setState(() => bold = value),
          child: const Icon(LucideIcons.bold, semanticLabel: 'Toggle bold'),
        ),
      ],
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
