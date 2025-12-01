import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import '../common/base_scaffold.dart';

class BreadcrumbPage extends StatelessWidget {
  const BreadcrumbPage({super.key});

  void _navigateToHome() {
    print('Navigating to Home');
  }

  void _navigateToComponents() {
    print('Navigating to Components');
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBarTitle: 'Breadcrumb',
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Simple Breadcrumb',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const ShadBreadcrumb(
          children: [
            Text('Home'),
            Text('Library'),
            Text('Data'),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Breadcrumb with Links',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
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
            const Text('Breadcrumb'),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Breadcrumb with Ellipsis',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        ShadBreadcrumb(
          children: [
            ShadBreadcrumbLink(
              onPressed: _navigateToHome,
              child: const Text('Home'),
            ),
            const ShadBreadcrumbEllipsis(),
            ShadBreadcrumbLink(
              onPressed: _navigateToComponents,
              child: const Text('Components'),
            ),
            const Text('Breadcrumb'),
          ],
        ),
        const SizedBox(height: 20),
        const Text(
          'Custom Separator',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        ShadBreadcrumb(
          separator: const Icon(LucideIcons.slash),
          children: [
            ShadBreadcrumbLink(
              onPressed: _navigateToHome,
              child: const Text('Home'),
            ),
            ShadBreadcrumbLink(
              onPressed: _navigateToComponents,
              child: const Text('Components'),
            ),
            const Text('Breadcrumb'),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Breadcrumb with Dropdown',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        ShadBreadcrumb(
          children: [
            ShadBreadcrumbLink(
              onPressed: _navigateToHome,
              child: const Text('Home'),
            ),
            ShadBreadcrumbDropdown(
              items: [
                ShadBreadcrumbDropMenuItem(
                  onPressed: () => print('Navigating to Documentation'),
                  child: const Text('Documentation'),
                ),
                ShadBreadcrumbDropMenuItem(
                  onPressed: () => print('Navigating to Themes'),
                  child: const Text('Themes'),
                ),
                ShadBreadcrumbDropMenuItem(
                  onPressed: () => print('Navigating to Github'),
                  child: const Text('Github'),
                ),
              ],
              child: const Text('Components'),
            ),
            Text('Breadcrumb'),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Long Breadcrumb',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        ShadBreadcrumb(
          children: [
            ShadBreadcrumbLink(
              onPressed: _navigateToHome,
              child: const Text('Home'),
            ),
            ShadBreadcrumbLink(
              onPressed: _navigateToComponents,
              child: const Text('Component 1'),
            ),
            ShadBreadcrumbLink(
              onPressed: _navigateToComponents,
              child: const Text('Component 2'),
            ),
            ShadBreadcrumbLink(
              onPressed: _navigateToComponents,
              child: const Text('Component 3'),
            ),
            ShadBreadcrumbLink(
              onPressed: _navigateToComponents,
              child: const Text('Component 4'),
            ),
            Text('Breadcrumb'),
          ],
        ),
      ],
    );
  }
}
