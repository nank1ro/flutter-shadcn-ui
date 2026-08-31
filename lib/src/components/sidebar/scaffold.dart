import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'package:shadcn_ui/src/components/sidebar/controller.dart';
import 'package:shadcn_ui/src/components/sidebar/scope.dart';
import 'package:shadcn_ui/src/theme/components/sidebar.dart';
import 'package:shadcn_ui/src/theme/data.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/theme/themes/shadows.dart';

/// The root layout widget for a sidebar-based interface.
///
/// Positions a `ShadSidebar` alongside [child] (the main content).

/// Provides [ShadSidebarScope] to all descendants,
///
/// Example:
/// ```dart
/// ShadSidebarScaffold(
///   sidebar: ShadSidebar(
///     header: ShadSidebarHeader(child: Logo()),
///     content: ShadSidebarContent(children: [...]),
///     footer: ShadSidebarFooter(child: UserInfo()),
///   ),
///   child: MainContent(),
/// )
/// ```
class ShadSidebarScaffold extends StatefulWidget {
  const ShadSidebarScaffold({
    super.key,
    required this.sidebar,
    required this.child,
    this.controller,
    this.side = ShadSidebarSide.start,
    this.variant = ShadSidebarVariant.sidebar,
    this.collapsibleMode = ShadSidebarCollapsibleMode.offcanvas,
    this.breakpoint,
    this.width,
    this.collapsedWidth,
    this.animationDuration,
    this.animationCurve,
    this.scrimColor,
    this.enableShortcut,
    this.shortcuts,
  });

  final Widget sidebar;
  final Widget child;
  final ShadSidebarController? controller;
  final ShadSidebarSide side;
  final ShadSidebarVariant variant;
  final ShadSidebarCollapsibleMode collapsibleMode;

  /// {@template ShadSidebarScaffold.breakpoint}
  /// Screen width below which the sidebar switches to mobile (sheet) mode.
  /// Defaults to 768.
  /// {@endtemplate}
  final double? breakpoint;

  /// {@template ShadSidebarScaffold.width}
  /// Width of the sidebar when expanded. Defaults to 256.
  /// {@endtemplate}
  final double? width;

  /// {@template ShadSidebarScaffold.collapsedWidth}
  /// Width of the sidebar when collapsed in icon mode. Defaults to 48.
  /// {@endtemplate}
  final double? collapsedWidth;

  /// {@template ShadSidebarScaffold.animationDuration}
  /// Duration of the expand/collapse animation.
  /// Defaults to `Duration(milliseconds: 200)`.
  /// {@endtemplate}
  final Duration? animationDuration;

  /// {@template ShadSidebarScaffold.animationCurve}
  /// Curve of the expand/collapse animation.
  /// Defaults to `Curves.linear`.
  /// {@endtemplate}
  final Curve? animationCurve;
  final Color? scrimColor;
  final bool? enableShortcut;

  /// Custom shortcut activators for toggling the sidebar.
  /// Defaults to `[Cmd+B, Ctrl+B]`.
  final List<ShortcutActivator>? shortcuts;

  @override
  State<ShadSidebarScaffold> createState() => _ShadSidebarScaffoldState();
}

