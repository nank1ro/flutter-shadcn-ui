import 'package:example/common/base_scaffold.dart';
import 'package:example/common/properties/bool_property.dart';
import 'package:example/common/properties/enum_property.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ItemPage extends StatefulWidget {
  const ItemPage({super.key});

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  ShadItemVariant variant = ShadItemVariant.outline;
  ShadItemSize size = ShadItemSize.regular;
  bool pressable = true;
  bool enabled = true;

  @override
  Widget build(BuildContext context) {
    final onPressed = pressable ? () {} : null;

    return BaseScaffold(
      appBarTitle: 'Item',
      editable: [
        MyEnumProperty(
          label: 'Variant',
          value: variant,
          values: ShadItemVariant.values,
          onChanged: (value) {
            if (value != null) setState(() => variant = value);
          },
        ),
        MyEnumProperty(
          label: 'Size',
          value: size,
          values: ShadItemSize.values,
          onChanged: (value) {
            if (value != null) setState(() => size = value);
          },
        ),
        MyBoolProperty(
          label: 'Pressable',
          value: pressable,
          onChanged: (value) => setState(() => pressable = value),
        ),
        MyBoolProperty(
          label: 'Enabled',
          value: enabled,
          onChanged: (value) => setState(() => enabled = value),
        ),
      ],
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 448),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 24,
            children: [
              ShadItem.raw(
                variant: variant,
                size: size,
                enabled: enabled,
                onPressed: onPressed,
                title: const Text('Basic Item'),
                description: const Text(
                  'A simple item with title and description.',
                ),
                actions: ShadButton.outline(
                  size: ShadButtonSize.sm,
                  onPressed: () {},
                  child: const Text('Action'),
                ),
              ),
              ShadItem.raw(
                variant: variant,
                size: size,
                enabled: enabled,
                onPressed: onPressed,
                media: const Icon(LucideIcons.badgeCheck, size: 20),
                title: const Text('Your profile has been verified.'),
                actions: const Icon(LucideIcons.chevronRight, size: 16),
              ),
              ShadItem.raw(
                variant: variant,
                size: size,
                enabled: enabled,
                onPressed: onPressed,
                media: const ShadItemMedia.icon(
                  child: Icon(LucideIcons.shieldAlert),
                ),
                title: const Text('Security Alert'),
                description: const Text(
                  'New login detected from unknown device.',
                ),
                actions: ShadButton.outline(
                  size: ShadButtonSize.sm,
                  onPressed: () {},
                  child: const Text('Review'),
                ),
              ),
              ShadItemGroup(
                children: [
                  for (final (index, person) in _people.indexed) ...[
                    if (index > 0) const ShadItemSeparator(),
                    ShadItem.raw(
                      variant: variant,
                      size: size,
                      enabled: enabled,
                      onPressed: onPressed,
                      media: ShadAvatar(
                        person.avatar,
                        placeholder: Text(person.initials),
                      ),
                      title: Text(person.name),
                      description: Text(person.email),
                      actions: ShadIconButton.ghost(
                        icon: const Icon(LucideIcons.plus),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

const _people = [
  (
    name: 'shadcn',
    initials: 'CN',
    email: 'shadcn@vercel.com',
    avatar: 'https://github.com/shadcn.png',
  ),
  (
    name: 'nank1ro',
    initials: 'AM',
    email: 'alexandru@mariuti.com',
    avatar: 'https://github.com/nank1ro.png',
  ),
];
