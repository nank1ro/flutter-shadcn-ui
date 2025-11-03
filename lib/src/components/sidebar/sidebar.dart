import 'dart:ui';

import 'package:flutter/material.dart' show Scrollbar;
import 'package:flutter/widgets.dart';

import 'package:flutter_animate/flutter_animate.dart';

import 'package:shadcn_ui/src/components/separator.dart';
import 'package:shadcn_ui/src/components/sheet.dart';
import 'package:shadcn_ui/src/components/sidebar/common/enums.dart';
import 'package:shadcn_ui/src/components/sidebar/sidebar_controller.dart';
import 'package:shadcn_ui/src/components/sidebar/sidebar_scaffold.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/theme/themes/shadows.dart';
import 'package:shadcn_ui/src/utils/border.dart';
import 'package:shadcn_ui/src/utils/gesture_detector.dart';

class ShadSidebarScope extends InheritedWidget {
  const ShadSidebarScope({
    super.key,
    required this.extended,
    required this.isMobile,
    required this.collapseMode,
    required this.state,
    required super.child,
  });
  final ShadSidebarCollapseMode collapseMode;
  final bool extended;
  final bool isMobile;
  final ShadSidebarState state;

  @override
  bool updateShouldNotify(ShadSidebarScope oldWidget) {
    return oldWidget.extended != extended ||
        oldWidget.isMobile != isMobile ||
        oldWidget.collapseMode != collapseMode ||
        state != oldWidget.state;
  }

  static ShadSidebarScope? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ShadSidebarScope>();
  }

  static ShadSidebarScope of(BuildContext context) {
    final result = maybeOf(context);
    assert(result != null, 'No ShadSidebar found in context');
    return result!;
  }
}

/// A widget that holds the configuration and content for a sidebar.
///
/// Typically used in conjunction with [ShadSidebarScaffold].
class ShadSidebar extends StatefulWidget {
  const ShadSidebar.variant({
    super.key,
    this.controller,
    this.header,
    this.content,
    this.footer,
    this.backgroundColor,
    this.borderColor,
    this.animationDuration,
    this.animationCurve,
    this.collapseMode,
    this.collapsedToIconsWidth,
    this.extendedWidth,
    this.mobileWidth,
    this.mobileBreakPoint,
    this.keyboardShortcut,
    this.initiallyExtended,
    this.side,
    this.triggerWithRail = true,
    this.showRail = false,
    required this.variant,
  });

  /// Creates a sidebar with the `ShadSidebarVariant.normal` variant.
  const ShadSidebar.normal({
    super.key,
    this.controller,
    this.header,
    this.content,
    this.footer,
    this.backgroundColor,
    this.borderColor,
    this.animationDuration,
    this.animationCurve,
    this.collapseMode,
    this.collapsedToIconsWidth,
    this.extendedWidth,
    this.mobileWidth,
    this.mobileBreakPoint,
    this.keyboardShortcut,
    this.initiallyExtended,
    this.side,
    this.showRail = true,
    this.triggerWithRail = true,
  }) : variant = ShadSidebarVariant.normal;

  /// Creates a sidebar with the `ShadSidebarVariant.floating` variant.
  const ShadSidebar.floating({
    super.key,
    this.controller,
    this.header,
    this.content,
    this.footer,
    this.backgroundColor,
    this.borderColor,
    this.animationDuration,
    this.animationCurve,
    this.collapseMode,
    this.collapsedToIconsWidth,
    this.extendedWidth,
    this.mobileWidth,
    this.mobileBreakPoint,
    this.keyboardShortcut,
    this.initiallyExtended,
    this.side,
    this.triggerWithRail = true,
    this.showRail = false,
  }) : variant = ShadSidebarVariant.floating;

  /// Creates a sidebar with the `ShadSidebarVariant.inset` variant.
  const ShadSidebar.inset({
    super.key,
    this.controller,
    this.header,
    this.content,
    this.footer,
    this.backgroundColor,
    this.borderColor,
    this.animationDuration,
    this.animationCurve,
    this.collapseMode,
    this.collapsedToIconsWidth,
    this.extendedWidth,
    this.mobileWidth,
    this.mobileBreakPoint,
    this.keyboardShortcut,
    this.initiallyExtended,
    this.side,
    this.triggerWithRail = true,
    this.showRail = false,
  }) : variant = ShadSidebarVariant.inset;

  final ShadSidebarController? controller;

