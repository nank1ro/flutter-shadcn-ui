import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

enum CardStyle {
  project,
  notifications,
}

class CardPage extends StatelessWidget {
  const CardPage({
    super.key,
    required this.style,
  });

  final CardStyle style;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: () {
          return switch (style) {
            CardStyle.project => const CardProject(),
            CardStyle.notifications => const CardNotifications(),
          };
        }(),
      ),
    );
  }
}

const frameworks = {
  'next': 'Next.js',
  'react': 'React',
  'astro': 'Astro',
  'nuxt': 'Nuxt.js',
};

class CardProject extends StatelessWidget {
  const CardProject({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ShadcnTheme.of(context);
    return SizedBox(
      width: 350,
      child: ShadcnCard(
        title: Text('Create project', style: theme.textTheme.h4),
        description: const Text('Deploy your new project in one-click.'),
        content: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('Name'),
              const ShadcnInput(placeholder: 'Name of your project'),
              const SizedBox(height: 6),
              const Text('Framework'),
              ShadcnSelect<String>(
                placeholder: const Text('Select'),
                options: frameworks.entries
                    .map(
                        (e) => ShadcnOption(value: e.key, child: Text(e.value)))
                    .toList(),
                selectedOptionBuilder: (context, value) {
                  return Text(frameworks[value]!);
                },
                onChanged: (value) {},
              ),
            ],
          ),
        ),
        footer: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ShadcnButton.outline(
              text: const Text('Cancel'),
              onPressed: () {},
            ),
            ShadcnButton(
              text: const Text('Deploy'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

const notifications = [
  (
    title: "Your call has been confirmed.",
    description: "1 hour ago",
  ),
  (
    title: "You have a new message!",
    description: "1 hour ago",
  ),
  (
    title: "Your subscription is expiring soon!",
    description: "2 hours ago",
  ),
];

class CardNotifications extends StatefulWidget {
  const CardNotifications({super.key});

  @override
  State<CardNotifications> createState() => _CardNotificationsState();
}

class _CardNotificationsState extends State<CardNotifications> {
  final pushNotifications = ValueNotifier(false);

  @override
  void dispose() {
    pushNotifications.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadcnTheme.of(context);
    return SizedBox(
      width: 380,
      child: ShadcnCard(
        title: const Text('Notifications'),
        description: const Text('You have 3 unread messages.'),
        content: Column(
          children: [
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: theme.radius,
                border: Border.all(color: theme.colorScheme.border),
              ),
              child: Row(
                children: [
                  ShadcnImage.square(
                    ShadAssets.bellRing,
                    size: 24,
                    color: theme.colorScheme.foreground,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Push Notifications',
                            style: theme.textTheme.small,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Send notifications to device.',
                            style: theme.textTheme.muted,
                          )
                        ],
                      ),
                    ),
                  ),
                  ValueListenableBuilder(
                    valueListenable: pushNotifications,
                    builder: (context, value, child) {
                      return ShadSwitch(
                        value: value,
                        onChanged: (v) => pushNotifications.value = v,
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            ...notifications
                .map(
                  (n) => Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        margin: const EdgeInsets.only(top: 4),
                        decoration: const BoxDecoration(
                          color: Color(0xFF0CA5E9),
                          shape: BoxShape.circle,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Your call has been confirmed.',
                                  style: theme.textTheme.small),
                              const SizedBox(height: 4),
                              Text(n.description, style: theme.textTheme.muted),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
                .separatedBy(const SizedBox(height: 16)),
            const SizedBox(height: 16),
          ],
        ),
        footer: ShadcnButton(
          width: double.infinity,
          text: const Text('Mark all as read'),
          icon: const Padding(
            padding: EdgeInsets.only(right: 8),
            child: ShadcnImage.square(ShadAssets.check, size: 16),
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
