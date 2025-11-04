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
                  child: ShadBreadcrumbLinkedText(
                    onPressed: _navigateToHome,
                    text: 'Home',
                  ),
                ),
                ShadBreadcrumbItem(
                  child: ShadBreadcrumbLinkedText(
                    onPressed: _navigateToComponents,
                    text: 'Components',
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
                  child: ShadBreadcrumbLinkedText(
                    onPressed: _navigateToHome,
                    text:'Home',
                  ),
                ),
                const ShadBreadcrumbItem(
                  child: ShadBreadcrumbEllipsis(),
                ),
                ShadBreadcrumbItem(
                  child: ShadBreadcrumbLinkedText(
                    onPressed: _navigateToComponents,
                      text:'Components',
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
                  child: ShadBreadcrumbLinkedText(
                    onPressed: _navigateToHome,
                    text: 'Home',
                  ),
                ),
                ShadBreadcrumbItem(
                  child: ShadBreadcrumbLinkedText(
                    onPressed: _navigateToComponents,
                    text: 'Components',
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
            const SizedBox(height: 32),
            
        
          ],
        ),
      ),
    );
  }
}
