import 'package:flutter/material.dart';
import 'package:shadcn_ui/src/theme/theme.dart';

/// {@template ShadListSection}
/// A section in a [ShadStickySectionList] with a sticky header and items.
///
/// Each section has a header that pins to the top of the scroll viewport.
/// When the next section's header reaches the pinned position, it pushes
/// the current header upward and takes its place.
/// {@endtemplate}
class ShadListSection {
  /// {@macro ShadListSection}
  const ShadListSection({
    required this.header,
    required this.headerExtent,
    required this.items,
  });

  /// The header widget displayed at the top of this section.
  ///
  /// This widget will stick to the top of the viewport while items in
  /// this section scroll underneath it. Give it a solid background color
  /// (matching the sheet background) so it visually occludes content
  /// that scrolls behind it.
  final Widget header;

  /// The fixed height of the [header] widget in logical pixels.
  ///
  /// Must be accurate for the sticky pinning behavior to work correctly.
  /// The header occupies exactly this much vertical space whether it is
  /// in-flow or pinned.
  final double headerExtent;

  /// The item widgets contained in this section.
  final List<Widget> items;
}

/// {@template ShadStickySectionList}
/// A scrollable list with sticky section headers that push each other away.
///
/// When scrolling upward, each section header pins to the top of the
/// viewport. When the next section's header reaches the pinned position,
/// it pushes the current header upward and takes its place — creating an
/// accordion-like effect where only one section header is focused at a time.
///
/// Built on Flutter's [CustomScrollView] with pinned
/// [SliverPersistentHeader] delegates for each section.
///
/// Use as the `child` of a `ShadSheet` with
/// `scrollable: false`:
///
/// ```dart
/// showShadSheet(
///   context: context,
///   builder: (context) => ShadSheet(
///     scrollable: false,
///     expandable: true,
///     child: ShadStickySectionList(
///       sections: [
///         ShadListSection(
///           header: Padding(
///             padding: EdgeInsets.all(16),
///             child: Text('Popular'),
///           ),
///           headerExtent: 56,
///           items: popularProducts
///               .map((p) => ProductCard(product: p))
///               .toList(),
///         ),
///         ShadListSection(
///           header: Padding(
///             padding: EdgeInsets.all(16),
///             child: Text('New Arrivals'),
///           ),
///           headerExtent: 56,
///           items: newProducts.map((p) => ProductCard(product: p)).toList(),
///         ),
///       ],
///     ),
///   ),
/// );
/// ```
/// {@endtemplate}
class ShadStickySectionList extends StatelessWidget {
  /// {@macro ShadStickySectionList}
  const ShadStickySectionList({
    super.key,
    required this.sections,
    this.headerBackgroundColor,
    this.padding,
    this.controller,
    this.physics,
    this.clipBehavior = Clip.hardEdge,
    this.anchor = 0.0,
  });

  /// The sections to display in the list.
  final List<ShadListSection> sections;

  /// Background color applied behind each sticky header.
  ///
  /// Defaults to the theme's background color.
  /// Set this to match the parent sheet's background so headers visually
  /// occlude scrolled content beneath them.
  final Color? headerBackgroundColor;

  /// Padding around the entire list content.
  final EdgeInsetsGeometry? padding;

  /// Optional [ScrollController] for the internal [CustomScrollView].
  final ScrollController? controller;

  /// Scroll physics for the list. Defaults to platform-standard behavior.
  final ScrollPhysics? physics;

  /// {@macro flutter.widgets.Clip}
  final Clip clipBehavior;

  /// {@macro flutter.widgets.Scrollable.anchor}
  final double anchor;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final bgColor = headerBackgroundColor ?? theme.colorScheme.background;

    final slivers = <Widget>[];

    if (padding != null) {
      slivers.add(SliverPadding(padding: padding!));
    }

    for (final section in sections) {
      // Sticky header for this section
      slivers.add(
        SliverPersistentHeader(
          pinned: true,
          delegate: _StickySectionHeaderDelegate(
            header: DecoratedBox(
              decoration: BoxDecoration(color: bgColor),
              child: section.header,
            ),
            extent: section.headerExtent,
          ),
        ),
      );

      // Items in this section
      slivers.add(
        SliverList(
          delegate: SliverChildListDelegate(section.items),
        ),
      );
    }

    return CustomScrollView(
      controller: controller,
      physics: physics,
      clipBehavior: clipBehavior,
      anchor: anchor,
      slivers: slivers,
    );
  }
}

class _StickySectionHeaderDelegate extends SliverPersistentHeaderDelegate {
  _StickySectionHeaderDelegate({
    required this.header,
    required this.extent,
  });

  final Widget header;
  final double extent;

  @override
  double get minExtent => extent;

  @override
  double get maxExtent => extent;

  @override
  bool shouldRebuild(covariant _StickySectionHeaderDelegate old) =>
      header != old.header || extent != old.extent;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return SizedBox.expand(child: header);
  }
}
