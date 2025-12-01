import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

enum ShadBreadcrumbStyle {
  primary,
  customSeparator,
  dropdown,
}

class BreadcrumbPage extends StatelessWidget {
  const BreadcrumbPage({
    super.key,
    required this.style,
  });

  final ShadBreadcrumbStyle style;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: switch (style) {
            ShadBreadcrumbStyle.primary => const PrimaryBreadcrumb(),
            ShadBreadcrumbStyle.customSeparator =>
              const CustomSeparatorBreadcrumb(),
            ShadBreadcrumbStyle.dropdown => const DropdownBreadcrumb(),
          },
        ),
      ),
    );
  }
}

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
