import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class BreadcrumbsPage extends StatelessWidget {
  const BreadcrumbsPage({
    super.key,
  });

  void _navigateToHome() {
    print('Navigating to Home');
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
                ShadBreadcrumbItem(
                  isLastItem: true,
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
                ShadBreadcrumbLink(
                  onPressed: _navigateToHome,
                  child: const Text('Home'),
                ),
                ShadBreadcrumbLink(
                  onPressed: _navigateToComponents,
                  child: const Text('Components'),
                ),
                const ShadBreadcrumbItem(
                  isLastItem: true,
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
                ShadBreadcrumbLink(
                  onPressed: _navigateToHome,
                  child: const Text('Home'),
                ),
                ShadBreadcrumbEllipsis(),
                ShadBreadcrumbLink(
                  onPressed: _navigateToComponents,
                  child: const Text('Components'),
                ),
                const ShadBreadcrumbItem(
                  isLastItem: true,
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
                ShadBreadcrumbLink(
                  onPressed: _navigateToHome,
                  child: const Text('Home'),
                ),
                ShadBreadcrumbLink(
                  onPressed: _navigateToComponents,
                  child: const Text('Components'),
                ),
                const ShadBreadcrumbItem(
                  isLastItem: true,
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
              mainAxisAlignment: WrapAlignment.center,
              children: [
                ShadBreadcrumbItem(
                  child: Text('Home'),
                ),
                ShadBreadcrumbItem(
                  child: Text('Library'),
                ),
                ShadBreadcrumbItem(
                  isLastItem: true,
                  child: Text('Data'),
                ),
              ],
            ),
            const SizedBox(height: 32),

            // With Dropdown
            const Text(
              'With Dropdown',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            ShadBreadcrumb(
              children: [
                ShadBreadcrumbLink(
                  onPressed: _navigateToHome,
                  child: const Text('Home'),
                ),
                ShadBreadcrumbDropdown(
                  child: Text('Components'),
                  children: [
                    ShadBreadcrumbDropMenuItem(
                      onPressed: () => print('Navigating to Documentation'),
                      child: Text('Documentation'),
                    ),
                    ShadBreadcrumbDropMenuItem(
                      onPressed: () => print('Navigating to Themes'),
                      child: Text('Themes'),
                    ),
                    ShadBreadcrumbDropMenuItem(
                      onPressed: () => print('Navigating to Github'),
                      child: Text('Github'),
                    ),
                  ],
                ),
                const ShadBreadcrumbItem(
                  isLastItem: true,
                  child: Text('Breadcrumb'),
                ),
              ],
            ),
            const SizedBox(height: 32),
            const Text(
              'Long Breadcrumb',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            ShadBreadcrumb(
              children: [
                ShadBreadcrumbLink(
                  onPressed: _navigateToHome,
                  child: Text('Home'),
                ),
                ShadBreadcrumbLink(
                  onPressed: _navigateToComponents,
                  child: Text('Component 1'),
                ),
                ShadBreadcrumbLink(
                  onPressed: _navigateToComponents,
                  child: Text('Component 2'),
                ),
                ShadBreadcrumbLink(
                  onPressed: _navigateToComponents,
                  child: Text('Component 3'),
                ),
                ShadBreadcrumbLink(
                  onPressed: _navigateToComponents,
                  child: Text('Component 4'),
                ),
                ShadBreadcrumbItem(
                  isLastItem: true,
                  child: Text('Breadcrumb'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
