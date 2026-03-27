import 'package:example/common/base_scaffold.dart';
import 'package:example/common/properties/enum_property.dart';
import 'package:example/common/properties/option_property.dart';
import 'package:flutter/material.dart';
import 'package:flutter_solidart/flutter_solidart.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class SidebarPage extends StatefulWidget {
  const SidebarPage({super.key});

  @override
  State<SidebarPage> createState() => _SidebarPageState();
}

class _SidebarPageState extends State<SidebarPage> {
  int _currentTab = 0;

  final collapseModeSignal = Signal(
    ShadSidebarCollapsibleMode.offcanvas,
  );
  final variantSignal = Signal<ShadSidebarVariant>(ShadSidebarVariant.sidebar);

  static const _tabs = [
    'Single Sidebar',
    'Dual Sidebars',
    'Nested Sidebars',
  ];
  final colorSchemes = [
    'blue',
    'gray',
    'green',
    'neutral',
    'orange',
    'red',
    'rose',
    'slate',
    'stone',
    'violet',
    'yellow',
    'zinc',
  ];
  String selectedTheme = 'neutral';

  @override
  void dispose() {
    collapseModeSignal.dispose();
    variantSignal.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentBrightness = ShadTheme.of(context).brightness;

    return ShadTheme(
      data: ShadThemeData(
        colorScheme: ShadColorScheme.fromName(
          selectedTheme,
          brightness: currentBrightness,
        ),
        brightness: currentBrightness,
      ),
      child: Builder(
        builder: (context) {
          return BaseScaffold(
            appBarTitle: 'Sidebar',
            childrenPanelMinWidth: .1,
            editablePanelInitialWidth: .2,
            crossAxisAlignment: CrossAxisAlignment.start,
            editable: [
              MyOptionProperty(
                label: 'Theme',
                initialOption: selectedTheme,
                options: colorSchemes,
                optionToString: (e) => e,
                onChanged: (value) {
                  setState(() {
                    selectedTheme = value!;
                  });
                },
              ),
              const ShadSeparator.horizontal(),
              if (_currentTab == 0) ...[
                MyEnumProperty(
                  label: 'Variant',
                  value: variantSignal.value,
                  values: ShadSidebarVariant.values,
                  onChanged: (v) => variantSignal.value = v!,
                ),
                const ShadSeparator.horizontal(),
                MyEnumProperty(
                  label: 'Collapse mode',
                  value: collapseModeSignal.value,
                  values: ShadSidebarCollapsibleMode.values,
                  onChanged: (v) => collapseModeSignal.value = v!,
                ),
                const ShadSeparator.horizontal(),
              ],

              SizedBox(
                child: Column(
                  spacing: 8,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(_tabs.length, (i) {
                    final isSelected = _currentTab == i;
                    return ShadButton.raw(
                      onPressed: () => setState(() => _currentTab = i),
                      size: ShadButtonSize.sm,
                      variant: isSelected
                          ? ShadButtonVariant.primary
                          : ShadButtonVariant.outline,
                      child: Text(_tabs[i]),
                    );
                  }),
                ),
              ),
            ],
            wrapChildrenInScrollable: false,
            wrapSingleChildInColumn: false,
            children: [
              switch (_currentTab) {
                0 => SignalBuilder(
                  builder: (context, _) {
                    return _DefaultSidebarExample(
                      collapsibleMode: collapseModeSignal.value,
                      variant: variantSignal.value,
                    );
                  },
                ),
                1 => const _DualSidebarExample(),
                2 => const _NestedSidebarExample(),
                _ => const SizedBox.shrink(),
              },
            ],
          );
        },
      ),
    );
  }
}

// =============================================================================
// 1. Default Sidebar
// =============================================================================

class _DefaultSidebarExample extends StatelessWidget {
  const _DefaultSidebarExample({
    required this.variant,
    required this.collapsibleMode,
  });
  final ShadSidebarVariant variant;
  final ShadSidebarCollapsibleMode collapsibleMode;

