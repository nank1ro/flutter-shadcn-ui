import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'package:shadcn_ui/src/components/sidebar/sidebar_controller.dart';
import 'package:shadcn_ui/src/components/sidebar/sidebar_scope.dart';
import 'package:shadcn_ui/src/theme/components/sidebar.dart';
import 'package:shadcn_ui/src/theme/data.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/theme/themes/shadows.dart';

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
  });

  final Widget sidebar;
  final Widget child;
  final ShadSidebarController? controller;
  final ShadSidebarSide side;
  final ShadSidebarVariant variant;
  final ShadSidebarCollapsibleMode collapsibleMode;
  final double? breakpoint;
  final double? width;
  final double? collapsedWidth;
  final Duration? animationDuration;
  final Curve? animationCurve;
  final Color? scrimColor;
  final bool? enableShortcut;

  @override
  State<ShadSidebarScaffold> createState() => _ShadSidebarScaffoldState();
}

class _ShadSidebarScaffoldState extends State<ShadSidebarScaffold>
    with SingleTickerProviderStateMixin {
  late ShadSidebarController _controller;
  late AnimationController _animationController;
  late CurvedAnimation _animation;
  bool _ownsController = false;
  bool? _wasMobile;

  @override
  void initState() {
    super.initState();
    _setupController();
    _setupAnimation();
  }

  @override
  void didUpdateWidget(ShadSidebarScaffold oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.controller != oldWidget.controller) {
      _controller.removeListener(_onControllerChanged);
      if (_ownsController) _controller.dispose();
      _setupController();
      _syncAnimationToController();
    }

    if (widget.animationDuration != oldWidget.animationDuration) {
      _animationController.duration =
          widget.animationDuration ?? const Duration(milliseconds: 200);
    }

    if (widget.animationCurve != oldWidget.animationCurve) {
      _animation.dispose();
      _animation = CurvedAnimation(
        parent: _animationController,
        curve: widget.animationCurve ?? Curves.easeInOut,
      );
    }

    if (widget.collapsibleMode != oldWidget.collapsibleMode &&
        widget.collapsibleMode == ShadSidebarCollapsibleMode.none) {
      _animationController.value = 1.0;
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_onControllerChanged);
    if (_ownsController) _controller.dispose();
    _animation.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _setupController() {
    if (widget.controller != null) {
      _controller = widget.controller!;
      _ownsController = false;
    } else {
      _controller = ShadSidebarController();
      _ownsController = true;
    }
    _controller.addListener(_onControllerChanged);
  }

  void _setupAnimation() {
    final duration =
        widget.animationDuration ?? const Duration(milliseconds: 200);
    final curve = widget.animationCurve ?? Curves.easeInOut;

    final initialValue =
        widget.collapsibleMode == ShadSidebarCollapsibleMode.none
        ? 1.0
        : (_controller.isOpen ? 1.0 : 0.0);

    _animationController = AnimationController(
      vsync: this,
      duration: duration,
      value: initialValue,
    );

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: curve,
    );
  }

  void _syncAnimationToController() {
    if (widget.collapsibleMode == ShadSidebarCollapsibleMode.none) {
      _animationController.value = 1.0;
      return;
    }
    if (_controller.isOpen) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  void _onControllerChanged() {
    if (widget.collapsibleMode == ShadSidebarCollapsibleMode.none) return;
    _syncAnimationToController();
    // Rebuild so ShadSidebarScope gets new `isOpen` value.
    // This triggers updateShouldNotify → dependents rebuild.
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final sidebarTheme = theme.sidebarTheme;

    final effectiveBreakpoint =
        widget.breakpoint ?? sidebarTheme.mobileBreakpoint ?? 768.0;
    final effectiveWidth = widget.width ?? sidebarTheme.width ?? 256.0;
    final effectiveCollapsedWidth =
        widget.collapsedWidth ?? sidebarTheme.collapsedWidth ?? 48.0;
    final effectiveDuration =
        widget.animationDuration ??
        sidebarTheme.animationDuration ??
        const Duration(milliseconds: 200);
    final effectiveEnableShortcut = widget.enableShortcut ?? true;

    _animationController.duration = effectiveDuration;

    final screenWidth = MediaQuery.sizeOf(context).width;
    final isMobile = screenWidth < effectiveBreakpoint;

    if (_wasMobile != null && isMobile != _wasMobile) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        if (isMobile) {
          _controller.close();
        } else {
          _controller.open();
        }
      });
    }
    _wasMobile = isMobile;

    Widget result = ShadSidebarScope(
      controller: _controller,
      animation: _animation,
      variant: widget.variant,
      side: widget.side,
      collapsibleMode: widget.collapsibleMode,
      isMobile: isMobile,
      expandedWidth: effectiveWidth,
      collapsedWidth: effectiveCollapsedWidth,
      isOpen: _controller.isOpen,
      child: isMobile
          ? _buildMobileLayout(theme, sidebarTheme, effectiveWidth, context)
          : _buildDesktopLayout(theme, sidebarTheme),
    );

    if (effectiveEnableShortcut) {
      result = _wrapWithShortcut(result);
    }

    return result;
  }

  Widget _wrapWithShortcut(Widget child) {
    return CallbackShortcuts(
      bindings: <ShortcutActivator, VoidCallback>{
        const SingleActivator(LogicalKeyboardKey.keyB, meta: true):
            _controller.toggle,
        const SingleActivator(LogicalKeyboardKey.keyB, control: true):
            _controller.toggle,
      },
      child: Focus(
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
          animation: _animation,
          builder: (context, _) {
            final isVisible = _animation.status != AnimationStatus.dismissed;

            if (!isVisible) return const SizedBox.shrink();

            return Stack(
              children: [
                Positioned.fill(
                  child: GestureDetector(
                    onTap: _controller.close,
                    child: ColoredBox(
                      color: Color.lerp(
                        const Color(0x00000000),
                        effectiveScrimColor,
                        _animation.value,
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
                          ? _animation.value - 1.0
                          : 1.0 - _animation.value,
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
