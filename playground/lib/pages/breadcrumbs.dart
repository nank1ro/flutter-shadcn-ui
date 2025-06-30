import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class BreadcrumbsPage extends StatelessWidget {
  const BreadcrumbsPage({
    super.key,
  });

  void _navigateToHome() {
    print('Navigating to Home');
  }

  void _navigateToLibrary() {
    print('Navigating to Library');
  }

  void _navigateToComponents() {
    print('Navigating to Components');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Breadcrumbs',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Displays the path to the current resource using a hierarchy of links.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 32),
            
            // Simple Breadcrumb
            const Text(
              'Simple Breadcrumb',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            const ShadBreadcrumb(
              children: [
                ShadBreadcrumbItem(
                  child: Text('Home'),
                ),
                ShadBreadcrumbItem(
                  child: Text('Library'),
                ),
                ShadBreadcrumbPage(
                  child: Text('Data'),
                ),
              ],
            ),
            const SizedBox(height: 32),
            
            // Breadcrumb with Links
            const Text(
              'Breadcrumb with Links',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            ShadBreadcrumb(
              children: [
                ShadBreadcrumbItem(
                  child: ShadBreadcrumbLink(
                    onPressed: _navigateToHome,
                    child: const Text('Home'),
                  ),
                ),
                ShadBreadcrumbItem(
                  child: ShadBreadcrumbLink(
                    onPressed: _navigateToComponents,
                    child: const Text('Components'),
                  ),
                ),
                const ShadBreadcrumbPage(
                  child: Text('Breadcrumb'),
                ),
              ],
            ),
            const SizedBox(height: 32),
            
            // Breadcrumb with Ellipsis
            const Text(
              'Breadcrumb with Ellipsis',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            ShadBreadcrumb(
              children: [
                ShadBreadcrumbItem(
                  child: ShadBreadcrumbLink(
                    onPressed: _navigateToHome,
                    child: const Text('Home'),
                  ),
                ),
                const ShadBreadcrumbItem(
                  child: ShadBreadcrumbEllipsis(),
                ),
                ShadBreadcrumbItem(
                  child: ShadBreadcrumbLink(
                    onPressed: _navigateToLibrary,
                    child: const Text('Library'),
                  ),
                ),
                ShadBreadcrumbItem(
                  child: ShadBreadcrumbLink(
                    onPressed: _navigateToComponents,
                    child: const Text('Components'),
                  ),
                ),
                const ShadBreadcrumbPage(
                  child: Text('Breadcrumb'),
                ),
              ],
            ),
            const SizedBox(height: 32),
            
            // Breadcrumb with Dropdown
            const Text(
              'Breadcrumb with Dropdown',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            ShadBreadcrumb(
              children: [
                ShadBreadcrumbItem(
                  child: ShadBreadcrumbLink(
                    onPressed: _navigateToHome,
                    child: const Text('Home'),
                  ),
                ),
                ShadBreadcrumbItem(
                  child: ShadBreadcrumbDropdown(
                    items: [
                      ShadBreadcrumbLink(
                        onPressed: () => print('Navigating to Documentation'),
                        child: const Text('Documentation'),
                      ),
                      ShadBreadcrumbLink(
                        onPressed: () => print('Navigating to Tutorials'),
                        child: const Text('Tutorials'),
                      ),
                      ShadBreadcrumbLink(
                        onPressed: () => print('Navigating to Building UI'),
                        child: const Text('Building UI'),
                      ),
                      ShadBreadcrumbLink(
                        onPressed: () => print('Navigating to Templates'),
                        child: const Text('Templates'),
                      ),
                    ],
                  ),
                ),
                ShadBreadcrumbItem(
                  child: ShadBreadcrumbLink(
                    onPressed: _navigateToComponents,
                    child: const Text('Components'),
                  ),
                ),
                const ShadBreadcrumbPage(
                  child: Text('Breadcrumb'),
                ),
              ],
            ),
            const SizedBox(height: 32),
            
            // Breadcrumb with Custom Dropdown Trigger
            const Text(
              'Breadcrumb with Custom Dropdown Trigger',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            ShadBreadcrumb(
              children: [
                ShadBreadcrumbItem(
                  child: ShadBreadcrumbLink(
                    onPressed: _navigateToHome,
                    child: const Text('Home'),
                  ),
                ),
                ShadBreadcrumbItem(
                  child: ShadBreadcrumbDropdown(
                    trigger: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('More'),
                        SizedBox(width: 4),
                        Icon(Icons.keyboard_arrow_down, size: 16),
                      ],
                    ),
                    items: [
                      ShadBreadcrumbLink(
                        onPressed: () => print('Navigating to Products'),
                        child: const Text('Products'),
                      ),
                      ShadBreadcrumbLink(
                        onPressed: () => print('Navigating to Categories'),
                        child: const Text('Categories'),
                      ),
                      ShadBreadcrumbLink(
                        onPressed: () => print('Navigating to Settings'),
                        child: const Text('Settings'),
                      ),
                    ],
                  ),
                ),
                ShadBreadcrumbItem(
                  child: ShadBreadcrumbLink(
                    onPressed: _navigateToComponents,
                    child: const Text('Components'),
                  ),
                ),
                const ShadBreadcrumbPage(
                  child: Text('Breadcrumb'),
                ),
              ],
            ),
            const SizedBox(height: 32),
            
            // Custom Separator
            const Text(
              'Custom Separator',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            ShadBreadcrumb(
              separator: const Icon(Icons.arrow_forward_ios, size: 14),
              children: [
                ShadBreadcrumbItem(
                  child: ShadBreadcrumbLink(
                    onPressed: _navigateToHome,
                    child: const Text('Home'),
                  ),
                ),
                ShadBreadcrumbItem(
                  child: ShadBreadcrumbLink(
                    onPressed: _navigateToComponents,
                    child: const Text('Components'),
                  ),
                ),
                const ShadBreadcrumbPage(
                  child: Text('Breadcrumb'),
                ),
              ],
            ),
            const SizedBox(height: 32),
            
            // With Different Alignment
            const Text(
              'Center Aligned',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            const ShadBreadcrumb(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ShadBreadcrumbItem(
                  child: Text('Home'),
                ),
                ShadBreadcrumbItem(
                  child: Text('Library'),
                ),
                ShadBreadcrumbPage(
                  child: Text('Data'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
