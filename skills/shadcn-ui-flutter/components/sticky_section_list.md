# Sticky Section List

A scrollable list with a dynamic sticky header that updates based on the current section in view. The header changes instantly to reflect the section being scrolled through, with section headers appearing inline within the scrollable content.

```dart
ShadButton.outline(
  child: const Text('Browse Products'),
  onPressed: () => showShadSheet(
    context: context,
    builder: (context) => ShadSheet(
      scrollable: false,
      child: ShadStickySectionList(
        sections: [
          ShadListSection(
            header: Text('Popular'),
            items: popularProducts
                .map((p) => ProductCard(product: p))
                .toList(),
          ),
          ShadListSection(
            header: Text('New Arrivals'),
            items: newProducts
                .map((p) => ProductCard(product: p))
                .toList(),
          ),
        ],
      ),
    ),
  ),
),
```

## Features

- **Dynamic sticky header**: Updates instantly (no animation) based on scroll position
- **Inline section headers**: Headers appear within the scrollable content
- **Real-time section detection**: Measures live position of each inline header on every scroll frame
- **Handles dynamic content**: Works with async image loads, varying item heights, and viewport resizes
- **Theme-aware**: Fully integrated with `ShadTheme` for consistent styling

## Basic Usage

The component requires a list of `ShadListSection` objects, each with a header widget and a list of item widgets:

```dart
ShadStickySectionList(
  sections: [
    ShadListSection(
      header: Text('Section 1', style: theme.textTheme.h4),
      items: [
        ListTile(title: Text('Item 1')),
        ListTile(title: Text('Item 2')),
        ListTile(title: Text('Item 3')),
      ],
    ),
    ShadListSection(
      header: Text('Section 2', style: theme.textTheme.h4),
      items: [
        ListTile(title: Text('Item 4')),
        ListTile(title: Text('Item 5')),
      ],
    ),
  ],
)
```

## Inside a Sheet

The most common use case is displaying the sticky section list inside a sheet. Use `scrollable: false` on the `ShadSheet`:

```dart
showShadSheet(
  context: context,
  builder: (context) => ShadSheet(
    scrollable: false,
    expandable: true,
    child: ShadStickySectionList(
      sections: sections,
    ),
  ),
);
```

## Tracking the Current Section

Use `onSectionChanged` to track which section is currently active. This is useful for:

- Prefetching data for upcoming sections
- Analytics and user behavior tracking
- Updating external state or UI based on the visible section
- Enriching listings or loading related content

```dart
class _MySheetState extends State<MySheet> {
  int _currentSection = 0;

  @override
  Widget build(BuildContext context) {
    return ShadSheet(
      scrollable: false,
      child: ShadStickySectionList(
        sections: sections,
        onSectionChanged: (sectionIndex) {
          setState(() => _currentSection = sectionIndex);

          // Example: Prefetch next section's data
          if (sectionIndex < sections.length - 1) {
            _prefetchSectionData(sectionIndex + 1);
          }

          // Example: Track analytics
          analytics.logEvent('section_viewed', {
            'section_index': sectionIndex,
            'section_name': getSectionName(sectionIndex),
          });
        },
      ),
    );
  }

  Future<void> _prefetchSectionData(int sectionIndex) async {
    // Load data for upcoming section
    await dataService.prefetch(sectionIndex);
  }
}
```

The callback receives the zero-based index of the newly active section and is called whenever the user scrolls into a different section.

## Customization

### Styling

All visual properties can be customized through the theme or widget properties:

```dart
ShadStickySectionList(
  sections: sections,
  padding: const EdgeInsets.all(16),
  headerPadding: const EdgeInsets.fromLTRB(24, 20, 24, 12),
  headerBackgroundColor: Colors.white,
  headerBorder: ShadBorder(
    bottom: ShadBorderSide(color: Colors.grey, width: 2),
  ),
  inlineHeaderPadding: const EdgeInsets.symmetric(
    horizontal: 24,
    vertical: 12,
  ),
  inlineHeaderBackgroundColor: Colors.grey.withValues(alpha: 0.3),
  clipBehavior: Clip.hardEdge,
)
```

### Theme Integration

Set default styling for all sticky section lists through the theme:

