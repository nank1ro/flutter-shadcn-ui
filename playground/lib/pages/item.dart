import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

enum ItemStyle {
  primary,
  variants,
  size,
  icon,
  avatar,
  image,
  group,
  header,
  link,
}

class ItemPage extends StatelessWidget {
  const ItemPage({super.key, required this.style});

  final ItemStyle style;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: style == ItemStyle.header ? 640 : 448,
            ),
            child: switch (style) {
              ItemStyle.primary => const ItemDemo(),
              ItemStyle.variants => const ItemVariants(),
              ItemStyle.size => const ItemSize(),
              ItemStyle.icon => const ItemIcon(),
              ItemStyle.avatar => const ItemAvatar(),
              ItemStyle.image => const ItemImage(),
              ItemStyle.group => const ItemGroup(),
              ItemStyle.header => const ItemHeader(),
              ItemStyle.link => const ItemLink(),
            },
          ),
        ),
      ),
    );
  }
}

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
            onPressed: () {},
            media: ShadItemMedia.image(
              child: Image.network(
                'https://avatar.vercel.sh/${Uri.encodeComponent(song.title)}',
                fit: BoxFit.cover,
              ),
            ),
            title: Text('${song.title} - ${song.album}'),
            description: Text(song.artist),
            actions: Text(song.duration),
          ),
      ],
    );
  }
}

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
          onPressed: () {},
          title: const Text('Visit our documentation'),
          description: const Text(
            'Learn how to get started with our components.',
          ),
          actions: const Icon(LucideIcons.chevronRight, size: 16),
        ),
        ShadItem.outline(
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
