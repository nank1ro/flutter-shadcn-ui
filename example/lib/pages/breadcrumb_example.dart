import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class BreadcrumbExample extends StatelessWidget {
  const BreadcrumbExample({super.key});

  void _navigateToHome() {
    print('Navigating to Home');
  }

  void _navigateToComponents() {
    print('Navigating to Components');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Breadcrumb Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Simple Breadcrumb',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                  child: Text('Data'),
                  isCurrentPage: true,
                ),
              ],
            ),
            const SizedBox(height: 32),
            const Text(
              'Breadcrumb with Links',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                const ShadBreadcrumbItem(
                  child: Text('Breadcrumb'),
                  isCurrentPage: true,
                ),
              ],
            ),
            const SizedBox(height: 32),
            const Text(
              'Breadcrumb with Ellipsis',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                    onPressed: _navigateToComponents,
                    child: const Text('Components'),
                  ),
                ),
                const ShadBreadcrumbItem(
                  child: Text('Breadcrumb'),
                  isCurrentPage: true,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
