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

const team = ['shadcn', 'nank1ro', 'evilrabbit'];

class ItemAvatar extends StatelessWidget {
  const ItemAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 24,
      children: [
        ShadItem.outline(
          media: const ShadAvatar(
            'https://avatars.githubusercontent.com/nank1ro',
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
          media: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (final (index, username) in team.indexed)
                // Overlap each avatar with the next one by 8px.
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  widthFactor: index < team.length - 1 ? 28 / 36 : 1,
                  heightFactor: 1,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: theme.colorScheme.background,
                    ),
                    child: ShadAvatar(
                      'https://avatars.githubusercontent.com/$username',
                      placeholder: Text(username[0].toUpperCase()),
                      size: const Size.square(32),
                    ),
                  ),
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
    image:
        'https://images.unsplash.com/photo-1650804068570-7fb2e3dbf888?q=80&w=128&fit=crop',
  ),
  (
    title: 'Coffee Shop Conversations',
    artist: 'The Morning Brew',
    album: 'Urban Stories',
    duration: '4:05',
    image:
        'https://images.unsplash.com/photo-1610280777472-54133d004c8c?q=80&w=128&fit=crop',
  ),
  (
    title: 'Digital Rain',
    artist: 'Cyber Symphony',
    album: 'Binary Beats',
    duration: '3:30',
    image:
        'https://images.unsplash.com/photo-1602146057681-08560aee8cde?q=80&w=128&fit=crop',
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
            media: ShadItemMedia.image(src: song.image),
            title: Text('${song.title} - ${song.album}'),
            description: Text(song.artist),
            actions: ShadItemDescription(child: Text(song.duration)),
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
              'https://avatars.githubusercontent.com/${person.username}',
              placeholder: Text(person.name[0].toUpperCase()),
              size: const Size.square(32),
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
    image:
        'https://images.unsplash.com/photo-1650804068570-7fb2e3dbf888?q=80&w=640&fit=crop',
  ),
  (
    name: 'v0-1.5-lg',
    description: 'Advanced thinking or reasoning.',
    image:
        'https://images.unsplash.com/photo-1610280777472-54133d004c8c?q=80&w=640&fit=crop',
  ),
  (
    name: 'v0-2.0-mini',
    description: 'Open Source model for everyone.',
    image:
        'https://images.unsplash.com/photo-1602146057681-08560aee8cde?q=80&w=640&fit=crop',
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
                    model.image,
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