  @override
  Widget build(BuildContext context) {
    return ShadSidebarScaffold(
      variant: variant,
      collapsibleMode: collapsibleMode,
      sidebar: ShadSidebar(
        header: const ShadSidebarHeader(
          child: _AppLogo(),
        ),
        content: ShadSidebarContent(
          children: [
            if (collapsibleMode == ShadSidebarCollapsibleMode.icon)
              const _PlatformGroupWithTooltips()
            else
              const _PlatformGroup(),
            const ShadSidebarSeparator(),
            const _ProjectsGroup(),
            const ShadSidebarSeparator(),
            const _SettingsGroup(),
          ],
        ),
        footer: const ShadSidebarFooter(
          child: _UserFooter(),
        ),
      ),
      child: _MainContent(
        title: switch (variant) {
          ShadSidebarVariant.sidebar => 'Default Variant',
          ShadSidebarVariant.floating => 'Floating Variant',
          ShadSidebarVariant.inset => 'Inset Variant',
        },
      ),
    );
  }
}

// =============================================================================
// 2. Dual Sidebar
// =============================================================================

class _DualSidebarExample extends StatefulWidget {
  const _DualSidebarExample();

  @override
  State<_DualSidebarExample> createState() => _DualSidebarExampleState();
}

class _DualSidebarExampleState extends State<_DualSidebarExample> {
  final _startController = ShadSidebarController();
  final _endController = ShadSidebarController();

  @override
  void dispose() {
    _startController.dispose();
    _endController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ShadSidebarScaffold(
      side: ShadSidebarSide.start,
      controller: _startController,
      variant: ShadSidebarVariant.sidebar,
      collapsibleMode: ShadSidebarCollapsibleMode.offcanvas,
      sidebar: ShadSidebar(
        header: ShadSidebarHeader(
          child: _AppLogo(),
        ),
        content: ShadSidebarContent(
          children: [
            const _PlatformGroup(),
            const ShadSidebarSeparator(),
            _ProjectsGroup(),
          ],
        ),
        footer: ShadSidebarFooter(
          child: _UserFooter(),
        ),
      ),
      // Nested scaffold for end sidebar
      child: ShadSidebarScaffold(
        side: ShadSidebarSide.end,
        controller: _endController,
        variant: ShadSidebarVariant.sidebar,
        collapsibleMode: ShadSidebarCollapsibleMode.offcanvas,
        width: 220,
        sidebar: ShadSidebar(
          header: ShadSidebarHeader(
            child: Text(
              'Inspector',
              style: ShadTheme.of(context).textTheme.large,
            ),
          ),
          content: ShadSidebarContent(
            children: const [
              _PropertiesGroup(),
              ShadSidebarSeparator(),
              _LayersGroup(),
            ],
          ),
        ),
        child: _DualSidebarMainContent(
          startController: _startController,
          endController: _endController,
        ),
      ),
    );
  }
}

class _DualSidebarMainContent extends StatelessWidget {
  const _DualSidebarMainContent({
    required this.startController,
    required this.endController,
  });

