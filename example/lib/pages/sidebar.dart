import 'package:example/common/base_scaffold.dart';
import 'package:example/common/properties/enum_property.dart';
import 'package:example/common/properties/option_property.dart';
import 'package:flutter/material.dart';
import 'package:flutter_solidart/flutter_solidart.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

const kMobileWrapperWidth = 400.0;
const kTabletWrapperWidth = 800.0;
const kDesktopWrapperWidth = 1150.0;

/// The width of each [_SidebarExampleWrapper]
final wrapperWidthSignal = Signal<double>.lazy(autoDispose: true);

final collapseModeSignal = Signal<ShadSidebarCollapseMode>.lazy(
  autoDispose: true,
);

class SidebarPage extends StatefulWidget {
  const SidebarPage({super.key});

  @override
  State<SidebarPage> createState() => _SidebarPageState();
}

class _SidebarPageState extends State<SidebarPage>
    with SingleTickerProviderStateMixin {
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
  void initState() {
    super.initState();
    wrapperWidthSignal.value = kDesktopWrapperWidth;
    collapseModeSignal.value = ShadSidebarCollapseMode.offScreen;
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
        disableSecondaryBorder: true,
      ),
      child: Builder(
        builder: (context) {
          return BaseScaffold(
            appBarTitle: 'Sidebar',
            editablePanelInitialWidth: 0.1,
            editablePanelMinWidth: 0.1,
            wrapChildrenInScrollable: true,
            crossAxisAlignment: CrossAxisAlignment.center,
            gap: 40,
            editable: [
              MyOptionProperty(
                label: 'Select a theme from the dropdown:',
                minWidth: 180,
                labelTextStyle: TextStyle(fontSize: 14),
                initialOption: selectedTheme,
                options: colorSchemes,
                optionToString: (e) => e,
                onChanged: (value) {
                  setState(() {
                    selectedTheme = value!;
                  });
                },
              ),
              _DeviceToggle(),
              MyEnumProperty(
                label: 'Collapse mode',
                value: collapseModeSignal.value,
                values: ShadSidebarCollapseMode.values,
                onChanged: (v) => collapseModeSignal.value = v!,
              ),
            ],
            children: [
              _NormalVariant(),
              _InsetVariant(),
              _FloatingVariant(),
              _NestedExample(),
            ],
          );
        },
      ),
    );
  }
}

class _DeviceToggle extends StatelessWidget {
  const _DeviceToggle();

  @override
  Widget build(BuildContext context) {
    final colorScheme = ShadTheme.of(context).colorScheme;

    return ShadCard(
      padding: EdgeInsets.all(8),
      title: SignalBuilder(
        builder: (context, _) {
          final isMobileWidth = wrapperWidthSignal.value == kMobileWrapperWidth;
          final isTabletWidth = wrapperWidthSignal.value == kTabletWrapperWidth;
          final isDesktopWidth =
              wrapperWidthSignal.value == kDesktopWrapperWidth;
          return Center(
            child: Wrap(
              runAlignment: WrapAlignment.center,
              direction: Axis.vertical,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                ShadButton.ghost(
                  leading: Icon(LucideIcons.smartphone400, size: 20),
                  onPressed: () {
                    wrapperWidthSignal.value = kMobileWrapperWidth;
                  },
                  foregroundColor: colorScheme.accentForeground,
                  backgroundColor: isMobileWidth ? colorScheme.accent : null,
                  child: Text('Mobile'),
                ),
                ShadButton.ghost(
                  leading: Icon(LucideIcons.tablet400, size: 20),
                  onPressed: () {
                    wrapperWidthSignal.value = kTabletWrapperWidth;
                  },
                  foregroundColor: colorScheme.accentForeground,
                  backgroundColor: isTabletWidth ? colorScheme.accent : null,
                  child: Text('Tablet'),
                ),
                ShadButton.ghost(
                  leading: Icon(LucideIcons.monitor400, size: 20),
                  onPressed: () {
                    wrapperWidthSignal.value = kDesktopWrapperWidth;
                  },
                  foregroundColor: colorScheme.accentForeground,
                  backgroundColor: isDesktopWidth ? colorScheme.accent : null,
                  child: Text('Desktop'),
                ),
                const Divider(),
              ],
            ),
          );
        },
      ),
      description: Text(
        'or use the handle to resize the scaffold.',
        style: TextStyle(fontSize: 12),
      ),
    );
  }
}

