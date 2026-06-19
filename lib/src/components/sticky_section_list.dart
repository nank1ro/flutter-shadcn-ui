import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/utils/border.dart';

/// {@template ShadListSection}
/// A section in a [ShadStickySectionList] with a header widget and items.
/// {@endtemplate}
class ShadListSection {
  /// {@macro ShadListSection}
  const ShadListSection({required this.header, required this.items});

  /// The header widget displayed at the top of this section.
  ///
  /// Rendered both inline (within the scrollable content) and as the
  /// sticky title pinned at the top of the viewport when this section
  /// is the active one.
  final Widget header;

  /// The item widgets contained in this section.
  final List<Widget> items;
}

/// {@template ShadStickySectionList}
/// A scrollable list with a single dynamic sticky header that updates
/// based on the current section in view.
///
/// The header at the top changes instantly (no animation) to reflect
/// the section currently being scrolled through. Section headers appear
/// inline within the scrollable content. The active section is detected
/// by measuring the real position of each inline header, so the title
/// switches exactly when a section's header reaches the top of the
/// scroll area — regardless of item heights.
///
/// Use as the `child` of a `ShadSheet` with `scrollable: false`:
///
/// ```dart
/// showShadSheet(
///   context: context,
///   builder: (context) => ShadSheet(
///     scrollable: false,
///     child: ShadStickySectionList(
///       sections: [
///         ShadListSection(
///           header: Text('Popular'),
///           items: popularProducts
///               .map((p) => ProductCard(product: p))
///               .toList(),
///         ),
///         ShadListSection(
///           header: Text('New Arrivals'),
///           items: newProducts.map((p) => ProductCard(product: p)).toList(),
///         ),
///       ],
///     ),
///   ),
/// );
/// ```
/// {@endtemplate}
class ShadStickySectionList extends StatefulWidget {
  /// {@macro ShadStickySectionList}
  const ShadStickySectionList({
    super.key,
    required this.sections,
    this.controller,
    this.physics,
    this.padding,
    this.headerPadding,
    this.headerBackgroundColor,
    this.headerBorder,
    this.inlineHeaderPadding,
    this.inlineHeaderBackgroundColor,
    this.clipBehavior = Clip.hardEdge,
  });

  /// The sections to display in the list.
  final List<ShadListSection> sections;

  /// Optional [ScrollController] for the internal scroll view.
  final ScrollController? controller;

  /// Scroll physics for the list.
  final ScrollPhysics? physics;

  /// {@template ShadStickySectionList.padding}
  /// Padding around the entire scrollable content.
  /// Defaults to [EdgeInsets.zero].
  /// {@endtemplate}
  final EdgeInsetsGeometry? padding;

  /// {@template ShadStickySectionList.headerPadding}
  /// Padding inside the sticky header pinned at the top.
  /// Defaults to `EdgeInsets.fromLTRB(24, 20, 24, 12)`.
  /// {@endtemplate}
  final EdgeInsetsGeometry? headerPadding;

  /// {@template ShadStickySectionList.headerBackgroundColor}
  /// Background color of the sticky header.
  /// Defaults to the theme's background color.
  /// {@endtemplate}
  final Color? headerBackgroundColor;

  /// {@template ShadStickySectionList.headerBorder}
  /// Border surrounding the sticky header.
  /// Defaults to a bottom border using the theme's border color.
  /// {@endtemplate}
  final ShadBorder? headerBorder;

  /// {@template ShadStickySectionList.inlineHeaderPadding}
  /// Padding inside the inline section headers within the scroll content.
  /// Defaults to `EdgeInsets.symmetric(horizontal: 24, vertical: 12)`.
  /// {@endtemplate}
  final EdgeInsetsGeometry? inlineHeaderPadding;

  /// {@template ShadStickySectionList.inlineHeaderBackgroundColor}
  /// Background color of the inline section headers.
  /// Defaults to the theme's muted color at 30% alpha.
  /// {@endtemplate}
  final Color? inlineHeaderBackgroundColor;

  /// {@macro flutter.widgets.Clip}
  final Clip clipBehavior;

  @override
  State<ShadStickySectionList> createState() => _ShadStickySectionListState();
}

class _ShadStickySectionListState extends State<ShadStickySectionList> {
  late final ScrollController _scrollController;
  int _currentSectionIndex = 0;

  /// Maps section index → the scroll offset at which that section's inline
  /// header reaches the top of the viewport. Measured lazily as headers get
  /// laid out via [RenderAbstractViewport.getOffsetToReveal].
  final Map<int, double> _headerRevealOffsets = {};

