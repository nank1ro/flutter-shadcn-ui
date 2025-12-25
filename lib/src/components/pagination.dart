import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ShadPaginationController extends ChangeNotifier {
  int _selectedIndex = 0;

  /// Returns the selected index of the pagination.
  int get selectedIndex => _selectedIndex;

  /// Sets the selected index of the pagination.
  /// Notifies listeners if the index changes.
  set selectedIndex(int index) {
    if (_selectedIndex == index) return;
    _selectedIndex = index;
    notifyListeners();
  }

  /// Navigates to the next page if available.
  bool nextPage(int totalPages) {
    if (_selectedIndex < totalPages - 1) {
      selectedIndex = _selectedIndex + 1;
      return true;
    }
    return false;
  }

  /// Navigates to the previous page if available.
  bool previousPage() {
    if (_selectedIndex > 0) {
      selectedIndex = _selectedIndex - 1;
      return true;
    }
    return false;
  }

  /// Navigates to the first page.
  void firstPage() {
    selectedIndex = 0;
  }

  /// Navigates to the last page.
  void lastPage(int totalPages) {
    selectedIndex = totalPages - 1;
  }
}

/// A pagination that allows navigation through multiple pages of content.
class ShadPagination extends StatefulWidget {
  const ShadPagination({
    super.key,
    this.controller,
    required this.totalPages,
    this.initialPage = 0,
    this.padding,
    this.border,
    this.backgroundColor,
    this.radius,
    this.onPageChanged,
    this.showEllipsis = true,
    this.showFirstLastButtons = false,
    this.isCompact = false,
    this.showPageNumbers = true,
    this.siblingCount = 1,
    this.boundaryCount = 1,
    this.buttonVariant,
    this.buttonSize,
    this.buttonPadding,
    this.selectedButtonVariant,
    this.selectedButtonBackgroundColor,
    this.buttonGap = 4.0,
    this.showPreviousNextLabels = false,
  });

  /// {@macro ShadPaginationController}
  final ShadPaginationController? controller;

  /// {@template ShadPagination.initialPage}
  /// The initial page index.
  /// {@endtemplate}
  final int initialPage;

  /// {@template ShadPagination.padding}
  /// The padding of the pagination, default to `EdgeInsets.all(4)`
  /// {@endtemplate}
  final EdgeInsetsGeometry? padding;

  /// {@template ShadPagination.border}
  /// The border of the pagination, default to
  /// `ShadBorder.all(color: theme.colorScheme.border, width: 1)`
  /// {@endtemplate}
  final ShadBorder? border;

  /// {@template ShadPagination.backgroundColor}
  /// The background color of the pagination, default to `null`
  /// {@endtemplate}
  final Color? backgroundColor;

  /// {@template ShadPagination.radius}
  /// The radius of the pagination, default to `theme.radius`
  /// {@endtemplate}
  final BorderRadiusGeometry? radius;

  /// {@template ShadPagination.totalPages}
  /// The total number of pages in the pagination.
  /// {@endtemplate}
  final int totalPages;

  /// {@template ShadPagination.onPageChanged}
  /// Callback when the page is changed.
  /// {@endtemplate}
  final ValueChanged<int>? onPageChanged;

  /// {@template ShadPagination.isCompact}
  /// Whether to use a compact style for the pagination.
  /// {@endtemplate}
  final bool isCompact;

  /// {@template ShadPagination.showFirstLastButtons}
  /// Whether to show first and last buttons in the pagination.
  /// {@endtemplate}
  final bool showFirstLastButtons;

  /// {@template ShadPagination.showEllipsis}
  /// Whether to show ellipsis (...) in the pagination when there are many pages.
  /// {@endtemplate}
  final bool showEllipsis;

  /// {@template ShadPagination.showPageNumbers}
  /// Whether to show page numbers in the pagination.
  /// {@endtemplate}
  final bool showPageNumbers;

  /// {@template ShadPagination.siblingCount}
  /// Number of sibling pages to show on each side of the current page.
  /// {@endtemplate}
  final int siblingCount;

  /// {@template ShadPagination.boundaryCount}
  /// Number of boundary pages to show at the beginning and end.
  /// {@endtemplate}
  final int boundaryCount;

  /// {@template ShadPagination.buttonVariant}
  /// The variant for the pagination buttons.
  /// {@endtemplate}
  final ShadButtonVariant? buttonVariant;

  /// {@template ShadPagination.buttonSize}
  /// The size for the pagination buttons.
  /// {@endtemplate}
  final ShadButtonSize? buttonSize;

  /// {@template ShadPagination.buttonPadding}
  /// The padding for the pagination buttons.
  /// {@endtemplate}
  final EdgeInsetsGeometry? buttonPadding;

