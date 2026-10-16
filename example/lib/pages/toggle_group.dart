import 'package:example/common/base_scaffold.dart';
import 'package:example/common/properties/bool_property.dart';
import 'package:example/common/properties/enum_property.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

enum TextFormat { bold, italic, underline }

enum TextAlignment { left, center, right }

class ToggleGroupPage extends StatefulWidget {
  const ToggleGroupPage({super.key});

  @override
  State<ToggleGroupPage> createState() => _ToggleGroupPageState();
}

class _ToggleGroupPageState extends State<ToggleGroupPage> {
  bool enabled = true;
  bool allowDeselection = true;
  ShadToggleVariant variant = ShadToggleVariant.primary;
  ShadButtonSize size = ShadButtonSize.regular;
  Axis axis = Axis.horizontal;
  bool spaced = false;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBarTitle: 'Toggle Group',
      editable: [
        MyBoolProperty(
          label: 'Enabled',
          value: enabled,
          onChanged: (value) => setState(() => enabled = value),
        ),
        MyBoolProperty(
          label: 'Allow deselection',
          value: allowDeselection,
          onChanged: (value) => setState(() => allowDeselection = value),
        ),
        MyBoolProperty(
          label: 'Spacing',
          value: spaced,
          onChanged: (value) => setState(() => spaced = value),
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
        MyEnumProperty(
          label: 'Axis',
          value: axis,
          values: Axis.values,
          onChanged: (value) {
            if (value != null) setState(() => axis = value);
          },
        ),
      ],
      children: [
        const Text('Multiple'),
        ShadToggleGroup<TextFormat>.multiple(
          enabled: enabled,
          variant: variant,
          size: size,
          axis: axis,
          spacing: spaced ? 8 : null,
          initialValues: const {TextFormat.bold},
          onChanged: (values) => debugPrint('Formats: $values'),
          items: const [
            ShadToggleGroupItem(
              value: TextFormat.bold,
              child: Icon(LucideIcons.bold),
            ),
            ShadToggleGroupItem(
              value: TextFormat.italic,
              child: Icon(LucideIcons.italic),
            ),
            ShadToggleGroupItem(
              value: TextFormat.underline,
              child: Icon(LucideIcons.underline),
            ),
          ],
        ),
        const Text('Single'),
        ShadToggleGroup<TextAlignment>(
          enabled: enabled,
          allowDeselection: allowDeselection,
          variant: variant,
          size: size,
          axis: axis,
          spacing: spaced ? 8 : null,
          initialValue: TextAlignment.left,
          onChanged: (value) => debugPrint('Alignment: $value'),
          items: const [
            ShadToggleGroupItem(
              value: TextAlignment.left,
              leading: Icon(LucideIcons.textAlignStart),
              child: Text('Left'),
            ),
            ShadToggleGroupItem(
              value: TextAlignment.center,
              leading: Icon(LucideIcons.textAlignCenter),
              child: Text('Center'),
            ),
            ShadToggleGroupItem(
              value: TextAlignment.right,
              enabled: false,
              leading: Icon(LucideIcons.textAlignEnd),
              child: Text('Right'),
            ),
          ],
        ),
      ],
    );
  }
}