  /// {@template ShadSidebar.header}
  /// The header of the sidebar.
  /// {@endtemplate}
  final ShadSidebarHeader? header;

  /// {@template ShadSidebar.content}
  /// The main content of the sidebar.
  /// {@endtemplate}
  final ShadSidebarContent? content;

  /// {@template ShadSidebar.footer}
  /// The footer of the sidebar.
  /// {@endtemplate}
  final ShadSidebarFooter? footer;

  /// The background color of the sidebar.
  final Color? backgroundColor;

  /// {@template ShadSidebar.borderColor}
  /// The color of the sidebar border.
  ///
  /// Defaults to `ShadTheme.colorScheme.sidebarBorder`.
  /// {@endtemplate}
  final Color? borderColor;

  /// {@template ShadSidebar.initiallyExtended}
  /// Whether the sidebar is initially extended. Defaults to `true`.
  /// {@endtemplate}
  final bool? initiallyExtended;

  /// {@template ShadSidebar.animationDuration}
  /// The duration of the animation when the sidebar is extended or collapsed.
  ///
  /// Defaults to `Duration(milliseconds: 200)`.
  /// {@endtemplate}
  final Duration? animationDuration;

  /// {@template ShadSidebar.animationCurve}
  /// The curve of the animation when the sidebar is extended or collapsed.
  ///
  /// Defaults to `Curves.linear`.
  /// {@endtemplate}
  final Curve? animationCurve;

  /// {@template ShadSidebar.collapsedToIconsWidth}
  /// The width of the sidebar when it [collapseMode] is
  ///  set to [ShadSidebarCollapseMode.icons].
  ///
  /// Defaults to `48`.
  /// {@endtemplate}
  final double? collapsedToIconsWidth;

  /// {@template ShadSidebar.extendedWidth}
  /// The minimum width of the sidebar when it is extended.
  ///
  /// Defaults to `256`.
  /// {@endtemplate}
  final double? extendedWidth;

  /// {@template ShadSidebar.mobileWidth}
  /// The minimum width of the sidebar when it is extended on mobile.
  ///
  /// Defaults to `288`.
  /// {@endtemplate}
  final double? mobileWidth;

  /// {@template ShadSidebar.collapseMode}
  /// The collapse mode of the sidebar.
  ///
  /// Defaults to [ShadSidebarCollapseMode.offScreen].
  /// {@endtemplate}
  final ShadSidebarCollapseMode? collapseMode;

  /// {@template ShadSidebar.variant}
  ///
  /// Defaults to [ShadSidebarVariant.normal].
  /// {@endtemplate}
  final ShadSidebarVariant variant;

  /// {@template ShadSidebar.mobileBreakPoint}
  /// The breakpoint at which....
  ///
  /// Defaults to `768`px.
  /// {@endtemplate}
  final double? mobileBreakPoint;

  /// {@template ShadSidebar.keyboardShortcut}
  /// The keyboard shortcut that will toggle the sidebar.
  ///
  /// Defaults to `CTRL+b` on Windows and Linux, and `CMD+b` on macOS.
  ///
  /// example: -
  /// ```dart
  ///   keyboardShortcut: SingleActivator(LogicalKeyboardKey.keyB),
  /// ```
  /// {@endtemplate}
  final ShortcutActivator? keyboardShortcut;

  final ShadSidebarSide? side;

  /// {@template ShadSidebar.showRail}
  /// Whether to show the rail.
  ///
  /// Defaults to `true`.
  /// {@endtemplate}
  final bool showRail;

  final bool triggerWithRail;

  static ShadSidebarState of(BuildContext context) {
    return ShadSidebarScope.of(context).state;
  }

  static ShadSidebarState? maybeOf(BuildContext context) {
    return ShadSidebarScope.maybeOf(context)?.state;
  }

  @override
  State<ShadSidebar> createState() => ShadSidebarState();
}