class _ShadSidebarScaffoldState extends State<ShadSidebarScaffold>
    with SingleTickerProviderStateMixin {
  late ShadSidebarController controller;
  late AnimationController animationController;
  late CurvedAnimation animation;
  bool _ownsController = false;
  bool _initialized = false;
  bool? _wasMobile;

  // ---------------------------------------------------------------------------
  // Lifecycle
  // ---------------------------------------------------------------------------

  @override
  void initState() {
    super.initState();
    _setupController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_initialized) {
      // First call — create animation controllers using theme values.
      _setupAnimation();
      _initialized = true;
    } else {
      // Subsequent calls — theme or MediaQuery changed.
      // Only update duration/curve.
      _updateAnimationFromTheme();
    }
  }

  @override
  void didUpdateWidget(ShadSidebarScaffold oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.controller != oldWidget.controller) {
      controller.removeListener(_onControllerChanged);
      if (_ownsController) controller.dispose();
      _setupController();
      _syncAnimationToController();
    }

    if (widget.animationDuration != oldWidget.animationDuration) {
      _updateAnimationDuration();
    }

    if (widget.animationCurve != oldWidget.animationCurve) {
      _updateAnimationCurve();
    }

    if (widget.collapsibleMode != oldWidget.collapsibleMode &&
        widget.collapsibleMode == ShadSidebarCollapsibleMode.none) {
      controller.open();
      animationController.value = 1.0;
    }
  }

  @override
  void dispose() {
    controller.removeListener(_onControllerChanged);
    if (_ownsController) controller.dispose();
    animation.dispose();
    animationController.dispose();
    super.dispose();
  }

  // ---------------------------------------------------------------------------
  // Setup — runs once
  // ---------------------------------------------------------------------------

  void _setupController() {
    if (widget.controller != null) {
      controller = widget.controller!;
      _ownsController = false;
    } else {
      controller = ShadSidebarController();
      _ownsController = true;
    }
    controller.addListener(_onControllerChanged);
  }

  void _setupAnimation() {
    final effectiveDuration = _resolveAnimationDuration();
    final effectiveCurve = _resolveAnimationCurve();

    final initialValue =
        widget.collapsibleMode == ShadSidebarCollapsibleMode.none
        ? 1.0
        : (controller.isOpen ? 1.0 : 0.0);

    animationController = AnimationController(
      vsync: this,
      duration: effectiveDuration,
      value: initialValue,
    );

    animation = CurvedAnimation(
      parent: animationController,
      curve: effectiveCurve,
    );
  }

  // ---------------------------------------------------------------------------
  // Updates — runs on theme/widget changes without recreating controllers
  // ---------------------------------------------------------------------------

  void _updateAnimationFromTheme() {
    _updateAnimationDuration();
    // Curve only needs updating if widget param is null (theme-driven).
    // If widget param is set, didUpdateWidget handles it.
    if (widget.animationCurve == null) {
      _updateAnimationCurve();
    }
  }

  void _updateAnimationDuration() {
    animationController.duration = _resolveAnimationDuration();
  }

  void _updateAnimationCurve() {
    final effectiveCurve = _resolveAnimationCurve();
    animation.dispose();
    animation = CurvedAnimation(
      parent: animationController,
      curve: effectiveCurve,
    );
  }

  // ---------------------------------------------------------------------------
  // Resolution helpers
  // ---------------------------------------------------------------------------

  Duration _resolveAnimationDuration() {
    final theme = ShadTheme.of(context);
    return widget.animationDuration ??
        theme.sidebarTheme.animationDuration ??
        const Duration(milliseconds: 200);
  }

  Curve _resolveAnimationCurve() {
    final theme = ShadTheme.of(context);
    return widget.animationCurve ??
        theme.sidebarTheme.animationCurve ??
        Curves.linear;
  }

  // ---------------------------------------------------------------------------
  // Sync & events
  // ---------------------------------------------------------------------------

  void _syncAnimationToController() {
    if (widget.collapsibleMode == ShadSidebarCollapsibleMode.none) {
      animationController.value = 1.0;
      return;
    }
    if (controller.isOpen) {
      animationController.forward();
    } else {
      animationController.reverse();
    }
  }

  void _onControllerChanged() {
    if (widget.collapsibleMode == ShadSidebarCollapsibleMode.none) {
      if (!controller.isOpen) {
        controller.open();
      }
      return;
    }
    _syncAnimationToController();
    if (mounted) setState(() {});
  }

  // ---------------------------------------------------------------------------
  // Build
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final sidebarTheme = theme.sidebarTheme;

    final effectiveBreakpoint =
        widget.breakpoint ?? sidebarTheme.mobileBreakpoint ?? 768.0;
    final effectiveWidth = widget.width ?? sidebarTheme.width ?? 256.0;
    final effectiveCollapsedWidth =
        widget.collapsedWidth ?? sidebarTheme.collapsedWidth ?? 48.0;
    final effectiveEnableShortcut = widget.enableShortcut ?? true;

    final screenWidth = MediaQuery.sizeOf(context).width;
    final isMobile = screenWidth < effectiveBreakpoint;

    final effectiveDuration = _resolveAnimationDuration();
    final effectiveCurve = _resolveAnimationCurve();

    if (_wasMobile != null && isMobile != _wasMobile) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        if (isMobile) {
          controller.close();
        } else {
          controller.open();
        }
      });
    }
    _wasMobile = isMobile;

    Widget result = ShadSidebarScope(
      controller: controller,
      animation: animation,
      variant: widget.variant,
      side: widget.side,
      collapsibleMode: widget.collapsibleMode,
      isMobile: isMobile,
      expandedWidth: effectiveWidth,
      collapsedWidth: effectiveCollapsedWidth,
      isOpen: controller.isOpen,
      animationDuration: effectiveDuration,
      animationCurve: effectiveCurve,
      child: widget.collapsibleMode == ShadSidebarCollapsibleMode.none
          ? _buildDesktopLayout(theme, sidebarTheme)
          : isMobile
          ? _buildMobileLayout(theme, sidebarTheme, effectiveWidth, context)
          : _buildDesktopLayout(theme, sidebarTheme),
    );

    if (effectiveEnableShortcut) {
      result = _wrapWithShortcut(result);
    }

    return result;
  }

  // ---------------------------------------------------------------------------
  // Keyboard shortcut
  // ---------------------------------------------------------------------------

  static const _defaultShortcuts = <ShortcutActivator>[
    SingleActivator(LogicalKeyboardKey.keyB, meta: true),
    SingleActivator(LogicalKeyboardKey.keyB, control: true),
  ];

  Widget _wrapWithShortcut(Widget child) {
    final activators = widget.shortcuts ?? _defaultShortcuts;

    return Shortcuts(
      shortcuts: {
        for (final activator in activators)
          activator: const _ToggleSidebarIntent(),
      },
      child: Actions(
        actions: <Type, Action<Intent>>{
          _ToggleSidebarIntent: CallbackAction<_ToggleSidebarIntent>(
            onInvoke: (_) {
              if (widget.collapsibleMode != ShadSidebarCollapsibleMode.none) {
                controller.toggle();
              }
              return null;
            },
          ),
        },
        child: child,
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Desktop layout
  // ---------------------------------------------------------------------------

  Widget _buildDesktopLayout(
    ShadThemeData theme,
    ShadSidebarTheme sidebarTheme,
  ) {
    if (widget.variant == ShadSidebarVariant.inset) {
      return _buildInsetDesktopLayout(theme, sidebarTheme);
    }

    final children = widget.side == ShadSidebarSide.start
        ? [widget.sidebar, Expanded(child: widget.child)]
        : [Expanded(child: widget.child), widget.sidebar];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: children,
    );
  }

  Widget _buildInsetDesktopLayout(
    ShadThemeData theme,
    ShadSidebarTheme sidebarTheme,
  ) {
    final colorScheme = theme.colorScheme;

    final sidebarBgColor =
        sidebarTheme.backgroundColor ??
        colorScheme.sidebarBackground ??
        colorScheme.card;

    final bodyBgColor = colorScheme.background;

    final bodyWrapper = Expanded(
      child: Container(
        margin: const EdgeInsets.all(8),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: bodyBgColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: ShadShadows.sm,
        ),
        child: widget.child,
      ),
    );

    final children = widget.side == ShadSidebarSide.start
        ? <Widget>[widget.sidebar, bodyWrapper]
        : <Widget>[bodyWrapper, widget.sidebar];

    return ColoredBox(
      color: sidebarBgColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Mobile layout
  // ---------------------------------------------------------------------------

  Widget _buildMobileLayout(
    ShadThemeData theme,
    ShadSidebarTheme sidebarTheme,
    double sidebarWidth,
    BuildContext context,
  ) {
    final physicallyLeft = ShadSidebarScope.isPhysicallyLeft(
      context,
      widget.side,
    );

    final effectiveScrimColor = widget.scrimColor ?? const Color(0x66000000);

    return Stack(
      children: [
        Positioned.fill(child: widget.child),
        AnimatedBuilder(
          animation: animation,
          builder: (context, _) {
            final isVisible = animation.status != AnimationStatus.dismissed;

            if (!isVisible) return const SizedBox.shrink();

            return Stack(
              children: [
                Positioned.fill(
                  child: GestureDetector(
                    onTap: controller.close,
                    child: ColoredBox(
                      color: Color.lerp(
                        const Color(0x00000000),
                        effectiveScrimColor,
                        animation.value,
                      )!,
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: physicallyLeft ? 0 : null,
                  right: physicallyLeft ? null : 0,
                  width: sidebarWidth,
                  child: FractionalTranslation(
                    translation: Offset(
                      physicallyLeft
                          ? animation.value - 1.0
                          : 1.0 - animation.value,
                      0,
                    ),
                    child: widget.sidebar,
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

class _ToggleSidebarIntent extends Intent {
  const _ToggleSidebarIntent();
}