  final ShadSidebarController startController;
  final ShadSidebarController endController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Toolbar with both triggers
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Row(
            children: [
              ShadSidebarTrigger(controller: startController),
              const Spacer(),
              Text(
                'Dual Sidebar',
                style: ShadTheme.of(context).textTheme.large,
              ),
              const Spacer(),
              ShadSidebarTrigger(controller: endController),
            ],
          ),
        ),
        const ShadSidebarSeparator(),
        Expanded(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Dual Sidebar Layout',
                    style: ShadTheme.of(context).textTheme.h3,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Navigation on the left, inspector/properties on the right.\n'
                    'Each sidebar has its own controller and trigger.',
                    style: ShadTheme.of(context).textTheme.muted,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// =============================================================================
// 3. Nested Sidebar
// =============================================================================
final messages = [
  (
    sender: 'James Martin',
    subject: 'Re: Conference Registration',
    date: '1 Week ago',
    preview:
        'Hi, I would like to register for the conference. Please let me know if you can help me with the registration.',
  ),
  (
    sender: 'John Smith',
    subject: 'Important Announcement',
    date: '2 Weeks ago',
    preview:
        'Please join us for the conference. We are excited to announce the launch of our new product.',
  ),
  (
    sender: 'Sarah Lee',
    subject: 'Conference Registration',
    date: '1 Weeks ago',
    preview:
        'Hi, I would like to register for the conference. Please let me know if you can help me with the registration.',
  ),
];
final inboxTabs = [
  (title: 'Inbox', icon: LucideIcons.inbox),
  (title: 'Draft', icon: LucideIcons.file),
  (title: 'Sent', icon: LucideIcons.send),
  (title: 'Archive', icon: LucideIcons.archive),
  (title: 'Trash', icon: LucideIcons.trash2),
];

class _NestedSidebarExample extends StatefulWidget {
  const _NestedSidebarExample();

  @override
  State<_NestedSidebarExample> createState() => _NestedSidebarExampleState();
}

class _NestedSidebarExampleState extends State<_NestedSidebarExample> {
  final _pinnedController = ShadSidebarController(isOpen: false);
  final _collapsibleController = ShadSidebarController();

  @override
  void dispose() {
    _pinnedController.dispose();
    _collapsibleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ShadSidebarScaffold(
      side: ShadSidebarSide.start,
      controller: _pinnedController,
      variant: ShadSidebarVariant.sidebar,
      collapsibleMode: ShadSidebarCollapsibleMode.icon,
      sidebar: ShadSidebar(
        header: const ShadSidebarHeader(
          child: _AppLogo(),
        ),
        content: ShadSidebarContent(
          children: [
            ShadSidebarGroup(
              children: inboxTabs
                  .map(
                    (t) => ShadSidebarItem(
                      icon: Icon(t.icon),
                      child: Text(t.title),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
        footer: ShadSidebarFooter(
          child: _UserFooter(),
        ),
      ),
      // Nested scaffold for second sidebar
      child: ShadSidebarScaffold(
        side: ShadSidebarSide.start,
        controller: _collapsibleController,
        variant: ShadSidebarVariant.sidebar,
        collapsibleMode: ShadSidebarCollapsibleMode.offcanvas,
        width: 220,
        sidebar: ShadSidebar(
          header: const ShadSidebarHeader(
            child: Text('Inbox'),
          ),
          content: ShadSidebarContent(
            children: messages
                .map(
                  (m) => ShadButton.ghost(
                    textStyle: TextStyle(
                      color: ShadTheme.of(
                        context,
                      ).colorScheme.sidebarForeground,
                    ),
                    decoration: ShadDecoration(
                      shadows: [],
                      border: ShadBorder(
                        radius: BorderRadius.zero,
                        bottom: ShadBorderSide(
                          width: 1,
                          color: ShadTheme.of(
                            context,
                          ).colorScheme.border,
                        ),
                      ),
                    ),
                    padding: const EdgeInsets.all(14.0),
                    expands: true,
                    height: 116,
                    gap: 0,
                    child: Column(
                      spacing: 8,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(m.sender),
                            Text(
                              m.date,
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                        Text(
                          m.subject,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          m.preview,
                          style: TextStyle(
                            fontSize: 12,
                            height: 1.25,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        child: _NestedSidebarMainContent(
          collapsibleController: _collapsibleController,
        ),
      ),
    );
  }
}

class _NestedSidebarMainContent extends StatelessWidget {
  const _NestedSidebarMainContent({
    required this.collapsibleController,
  });

  final ShadSidebarController collapsibleController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Toolbar with both triggers
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Row(
            children: [
              ShadSidebarTrigger(controller: collapsibleController),
              Text(
                'Nested Sidebars',
                style: ShadTheme.of(context).textTheme.large,
              ),
            ],
          ),
        ),
        const ShadSidebarSeparator(),
        Expanded(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Nested Sidebar Layout',
                    style: ShadTheme.of(context).textTheme.h3,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// =============================================================================
// Shared: Main Content
// =============================================================================

class _MainContent extends StatelessWidget {
  const _MainContent({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Top toolbar
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Row(
            children: [
              const ShadSidebarTrigger(),
              const SizedBox(width: 8),
              Text(title, style: ShadTheme.of(context).textTheme.large),
            ],
          ),
        ),
        const ShadSidebarSeparator(),
        // Body
        Expanded(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: ShadTheme.of(context).textTheme.h3,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Use the trigger button or press Cmd+B / Ctrl+B to toggle.',
                    style: ShadTheme.of(context).textTheme.muted,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  Flexible(child: _ContentCards()),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ContentCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colorScheme = ShadTheme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        spacing: 16,
        children: [
          SizedBox(
            height: 200,
            child: GridView.custom(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisExtent: 200,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
              ),
              childrenDelegate: SliverChildListDelegate.fixed(
                [
                  for (var i = 0; i <= 2; i++)
                    SizedBox(
                      height: 180,
                      child: Card(
                        elevation: 0,
                        color: colorScheme.accent,
                      ),
                    ),
                ],
              ),
            ),
          ),
          Flexible(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                minWidth: double.infinity,
                minHeight: double.infinity,
              ),
              child: Card(
                elevation: 0,
                color: colorScheme.accent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// =============================================================================
// Shared: App Logo
// =============================================================================

class _AppLogo extends StatelessWidget {
  const _AppLogo();
  @override
  Widget build(BuildContext context) {
    final scope = ShadSidebarScope.maybeOf(context);
    final isIconCollapsed = scope?.isIconCollapsed ?? false;

    if (isIconCollapsed) {
      return _LogoIcon(size: 24);
    }

    return Row(
      children: [
        const _LogoIcon(size: 24),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Acme Inc',
                style: ShadTheme.of(context).textTheme.p.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'Enterprise',
                style: ShadTheme.of(context).textTheme.muted.copyWith(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _LogoIcon extends StatelessWidget {
  const _LogoIcon({required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: theme.colorScheme.primary,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Center(
        child: Text(
          'A',
          style: TextStyle(
            color: theme.colorScheme.primaryForeground,
            fontSize: size * 0.5,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

// =============================================================================
// Shared: User Footer
// =============================================================================

class _UserFooter extends StatelessWidget {
  const _UserFooter();
  @override
  Widget build(BuildContext context) {
    final scope = ShadSidebarScope.maybeOf(context);
    final isIconCollapsed = scope?.isIconCollapsed ?? false;

    if (isIconCollapsed) {
      return const Center(
        child: Icon(LucideIcons.userRound500),
      );
    }

    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: const Icon(LucideIcons.userRound500),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'John Doe',
                style: ShadTheme.of(context).textTheme.p.copyWith(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                'john@acme.com',
                style: ShadTheme.of(context).textTheme.muted.copyWith(
                  fontSize: 12,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// =============================================================================
// Shared: Sidebar Groups (default — no tooltips)
// =============================================================================

class _PlatformGroup extends StatelessWidget {
  const _PlatformGroup();
  @override
  Widget build(BuildContext context) {
    return ShadSidebarGroup(
      label: const Text('Platform'),
      children: [
        ShadSidebarItem(
          icon: const Icon(Icons.search_rounded),
          child: const Text('Search'),
          onPressed: () {},
        ),
        ShadSidebarItem.collapsible(
          icon: const Icon(Icons.smart_toy_outlined),
          child: const Text('Models'),
          children: [
            ShadSidebarItem(
              child: const Text('Genesis'),
              onPressed: () {},
            ),
            ShadSidebarItem(
              selected: true,
              onPressed: () {},
              child: const Text('Explorer'),
            ),
            ShadSidebarItem(
              child: const Text('Quantum'),
              onPressed: () {},
            ),
          ],
        ),
        ShadSidebarItem.collapsible(
          icon: const Icon(Icons.description_outlined),
          child: const Text('Documentation'),
          initiallyExpanded: true,
          children: [
            ShadSidebarItem(
              child: const Text('Introduction'),
              onPressed: () {},
            ),
            ShadSidebarItem(
              selected: true,
              onPressed: () {},
              child: const Text('Get Started'),
            ),
            ShadSidebarItem(
              child: const Text('Tutorials'),
              onPressed: () {},
            ),
            ShadSidebarItem(
              child: const Text('Changelog'),
              onPressed: () {},
            ),
          ],
        ),
        ShadSidebarItem(
          icon: const Icon(Icons.settings_outlined),
          child: const Text('Settings'),
          onPressed: () {},
        ),
      ],
    );
  }
}

class _ProjectsGroup extends StatelessWidget {
  const _ProjectsGroup();
  @override
  Widget build(BuildContext context) {
    return ShadSidebarGroup(
      label: const Text('Projects'),
      children: [
        ShadSidebarItem(
          icon: const Icon(Icons.folder_outlined),
          trailing: _Badge('12'),
          onPressed: () {},
          child: const Text('Design Engineering'),
        ),
        ShadSidebarItem(
          icon: const Icon(Icons.folder_outlined),
          trailing: _Badge('6'),
          onPressed: () {},
          child: const Text('Sales & Marketing'),
        ),
        ShadSidebarItem(
          icon: const Icon(Icons.folder_outlined),
          trailing: _Badge('3'),
          onPressed: () {},
          child: const Text('Travel'),
        ),
      ],
    );
  }
}

class _SettingsGroup extends StatelessWidget {
  const _SettingsGroup();
  @override
  Widget build(BuildContext context) {
    return ShadSidebarGroup(
      label: const Text('Settings'),
      children: [
        ShadSidebarItem(
          icon: const Icon(Icons.person_outline),
          child: const Text('Account'),
          onPressed: () {},
        ),
        ShadSidebarItem(
          icon: const Icon(Icons.notifications_outlined),
          child: const Text('Notifications'),
          onPressed: () {},
        ),
        ShadSidebarItem(
          icon: const Icon(Icons.security_outlined),
          child: const Text('Security'),
          onPressed: () {},
        ),
        ShadSidebarItem(
          icon: const Icon(Icons.palette_outlined),
          child: const Text('Appearance'),
          onPressed: () {},
        ),
      ],
    );
  }
}

// =============================================================================
// Shared: Sidebar Groups (with tooltips — for icon collapse mode)
// =============================================================================

class _PlatformGroupWithTooltips extends StatelessWidget {
  const _PlatformGroupWithTooltips();
  @override
  Widget build(BuildContext context) {
    return ShadSidebarGroup(
      label: const Text('Platform'),
      children: [
        ShadSidebarItem(
          icon: const Icon(Icons.home_outlined),
          tooltip: 'Home',
          selected: true,
          onPressed: () {},
          child: const Text('Home'),
        ),
        ShadSidebarItem(
          icon: const Icon(Icons.inbox_outlined),
          tooltip: 'Inbox',
          trailing: _Badge('24'),
          onPressed: () {},
          child: const Text('Inbox'),
        ),
        ShadSidebarItem(
          icon: const Icon(Icons.calendar_today_outlined),
          tooltip: 'Calendar',
          onPressed: () {},
          child: const Text('Calendar'),
        ),
        ShadSidebarItem(
          icon: const Icon(Icons.search_rounded),
          tooltip: 'Search',
          onPressed: () {},
          child: const Text('Search'),
        ),
        ShadSidebarItem(
          icon: const Icon(Icons.settings_outlined),
          tooltip: 'Settings',
          onPressed: () {},
          child: const Text('Settings'),
        ),
      ],
    );
  }
}

// =============================================================================
// Dual Sidebar: Right-side groups
// =============================================================================

class _PropertiesGroup extends StatelessWidget {
  const _PropertiesGroup();
  @override
  Widget build(BuildContext context) {
    return const ShadSidebarGroup(
      label: Text('Properties'),
      children: [
        ShadSidebarItem(
          icon: Icon(Icons.straighten_outlined),
          child: Text('Dimensions'),
          children: [
            ShadSidebarItem(
              child: Text('Width: 1200px'),
            ),
            ShadSidebarItem(
              child: Text('Height: 800px'),
            ),
          ],
        ),
        ShadSidebarItem(
          icon: Icon(Icons.format_paint_outlined),
          child: Text('Fill'),
          children: [
            ShadSidebarItem(
              child: Text('Background'),
            ),
            ShadSidebarItem(
              child: Text('Gradient'),
            ),
          ],
        ),
        ShadSidebarItem(
          icon: Icon(Icons.border_all_outlined),
          child: Text('Stroke'),
        ),
      ],
    );
  }
}

class _LayersGroup extends StatelessWidget {
  const _LayersGroup();
  @override
  Widget build(BuildContext context) {
    return ShadSidebarGroup(
      label: const Text('Layers'),
      children: [
        ShadSidebarItem(
          icon: const Icon(Icons.image_outlined),
          selected: true,
          onPressed: () {},
          child: const Text('Header Image'),
        ),
        ShadSidebarItem(
          icon: const Icon(Icons.text_fields),
          child: const Text('Title Text'),
          onPressed: () {},
        ),
        ShadSidebarItem(
          icon: const Icon(Icons.rectangle_outlined),
          child: const Text('Card Container'),
          onPressed: () {},
        ),
        ShadSidebarItem(
          icon: const Icon(Icons.text_fields),
          child: const Text('Body Text'),
          onPressed: () {},
        ),
        ShadSidebarItem(
          icon: const Icon(Icons.smart_button_outlined),
          child: const Text('CTA Button'),
          onPressed: () {},
        ),
      ],
    );
  }
}

// =============================================================================
// Shared: Badge helper
// =============================================================================

class _Badge extends StatelessWidget {
  const _Badge(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
      decoration: BoxDecoration(
        color: theme.colorScheme.muted,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          color: theme.colorScheme.mutedForeground,
        ),
      ),
    );
  }
}