class ShadSidebarState extends State<ShadSidebar>
    with TickerProviderStateMixin {
  ShadSidebarController? _internalController;
  ShadSidebarController? _effectiveController;

  late final AnimationController _animationController;

  Animation<double> get animation => _animationController;

  late ShadSidebarSide side;
  late bool isPhysicalLeft;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: widget.animationDuration ?? const Duration(milliseconds: 200),
    );
    _setEffectiveController(widget.controller);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final scaffoldInfo = ShadSidebarScaffoldInheritedWidget.of(context);

    final newController = _resolveController(scaffoldInfo);

    if (newController != _effectiveController) {
      _setEffectiveController(newController);
    }

    _animationController.duration = animationDuration;

    if (widget.side != null) {
      side = widget.side!;
    } else if (scaffoldInfo != null) {
      side = scaffoldInfo.side;
    } else {
      side = ShadSidebarSide.start;
    }
    final isRtl = Directionality.of(context) == TextDirection.rtl;
    isPhysicalLeft = side.isStart ? !isRtl : isRtl;
  }

  void _setEffectiveController(ShadSidebarController? controller) {
    _effectiveController?.removeListener(_handleControllerChanged);
    _effectiveController?.detach(this);

    _effectiveController = controller;
    _effectiveController?.attach(this);
    _effectiveController?.addListener(_handleControllerChanged);

    if (_effectiveController != null) {
      _animationController.value = _effectiveController!.extended ? 1 : 0;
    }
  }

  ShadSidebarController _resolveController(
    ShadSidebarScaffoldInheritedWidget? scaffoldInfo,
  ) {
    // Priority: Scaffold -> Widget -> Internal
    final scaffoldController = scaffoldInfo?.controller;
    if (scaffoldController != null) return scaffoldController;
    if (widget.controller != null) return widget.controller!;
    _internalController ??= ShadSidebarController(
      initiallyExtended: widget.initiallyExtended ?? true,
    );
    return _internalController!;
  }

  @override
  void didUpdateWidget(ShadSidebar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller) {
      didChangeDependencies();
    }
  }

  @override
  void dispose() {
    _effectiveController?.removeListener(_handleControllerChanged);
    _effectiveController?.detach(this);
    _internalController?.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _handleControllerChanged() {
    if (_effectiveController?.extended ?? false) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    if (_effectiveController?.isMobile ?? false) {
      if (_effectiveController?.extendedMobile ?? false) {
        _openMobile();
      } else {
        _closeMobile();
      }
    }
    setState(() {});
  }

  void _openMobile() {
    final theme = ShadTheme.of(context);
    final sidebarTheme = theme.sidebarTheme;
    final effectiveBorderColor = widget.borderColor ?? theme.colorScheme.border;
    final animateInEffect = SlideEffect(
      begin: isPhysicalLeft ? const Offset(-1, 0) : const Offset(1, 0),
      end: Offset.zero,
      curve: Curves.easeInOut,
      duration: const Duration(milliseconds: 500),
    );
    final animateOutEffect = SlideEffect(
      begin: Offset.zero,
      end: isPhysicalLeft ? const Offset(-1, 0) : const Offset(1, 0),
      curve: Curves.easeInOut,
      duration: const Duration(milliseconds: 300),
    );

    showShadSheet<void>(
      context: context,
      side: isPhysicalLeft ? ShadSheetSide.left : ShadSheetSide.right,
      animateIn: [animateInEffect],
      animateOut: [animateOutEffect],
      builder: (context) {
        return ShadSheet(
          constraints: BoxConstraints(
            maxWidth: widget.mobileWidth ?? sidebarTheme.mobileWidth ?? 288,
          ),
          padding: const EdgeInsetsDirectional.only(end: 1),
          closeIcon: const SizedBox.shrink(),
          scrollable: false,
          radius: BorderRadius.circular(0),
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: BorderDirectional(
                end: BorderSide(color: effectiveBorderColor),
              ),
            ),
            child: ShadSidebarScope(
              state: this,
              collapseMode: collapseMode,
              extended: extended,
              isMobile: isMobile,
              child: _SidebarLayout(
                header: widget.header,
                content: widget.content,
                footer: widget.footer,
                backgroundColor: widget.backgroundColor,
                borderColor: widget.borderColor,
                variant: widget.variant,
              ),
            ),
          ),
        );
      },
    ).then((_) {
      _effectiveController?.closeMobile();
    });
  }

  void _closeMobile() {
    if (_effectiveController != null) {
      if (!_effectiveController!.extendedMobile) return;
      Navigator.maybePop(context);
    }
  }

  void toggle() => _effectiveController?.toggle();

  bool get extended => _effectiveController?.extended ?? false;

  bool get isMobile => _effectiveController?.isMobile ?? false;

  bool get collapsedToIcons => !isMobile && !extended && collapseMode.isIcons;

  ShadSidebarCollapseMode get collapseMode {
    final sidebarTheme = ShadTheme.of(context).sidebarTheme;
    return widget.collapseMode ??
        sidebarTheme.collapseMode ??
        ShadSidebarCollapseMode.offScreen;
  }

  double get extendedWidth {
    final sidebarTheme = ShadTheme.of(context).sidebarTheme;
    return widget.extendedWidth ?? sidebarTheme.extendedWidth ?? 256.0;
  }

  double get collapsedToIconsWidth {
    final sidebarTheme = ShadTheme.of(context).sidebarTheme;
    return widget.collapsedToIconsWidth ??
        sidebarTheme.collapsedToIconsWidth ??
        48.0;
  }

  ShadSidebarVariant get variant => widget.variant;

  Curve get animationCurve {
    final sidebarTheme = ShadTheme.of(context).sidebarTheme;
    return widget.animationCurve ??
        sidebarTheme.animationCurve ??
        Curves.linear;
  }

  Duration get animationDuration {
    final sidebarTheme = ShadTheme.of(context).sidebarTheme;
    return widget.animationDuration ??
        sidebarTheme.animationDuration ??
        const Duration(milliseconds: 200);
  }

  @override
  Widget build(BuildContext context) {
    return ShadSidebarScope(
      state: this,
      collapseMode: collapseMode,
      extended: extended,
      isMobile: isMobile,
      child: _SidebarAnimator(
        state: this,
        child: _SidebarLayout(
          header: widget.header,
          content: widget.content,
          footer: widget.footer,
          backgroundColor: widget.backgroundColor,
          borderColor: widget.borderColor,
          variant: widget.variant,
        ),
      ),
    );
  }
}

