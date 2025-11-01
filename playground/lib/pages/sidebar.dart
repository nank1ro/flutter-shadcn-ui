import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

enum SidebarBlock {
  basicWithMenu,
  withDropdownHeader,
  withDropdownFooter,
  withGroup,
  withCollapsibleGroup,
  withMenus,
  withSubMenus,
  withCollapsibleMenu,
  withCustomTrigger,
}

class SidebarPage extends StatelessWidget {
  const SidebarPage({super.key, required this.block});
  final SidebarBlock block;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: switch (block) {
          SidebarBlock.basicWithMenu => const SidebarWithMenu(),
          SidebarBlock.withDropdownHeader => const SidebarWithDropdownHeader(),
          SidebarBlock.withDropdownFooter => const SidebarWithDropdownFooter(),
          SidebarBlock.withGroup => const SidebarWithGroups(),
          SidebarBlock.withCollapsibleGroup =>
            const SidebarWithCollapsibleGroup(),
          SidebarBlock.withMenus => const SidebarWithMenus(),
          SidebarBlock.withSubMenus => const SidebarWithSubMenus(),
          SidebarBlock.withCollapsibleMenu =>
            const SidebarWithCollapsibleMenus(),
          SidebarBlock.withCustomTrigger => const SidebarWithCustomTrigger(),
        },
      ),
    );
  }
}