final sidebarExtendedWidth = 256.0;
final versions = ['v1.0.1', 'v1.1.0-alpha', 'v2.0.0-beta'];

class _NormalVariant extends StatelessWidget {
  const _NormalVariant();

  @override
  Widget build(BuildContext context) {
    return _SidebarExampleWrapper(
      child: SignalBuilder(
        builder: (context, contentWidget) {
          return ShadSidebarScaffold(
            body: contentWidget!,
            sidebar: ShadSidebar.normal(
              extendedWidth: sidebarExtendedWidth,
              collapseMode: collapseModeSignal.value,
              header: ShadSidebarHeader(
                spacing: 8,
                children: [
                  ShadSidebarSelectTile(
                    title: 'Documentation',
                    initialValue: versions.first,
                    minWidth: sidebarExtendedWidth - 8,
                    menuItems: versions,
                  ),
                  const _SearchInput(),
                ],
              ),
              content: ShadSidebarContent(
                children: [
                  ShadSidebarGroup.items(
                    labelText: 'Getting Started',
                    items: [
                      ShadSidebarItem(labelText: 'Installation'),
                      ShadSidebarItem(labelText: 'Project Setup'),
                    ],
                  ),
                  ShadSidebarGroup.items(
                    labelText: 'Building Your Application',
                    items: [
                      ShadSidebarItem(labelText: 'Routing'),
                      ShadSidebarItem(
                        labelText: 'Data fetching',
                        selected: true,
                      ),
                      ShadSidebarItem(labelText: 'Rendering'),
                      ShadSidebarItem(labelText: 'Caching'),
                      ShadSidebarItem(labelText: 'Authentication'),
                      ShadSidebarItem(labelText: 'State management'),
                      ShadSidebarItem(labelText: 'Navigation'),
                      ShadSidebarItem(labelText: 'Styling'),
                      ShadSidebarItem(labelText: 'Testing'),
                      ShadSidebarItem(labelText: 'Upgrading'),
                      ShadSidebarItem(labelText: 'Deployment'),
                      ShadSidebarItem(labelText: 'Examples'),
                    ],
                  ),
                  ShadSidebarGroup.items(
                    labelText: 'API Reference',
                    items: [
                      ShadSidebarItem(labelText: 'Components'),
                      ShadSidebarItem(labelText: 'File Conventions'),
                      ShadSidebarItem(labelText: 'Widgets'),
                      ShadSidebarItem(labelText: 'Functions'),
                      ShadSidebarItem(labelText: 'CLI'),
                      ShadSidebarItem(labelText: 'Edge Runtime'),
                    ],
                  ),
                  ShadSidebarGroup.items(
                    labelText: 'Architecture',
                    items: [
                      ShadSidebarItem(labelText: 'Accessibility'),
                      ShadSidebarItem(labelText: 'Fast Refresh'),
                      ShadSidebarItem(labelText: 'Flutter for Web'),
                      ShadSidebarItem(labelText: 'Hot Reload'),
                      ShadSidebarItem(labelText: 'Plugins'),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
        child: _MainContent(
          exampleTitle: 'A normal sidebar with navigation grouped by section',
          triggerButton: const ShadSidebarTrigger(),
        ),
      ),
    );
  }
}

class _InsetVariant extends StatelessWidget {
  const _InsetVariant();

  @override
  Widget build(BuildContext context) {
    return _SidebarExampleWrapper(
      child: SignalBuilder(
        builder: (context, mainContent) {
          return ShadSidebarScaffold(
            body: mainContent!,
            endSidebar: ShadSidebar.inset(
              extendedWidth: sidebarExtendedWidth,
              collapseMode: collapseModeSignal.value,
              header: ShadSidebarHeader(
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 8,
                children: [
                  ShadSidebarTile(
                    titleText: 'Ace Inc.',
                    subTitleText: 'Enterprise',
                    leadingIconData: LucideIcons.command400,
                  ),
                ],
              ),
              footer: ShadSidebarFooter(
                children: [
                  Builder(
                    builder: (context) {
                      final state = ShadSidebar.of(context);
                      return ShadSidebarMenuTile(
                        menuConstraints: BoxConstraints(
                          minWidth: sidebarExtendedWidth,
                        ),
                        titleText: 'Flutter Shadcn',
                        subTitleText: 'me@example.com',
                        trailingIcon: const Icon(LucideIcons.chevronsUpDown400),
                        leadingIconData: LucideIcons.userRound,
                        menuAnchor: ShadAnchor(
                          overlayAlignment: state.side.isStart
                              ? Alignment.bottomRight
                              : Alignment.bottomLeft,
                          childAlignment: state.side.isStart
                              ? Alignment.bottomLeft
                              : Alignment.bottomRight,
                        ),
                        items: [
                          const ShadContextMenuItem(
                            leading: Icon(LucideIcons.user400),
                            child: Text('Account'),
                          ),
                          const ShadContextMenuItem(
                            leading: Icon(LucideIcons.cog400),
                            child: Text('Settings'),
                          ),
                          const ShadSidebarSeparator(),
                          const ShadContextMenuItem(
                            leading: Icon(LucideIcons.logOut400),
                            child: Text('Sign out'),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
              content: ShadSidebarContent(
                children: [
                  ShadSidebarGroup.items(
                    labelText: 'Platform',
                    hiddenWhenCollapsedToIcons: false,
                    items: [
                      ShadSidebarItem.collapsible(
                        labelText: 'Playground',
                        leading: Icon(LucideIcons.squareTerminal400),
                        items: [
                          ShadSidebarItem(labelText: 'History'),
                          ShadSidebarItem(labelText: 'Starred'),
                          ShadSidebarItem(labelText: 'Settings'),
                        ],
                      ),
                      ShadSidebarItem.collapsible(
                        labelText: 'Models',
                        initiallyCollapsed: true,
                        leading: Icon(LucideIcons.bot400),
                        items: [
                          ShadSidebarItem(labelText: 'Genesis'),
                          ShadSidebarItem(labelText: 'Explorer'),
                          ShadSidebarItem(labelText: 'Quantum'),
                        ],
                      ),
                      ShadSidebarItem.collapsible(
                        labelText: 'Documentation',
                        initiallyCollapsed: true,
                        leading: Icon(LucideIcons.bookOpen400),
                        items: [
                          ShadSidebarItem(labelText: 'Introduction'),
                          ShadSidebarItem(labelText: 'Get started'),
                          ShadSidebarItem(labelText: 'Tutorials'),
                          ShadSidebarItem(labelText: 'Examples'),
                        ],
                      ),
                      ShadSidebarItem.collapsible(
                        labelText: 'Settings',
                        initiallyCollapsed: true,
                        leading: Icon(LucideIcons.settings2400),
                        items: [
                          ShadSidebarItem(labelText: 'General'),
                          ShadSidebarItem(labelText: 'Team'),
                          ShadSidebarItem(labelText: 'Billing'),
                          ShadSidebarItem(labelText: 'Limits'),
                        ],
                      ),
                    ],
                  ),
                  ShadSidebarGroup.items(
                    labelText: 'Projects',
                    items: [
                      ShadSidebarItem.contextMenu(
                        labelText: 'Design Engineering',
                        leading: Icon(LucideIcons.frame400),
                        items: [
                          ShadContextMenuItem(
                            leading: Icon(LucideIcons.folder400),
                            child: Text('View Project'),
                          ),
                          ShadContextMenuItem(
                            leading: Icon(LucideIcons.share400),
                            child: Text('Share Project'),
                          ),
                          ShadSeparator.horizontal(
                            margin: EdgeInsets.symmetric(vertical: 4),
                          ),
                          ShadContextMenuItem(
                            leading: Icon(LucideIcons.trash400),
                            child: Text('Delete Project'),
                          ),
                        ],
                      ),
                      ShadSidebarItem.contextMenu(
                        labelText: 'Sales & Marketing',
                        leading: Icon(LucideIcons.chartPie400),
                        items: [
                          ShadContextMenuItem(
                            leading: Icon(LucideIcons.folder400),
                            child: Text('View Project'),
                          ),
                          ShadContextMenuItem(
                            leading: Icon(LucideIcons.share400),
                            child: Text('Share Project'),
                          ),
                          ShadSeparator.horizontal(
                            margin: EdgeInsets.symmetric(vertical: 4),
                          ),
                          ShadContextMenuItem(
                            leading: Icon(LucideIcons.trash400),
                            child: Text('Delete Project'),
                          ),
                        ],
                      ),
                      ShadSidebarItem.contextMenu(
                        labelText: 'Travel',
                        leading: Icon(LucideIcons.map400),
                        items: [
                          ShadContextMenuItem(
                            leading: Icon(LucideIcons.folder400),
                            child: Text('View Project'),
                          ),
                          ShadContextMenuItem(
                            leading: Icon(LucideIcons.share400),
                            child: Text('Share Project'),
                          ),
                          ShadSeparator.horizontal(
                            margin: EdgeInsets.symmetric(vertical: 4),
                          ),
                          ShadContextMenuItem(
                            leading: Icon(LucideIcons.trash400),
                            child: Text('Delete Project'),
                          ),
                        ],
                      ),
                      ShadSidebarItem(
                        labelText: 'More',
                      ),
                    ],
                  ),
                  ShadSidebarGroup.items(
                    flex: 1,
                    items: [
                      ShadSidebarItem(
                        labelText: 'Support',
                        leading: Icon(LucideIcons.lifeBuoy400, size: 16),
                      ),
                      ShadSidebarItem(
                        labelText: 'Feedback',
                        leading: Icon(LucideIcons.send400, size: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
        child: _MainContent(
          exampleTitle: 'An inset end-sidebar',
          withBorders: false,
          triggerButton: const ShadSidebarTrigger.end(),
        ),
      ),
    );
  }
}

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

class _NestedExample extends StatefulWidget {
  const _NestedExample();

  @override
  State<_NestedExample> createState() => _NestedExampleState();
}

class _NestedExampleState extends State<_NestedExample> {
  final selectedInboxTab = ValueNotifier<int>(0);

  @override
  void dispose() {
    selectedInboxTab.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _SidebarExampleWrapper(
      child: ShadSidebarScaffold(
        body: Builder(
          builder: (context) {
            return ClipRRect(
              child: ShadSidebarScaffold(
                sidebar: ShadSidebar.normal(
                  initiallyExtended: true,
                  header: ShadSidebarHeader(
                    spacing: 0,
                    padding: EdgeInsetsGeometry.all(16),
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ValueListenableBuilder(
                            valueListenable: selectedInboxTab,
                            builder: (context, value, _) {
                              return Text(
                                inboxTabs.elementAt(value).title,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            },
                          ),
                          const ShadSwitch(
                            value: false,
                            label: Text('unread only'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),
                      const _SearchInput(),
                      const ShadSeparator.horizontal(),
                    ],
                  ),
                  content: ShadSidebarContent(
                    spacing: 0,
                    children: [
                      ...messages.map(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                  fontWeight: FontWeight.w500,
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
                      ),
                    ],
                  ),
                ),
                body: _MainContent(
                  exampleTitle: 'A nested Sidebar',
                  triggerButton: Builder(
                    builder: (nestedScaffoldContext) {
                      return ShadIconButton.ghost(
                        icon: const Icon(LucideIcons.panelLeft, size: 16),
                        onPressed: () {
                          final isMobile =
                              ShadSidebarScaffold.of(
                                context,
                              ).sidebarState?.isMobile ??
                              false;
                          if (isMobile) {
                            ShadSidebarScaffold.of(context).toggleSidebar();
                          } else {
                            ShadSidebarScaffold.of(
                              nestedScaffoldContext,
                            ).toggleSidebar();
                          }
                        },
                      );
                    },
                  ),
                ),
              ),
            );
          },
        ),
        sidebar: ShadSidebar.normal(
          extendedWidth: sidebarExtendedWidth,
          initiallyExtended: false,
          triggerWithRail: false,
          collapseMode: ShadSidebarCollapseMode.icons,
          header: ShadSidebarHeader(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 8,
            children: [
              ShadSidebarTile(
                titleText: 'Ace Inc.',
                subTitleText: 'Enterprise',
                leadingIconData: LucideIcons.command400,
              ),
            ],
          ),
          footer: ShadSidebarFooter(
            children: [
              Builder(
                builder: (context) {
                  final state = ShadSidebar.of(context);
                  return ShadSidebarMenuTile(
                    menuConstraints: BoxConstraints(
                      minWidth: sidebarExtendedWidth,
                    ),
                    titleText: 'Flutter Shadcn',
                    subTitleText: 'me@example.com',
                    trailingIcon: const Icon(LucideIcons.chevronsUpDown400),
                    leadingIconData: LucideIcons.userRound,
                    menuAnchor: ShadAnchor(
                      overlayAlignment: state.side.isStart
                          ? Alignment.bottomRight
                          : Alignment.bottomLeft,
                      childAlignment: state.side.isStart
                          ? Alignment.bottomLeft
                          : Alignment.bottomRight,
                    ),
                    items: [
                      const ShadContextMenuItem(
                        leading: Icon(LucideIcons.user400),
                        child: Text('Account'),
                      ),
                      const ShadContextMenuItem(
                        leading: Icon(LucideIcons.cog400),
                        child: Text('Settings'),
                      ),
                      const ShadSidebarSeparator(),
                      const ShadContextMenuItem(
                        leading: Icon(LucideIcons.logOut400),
                        child: Text('Sign out'),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
          content: ShadSidebarContent(
            children: [
              ValueListenableBuilder(
                valueListenable: selectedInboxTab,
                builder: (context, tabIndex, _) {
                  return ShadSidebarGroup.items(
                    labelText: 'Mailbox',
                    hiddenWhenCollapsedToIcons: false,
                    items: inboxTabs
                        .map(
                          (e) => ShadSidebarItem(
                            selected: tabIndex == inboxTabs.indexOf(e),
                            labelText: e.title,
                            leading: Icon(e.icon),
                            onPressed: () {
                              selectedInboxTab.value = inboxTabs.indexOf(e);
                            },
                          ),
                        )
                        .toList(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FloatingVariant extends StatelessWidget {
  const _FloatingVariant();

  @override
  Widget build(BuildContext context) {
    return _SidebarExampleWrapper(
      child: SignalBuilder(
        builder: (context, contentWidget) {
          return ShadSidebarScaffold(
            body: contentWidget!,
            sidebar: ShadSidebar.floating(
              extendedWidth: 300,
              collapseMode: collapseModeSignal.value,
              header: ShadSidebarHeader(
                children: [
                  Builder(
                    builder: (context) {
                      final side = ShadSidebar.of(context).side;
                      return ShadSidebarMenuTile(
                        menuAnchor: ShadAnchor(
                          overlayAlignment: side.isStart
                              ? Alignment.topRight
                              : Alignment.topLeft,
                          childAlignment: side.isStart
                              ? Alignment.topLeft
                              : Alignment.topRight,
                        ),
                        menuConstraints: BoxConstraints(
                          minWidth: sidebarExtendedWidth,
                        ),
                        titleText: 'Flutter Shadcn',
                        subTitleText: 'me@example.com',
                        trailingIcon: Icon(LucideIcons.chevronsUpDown400),
                        leadingIconData: LucideIcons.userRound,
                        items: [
                          ShadContextMenuItem(
                            leading: Icon(LucideIcons.user400),
                            child: Text('Account'),
                          ),
                          ShadContextMenuItem(
                            leading: Icon(LucideIcons.cog400),
                            child: Text('Settings'),
                          ),
                          const ShadSidebarSeparator(),
                          ShadContextMenuItem(
                            leading: Icon(LucideIcons.logOut400),
                            child: Text('Sign out'),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
              footer: ShadSidebarFooter(
                children: [
                  ShadButton.ghost(
                    size: ShadButtonSize.sm,
                    expands: true,
                    mainAxisAlignment: MainAxisAlignment.start,
                    leading: Icon(LucideIcons.plus400),
                    child: Text('New Calendar'),
                  ),
                ],
              ),
              content: ShadSidebarContent(
                spacing: 0,
                children: [
                  ShadSidebarGroup(
                    content: SizedBox(
                      height: 300,
                      child: ShadCalendar(),
                    ),
                  ),
                  const ShadSidebarSeparator(),
                  ShadSidebarGroup.items(
                    labelText: 'My Calendars',
                    items: [
                      ShadSidebarItem(
                        labelText: 'Personal',
                        leading: ShadSidebarItemCheckbox(value: true),
                      ),
                      ShadSidebarItem(
                        labelText: 'Work',
                        leading: ShadSidebarItemCheckbox(value: true),
                      ),
                      ShadSidebarItem(
                        labelText: 'Family',
                        leading: ShadSidebarItemCheckbox(value: false),
                      ),
                    ],
                  ),
                  const ShadSidebarSeparator(),
                  ShadSidebarGroup.collapsibleItems(
                    labelText: 'Favorites',
                    initiallyCollapsed: true,
                    items: [
                      ShadSidebarItem(
                        labelText: 'Holidays',
                        leading: ShadSidebarItemCheckbox(value: true),
                      ),
                      ShadSidebarItem(
                        labelText: 'Birthdays',
                        leading: ShadSidebarItemCheckbox(value: true),
                      ),
                    ],
                  ),
                  const ShadSidebarSeparator(),
                  ShadSidebarGroup.collapsibleItems(
                    labelText: 'Other',
                    initiallyCollapsed: true,
                    items: [
                      ShadSidebarItem(
                        labelText: 'Reminders',
                        leading: ShadSidebarItemCheckbox(value: true),
                      ),
                      ShadSidebarItem(
                        labelText: 'Travel',
                        leading: ShadSidebarItemCheckbox(value: false),
                      ),
                    ],
                  ),
                  const ShadSidebarSeparator(),
                ],
              ),
            ),
          );
        },
        child: _MainContent(
          exampleTitle: 'A floating sidebar with a calendar',
          triggerButton: const ShadSidebarTrigger(),
          withBorders: false,
        ),
      ),
    );
  }
}

class _SearchInput extends StatelessWidget {
  const _SearchInput();

  @override
  Widget build(BuildContext context) {
    final colorScheme = ShadTheme.of(context).colorScheme;
    final state = ShadSidebar.of(context);
    return ShadInput(
      placeholder: const Text('Search...'),
      maxLines: 1,
      mainAxisAlignment: MainAxisAlignment.center,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      leading: Container(
        alignment: Alignment.center,
        width: 32,
        height: 22,
        child: Icon(
          LucideIcons.search,
          size: 16,
          color: colorScheme.sidebarForeground,
        ),
      ),
      placeholderStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      padding: EdgeInsets.fromLTRB(0, 4, 12, 4),
      decoration: ShadDecoration(
        color: colorScheme.background,
        border: ShadBorder.all(
          strokeAlign: 0,
          radius: BorderRadius.circular(8),
          width: 0.8,
          color: colorScheme.input,
        ),
        focusedBorder: ShadBorder.all(
          radius: BorderRadius.circular(8),
          width: 0.8,
          color: colorScheme.ring,
        ),
        disableSecondaryBorder: true,
      ),
      constraints: BoxConstraints(
        maxHeight: 23,
        maxWidth: state.collapsedToIcons ? 36 : double.infinity,
      ),
    );
  }
}

class _SidebarExampleWrapper extends StatelessWidget {
  const _SidebarExampleWrapper({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final colorScheme = ShadTheme.of(context).colorScheme;
    final borderSide = BorderSide(
      color: ShadTheme.of(context).brightness == Brightness.light
          ? const Color(0xFFe5e5e5)
          : const Color.fromRGBO(255, 255, 255, 0.098),
      width: 1,
    );
    return SignalBuilder(
      builder: (context, child) {
        return SizedBox(
          width: wrapperWidthSignal.value,
          height: 910,
          child: child,
        );
      },
      child: ShadResizablePanelGroup(
        showHandle: true,
        dividerColor: Colors.transparent,
        handleIcon: Container(
          width: 6,
          height: 32,
          margin: const EdgeInsetsGeometry.directional(end: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            color: colorScheme.border,
          ),
        ),
        children: [
          ShadResizablePanel(
            id: 0,
            defaultSize: 1,
            minSize: .34,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.fromBorderSide(borderSide),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Material(
                  type: MaterialType.transparency,
                  // Each [SidebarScaffold] is wrapped in a [Navigator]
                  // cuz on mobile, the sidebar is showed using `showShadSheet`
                  // which push a dialog route into the route stack.
                  // If the Navigator is omitted, the sidebar will be shown on
                  // the entire app screen and not on the wrapper.
                  child: Navigator(
                    onGenerateRoute: (settings) {
                      return MaterialPageRoute(
                        builder: (context) => child,
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          ShadResizablePanel(
            id: 1,
            defaultSize: 0,
            minSize: 0,
            child: const SizedBox(),
          ),
        ],
      ),
    );
  }
}

class _MainContent extends StatelessWidget {
  const _MainContent({
    required this.exampleTitle,
    required this.triggerButton,
    this.withBorders = true,
  });
  final String exampleTitle;
  final bool withBorders;
  final Widget triggerButton;

  @override
  Widget build(BuildContext context) {
    final colorScheme = ShadTheme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 64,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          decoration: withBorders
              ? BoxDecoration(
                  border: Border(bottom: BorderSide(color: colorScheme.border)),
                )
              : null,
          child: Row(
            children: [
              triggerButton,
              if (withBorders)
                VerticalDivider(
                  color: colorScheme.border,
                  thickness: 1,
                ),
              const SizedBox(width: 8),
              Flexible(child: Text(exampleTitle)),
            ],
          ),
        ),
        Expanded(
          child: Padding(
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
          ),
        ),
      ],
    );
  }
}

class ShadSidebarTile extends StatelessWidget {
  const ShadSidebarTile({
    super.key,
    this.title,
    this.titleText,
    this.subTitle,
    this.subTitleText,
    this.trailing,
    this.leadingIconData,
    this.leading,
    this.onPressed,
    this.padding = const EdgeInsets.all(8),
    this.minHeight = 48,
  }) : assert(
         (title != null) ^ (titleText != null),
         'Either title or titleText must be provided',
       ),
       assert(
         (subTitle == null) || (subTitleText == null),
         'Either subTitle or subTitleText can be provided',
       ),
       assert(
         (leadingIconData == null) || (leading == null),
         'Either leadingIconData or leading can be provided',
       );
  final String? titleText;
  final Widget? title;
  final String? subTitleText;
  final Widget? subTitle;
  final Widget? trailing;
  final Widget? leading;
  final IconData? leadingIconData;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry padding;
  final double minHeight;

  @override
  Widget build(BuildContext context) {
    final cs = ShadTheme.of(context).colorScheme;
    final state = ShadSidebar.of(context);
    final collapsedToIcons = state.collapsedToIcons;
    final leading = buildLeading(cs);
    return ShadButton.ghost(
      height: collapsedToIcons ? 32 : minHeight,
      expands: true,
      gap: collapsedToIcons ? 0 : null,
      width: collapsedToIcons ? 32 : null,
      padding: collapsedToIcons ? EdgeInsets.zero : padding,
      hoverBackgroundColor: cs.sidebarAccent,
      backgroundColor: Colors.transparent,
      pressedBackgroundColor: cs.sidebarAccent,
      mainAxisAlignment: collapsedToIcons ? MainAxisAlignment.center : null,
      onPressed: onPressed,
      trailing: collapsedToIcons ? null : trailing,
      decoration: ShadDecoration(
        border: ShadBorder.all(
          radius: BorderRadius.circular(8),
          color: cs.sidebarBorder,
          width: 0,
        ),
        focusedBorder: ShadBorder.all(
          radius: BorderRadius.circular(8),
          color: cs.sidebarBorder,
          width: 0,
        ),
      ),
      leading: leading,
      child: Offstage(
        offstage: collapsedToIcons,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child:
                  title ??
                  Text(
                    titleText!,
                    style: const TextStyle(
                      fontSize: 14,
                      height: 1.25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
            ),
            if (subTitle != null)
              Flexible(child: subTitle!)
            else if (subTitleText != null)
              Flexible(
                child: Text(
                  subTitleText!,
                  style: const TextStyle(
                    fontSize: 12,
                    height: 1.25,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget buildLeading(ShadColorScheme cs) {
    if (leading != null) return leading!;
    if (leadingIconData != null) {
      return Container(
        constraints: BoxConstraints.tight(Size.square(28)),
        decoration: BoxDecoration(
          color: cs.sidebarPrimary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          leadingIconData,
          size: 16,
          color: cs.sidebarPrimaryForeground,
        ),
      );
    }
    return SizedBox.shrink();
  }
}

class ShadSidebarMenuTile extends StatelessWidget {
  const ShadSidebarMenuTile({
    super.key,
    this.titleText,
    this.title,
    this.subTitleText,
    this.subTitle,
    this.leading,
    this.menuDecoration,
    this.menuConstraints,
    this.menuAnchor,
    this.leadingIconData,
    this.enabled = true,
    this.tileMinHeight = 48,
    this.tilePadding = const EdgeInsets.all(8),
    required this.trailingIcon,
    required this.items,
  });
  final String? titleText;
  final Widget? title;
  final String? subTitleText;
  final Widget? subTitle;
  final EdgeInsetsGeometry tilePadding;
  final Widget trailingIcon;
  final Widget? leading;
  final IconData? leadingIconData;
  final double tileMinHeight;

  final List<Widget> items;
  final ShadDecoration? menuDecoration;
  final BoxConstraints? menuConstraints;
  final ShadAnchor? menuAnchor;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    var opened = false;
    return StatefulBuilder(
      builder: (context, mSetState) {
        final side = ShadSidebar.of(context).side;
        return ShadContextMenu(
          decoration: menuDecoration,
          items: items,
          visible: opened,
          constraints: menuConstraints,
          effects: [
            const FadeEffect(
              begin: 0,
              end: 1,
              duration: Duration(milliseconds: 150),
              curve: Curves.easeIn,
            ),
            const ScaleEffect(
              begin: Offset(.95, .95),
              end: Offset(1, 1),
              curve: Curves.easeIn,
              duration: Duration(milliseconds: 150),
            ),
            MoveEffect(
              begin: side.isStart ? const Offset(-8, 0) : const Offset(8, 0),
              end: Offset.zero,
              curve: Curves.easeIn,
              duration: const Duration(milliseconds: 150),
            ),
          ],
          anchor: menuAnchor,
          child: ShadSidebarTile(
            minHeight: tileMinHeight,
            title: title,
            titleText: titleText,
            leading: leading,
            subTitle: subTitle,
            subTitleText: subTitleText,
            padding: tilePadding,
            leadingIconData: leadingIconData,
            trailing: trailingIcon,
            onPressed: () => mSetState(() => opened = !opened),
          ),
        );
      },
    );
  }
}

class ShadSidebarSelectTile<T> extends StatefulWidget {
  const ShadSidebarSelectTile({
    super.key,
    required this.title,
    required this.menuItems,
    required this.initialValue,
    this.onChanged,
    this.minWidth,
  });
  final String title;
  final List<T> menuItems;
  final T initialValue;
  final ValueChanged<T>? onChanged;
  final double? minWidth;

  @override
  State<ShadSidebarSelectTile<T>> createState() =>
      _ShadSidebarSelectTileState<T>();
}

class _ShadSidebarSelectTileState<T> extends State<ShadSidebarSelectTile<T>> {
  late T _selectedValue = widget.initialValue;
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final cs = theme.colorScheme;
    return ShadContextMenu(
      visible: isOpen,
      constraints: BoxConstraints(
        minWidth: widget.minWidth ?? 128,
      ),
      items: widget.menuItems.map((e) {
        return ShadContextMenuItem(
          onPressed: () {
            setState(() {
              _selectedValue = e;
              isOpen = false;
            });
            widget.onChanged?.call(e);
          },
          trailing: _selectedValue == e
              ? Icon(
                  LucideIcons.check,
                  size: 16,
                  color: cs.mutedForeground,
                )
              : null,
          child: Text(e.toString()),
        );
      }).toList(),
      child: ShadSidebarTile(
        titleText: widget.title,
        subTitleText: _selectedValue.toString(),
        leadingIconData: LucideIcons.galleryVerticalEnd400,
        onPressed: () => setState(() => isOpen = !isOpen),
        trailing: Icon(
          LucideIcons.chevronsUpDown400,
          size: 16,
          color: cs.sidebarForeground,
        ),
      ),
    );
  }
}

class ShadSidebarItemCheckbox extends StatelessWidget {
  const ShadSidebarItemCheckbox({super.key, required this.value});
  final bool value;
  @override
  Widget build(BuildContext context) {
    final cs = ShadTheme.of(context).colorScheme;
    return ShadCheckbox(
      decoration: ShadDecoration(
        labelStyle: TextStyle(
          color: cs.sidebarPrimaryForeground,
        ),
        border: ShadBorder.all(
          color: value ? cs.sidebarPrimary : cs.sidebarBorder,
          radius: BorderRadius.circular(6),
        ),
      ),
      icon: Icon(
        LucideIcons.check400,
        size: 12,
        color: value ? cs.sidebarPrimaryForeground : cs.sidebarForeground,
      ),
      size: 14,
      value: value,
      color: cs.sidebarPrimary,
    );
  }
}
