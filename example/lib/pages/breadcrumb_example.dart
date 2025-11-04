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
              child: ShadBreadcrumbPage(
                child: Text('Data'),
              ),
            ),
          ],
        ),
        const Text(
          'Breadcrumb with Links',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
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
            const ShadBreadcrumbItem(
              child: ShadBreadcrumbPage(
                child: Text('Breadcrumb'),
              ),
            ),
          ],
        ),
        const Text(
          'Breadcrumb with Ellipsis',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
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
                text: 'Components',
              ),
            ),
            const ShadBreadcrumbItem(
              child: ShadBreadcrumbPage(
                child: Text('Breadcrumb'),
              ),
            ),
          ],
        ),
        const Text(
          'Custom Separator',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        ShadBreadcrumb(
          separator: const Text(' / '),
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
            const ShadBreadcrumbItem(
              child: ShadBreadcrumbPage(
                child: Text('Breadcrumb'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
