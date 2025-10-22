import 'package:example/common/base_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

final profile = [
  (title: 'Name', value: 'Alexandru'),
  (title: 'Username', value: 'nank1ro'),
];
final terms = [
  (
    title: 'Acceptance of Terms',
    description:
        'By accessing and using this service, you accept and agree to be bound by the terms and provision of this agreement. If you do not agree to abide by the above, please do not use this service.',
  ),
  (
    title: 'Use License',
    description:
        'Permission is granted to temporarily download one copy of the materials (information or software) on our service for personal, non-commercial transitory viewing only. This is the grant of a license, not a transfer of title.',
  ),
  (
    title: 'Disclaimer',
    description:
        'The materials on our service are provided on an \'as is\' basis. We make no warranties, expressed or implied, and hereby disclaim and negate all other warranties including, without limitation, implied warranties or conditions of merchantability, fitness for a particular purpose, or non-infringement of intellectual property or other violation of rights.',
  ),
  (
    title: 'Limitations',
    description:
        'In no event shall we or our suppliers be liable for any damages (including, without limitation, damages for loss of data or profit, or due to business interruption) arising out of the use or inability to use the materials on our service, even if we or a ShadcnUi supplier has been advised of the possibility of such damages. Furthermore, you agree that ShadcnUi shall not be liable for direct, indirect, consequential, incidental, special, exemplary, or punitive damages.',
  ),
];

