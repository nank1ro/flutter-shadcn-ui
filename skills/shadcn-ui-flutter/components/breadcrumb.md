# Breadcrumb

Displays the path to the current resource using a hierarchy of links.




```dart
class PrimaryBreadcrumb extends StatelessWidget {
  const PrimaryBreadcrumb({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadBreadcrumb(
      children: [
        ShadBreadcrumbLink(
          onPressed: () => print('Navigating to Home'),
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
          showDropdownArrow: false,
          child: ShadBreadcrumbEllipsis(),
        ),
        Text('Components'),
        Text('Breadcrumb'),
      ],
    );
  }
}
```



## Custom separator

Use a custom `separator` to change the default `>` separator.



```dart
class CustomSeparatorBreadcrumb extends StatelessWidget {
  const CustomSeparatorBreadcrumb({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadBreadcrumb(
      separator: const Icon(LucideIcons.slash),
      children: [
        ShadBreadcrumbLink(
          onPressed: () => print('Navigating to Home'),
          child: const Text('Home'),
        ),
        ShadBreadcrumbLink(
          onPressed: () => print('Navigating to Components'),
          child: const Text('Components'),
        ),
        Text('Breadcrumb'),
      ],
    );
  }
}
```




## Dropdown

You can use `ShadBreadcrumbDropdown` to create a dropdown in the breadcrumb.



```dart
class DropdownBreadcrumb extends StatelessWidget {
  const DropdownBreadcrumb({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadBreadcrumb(
      children: [
        ShadBreadcrumbLink(
          onPressed: () => print('Navigating to Home'),
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
    );
  }
}
```

## Example
```dart
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

```