class SidebarWithMenu extends StatelessWidget {
  const SidebarWithMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadSidebarScaffold(
      body: const Center(child: ShadSidebarTrigger()),
      sidebar: const ShadSidebar.normal(
        // This's because of the preview frame width
        mobileBreakPoint: 400,
        content: ShadSidebarContent(
          children: [
            ShadSidebarGroup(
              labelText: 'Application',
              content: ShadSidebarMenu(
                items: [
                  ShadSidebarItem(
                    labelText: 'Home',
                    leading: Icon(LucideIcons.house, size: 16),
                  ),
                  ShadSidebarItem(
                    labelText: 'Profile',
                    leading: Icon(LucideIcons.user, size: 16),
                  ),
                  ShadSidebarItem(
                    labelText: 'Search',
                    leading: Icon(LucideIcons.search, size: 16),
                  ),
                  ShadSidebarItem(
                    labelText: 'Settings',
                    leading: Icon(LucideIcons.settings, size: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final versions = ['v1.0.1', 'v1.1.0-alpha', 'v2.0.0-beta'];

class SidebarWithDropdownHeader extends StatelessWidget {
  const SidebarWithDropdownHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadSidebarScaffold(
      body: const Center(child: ShadSidebarTrigger()),
      sidebar: ShadSidebar.normal(
        mobileBreakPoint: 400,
        header: ShadSidebarHeader(
          children: [
            ShadSidebarSelectTile(
              title: 'Documentation',
              initialValue: versions.first,
              minWidth: 240,
              menuItems: versions,
            ),
          ],
        ),
      ),
    );
  }
}

class SidebarWithDropdownFooter extends StatelessWidget {
  const SidebarWithDropdownFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadSidebarScaffold(
      body: const Center(child: ShadSidebarTrigger()),
      sidebar: ShadSidebar.normal(
        mobileBreakPoint: 400,
        footer: ShadSidebarFooter(
          children: [
            ShadSidebarMenuTile(
              menuAnchor: const ShadAnchor(
                overlayAlignment: Alignment.topCenter,
              ),
              titleText: 'Alicia Koch',
              subTitleText: 'alicia@example.com',
              leadingIconData: LucideIcons.userRound,
              trailingIcon: const Icon(LucideIcons.chevronsUpDown, size: 16),
              items: const [
                ShadContextMenuItem(
                  leading: Icon(LucideIcons.user, size: 16),
                  child: Text('Profile'),
                ),
                ShadContextMenuItem(
                  leading: Icon(LucideIcons.mail, size: 16),
                  child: Text('Mail'),
                ),
                ShadContextMenuItem(
                  leading: Icon(LucideIcons.settings, size: 16),
                  child: Text('Settings'),
                ),
                ShadSidebarSeparator(),
                ShadContextMenuItem(
                  leading: Icon(LucideIcons.logOut, size: 16),
                  child: Text('Log out'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SidebarWithGroups extends StatelessWidget {
  const SidebarWithGroups({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = ShadTheme.of(context).colorScheme;
    return ShadSidebarScaffold(
      body: const Center(child: ShadSidebarTrigger()),
      sidebar: ShadSidebar.normal(
        mobileBreakPoint: 400,
        content: ShadSidebarContent(
          children: [
            const ShadSidebarGroup(
              labelText: 'Analytics',
              content: ShadSidebarMenu(
                items: [
                  ShadSidebarItem(labelText: 'Overview'),
                  ShadSidebarItem(labelText: 'Reports'),
                  ShadSidebarItem(labelText: 'Notifications'),
                ],
              ),
            ),
            ShadSidebarGroup(
              labelText: 'Account',
              action: ShadIconButton.ghost(
                icon: const Icon(LucideIcons.settings, size: 16),
                foregroundColor: cs.sidebarAccentForeground,
                onPressed: () {
                  showShadSheet(
                    context: context,
                    builder: (context) => const ShadSheet(
                      title: Text('Settings'),
                      child: Text('Hello world'),
                    ),
                  );
                },
              ),
              content: const ShadSidebarMenu(
                items: [
                  ShadSidebarItem(labelText: 'Profile'),
                  ShadSidebarItem(labelText: 'Billing'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SidebarWithCollapsibleGroup extends StatelessWidget {
  const SidebarWithCollapsibleGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadSidebarScaffold(
      body: const Center(child: ShadSidebarTrigger()),
      sidebar: const ShadSidebar.normal(
        mobileBreakPoint: 400,
        content: ShadSidebarContent(
          children: [
            ShadSidebarGroup.collapsible(
              labelText: 'Analytics',
              content: ShadSidebarMenu(
                items: [
                  ShadSidebarItem(labelText: 'Overview'),
                  ShadSidebarItem(labelText: 'Reports'),
                  ShadSidebarItem(labelText: 'Notifications'),
                ],
              ),
            ),
            ShadSidebarGroup.collapsible(
              labelText: 'Account',
              initiallyCollapsed: true,
              content: ShadSidebarMenu(
                items: [
                  ShadSidebarItem(labelText: 'Profile'),
                  ShadSidebarItem(labelText: 'Settings'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SidebarWithMenus extends StatelessWidget {
  const SidebarWithMenus({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadSidebarScaffold(
      body: const Center(child: ShadSidebarTrigger()),
      sidebar: const ShadSidebar.normal(
        mobileBreakPoint: 400,
        content: ShadSidebarContent(
          children: [
            ShadSidebarGroup(
              labelText: 'Projects',
              content: ShadSidebarMenu(
                items: [
                  ShadSidebarItem(
                    labelText: 'Design Engineering',
                    leading: Icon(LucideIcons.frame400),
                  ),
                  ShadSidebarItem(
                    labelText: 'Sales & Marketing',
                    leading: Icon(LucideIcons.chartPie400),
                  ),
                  ShadSidebarItem(
                    labelText: 'Travel',
                    leading: Icon(LucideIcons.map400),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SidebarWithSubMenus extends StatelessWidget {
  const SidebarWithSubMenus({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadSidebarScaffold(
      body: const Center(child: ShadSidebarTrigger()),
      sidebar: const ShadSidebar.normal(
        mobileBreakPoint: 400,
        content: ShadSidebarContent(
          children: [
            ShadSidebarGroup(
              content: ShadSidebarMenu(
                items: [
                  ShadSidebarItem(
                    labelText: 'Getting Started',
                    subItems: [
                      ShadSidebarItem(labelText: 'Installation'),
                      ShadSidebarItem(labelText: 'Project Setup'),
                    ],
                  ),
                  ShadSidebarItem(
                    labelText: 'Building Your Application',
                    subItems: [
                      ShadSidebarItem(labelText: 'Routing'),
                      ShadSidebarItem(labelText: 'Data fetching'),
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
                  ShadSidebarItem(
                    labelText: 'API Reference',
                    subItems: [
                      ShadSidebarItem(labelText: 'Components'),
                      ShadSidebarItem(labelText: 'File Conventions'),
                      ShadSidebarItem(labelText: 'Widgets'),
                      ShadSidebarItem(labelText: 'Functions'),
                      ShadSidebarItem(labelText: 'CLI'),
                      ShadSidebarItem(labelText: 'Edge Runtime'),
                    ],
                  ),
                  ShadSidebarItem(
                    labelText: 'Architecture',
                    subItems: [
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
          ],
        ),
      ),
    );
  }
}

class SidebarWithCollapsibleMenus extends StatelessWidget {
  const SidebarWithCollapsibleMenus({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadSidebarScaffold(
      body: const Center(child: ShadSidebarTrigger()),
      sidebar: const ShadSidebar.normal(
        mobileBreakPoint: 400,
        content: ShadSidebarContent(
          children: [
            ShadSidebarGroup(
              labelText: 'Platform',
              hiddenWhenCollapsedToIcons: false,
              content: ShadSidebarMenu(
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
            ),
          ],
        ),
      ),
    );
  }
}

class SidebarWithLeadingAndTrailingMenuIcons extends StatelessWidget {
  const SidebarWithLeadingAndTrailingMenuIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadSidebarScaffold(
      body: const Center(child: Text('With Leading and Trailing Icons')),
      sidebar: const ShadSidebar.normal(
        content: ShadSidebarContent(
          children: [
            ShadSidebarGroup(
              labelText: 'Application',
              content: ShadSidebarMenu(
                items: [
                  ShadSidebarItem(
                    leading: Icon(LucideIcons.house, size: 16),
                    trailing: Text('⌘ H'),
                    labelText: 'Home',
                  ),
                  ShadSidebarItem(
                    leading: Icon(LucideIcons.chartPie, size: 16),
                    trailing: Text('⌘ D'),
                    labelText: 'Dashboard',
                  ),
                  ShadSidebarItem(
                    leading: Icon(LucideIcons.inbox, size: 16),
                    trailing: Text('⌘ I'),
                    labelText: 'Inbox',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SidebarWithCustomTrigger extends StatelessWidget {
  const SidebarWithCustomTrigger({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadSidebarScaffold(
      body: Builder(
        builder: (context) {
          var extended = ShadSidebarScaffold.of(context).isSidebarExtended();
          return Center(
            child: ShadButton.outline(
              leading: Icon(
                extended
                    ? LucideIcons.panelLeftClose
                    : LucideIcons.panelLeftOpen,
              ),
              child: Text(
                extended ? 'Close sidebar' : 'Open sidebar',
              ),
              onPressed: () => ShadSidebarScaffold.of(context).toggleSidebar(),
            ),
          );
        },
      ),
      sidebar: const ShadSidebar.normal(
        mobileBreakPoint: 400,
        content: ShadSidebarContent(
          children: [
            ShadSidebarGroup(
              labelText: 'Analytics',
              content: ShadSidebarMenu(
                items: [
                  ShadSidebarItem(labelText: 'Overview'),
                  ShadSidebarItem(labelText: 'Reports'),
                ],
              ),
            ),
            ShadSidebarSeparator(margin: EdgeInsets.symmetric(horizontal: 8)),
            ShadSidebarGroup(
              labelText: 'Account',
              content: ShadSidebarMenu(
                items: [
                  ShadSidebarItem(labelText: 'Profile'),
                  ShadSidebarItem(labelText: 'Settings'),
                ],
              ),
            ),
          ],
        ),
      ),
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
    final state = ShadSidebarController.of(context);
    final leading = buildLeading(cs);
    return ShadButton.ghost(
      height: state.collapsedToIcons ? 32 : minHeight,
      expands: true,
      gap: state.collapsedToIcons ? 0 : null,
      width: state.collapsedToIcons ? 32 : null,
      padding: state.collapsedToIcons ? EdgeInsets.zero : padding,
      hoverBackgroundColor: cs.sidebarAccent,
      foregroundColor: cs.sidebarAccentForeground,
      backgroundColor: Colors.transparent,
      pressedBackgroundColor: cs.sidebarAccent,
      mainAxisAlignment: state.collapsedToIcons
          ? MainAxisAlignment.center
          : null,
      onPressed: onPressed,
      trailing: state.collapsedToIcons ? null : trailing,
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
        offstage: state.collapsedToIcons,
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
        constraints: BoxConstraints.tight(const Size.square(28)),
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
    return const SizedBox.shrink();
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
        final side = ShadSidebarController.of(context).side;
        return ShadContextMenu(
          decoration: menuDecoration,
          items: items,
          visible: opened,
          constraints:
              menuConstraints ??
              BoxConstraints(
                minWidth: ShadSidebarController.of(context).extendedWidth - 8,
              ),
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
              begin: side.isLeft ? const Offset(-8, 0) : const Offset(8, 0),
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
