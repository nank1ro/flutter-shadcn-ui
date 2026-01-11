import 'package:flutter/widgets.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:shadcn_ui/src/components/button.dart';
import 'package:shadcn_ui/src/theme/data.dart' show ShadThemeData;
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/utils/border.dart';

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
    this.buttonHeight = 40.0,
    this.compactBreakpoint = 768.0,
    this.compactButtonVariant = ShadButtonVariant.ghost,
    this.ellipsisColor,
    this.navigationButtonSize,
    this.navigationButtonVariant,
    this.selectedButtonForegroundColor,
    this.width,
    this.margin = const EdgeInsets.symmetric(horizontal: 16),
    this.previousButtonLabel = 'Previous',
    this.nextButtonLabel = 'Next',
    this.constraints,
  }) : assert(totalPages > 0, 'totalPages must be greater than 0'),
       assert(initialPage >= 0, 'initialPage must be non-negative'),
       assert(
         initialPage < totalPages,
         'initialPage must be less than totalPages',
       ),
       assert(siblingCount >= 0, 'siblingCount must be non-negative'),
       assert(boundaryCount >= 0, 'boundaryCount must be non-negative'),
       assert(
         buttonHeight == null || buttonHeight > 0,
         'buttonHeight must be greater than 0',
       ),
       assert(
         compactBreakpoint == null || compactBreakpoint > 0,
         'compactBreakpoint must be greater than 0',
       );

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
  /// Whether to show ellipsis (...) in the pagination
  /// when there are many pages.
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

  /// {@template ShadPagination.buttonHeight}
  /// The height for the pagination buttons.
  /// {@endtemplate}
  final double? buttonHeight;

  /// {@template ShadPagination.compactBreakpoint}
  /// The breakpoint width below which the pagination
  /// switches to a compact style.
  /// {@endtemplate}
  final double? compactBreakpoint;

  /// {@template ShadPagination.compactButtonVariant}
  /// The variant for the pagination buttons in compact style.
  /// {@endtemplate}
  final ShadButtonVariant? compactButtonVariant;

  /// {@template ShadPagination.ellipsisColor}
  /// The color for the ellipsis (...) in the pagination.
  /// {@endtemplate}
  final Color? ellipsisColor;

  /// {@template ShadPagination.navigationButtonSize}
  /// The size for the navigation buttons (first, previous, next, last).
  /// {@endtemplate}
  final ShadButtonSize? navigationButtonSize;

  /// {@template ShadPagination.navigationButtonVariant}
  /// The variant for the navigation buttons (first, previous, next, last).
  /// {@endtemplate}
  final ShadButtonVariant? navigationButtonVariant;

  /// {@template ShadPagination.selectedButtonForegroundColor}
  /// The foreground color for the selected page button.
  /// {@endtemplate}
  final Color? selectedButtonForegroundColor;

  /// {@template ShadPagination.width}
  /// The width of the pagination widget.
  /// If null, it will take the screen width minus [margin].
  /// {@endtemplate}
  final double? width;

  /// {@template ShadPagination.margin}
  /// The margin around the pagination widget when using automatic width.
  /// Defaults to `EdgeInsets.symmetric(horizontal: 16.0)`.
  /// {@endtemplate}
  final EdgeInsetsGeometry? margin;

  /// {@template ShadPagination.constraints}
  /// Additional constraints for the pagination widget.
  /// {@endtemplate}
  final BoxConstraints? constraints;

  /// {@template ShadPagination.previousButtonLabel}
  /// The label for the previous button.
  /// {@endtemplate}
  final String? previousButtonLabel;

  /// {@template ShadPagination.nextButtonLabel}
  /// The label for the next button.
  /// {@endtemplate}
  final String? nextButtonLabel;

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
      _controller.selectedIndex = widget.initialPage;
    } else {
      // Respect the provided controller's state, but apply initialPage
      // if it's at default
      if (widget.controller!.selectedIndex == 0 && widget.initialPage != 0) {
        widget.controller!.selectedIndex = widget.initialPage;
      }
    }
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

    final effectivePadding =
        widget.padding ??
        theme.shadPaginationTheme.padding ??
        const EdgeInsets.all(4);

    final effectiveMargin =
        widget.margin ?? const EdgeInsets.symmetric(horizontal: 16);

    return ListenableBuilder(
      listenable: controller,
      builder: (context, child) {
        final screenWidth = MediaQuery.of(context).size.width;

        final effectiveCompactBreakpoint =
            widget.compactBreakpoint ??
            theme.shadPaginationTheme.compactBreakpoint;

        final isCompactBasedOnBreakpoint =
            widget.isCompact || screenWidth < effectiveCompactBreakpoint;

        // Calculate the effective width
        double effectiveWidth;

        if (widget.width != null) {
          // Use user-specified width
          effectiveWidth = widget.width!;
        } else {
          // Use screen width minus margin
          final horizontalMargin = effectiveMargin.horizontal;
          effectiveWidth = screenWidth - horizontalMargin;
        }
        // Create container with constraints
        Widget paginationContent = Container(
          width: effectiveWidth,
          padding: effectivePadding,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: _buildPaginationItems(
                isCompactBasedOnBreakpoint,
                theme,
              ),
            ),
          ),
        );

        // Apply constraints if provided
        if (widget.constraints != null) {
          paginationContent = ConstrainedBox(
            constraints: widget.constraints!,
            child: paginationContent,
          );
        }

        // Apply margin
        if (effectiveMargin != EdgeInsets.zero) {
          paginationContent = Padding(
            padding: effectiveMargin,
            child: paginationContent,
          );
        }

        return paginationContent;
      },
    );
  }

  List<Widget> _buildPaginationItems(bool isCompact, ShadThemeData theme) {
    if (widget.totalPages <= 1) return [];

    final items = <Widget>[];
    final currentPage = controller.selectedIndex;

    // Add Previous button
    final canGoPrevious = currentPage > 0;

    items.add(
      _buildNavigationButton(
        icon: LucideIcons.chevronLeft,
        label: widget.showFirstLastButtons ? widget.previousButtonLabel : null,
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
          final effectiveEllipsisColor =
              widget.ellipsisColor ??
              theme.shadPaginationTheme.ellipsisColor ??
              theme.colorScheme.mutedForeground;

          items.add(
            DecoratedBox(
              position: DecorationPosition.foreground,
              decoration: BoxDecoration(
                color: theme.colorScheme.background,
              ),
              child: SizedBox(
                width: 32,
                child: Align(
                  child: Text(
                    '...',
                    style: TextStyle(
                      color: effectiveEllipsisColor,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
          );
        } else {
          final isSelected = page - 1 == currentPage;
          items.add(
            _buildPageButton(
              page: page,
              isSelected: isSelected,
              isCompact: isCompact,
            ),
          );
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
        icon: LucideIcons.chevronRight,
        label: widget.showFirstLastButtons ? widget.nextButtonLabel : null,
        onPressed: canGoNext
            ? () {
                controller.nextPage(widget.totalPages);
                widget.onPageChanged?.call(controller.selectedIndex);
              }
            : null,
        tooltip: 'Next page',
      ),
    );

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

    // // Add ellipsis if needed before current page range
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

    // Use navigation-specific properties if provided
    final navigationVariant =
        widget.navigationButtonVariant ?? effectiveVariant;
    final navigationSize = widget.navigationButtonSize ?? effectiveSize;

    // Automatically determine icon position based on icon type
    final isRightIcon = icon == LucideIcons.chevronRight;

    final children = <Widget>[];

    if (label != null) {
      // Button with icon and label
      final iconWidget = Icon(
        icon,
        size: 16,
        color: onPressed == null
            ? theme.colorScheme.mutedForeground
            : theme.colorScheme.foreground,
      );

      final textWidget = Text(
        label,
        style: TextStyle(
          fontSize: 14,
          color: onPressed == null
              ? theme.colorScheme.mutedForeground
              : theme.colorScheme.foreground,
        ),
      );

      // Auto-arrange: left icons on left, right icons on right
      if (isRightIcon) {
        // For "Next" type icons: Text on left, Icon on right
        children.addAll([
          textWidget,
          const SizedBox(width: 4),
          iconWidget,
        ]);
      } else {
        // For "Previous" type icons: Icon on left, Text on right
        children.addAll([
          iconWidget,
          const SizedBox(width: 4),
          textWidget,
        ]);
      }
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
      variant: navigationVariant,
      size: navigationSize,
      padding: effectivePadding,
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: children,
      ),
    );
  }

  Widget _buildPageButton({
    required int page,
    required bool isSelected,
    required bool isCompact,
  }) {
    final theme = ShadTheme.of(context);

    // Determine which variant to use based on compact mode
    final effectiveVariant = isSelected
        ? (widget.selectedButtonVariant ?? ShadButtonVariant.secondary)
        : (isCompact
              ? (widget.compactButtonVariant ??
                    widget.buttonVariant ??
                    ShadButtonVariant.ghost)
              : (widget.buttonVariant ?? ShadButtonVariant.outline));

    final effectiveBackgroundColor = isSelected
        ? (widget.selectedButtonBackgroundColor ?? theme.colorScheme.accent)
        : null;

    final effectiveForegroundColor = isSelected
        ? (widget.selectedButtonForegroundColor ??
              theme.colorScheme.accentForeground)
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
      child: Container(
        height: widget.buttonHeight,
        alignment: Alignment.center,
        child: Text(
          page.toString(),
          style: TextStyle(
            fontSize: 14,
            color: isSelected ? effectiveForegroundColor : null,
          ),
        ),
      ),
    );
  }

  T min<T extends num>(T a, T b) => a < b ? a : b;
  T max<T extends num>(T a, T b) => a > b ? a : b;
}