  @override
  void initState() {
    super.initState();
    _scrollController = widget.controller ?? ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void didUpdateWidget(covariant ShadStickySectionList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.sections != widget.sections) {
      _headerRevealOffsets.clear();
      _currentSectionIndex = 0;
    }
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _scrollController.dispose();
    } else {
      _scrollController.removeListener(_onScroll);
    }
    super.dispose();
  }

  void _onHeaderRevealMeasured(int sectionIndex, double revealOffset) {
    if (_headerRevealOffsets[sectionIndex] != revealOffset) {
      _headerRevealOffsets[sectionIndex] = revealOffset;
      // Re-evaluate the active section right away so the title is in sync
      // even when not actively scrolling.
      _updateCurrentSection();
    }
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;
    _updateCurrentSection();
  }

  void _updateCurrentSection() {
    final offset = _scrollController.position.pixels;

    // Find the highest section index whose measured reveal offset is at or
    // below the current scroll position — i.e. the last header that has
    // already passed the top of the viewport.
    var active = 0;
    for (final entry in _headerRevealOffsets.entries) {
      if (entry.value <= offset + 1 && entry.key > active) {
        active = entry.key;
      }
    }

    if (_currentSectionIndex != active) {
      setState(() => _currentSectionIndex = active);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    final effectivePadding = widget.padding ?? EdgeInsets.zero;
    final effectiveHeaderPadding =
        widget.headerPadding ?? const EdgeInsets.fromLTRB(24, 20, 24, 12);
    final effectiveHeaderBackgroundColor =
        widget.headerBackgroundColor ?? theme.colorScheme.background;
    final effectiveHeaderBorder =
        widget.headerBorder ??
        ShadBorder(bottom: ShadBorderSide(color: theme.colorScheme.border));
    final effectiveInlineHeaderPadding =
        widget.inlineHeaderPadding ??
        const EdgeInsets.symmetric(horizontal: 24, vertical: 12);
    final effectiveInlineHeaderBackgroundColor =
        widget.inlineHeaderBackgroundColor ??
        theme.colorScheme.muted.withValues(alpha: 0.3);

    final currentSection =
        widget.sections.isNotEmpty &&
            _currentSectionIndex < widget.sections.length
        ? widget.sections[_currentSectionIndex]
        : null;

    return Column(
      children: [
        if (currentSection != null)
          _StickyHeader(
            section: currentSection,
            padding: effectiveHeaderPadding,
            backgroundColor: effectiveHeaderBackgroundColor,
            border: effectiveHeaderBorder,
          ),
        Expanded(
          child: ListView.builder(
            controller: _scrollController,
            physics: widget.physics,
            clipBehavior: widget.clipBehavior,
            padding: effectivePadding,
            itemCount: _calculateTotalItemCount(),
            itemBuilder: (context, index) => _buildItemAtIndex(
              context,
              index,
              effectiveInlineHeaderPadding,
              effectiveInlineHeaderBackgroundColor,
            ),
          ),
        ),
      ],
    );
  }

  int _calculateTotalItemCount() {
    return widget.sections.fold<int>(
      0,
      (sum, section) => sum + 1 + section.items.length,
    );
  }

  Widget _buildItemAtIndex(
    BuildContext context,
    int index,
    EdgeInsetsGeometry inlineHeaderPadding,
    Color inlineHeaderBackgroundColor,
  ) {
    var remaining = index;
    for (var i = 0; i < widget.sections.length; i++) {
      final section = widget.sections[i];
      if (remaining == 0) {
        return _InlineSectionHeader(
          key: ValueKey('shad-sticky-header-$i'),
          sectionIndex: i,
          section: section,
          padding: inlineHeaderPadding,
          backgroundColor: inlineHeaderBackgroundColor,
          onRevealMeasured: _onHeaderRevealMeasured,
        );
      }
      remaining--;
      if (remaining < section.items.length) {
        return section.items[remaining];
      }
      remaining -= section.items.length;
    }
    return const SizedBox.shrink();
  }
}

/// The fixed header bar pinned at the top — updates instantly without animation.
class _StickyHeader extends StatelessWidget {
  const _StickyHeader({
    required this.section,
    required this.padding,
    required this.backgroundColor,
    required this.border,
  });

  final ShadListSection section;
  final EdgeInsetsGeometry padding;
  final Color backgroundColor;
  final ShadBorder border;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: border.toBorder(),
      ),
      child: section.header,
    );
  }
}

/// Inline section header rendered within the scrollable list.
///
/// After layout, it reports the scroll offset at which it reaches the top of
/// the viewport so the parent can keep the sticky title in sync.
class _InlineSectionHeader extends StatefulWidget {
  const _InlineSectionHeader({
    super.key,
    required this.sectionIndex,
    required this.section,
    required this.padding,
    required this.backgroundColor,
    required this.onRevealMeasured,
  });

  final int sectionIndex;
  final ShadListSection section;
  final EdgeInsetsGeometry padding;
  final Color backgroundColor;
  final void Function(int sectionIndex, double revealOffset) onRevealMeasured;

  @override
  State<_InlineSectionHeader> createState() => _InlineSectionHeaderState();
}

class _InlineSectionHeaderState extends State<_InlineSectionHeader> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _measureRevealOffset());
  }

  @override
  void didUpdateWidget(covariant _InlineSectionHeader oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.section != widget.section ||
        oldWidget.padding != widget.padding) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => _measureRevealOffset(),
      );
    }
  }

  void _measureRevealOffset() {
    if (!mounted) return;
    final renderObject = context.findRenderObject();
    if (renderObject == null || !renderObject.attached) return;
    final viewport = RenderAbstractViewport.of(renderObject);
    final revealOffset = viewport.getOffsetToReveal(renderObject, 0.0).offset;
    widget.onRevealMeasured(widget.sectionIndex, revealOffset);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding,
      color: widget.backgroundColor,
      child: Align(
        alignment: Alignment.centerLeft,
        child: widget.section.header,
      ),
    );
  }
}
