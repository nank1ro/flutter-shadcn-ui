# Item

A versatile component that you can use to display any content.



```dart
class ItemDemo extends StatelessWidget {
  const ItemDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 24,
      children: [
        ShadItem.outline(
          title: const Text('Basic Item'),
          description: const Text('A simple item with title and description.'),
          actions: ShadButton.outline(
            size: ShadButtonSize.sm,
            onPressed: () {},
            child: const Text('Action'),
          ),
        ),
        ShadItem.outline(
          size: ShadItemSize.sm,
          onPressed: () {},
          media: const Icon(LucideIcons.badgeCheck, size: 20),
          title: const Text('Your profile has been verified.'),
          actions: const Icon(LucideIcons.chevronRight, size: 16),
        ),
      ],
    );
  }
}
```



## Variants

Use `ShadItem`, `ShadItem.outline` and `ShadItem.muted` to change the visual style of the item.



```dart
class ItemVariants extends StatelessWidget {
  const ItemVariants({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 24,
      children: [
        ShadItem(
          title: const Text('Default Variant'),
          description: const Text(
            'Standard styling with subtle background and borders.',
          ),
          actions: ShadButton.outline(
            size: ShadButtonSize.sm,
            onPressed: () {},
            child: const Text('Open'),
          ),
        ),
        ShadItem.outline(
          title: const Text('Outline Variant'),
          description: const Text(
            'Outlined style with clear borders and transparent background.',
          ),
          actions: ShadButton.outline(
            size: ShadButtonSize.sm,
            onPressed: () {},
            child: const Text('Open'),
          ),
        ),
        ShadItem.muted(
          title: const Text('Muted Variant'),
          description: const Text(
            'Subdued appearance with muted colors for secondary content.',
          ),
          actions: ShadButton.outline(
            size: ShadButtonSize.sm,
            onPressed: () {},
            child: const Text('Open'),
          ),
        ),
      ],
    );
  }
}
```



## Size

Use `size: ShadItemSize.sm` for a compact item.



```dart
class ItemSize extends StatelessWidget {
  const ItemSize({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 24,
      children: [
        ShadItem.outline(
          title: const Text('Default Size'),
          description: const Text(
            'The standard size for most use cases.',
          ),
          actions: ShadButton.outline(
            size: ShadButtonSize.sm,
            onPressed: () {},
            child: const Text('Action'),
          ),
        ),
        ShadItem.outline(
          size: ShadItemSize.sm,
          title: const Text('Small Size'),
          description: const Text('A compact size for dense layouts.'),
          actions: ShadButton.outline(
            size: ShadButtonSize.sm,
            onPressed: () {},
            child: const Text('Action'),
          ),
        ),
      ],
    );
  }
}
```



## Icon

Use `ShadItemMedia.icon` to display an icon inside a bordered, muted square.



```dart
class ItemIcon extends StatelessWidget {
  const ItemIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadItem.outline(
      media: const ShadItemMedia.icon(child: Icon(LucideIcons.shieldAlert)),
      title: const Text('Security Alert'),
      description: const Text(
        'New login detected from unknown device.',
      ),
      actions: ShadButton.outline(
        size: ShadButtonSize.sm,
        onPressed: () {},
        child: const Text('Review'),
      ),
    );
  }
}
```



## Avatar

Pass a `ShadAvatar` (or any widget) to `media`.



```dart
class ItemAvatar extends StatelessWidget {
  const ItemAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 24,
      children: [
        ShadItem.outline(
          media: const ShadAvatar(
            'https://github.com/nank1ro.png',
            placeholder: Text('AM'),
          ),
          title: const Text('Alexandru Mariuti'),
          description: const Text('Last seen 5 months ago'),
          actions: ShadIconButton.outline(
            iconSize: 16,
            width: 32,
            height: 32,
            icon: const Icon(LucideIcons.plus),
            onPressed: () {},
          ),
        ),
        ShadItem.outline(
          media: const Row(
            children: [
              ShadAvatar(
                'https://github.com/shadcn.png',
                placeholder: Text('CN'),
                size: Size.square(32),
              ),
              ShadAvatar(
                'https://github.com/nank1ro.png',
                placeholder: Text('AM'),
                size: Size.square(32),
              ),
            ],
          ),
          title: const Text('No Team Members'),
          description: const Text('Invite your team to collaborate.'),
          actions: ShadButton.outline(
            size: ShadButtonSize.sm,
            onPressed: () {},
            child: const Text('Invite'),
          ),
        ),
      ],
    );
  }
}
```



