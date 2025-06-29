import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class SidebarPage extends StatefulWidget {
  const SidebarPage({super.key});

  @override
  State<SidebarPage> createState() => _SidebarPageState();
}

class _SidebarPageState extends State<SidebarPage> {
  bool _isCollapsed = false;

  // Sample navigation items
  final List<ShadSidebarGroup> _navGroups = [
    ShadSidebarGroup(
      label: 'Getting Started',
      items: [
        ShadSidebarNavItem(
          title: 'Overview',
          icon: const Icon(LucideIcons.house, size: 16),
          isActive: true,
          onTap: () => print('Navigate to Overview'),
        ),
        ShadSidebarNavItem(
          title: 'Installation',
          icon: const Icon(LucideIcons.download, size: 16),
          onTap: () => print('Navigate to Installation'),
        ),
        ShadSidebarNavItem(
          title: 'Typography',
          icon: const Icon(LucideIcons.type, size: 16),
          onTap: () => print('Navigate to Typography'),
        ),
      ],
    ),
    ShadSidebarGroup(
      label: 'Components',
      items: [
        ShadSidebarNavItem(
          title: 'Button',
          icon: const Icon(LucideIcons.mousePointer, size: 16),
          onTap: () => print('Navigate to Button'),
        ),
        ShadSidebarNavItem(
          title: 'Form',
          icon: const Icon(LucideIcons.fileText, size: 16),
          items: [
            ShadSidebarNavItem(
              title: 'Input',
              onTap: () => print('Navigate to Input'),
            ),
            ShadSidebarNavItem(
              title: 'Textarea',
              onTap: () => print('Navigate to Textarea'),
            ),
            ShadSidebarNavItem(
              title: 'Select',
              onTap: () => print('Navigate to Select'),
            ),
          ],
        ),
        ShadSidebarNavItem(
          title: 'Navigation',
          icon: const Icon(LucideIcons.navigation, size: 16),
          items: [
            ShadSidebarNavItem(
              title: 'Breadcrumb',
              onTap: () => print('Navigate to Breadcrumb'),
            ),
            ShadSidebarNavItem(
              title: 'Sidebar',
              isActive: true,
              onTap: () => print('Navigate to Sidebar'),
            ),
            ShadSidebarNavItem(
              title: 'Tabs',
              onTap: () => print('Navigate to Tabs'),
            ),
          ],
        ),
      ],
    ),
    ShadSidebarGroup(
      label: 'Blocks',
      collapsible: true,
      initiallyExpanded: true,
      items: [
        ShadSidebarNavItem(
          title: 'Sidebar',
          icon: const Icon(LucideIcons.panelLeft, size: 16),
          isActive: true,
          onTap: () => print('Navigate to Sidebar Block'),
        ),
      ],
    ),
  ];