  /// {@template ShadPagination.selectedButtonVariant}
  /// The variant for the selected page button.
  /// {@endtemplate}
  final ShadButtonVariant? selectedButtonVariant;

  /// {@template ShadPagination.selectedButtonBackgroundColor}
  /// The background color for the selected page button.
  /// {@endtemplate}
  final Color? selectedButtonBackgroundColor;

  /// {@template ShadPagination.buttonGap}
  /// The gap between pagination buttons.
  /// {@endtemplate}
  final double buttonGap;

  /// {@template ShadPagination.showPreviousNextLabels}
  /// Whether to show "Previous" and "Next" text labels with icons.
  /// If false, only icons are shown.
  /// {@endtemplate}
  final bool showPreviousNextLabels;

  @override
  State<ShadPagination> createState() => _ShadPaginationState();
}

class _ShadPaginationState extends State<ShadPagination> {
  late ShadPaginationController _controller;
  ShadPaginationController get controller => widget.controller ?? _controller;

  @override
  void initState() {
    super.initState();
    if (widget.controller == null) {
      _controller = ShadPaginationController();
    }
    _controller.selectedIndex = widget.initialPage;
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final effectiveRadius =
        widget.radius ?? theme.menubarTheme.radius ?? theme.radius;
    final effectivePadding =
        widget.padding ?? theme.menubarTheme.padding ?? const EdgeInsets.all(4);
    final effectiveBackgroundColor =
        widget.backgroundColor ?? theme.menubarTheme.backgroundColor;
    final effectiveBorder = ShadBorder.all(
      color: theme.colorScheme.border,
      width: 1,
    ).merge(theme.menubarTheme.border).merge(widget.border);

    return ListenableBuilder(
      listenable: controller,
      builder: (context, child) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: effectiveBackgroundColor,
            border: effectiveBorder.toBorder(),
            borderRadius: effectiveRadius,
          ),
          child: Padding(
            padding: effectivePadding,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: _buildPaginationItems(),
              ),
            ),
          ),
        );
      },
    );
  }

  List<Widget> _buildPaginationItems() {
    if (widget.totalPages <= 0) return [];

    final items = <Widget>[];
    final currentPage = controller.selectedIndex;

    // Add First button if enabled
    if (widget.showFirstLastButtons && currentPage > 0) {
      items.add(
        _buildNavigationButton(
          icon: Icons.first_page,
          label: widget.showPreviousNextLabels ? 'First' : null,
          onPressed: () {
            controller.firstPage();
            widget.onPageChanged?.call(controller.selectedIndex);
          },
          tooltip: 'First page',
        ),
      );
      if (widget.buttonGap > 0) {
        items.add(SizedBox(width: widget.buttonGap));
      }
    }

    // Add Previous button
    final canGoPrevious = currentPage > 0;
    items.add(
      _buildNavigationButton(
        icon: Icons.chevron_left,
        label: widget.showPreviousNextLabels ? 'Previous' : null,
        onPressed: canGoPrevious
            ? () {
                controller.previousPage();
                widget.onPageChanged?.call(controller.selectedIndex);
              }
            : null,
        tooltip: 'Previous page',
      ),
    );

    if (widget.buttonGap > 0) {
      items.add(SizedBox(width: widget.buttonGap));
    }

    // Build page numbers
    if (widget.showPageNumbers) {
      final pageNumbers = _generatePageNumbers();
      for (var i = 0; i < pageNumbers.length; i++) {
        final page = pageNumbers[i];

        if (page == null) {
          // Ellipsis
          items.add(
            Container(
              alignment: Alignment.center,
              width: 32,
              child: Text(
                '...',
                style: TextStyle(
                  color: ShadTheme.of(context).colorScheme.mutedForeground,
                  fontSize: 14,
                ),
              ),
            ),
          );
        } else {
          final isSelected = page - 1 == currentPage;
          items.add(_buildPageButton(page: page, isSelected: isSelected));
        }

        if (i < pageNumbers.length - 1 && widget.buttonGap > 0) {
          items.add(SizedBox(width: widget.buttonGap));
        }
      }

      if (pageNumbers.isNotEmpty && widget.buttonGap > 0) {
        items.add(SizedBox(width: widget.buttonGap));
      }
    }

    // Add Next button
    final canGoNext = currentPage < widget.totalPages - 1;
    items.add(
      _buildNavigationButton(
        icon: Icons.chevron_right,
        label: widget.showPreviousNextLabels ? 'Next' : null,
        onPressed: canGoNext
            ? () {
                controller.nextPage(widget.totalPages);
                widget.onPageChanged?.call(controller.selectedIndex);
              }
            : null,
        tooltip: 'Next page',
      ),
    );

    // Add Last button if enabled
    if (widget.showFirstLastButtons && canGoNext) {
      if (widget.buttonGap > 0) {
        items.add(SizedBox(width: widget.buttonGap));
      }
      items.add(
        _buildNavigationButton(
          icon: Icons.last_page,
          label: widget.showPreviousNextLabels ? 'Last' : null,
          onPressed: () {
            controller.lastPage(widget.totalPages);
            widget.onPageChanged?.call(controller.selectedIndex);
          },
          tooltip: 'Last page',
        ),
      );
    }

    return items;
  }

  List<int?> _generatePageNumbers() {
    if (widget.totalPages <= 0) return [];

    final currentPage = controller.selectedIndex + 1; // Convert to 1-based
    final totalPages = widget.totalPages;
    final siblingCount = widget.siblingCount;
    final boundaryCount = widget.boundaryCount;

    final pages = <int?>[];

    // For small number of pages, show all
    if (totalPages <= (boundaryCount * 2 + siblingCount * 2 + 3)) {
      for (var i = 1; i <= totalPages; i++) {
        pages.add(i);
      }
      return pages;
    }

    // Always show first boundary pages
    for (var i = 1; i <= min(boundaryCount, totalPages); i++) {
      pages.add(i);
    }

    // Add ellipsis if needed before current page range
    if (currentPage - siblingCount > boundaryCount + 1 && widget.showEllipsis) {
      pages.add(null); // null represents ellipsis
    }

    // Add current page and siblings
    final start = max(currentPage - siblingCount, boundaryCount + 1);
    final end = min(currentPage + siblingCount, totalPages - boundaryCount);
    for (var i = start; i <= end; i++) {
      if (i > boundaryCount && i <= totalPages - boundaryCount) {
        pages.add(i);
      }
    }

    // Add ellipsis if needed after current page range
    if (currentPage + siblingCount < totalPages - boundaryCount &&
        widget.showEllipsis) {
      pages.add(null);
    }

    // Always show last boundary pages
    for (
      var i = max(totalPages - boundaryCount + 1, boundaryCount + 1);
      i <= totalPages;
      i++
    ) {
      if (i > boundaryCount && !pages.contains(i)) {
        pages.add(i);
      }
    }

    return pages;
  }

  Widget _buildNavigationButton({
    required IconData icon,
    String? label,
    required VoidCallback? onPressed,
    required String tooltip,
  }) {
    final theme = ShadTheme.of(context);
    final effectiveVariant = widget.buttonVariant ?? ShadButtonVariant.outline;
    final effectiveSize = widget.buttonSize ?? ShadButtonSize.sm;
    final effectivePadding =
        widget.buttonPadding ??
        const EdgeInsets.symmetric(horizontal: 12, vertical: 6);

    final children = <Widget>[];

    if (label != null) {
      // Button with icon and label
      children.addAll([
        Icon(
          icon,
          size: 16,
          color: onPressed == null
              ? theme.colorScheme.mutedForeground
              : theme.colorScheme.foreground,
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: onPressed == null
                ? theme.colorScheme.mutedForeground
                : theme.colorScheme.foreground,
          ),
        ),
      ]);
    } else {
      // Button with icon only
      children.add(
        Icon(
          icon,
          size: 16,
          color: onPressed == null
              ? theme.colorScheme.mutedForeground
              : theme.colorScheme.foreground,
        ),
      );
    }

    return ShadButton.raw(
      variant: effectiveVariant,
      size: effectiveSize,
      padding: effectivePadding,
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: children,
      ),
    );
  }

  Widget _buildPageButton({required int page, required bool isSelected}) {
    final theme = ShadTheme.of(context);
    final effectiveVariant = isSelected
        ? (widget.selectedButtonVariant ?? ShadButtonVariant.secondary)
        : (widget.buttonVariant ?? ShadButtonVariant.outline);

    final effectiveBackgroundColor = isSelected
        ? (widget.selectedButtonBackgroundColor ?? theme.colorScheme.accent)
        : null;

    return ShadButton.raw(
      variant: effectiveVariant,
      size: widget.buttonSize ?? ShadButtonSize.sm,
      padding:
          widget.buttonPadding ??
          const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      backgroundColor: effectiveBackgroundColor,
      onPressed: () {
        if (!isSelected) {
          controller.selectedIndex = page - 1;
          widget.onPageChanged?.call(controller.selectedIndex);
        }
      },
      child: Text(
        page.toString(),
        style: TextStyle(
          fontSize: 14,
          color: isSelected ? theme.colorScheme.accentForeground : null,
        ),
      ),
    );
  }

  T min<T extends num>(T a, T b) => a < b ? a : b;
  T max<T extends num>(T a, T b) => a > b ? a : b;
}
