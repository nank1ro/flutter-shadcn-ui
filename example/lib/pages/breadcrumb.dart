import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import '../common/base_scaffold.dart';

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
              child: Text('Home'),
            ),
            ShadBreadcrumbLink(
              onPressed: _navigateToComponents,
              child: Text('Components'),
            ),
            ShadBreadcrumbItem(
              isLastItem: true,
              child: Text('Breadcrumb'),
            ),
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
              child: Text('Home'),
            ),
            ShadBreadcrumbEllipsis(),
            ShadBreadcrumbLink(
              onPressed: _navigateToComponents,
              child: Text('Components'),
            ),
            ShadBreadcrumbItem(
              child: Text('Breadcrumb'),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Custom Separator',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        ShadBreadcrumb(
          separator: const Text(' / '),
          children: [
            ShadBreadcrumbItem(
              child: ShadBreadcrumbLink(
                onPressed: _navigateToHome,
                child: Text('Home'),
              ),
            ),
            ShadBreadcrumbItem(
              child: ShadBreadcrumbLink(
                onPressed: _navigateToComponents,
                child: Text('Components'),
              ),
            ),
            const ShadBreadcrumbItem(
              isLastItem: true,
              child: Text('Breadcrumb'),
            ),
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
            ShadBreadcrumbItem(
              child: ShadBreadcrumbLink(
                onPressed: _navigateToHome,
                child: Text('Home'),
              ),
            ),
            ShadBreadcrumbItem(
              child: ShadBreadcrumbDropdown(
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
            ),
            const ShadBreadcrumbItem(
              isLastItem: true,
              child: Text('Breadcrumb'),
            ),
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
    );
  }
}