class DialogPage extends StatelessWidget {
  const DialogPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return BaseScaffold(
      appBarTitle: 'Dialog',
      children: [
        ShadButton.outline(
          child: const Text('Edit Profile'),
          onPressed: () {
            showShadDialog(
              context: context,
              builder: (context) => ShadDialog(
                title: const Text('Edit Profile'),
                description: const Text(
                  "Make changes to your profile here. Click save when you're done",
                ),
                actions: const [ShadButton(child: Text('Save changes'))],
                child: Container(
                  width: 375,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    spacing: 16,
                    children: profile
                        .map(
                          (p) => Row(
                            children: [
                              Expanded(
                                child: Text(
                                  p.title,
                                  textAlign: TextAlign.end,
                                  style: theme.textTheme.small,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                flex: 3,
                                child: ShadInput(initialValue: p.value),
                              ),
                            ],
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            );
          },
        ),
        ShadButton.outline(
          child: const Text('Show Dialog'),
          onPressed: () {
            showShadDialog(
              context: context,
              builder: (context) => ShadDialog.alert(
                title: const Text('Are you absolutely sure?'),
                description: const Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Text(
                    'This action cannot be undone. This will permanently delete your account and remove your data from our servers.',
                  ),
                ),
                actions: [
                  ShadButton.outline(
                    child: const Text('Cancel'),
                    onPressed: () => Navigator.of(context).pop(false),
                  ),
                  ShadButton(
                    child: const Text('Continue'),
                    onPressed: () => Navigator.of(context).pop(true),
                  ),
                ],
              ),
            );
          },
        ),
        ShadButton.outline(
          child: const Text('Scrollable Content'),
          onPressed: () {
            showShadDialog(
              context: context,
              builder: (context) => const _ScrollableDialog(),
            );
          },
        ),
        ShadButton.outline(
          child: const Text('Show Complex Dialog'),
          onPressed: () {
            showShadDialog(
              context: context,
              builder: (context) => const _ComplexDialog(),
            );
          },
        ),
      ],
    );
  }
}

class _ScrollableDialog extends StatefulWidget {
  const _ScrollableDialog();

  @override
  State<_ScrollableDialog> createState() => _ScrollableDialogState();
}

class _ScrollableDialogState extends State<_ScrollableDialog> {
  bool isActionsPinned = true;
  bool isHeaderPinned = true;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return ShadDialog(
      gap: 15,
      isHeaderPinned: isHeaderPinned,
      isFooterPinned: isActionsPinned,
      constraints: BoxConstraints(maxWidth: 500, maxHeight: 500),
      title: const Text('Term of Service'),
      description: const Text('Please read our terms of service carefully.'),
      actionsMainAxisAlignment: MainAxisAlignment.spaceBetween,
      actions: [
        ShadSwitch(
          value: isActionsPinned,
          label: Text(
            'Actions pinned',
            style: theme.textTheme.small,
          ),
          onChanged: (value) => setState(() => isActionsPinned = value),
        ),
        ShadSwitch(
          value: isHeaderPinned,
          label: Text(
            'Header pinned',
            style: theme.textTheme.small,
          ),
          onChanged: (value) => setState(() => isHeaderPinned = value),
        ),
      ],
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          spacing: 15,
          children: List.generate(terms.length, (index) {
            final term = terms[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${index + 1}. ${term.title}',
                  style: theme.textTheme.list.copyWith(
                    color: theme.colorScheme.foreground,
                  ),
                ),
                Text(
                  term.description,
                  style: theme.textTheme.muted,
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}

final headerItems = [
  (title: 'Clients', icon: LucideIcons.user),
  (title: 'Fleet', icon: LucideIcons.truck),
  (title: 'Warehouse', icon: LucideIcons.warehouse),
];
final members = [
  (name: 'Leslie Alexander', username: '@leslie.a'),
  (name: 'Alexandru Alexandru', username: '@alexandru.a'),
  (name: 'Esther Howard', username: '@esther.howard'),
];

class _ComplexDialog extends StatelessWidget {
  const _ComplexDialog();

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return ShadDialog.raw(
      variant: ShadDialogVariant.primary,
      constraints: BoxConstraints(
        maxWidth: 800,
        maxHeight: 600,
      ),
      header: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 6,
              children: [
                ...headerItems.map(
                  (e) => ShadButton.outline(
                    size: ShadButtonSize.sm,
                    leading: Icon(e.icon),
                    child: Text(e.title),
                  ),
                ),
                ShadSelect<String>(
                  selectedOptionBuilder: (context, value) {
                    return Text(value.toString());
                  },
                  placeholder: const Text('more'),
                  options: [],
                ),
              ],
            ),
          ),
          const ShadSeparator.horizontal(),
        ],
      ),
      actionsAxis: Axis.vertical,
      isFooterPinned: false,
      footer: Column(
        children: [
          const ShadSeparator.horizontal(),
          const SectionTitle(title: 'Warehouse', badge: '4'),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              spacing: 8,
              children: ['A', 'B', 'C', 'D'].map((e) {
                return ShadButton.outline(
                  height: 55,
                  leading: SizedBox(
                    height: 35,
                    width: 35,
                    child: ShadDecorator(
                      decoration: ShadDecoration(
                        color: theme.colorScheme.background,
                        shadows: ShadShadows.sm,
                        border: ShadBorder.all(
                          color: theme.colorScheme.border,
                          width: 1,
                          radius: BorderRadius.circular(4),
                        ),
                      ),
                      child: Icon(LucideIcons.house400),
                    ),
                  ),
                  child: Text('Warehouse $e'),
                );
              }).toList(),
            ),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MembersSection(),
          const ShadSeparator.horizontal(),
          const MembersSection(),
        ],
      ),
    );
  }
}

class MembersSection extends StatelessWidget {
  const MembersSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(
          title: 'Members',
          badge: '6',
        ),
        const SizedBox(height: 8),
        ...members.map(
          (m) => memberCard(theme, m),
        ),
        const ShadButton.link(
          padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
          trailing: Icon(LucideIcons.chevronDown),
          child: Text('show more'),
        ),
      ],
    );
  }

  ShadButton memberCard(
    ShadThemeData theme,
    ({String name, String username}) m,
  ) {
    return ShadButton.ghost(
      expands: true,
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      leading: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: theme.colorScheme.primary,
        ),
        width: 24,
      ),
      child: Wrap(
        spacing: 8,
        children: [
          Text(m.name),
          Text(
            m.username,
            style: theme.textTheme.muted.copyWith(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.title,
    required this.badge,
  });
  final String title;
  final String badge;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return Row(
      spacing: 8,
      children: [
        Text(
          title,
          style: theme.textTheme.small.copyWith(
            color: theme.colorScheme.foreground,
          ),
        ),
        ShadDecorator(
          decoration: ShadDecoration(
            border: ShadBorder.all(
              color: theme.colorScheme.border,
              width: 1,
              radius: BorderRadius.circular(4),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Center(child: Text(badge, style: theme.textTheme.small)),
          ),
        ),
      ],
    );
  }
}