## Image

Use `ShadItemMedia.image` to display a clipped image from a `src` (network url, asset or file). The image covers the square by default, use `fit` to change it.



```dart
const music = [
  (
    title: 'Midnight City Lights',
    artist: 'Neon Dreams',
    album: 'Electric Nights',
    duration: '3:45',
  ),
  (
    title: 'Coffee Shop Conversations',
    artist: 'The Morning Brew',
    album: 'Urban Stories',
    duration: '4:05',
  ),
  (
    title: 'Digital Rain',
    artist: 'Cyber Symphony',
    album: 'Binary Beats',
    duration: '3:30',
  ),
];

class ItemImage extends StatelessWidget {
  const ItemImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 16,
      children: [
        for (final song in music)
          ShadItem.outline(
            link: true,
            onPressed: () {},
            media: ShadItemMedia.image(
              src:
                  'https://avatar.vercel.sh/${Uri.encodeComponent(song.title)}',
            ),
            title: Text('${song.title} - ${song.album}'),
            description: Text(song.artist),
            actions: ShadItemDescription(child: Text(song.duration)),
          ),
      ],
    );
  }
}
```



## Group

Use `ShadItemGroup` to stack items in a list and `ShadItemSeparator` to separate them.



```dart
const people = [
  (name: 'shadcn', username: 'shadcn', email: 'shadcn@vercel.com'),
  (name: 'nank1ro', username: 'nank1ro', email: 'alexandru@mariuti.com'),
  (name: 'evilrabbit', username: 'evilrabbit', email: 'evilrabbit@vercel.com'),
];

class ItemGroup extends StatelessWidget {
  const ItemGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadItemGroup(
      children: [
        for (final (index, person) in people.indexed) ...[
          if (index > 0) const ShadItemSeparator(),
          ShadItem(
            media: ShadAvatar(
              'https://github.com/${person.username}.png',
              placeholder: Text(person.name[0].toUpperCase()),
            ),
            title: Text(person.name),
            description: Text(person.email),
            actions: ShadIconButton.ghost(
              iconSize: 16,
              width: 32,
              height: 32,
              icon: const Icon(LucideIcons.plus),
              onPressed: () {},
            ),
          ),
        ],
      ],
    );
  }
}
```



## Header

Use `header` (and `footer`) to display content spanning the full width of the item, above (or below) the item content.



```dart
const models = [
  (
    name: 'v0-1.5-sm',
    description: 'Everyday tasks and UI generation.',
  ),
  (
    name: 'v0-1.5-lg',
    description: 'Advanced thinking or reasoning.',
  ),
  (
    name: 'v0-2.0-mini',
    description: 'Open Source model for everyone.',
  ),
];

class ItemHeader extends StatelessWidget {
  const ItemHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16,
      children: [
        for (final model in models)
          Expanded(
            child: ShadItem.outline(
              header: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                    'https://avatar.vercel.sh/${model.name}',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Text(model.name),
              description: Text(model.description),
            ),
          ),
      ],
    );
  }
}
```



## Link

Pass `onPressed` to make the whole item interactive. It becomes focusable, shows a hover background and a focus ring, and can be activated with Enter or Space.

Set `link: true` for items that navigate somewhere: they are announced as links instead of buttons and are activated with Enter only, like a link on the web.



```dart
class ItemLink extends StatelessWidget {
  const ItemLink({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 16,
      children: [
        ShadItem(
          link: true,
          onPressed: () {},
          title: const Text('Visit our documentation'),
          description: const Text(
            'Learn how to get started with our components.',
          ),
          actions: const Icon(LucideIcons.chevronRight, size: 16),
        ),
        ShadItem.outline(
          link: true,
          onPressed: () {},
          title: const Text('External resource'),
          description: const Text(
            'Opens in a new tab with security attributes.',
          ),
          actions: const Icon(LucideIcons.externalLink, size: 16),
        ),
      ],
    );
  }
}
```

## Example
```dart
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

```