class _SidebarAnimator extends StatelessWidget {
  const _SidebarAnimator({
    required this.state,
    required this.child,
  });

  final ShadSidebarState state;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (state.isMobile) {
      return const SizedBox.shrink();
    }
    return switch (state.collapseMode) {
      ShadSidebarCollapseMode.icons => AnimatedBuilder(
        animation: state.animation,
        builder: (context, child) {
          return SizedBox(
            width: lerpDouble(
              state.collapsedToIconsWidth,
              state.extendedWidth,
              state.animation.value,
            ),
            child: child,
          );
        },
        child: child,
      ),
      ShadSidebarCollapseMode.offScreen => SlideTransition(
        position:
            Tween<Offset>(
              begin: state.isPhysicalLeft
                  ? const Offset(-1, 0)
                  : const Offset(1, 0),
              end: Offset.zero,
            ).animate(
              CurvedAnimation(
                parent: state.animation,
                curve: state.animationCurve,
              ),
            ),
        child: SizedBox(width: state.extendedWidth, child: child),
      ),
      ShadSidebarCollapseMode.none => SizedBox(
        width: state.extendedWidth,
        child: child,
      ),
    };
  }
}

class _SidebarLayout extends StatelessWidget {
  const _SidebarLayout({
    this.header,
    this.content,
    this.footer,
    this.backgroundColor,
    this.borderColor,
    required this.variant,
  });

  final ShadSidebarHeader? header;
  final ShadSidebarContent? content;
  final ShadSidebarFooter? footer;
  final Color? backgroundColor;
  final Color? borderColor;
  final ShadSidebarVariant variant;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final state = ShadSidebar.of(context);

    final effectiveBackgroundColor =
        backgroundColor ?? theme.colorScheme.sidebar;

    final sidebarContent = ColoredBox(
      color: effectiveBackgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (header != null) header!,
          Expanded(child: content ?? const SizedBox.shrink()),
          if (footer != null) footer!,
        ],
      ),
    );

    if (state.isMobile) {
      return sidebarContent;
    }

    var widget = variant.isFloating
        ? _buildFloatingVariant(context, sidebarContent)
        : sidebarContent;

    if (state.widget.showRail) {
      widget = _buildWithRail(context, widget);
    }
    return widget;
  }

  Widget _buildWithRail(
    BuildContext context,
    Widget sidebar,
  ) {
    final theme = ShadTheme.of(context);

    final effectiveBorderColor = borderColor ?? theme.colorScheme.border;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            sidebar,
            _Rail(
              width: constraints.maxWidth,
              borderColor: effectiveBorderColor,
            ),
          ],
        );
      },
    );
  }

  Widget _buildFloatingVariant(
    BuildContext context,
    Widget sidebar,
  ) {
    final theme = ShadTheme.of(context);

    final effectiveBorderColor = borderColor ?? theme.colorScheme.border;

    return Container(
      margin: const EdgeInsets.all(8),
      child: ShadDecorator(
        decoration: ShadDecoration(
          border: ShadBorder.all(
            radius: theme.radius,
            width: 1,
            color: effectiveBorderColor,
          ),
          shadows: ShadShadows.sm,
        ),
        child: ClipRRect(
          borderRadius: theme.radius,
          child: sidebar,
        ),
      ),
    );
  }
}