```dart
ShadApp(
  theme: ShadThemeData(
    stickySectionListTheme: ShadStickySectionListTheme(
      padding: EdgeInsets.zero,
      headerPadding: const EdgeInsets.fromLTRB(24, 20, 24, 12),
      headerBackgroundColor: colorScheme.background,
      headerBorder: ShadBorder(
        bottom: ShadBorderSide(color: colorScheme.border),
      ),
      inlineHeaderPadding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 12,
      ),
      inlineHeaderBackgroundColor: colorScheme.muted.withValues(alpha: 0.3),
      clipBehavior: Clip.hardEdge,
    ),
  ),
  // ...
)
```

## Advanced: Custom Scroll Controller

You can provide your own `ScrollController` to observe or control scroll behavior:

```dart
final controller = ScrollController();

ShadStickySectionList(
  controller: controller,
  sections: sections,
)

// Later, jump to a specific position
controller.animateTo(
  500,
  duration: const Duration(milliseconds: 300),
  curve: Curves.easeInOut,
);
```

## Advanced: Custom Scroll Physics

Control the scroll physics:

```dart
ShadStickySectionList(
  physics: const ClampingScrollPhysics(),
  sections: sections,
)
```

## Example

```dart
import 'package:example/common/base_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class StickySectionListPage extends StatelessWidget {
  const StickySectionListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final sections = [
      ShadListSection(
        header: const Text('Popular Products'),
        items: List.generate(
          10,
          (i) => ListTile(
            title: Text('Popular Product ${i + 1}'),
            subtitle: Text('Description for product ${i + 1}'),
          ),
        ),
      ),
      ShadListSection(
        header: const Text('New Arrivals'),
        items: List.generate(
          8,
          (i) => ListTile(
            title: Text('New Product ${i + 1}'),
            subtitle: Text('Fresh from the warehouse'),
          ),
        ),
      ),
      ShadListSection(
        header: const Text('On Sale'),
        items: List.generate(
          5,
          (i) => ListTile(
            title: Text('Sale Item ${i + 1}'),
            subtitle: Text('Limited time offer!'),
          ),
        ),
      ),
    ];

    return BaseScaffold(
      appBarTitle: 'Sticky Section List',
      children: [
        ShadButton.outline(
          child: const Text('Open List'),
          onPressed: () {
            showShadSheet(
              context: context,
              builder: (context) => ShadSheet(
                scrollable: false,
                expandable: true,
                initialSize: 1.0,
                child: ShadStickySectionList(
                  sections: sections,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
```

## Properties

### ShadStickySectionList

| Property                      | Type                    | Description                                                                          |
| ----------------------------- | ----------------------- | ------------------------------------------------------------------------------------ |
| `sections`                    | `List<ShadListSection>` | The sections to display in the list (required)                                       |
| `controller`                  | `ScrollController?`     | Optional scroll controller for the internal scroll view                              |
| `physics`                     | `ScrollPhysics?`        | Scroll physics for the list                                                          |
| `padding`                     | `EdgeInsetsGeometry?`   | Padding around the entire scrollable content                                         |
| `headerPadding`               | `EdgeInsetsGeometry?`   | Padding inside the sticky header pinned at the top                                   |
| `headerBackgroundColor`       | `Color?`                | Background color of the sticky header                                                |
| `headerBorder`                | `ShadBorder?`           | Border surrounding the sticky header                                                 |
| `inlineHeaderPadding`         | `EdgeInsetsGeometry?`   | Padding inside the inline section headers                                            |
| `inlineHeaderBackgroundColor` | `Color?`                | Background color of the inline section headers                                       |
| `clipBehavior`                | `Clip`                  | How to clip the list content (default: `Clip.hardEdge`)                              |
| `onSectionChanged`            | `ValueChanged<int>?`    | Called when the active section changes; receives the zero-based index of the section |

### ShadListSection

| Property | Type           | Description                                           |
| -------- | -------------- | ----------------------------------------------------- |
| `header` | `Widget`       | The header widget displayed at the top of the section |
| `items`  | `List<Widget>` | The item widgets contained in this section            |

## Notes

- The active section is detected by measuring the real, live position of each inline header on every scroll frame
- The sticky header updates instantly without animation when crossing section boundaries
- Works correctly regardless of item heights, async image loads, or viewport resizes
- Best used inside a `ShadSheet` with `scrollable: false` to avoid nested scroll views