  // Sample user data
  final ShadSidebarUser _user = const ShadSidebarUser(
    name: 'John Doe',
    email: 'john@example.com',
    avatar: null, // Will use fallback initials
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Main Sidebar Demo
          ShadSidebar(
            isCollapsed: _isCollapsed,
            onCollapsedChanged: (collapsed) {
              setState(() {
                _isCollapsed = collapsed;
              });
            },
            header: ShadSidebarHeader(
              logo: const Icon(
                LucideIcons.zap,
                size: 16,
                color: Colors.white,
              ),
              title: 'Acme Inc',
              subtitle: 'Enterprise',
              onTap: () => print('Header tapped'),
            ),
            navGroups: _navGroups,
            footer: ShadSidebarFooter(
              user: _user,
              onUserTap: () => print('User tapped'),
              actions: [
                ShadIconButton.ghost(
                  onPressed: () => print('Settings'),
                  icon: const Icon(LucideIcons.settings, size: 14),
                ),
              ],
            ),
          ),
          
          // Main Content Area
          Expanded(
            child: Container(
              color: ShadTheme.of(context).colorScheme.background,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header with collapse button
                    Row(
                      children: [
                        ShadIconButton.ghost(
                          onPressed: () {
                            setState(() {
                              _isCollapsed = !_isCollapsed;
                            });
                          },
                          icon: Icon(
                            _isCollapsed ? LucideIcons.panelLeft : LucideIcons.panelRightClose,
                            size: 16,
                          ),
                        ),
                        const SizedBox(width: 16),
                        const Text(
                          'Sidebar',
                          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'A composable and customizable sidebar component for navigation.',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    const SizedBox(height: 32),

                    // Usage Examples Section
                    const Text(
                      'Basic Usage',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: ShadTheme.of(context).colorScheme.muted.withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: ShadTheme.of(context).colorScheme.border,
                        ),
                      ),
                      child: const Text(
                        '''ShadSidebar(
  header: ShadSidebarHeader(
    title: 'My App',
    logo: Icon(Icons.star),
  ),
  navGroups: [
    ShadSidebarGroup(
      label: 'Navigation',
      items: [
        ShadSidebarNavItem(
          title: 'Home',
          icon: Icon(Icons.home),
          isActive: true,
        ),
        ShadSidebarNavItem(
          title: 'Settings',
          icon: Icon(Icons.settings),
        ),
      ],
    ),
  ],
  footer: ShadSidebarFooter(
    user: ShadSidebarUser(
      name: 'John Doe',
      email: 'john@example.com',
    ),
  ),
)''',
                        style: TextStyle(fontFamily: 'monospace'),
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Features section
                    const Text(
                      'Features',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 16),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _FeatureItem(
                          icon: LucideIcons.layoutDashboard,
                          title: 'Composable Structure',
                          description: 'Built with header, content, and footer sections that can be customized independently.',
                        ),
                        _FeatureItem(
                          icon: LucideIcons.layers,
                          title: 'Nested Navigation',
                          description: 'Support for hierarchical navigation with expandable sub-items.',
                        ),
                        _FeatureItem(
                          icon: LucideIcons.minimize2,
                          title: 'Collapsible',
                          description: 'Smooth animation when collapsing and expanding the sidebar.',
                        ),
                        _FeatureItem(
                          icon: LucideIcons.palette,
                          title: 'Theme Integration',
                          description: 'Fully integrated with shadcn/ui theming system.',
                        ),
                        _FeatureItem(
                          icon: LucideIcons.smartphone,
                          title: 'Responsive',
                          description: 'Adapts to different screen sizes and orientations.',
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),

                    // Components section
                    const Text(
                      'Components',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 16),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _ComponentItem(
                          name: 'ShadSidebar',
                          description: 'Main sidebar container with header, content, and footer areas.',
                        ),
                        _ComponentItem(
                          name: 'ShadSidebarHeader',
                          description: 'Header component with logo, title, and subtitle.',
                        ),
                        _ComponentItem(
                          name: 'ShadSidebarGroup',
                          description: 'Groups navigation items with optional labels and collapsible functionality.',
                        ),
                        _ComponentItem(
                          name: 'ShadSidebarMenuItem',
                          description: 'Individual navigation item with icon, text, and nested support.',
                        ),
                        _ComponentItem(
                          name: 'ShadSidebarFooter',
                          description: 'Footer component typically containing user information.',
                        ),
                        _ComponentItem(
                          name: 'ShadSidebarUser',
                          description: 'Data class for user information in the footer.',
                        ),
                        _ComponentItem(
                          name: 'ShadSidebarNavItem',
                          description: 'Data class for navigation item configuration.',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FeatureItem extends StatelessWidget {
  const _FeatureItem({
    required this.icon,
    required this.title,
    required this.description,
  });

  final IconData icon;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Icon(
                icon,
                size: 20,
                color: theme.colorScheme.primary,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: theme.colorScheme.mutedForeground,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ComponentItem extends StatelessWidget {
  const _ComponentItem({
    required this.name,
    required this.description,
  });

  final String name;
  final String description;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              fontFamily: 'monospace',
            ),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: TextStyle(
              fontSize: 14,
              color: theme.colorScheme.mutedForeground,
            ),
          ),
        ],
      ),
    );
  }
}