class _Rail extends StatefulWidget {
  const _Rail({
    required this.width,
    required this.borderColor,
  });

  final double width;
  final Color borderColor;

  @override
  State<_Rail> createState() => _RailState();
}

class _RailState extends State<_Rail> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final state = ShadSidebar.of(context);
    Widget rail = Align(
      alignment: AlignmentDirectional.centerEnd,
      child: ShadSeparator.vertical(
        margin: EdgeInsetsGeometry.zero,
        thickness: _isHovered ? 2 : 0,
        color: widget.borderColor,
      ),
    );
    if (state.widget.triggerWithRail && !state.collapseMode.isNone) {
      rail = ShadGestureDetector(
        behavior: HitTestBehavior.opaque,
        cursor: SystemMouseCursors.resizeColumn,
        onHoverChange: (value) => setState(() => _isHovered = value),
        onTap: () {
          ShadSidebar.of(context).toggle();
        },
        child: rail,
      );
    }
    return Positioned(
      top: 0,
      bottom: 0,
      left: state.isPhysicalLeft ? (widget.width - 17) : null,
      right: state.isPhysicalLeft ? null : (widget.width - 17),
      width: 16,
      child: rail,
    );
  }
}

/// The header of the sidebar.
class ShadSidebarHeader extends _WidgetListTemplate {
  const ShadSidebarHeader({
    super.key,
    super.padding = const EdgeInsets.all(8),
    super.children,
    super.spacing,
    super.axis,
    super.mainAxisAlignment,
    super.crossAxisAlignment = CrossAxisAlignment.stretch,
  }) : super(scrollable: false);
}

/// The content of the sidebar.
///
/// This is the main area of the sidebar and is scrollable by default.
class ShadSidebarContent extends _WidgetListTemplate {
  const ShadSidebarContent({
    super.key,
    super.padding = EdgeInsets.zero,
    super.mainAxisAlignment = MainAxisAlignment.start,
    super.spacing = 8,
    super.scrollable = true,
    super.children,
    super.crossAxisAlignment,
    super.alwaysShowScrollbar,
  });
}

/// The footer of the sidebar.
class ShadSidebarFooter extends _WidgetListTemplate {
  const ShadSidebarFooter({
    super.key,
    super.children,
    super.spacing,
    super.mainAxisAlignment,
    super.axis,
    super.crossAxisAlignment,
    super.padding = const EdgeInsets.all(8),
  }) : super(scrollable: false);
}

class _WidgetListTemplate extends StatefulWidget {
  const _WidgetListTemplate({
    super.key,
    this.axis = Axis.vertical,
    this.padding = EdgeInsets.zero,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.spacing = 0,
    this.scrollable = true,
    this.alwaysShowScrollbar = true,
    this.children = const [],
  });
  final Axis axis;
  final EdgeInsetsGeometry padding;
  final List<Widget> children;
  final bool scrollable;
  final double spacing;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final bool alwaysShowScrollbar;

  @override
  State<_WidgetListTemplate> createState() => _WidgetListTemplateState();
}

class _WidgetListTemplateState extends State<_WidgetListTemplate> {
  // A scroll controller is created to ensure the [Scrollbar] and
  // [CustomScrollView] are always linked, especially on mobile, where the
  // sidebar is rendered in a [ShadSheet] that does not have a default
  // [PrimaryScrollController]. This prevents a "ScrollController not attached"
  // error.
  late final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final content = Flex(
      direction: widget.axis,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: widget.mainAxisAlignment,
      crossAxisAlignment: widget.crossAxisAlignment,
      spacing: widget.spacing,
      children: widget.children,
    );
    if (!widget.scrollable) {
      return Padding(padding: widget.padding, child: content);
    }
    return Scrollbar(
      controller: _scrollController,
      thumbVisibility: widget.alwaysShowScrollbar,
      child: CustomScrollView(
        controller: _scrollController,
        primary: false,
        slivers: [
          SliverPadding(
            padding: widget.padding,
            sliver: SliverFillRemaining(
              hasScrollBody: false,
              child: content,
            ),
          ),
        ],
      ),
    );
  }
}
