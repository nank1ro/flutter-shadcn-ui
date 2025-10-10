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

final sideSignal = Signal<ShadSidebarSide>.lazy(autoDispose: true);

final collapseModeSignal =
    Signal<ShadSidebarCollapseMode>.lazy(autoDispose: true);

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
    'zinc'
  ];
  String selectedTheme = 'neutral';

  @override
  void initState() {
    super.initState();
    wrapperWidthSignal.value = kDesktopWrapperWidth;
    sideSignal.value = ShadSidebarSide.left;
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
              side: sideSignal.value,
              collapseMode: collapseModeSignal.value,
              header: ShadSidebarHeader(
                childrenSpacing: 8,
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
                  ShadSidebarGroup(
                    labelText: 'Getting Started',
                    content: ShadSidebarMenu(
                      items: [
                        ShadSidebarMenuItem(labelText: 'Installation'),
                        ShadSidebarMenuItem(labelText: 'Project Setup'),
                      ],
                    ),
                  ),
                  ShadSidebarGroup(
                    labelText: 'Building Your Application',
                    content: ShadSidebarMenu(
                      items: [
                        ShadSidebarMenuItem(labelText: 'Routing'),
                        ShadSidebarMenuItem(
                          labelText: 'Data fetching',
                          selected: true,
                        ),
                        ShadSidebarMenuItem(labelText: 'Rendering'),
                        ShadSidebarMenuItem(labelText: 'Caching'),
                        ShadSidebarMenuItem(labelText: 'Authentication'),
                        ShadSidebarMenuItem(labelText: 'State management'),
                        ShadSidebarMenuItem(labelText: 'Navigation'),
                        ShadSidebarMenuItem(labelText: 'Styling'),
                        ShadSidebarMenuItem(labelText: 'Testing'),
                        ShadSidebarMenuItem(labelText: 'Upgrading'),
                        ShadSidebarMenuItem(labelText: 'Deployment'),
                        ShadSidebarMenuItem(labelText: 'Examples'),
                      ],
                    ),
                  ),
                  ShadSidebarGroup(
                    labelText: 'API Reference',
                    content: ShadSidebarMenu(
                      items: [
                        ShadSidebarMenuItem(labelText: 'Components'),
                        ShadSidebarMenuItem(labelText: 'File Conventions'),
                        ShadSidebarMenuItem(labelText: 'Widgets'),
                        ShadSidebarMenuItem(labelText: 'Functions'),
                        ShadSidebarMenuItem(labelText: 'CLI'),
                        ShadSidebarMenuItem(labelText: 'Edge Runtime'),
                      ],
                    ),
                  ),
                  ShadSidebarGroup(
                    labelText: 'Architecture',
                    content: ShadSidebarMenu(
                      items: [
                        ShadSidebarMenuItem(labelText: 'Accessibility'),
                        ShadSidebarMenuItem(labelText: 'Fast Refresh'),
                        ShadSidebarMenuItem(labelText: 'Flutter for Web'),
                        ShadSidebarMenuItem(labelText: 'Hot Reload'),
                        ShadSidebarMenuItem(labelText: 'Plugins'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        child: _MainContent(
          exampleTitle: 'A normal sidebar with navigation grouped by section',
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
          final side = sideSignal.value;
          return ShadSidebarScaffold(
            body: mainContent!,
            sidebar: ShadSidebar.inset(
              extendedWidth: sidebarExtendedWidth,
              side: side,
              collapseMode: collapseModeSignal.value,
              header: ShadSidebarHeader(
                crossAxisAlignment: CrossAxisAlignment.center,
                childrenSpacing: 8,
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
                  ShadSidebarMenuTile(
                    menuConstraints:
                        BoxConstraints(minWidth: sidebarExtendedWidth),
                    titleText: 'Flutter Shadcn',
                    subTitleText: 'me@example.com',
                    trailingIcon: const Icon(LucideIcons.chevronsUpDown400),
                    leadingIconData: LucideIcons.userRound,
                    menuAnchor:
                        //  sidebar.isMobile
                        //     ? const ShadAnchor(
                        //         overlayAlignment: Alignment.topCenter,
                        //       )
                        // :
                        ShadAnchor(
                      overlayAlignment: side.isLeft
                          ? Alignment.bottomRight
                          : Alignment.bottomLeft,
                      childAlignment: side.isLeft
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
                  ),
                ],
              ),
              content: ShadSidebarContent(
                children: [
                  ShadSidebarGroup(
                    labelText: 'Platform',
                    hiddenWhenCollapsedToIcons: false,
                    content: ShadSidebarMenu(
                      items: [
                        const ShadSidebarMenuItem.collapsible(
                          labelText: 'Playground',
                          leading: Icon(LucideIcons.squareTerminal400),
                          subMenu: ShadSidebarSubMenu(
                            items: [
                              ShadSidebarSubMenuItem(labelText: 'History'),
                              ShadSidebarSubMenuItem(labelText: 'Starred'),
                              ShadSidebarSubMenuItem(labelText: 'Settings'),
                            ],
                          ),
                        ),
                        const ShadSidebarMenuItem.collapsible(
                          labelText: 'Models',
                          initiallyCollapsed: true,
                          leading: Icon(LucideIcons.bot400),
                          subMenu: ShadSidebarSubMenu(
                            items: [
                              ShadSidebarSubMenuItem(labelText: 'Genesis'),
                              ShadSidebarSubMenuItem(labelText: 'Explorer'),
                              ShadSidebarSubMenuItem(labelText: 'Quantum'),
                            ],
                          ),
                        ),
                        const ShadSidebarMenuItem.collapsible(
                          labelText: 'Documentation',
                          initiallyCollapsed: true,
                          leading: Icon(LucideIcons.bookOpen400),
                          subMenu: ShadSidebarSubMenu(
                            items: [
                              ShadSidebarSubMenuItem(labelText: 'Introduction'),
                              ShadSidebarSubMenuItem(labelText: 'Get started'),
                              ShadSidebarSubMenuItem(labelText: 'Tutorials'),
                              ShadSidebarSubMenuItem(labelText: 'Examples'),
                            ],
                          ),
                        ),
                        const ShadSidebarMenuItem.collapsible(
                          labelText: 'Settings',
                          initiallyCollapsed: true,
                          leading: Icon(LucideIcons.settings2400),
                          subMenu: ShadSidebarSubMenu(
                            items: [
                              ShadSidebarSubMenuItem(labelText: 'General'),
                              ShadSidebarSubMenuItem(labelText: 'Team'),
                              ShadSidebarSubMenuItem(labelText: 'Billing'),
                              ShadSidebarSubMenuItem(labelText: 'Limits'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  ShadSidebarGroup(
                    labelText: 'Projects',
                    content: ShadSidebarMenu(
                      items: [
                        ShadSidebarDropdownMenuItem(
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
                        ShadSidebarDropdownMenuItem(
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
                        ShadSidebarDropdownMenuItem(
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
                        ShadSidebarMenuItem(
                          labelText: 'More',
                        ),
                      ],
                    ),
                  ),
                  ShadSidebarGroup(
                    flex: 1,
                    content: ShadSidebarMenu(
                      items: [
                        ShadSidebarMenuItem(
                          labelText: 'Support',
                          leading: Icon(LucideIcons.lifeBuoy400, size: 16),
                        ),
                        ShadSidebarMenuItem(
                          labelText: 'Feedback',
                          leading: Icon(LucideIcons.send400, size: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        child: _MainContent(
          exampleTitle: 'An inset sidebar',
          withBorders: false,
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
          final side = sideSignal.value;
          return ShadSidebarScaffold(
            body: contentWidget!,
            sidebar: ShadSidebar.floating(
              extendedWidth: 300,
              side: side,
              collapseMode: collapseModeSignal.value,
              header: ShadSidebarHeader(
                children: [
                  ShadSidebarMenuTile(
                    menuAnchor: ShadAnchor(
                      overlayAlignment:
                          side.isLeft ? Alignment.topRight : Alignment.topLeft,
                      childAlignment:
                          side.isLeft ? Alignment.topLeft : Alignment.topRight,
                    ),
                    menuConstraints:
                        BoxConstraints(minWidth: sidebarExtendedWidth),
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
                childrenSpacing: 0,
                children: [
                  ShadSidebarGroup(
                    content: SizedBox(
                      height: 300,
                      child: ShadCalendar(),
                    ),
                  ),
                  const ShadSidebarSeparator(),
                  ShadSidebarGroup.collapsible(
                    labelText: 'My Calendars',
                    content: ShadSidebarMenu(
                      items: [
                        ShadSidebarMenuItem(
                          labelText: 'Personal',
                          leading: ShadSidebarMenuItemCheckbox(value: true),
                        ),
                        ShadSidebarMenuItem(
                          labelText: 'Work',
                          leading: ShadSidebarMenuItemCheckbox(value: true),
                        ),
                        ShadSidebarMenuItem(
                          labelText: 'Family',
                          leading: ShadSidebarMenuItemCheckbox(value: false),
                        ),
                      ],
                    ),
                  ),
                  const ShadSidebarSeparator(),
                  ShadSidebarGroup.collapsible(
                    labelText: 'Favorites',
                    initiallyCollapsed: true,
                    content: ShadSidebarMenu(
                      items: [
                        ShadSidebarMenuItem(
                          labelText: 'Holidays',
                          leading: ShadSidebarMenuItemCheckbox(value: true),
                        ),
                        ShadSidebarMenuItem(
                          labelText: 'Birthdays',
                          leading: ShadSidebarMenuItemCheckbox(value: true),
                        ),
                      ],
                    ),
                  ),
                  const ShadSidebarSeparator(),
                  ShadSidebarGroup.collapsible(
                    labelText: 'Other',
                    initiallyCollapsed: true,
                    content: ShadSidebarMenu(
                      items: [
                        ShadSidebarMenuItem(
                          labelText: 'Reminders',
                          leading: ShadSidebarMenuItemCheckbox(value: true),
                        ),
                        ShadSidebarMenuItem(
                          labelText: 'Travel',
                          leading: ShadSidebarMenuItemCheckbox(value: false),
                        ),
                      ],
                    ),
                  ),
                  const ShadSidebarSeparator(),
                ],
              ),
            ),
          );
        },
        child: _MainContent(
          exampleTitle: 'A floating sidebar with a calendar',
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
    final state = ShadSidebarController.of(context);
    return ShadInput(
      placeholder: const Text('Search the docs...'),
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
        maxWidth: state.collapsedToIcons ? 32 : double.infinity,
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
    this.withBorders = true,
  });
  final String exampleTitle;
  final bool withBorders;

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
              ShadSidebarTrigger(),
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
  })  : assert(
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
    final collapsedToIcons = state.collapseMode.isIcons && !state.extended;
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
              child: title ??
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
        final side = ShadSidebarController.of(context).side;
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

class ShadSidebarMenuItemCheckbox extends StatelessWidget {
  const ShadSidebarMenuItemCheckbox({super.key, required this.value});
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
