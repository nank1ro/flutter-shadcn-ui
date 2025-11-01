import 'dart:ui';

import 'package:flutter/widgets.dart';

import 'package:flutter_animate/flutter_animate.dart';

import 'package:shadcn_ui/src/components/sheet.dart';
import 'package:shadcn_ui/src/components/sidebar/common/enums.dart';
import 'package:shadcn_ui/src/components/sidebar/sidebar.dart';
import 'package:shadcn_ui/src/theme/components/sidebar.dart';
import 'package:shadcn_ui/src/theme/data.dart';
import 'package:shadcn_ui/src/theme/theme.dart';

class SidebarControllerScope extends InheritedWidget {
  const SidebarControllerScope({
    super.key,
    required this.state,
    required this.extended,
    required this.isMobile,
    required this.collapseMode,
    required super.child,
  });

  final ShadSidebarControllerState state;
  final bool extended;
  final bool isMobile;
  final ShadSidebarCollapseMode collapseMode;

  @override
  bool updateShouldNotify(SidebarControllerScope oldWidget) {
    return extended != oldWidget.extended ||
        isMobile != oldWidget.isMobile ||
        collapseMode != oldWidget.collapseMode;
  }
}

class ShadSidebarController extends StatefulWidget {
  const ShadSidebarController({
    super.key,
    required this.sidebar,
    this.onExtendedChange,
    required this.side,
  });

  final ShadSidebar sidebar;
  final ShadSidebarSide side;

  final ValueChanged<bool>? onExtendedChange;

  static ShadSidebarControllerState of(BuildContext context) {
    final result = context
        .dependOnInheritedWidgetOfExactType<SidebarControllerScope>();

    assert(result != null, 'No ShadSidebarController found in context');

    return result!.state;
  }

  static ShadSidebarControllerState? maybeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<SidebarControllerScope>()
        ?.state;
  }

  @override
  State<ShadSidebarController> createState() => ShadSidebarControllerState();
}

class ShadSidebarControllerState extends State<ShadSidebarController>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  bool _extended = false;
  bool _isInitiallyExtendedSet = false;

  // Theme data is cached and update in didChangeDependencies to avoid
  // repeated lookups during the build phase.
  late ShadThemeData _theme;
  late ShadSidebarTheme _sidebarTheme;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _theme = ShadTheme.of(context);
    _sidebarTheme = _theme.sidebarTheme;

    if (!_isInitiallyExtendedSet) {
      _extended = initiallyExtended;
      _animationController.value = _extended ? 1.0 : 0.0;
      _isInitiallyExtendedSet = true;
    }
    _animationController.duration = animationDuration;
  }

  bool _isMobile = false;

  bool _extendedMobile = false;

  bool get extended => _extended;

  bool get isMobile => _isMobile;

  bool get extendedMobile => _extendedMobile;

  bool get collapsedToIcons => !_extended && collapseMode.isIcons;

  AnimationController get animationController => _animationController;

  ShadSidebar get sidebar => widget.sidebar;

  bool get initiallyExtended =>
      sidebar.initiallyExtended ?? _sidebarTheme.initiallyExtended ?? true;

  ShadSidebarCollapseMode get collapseMode =>
      sidebar.collapseMode ??
      _sidebarTheme.collapseMode ??
      ShadSidebarCollapseMode.offScreen;

  double get extendedWidth =>
      sidebar.extendedWidth ?? _sidebarTheme.extendedWidth ?? 256.0;

  double get mobileWidth =>
      sidebar.mobileWidth ?? _sidebarTheme.mobileWidth ?? 288.0;

  double get mobileBreakPoint =>
      sidebar.mobileBreakPoint ?? _sidebarTheme.mobileBreakPoint ?? 768.0;

  double get collapsedToIconsWidth =>
      sidebar.collapsedToIconsWidth ??
      _sidebarTheme.collapsedToIconsWidth ??
      48.0;

  ShadSidebarSide get side => widget.side;

  ShadSidebarVariant get variant => sidebar.variant;

  Duration get animationDuration =>
      sidebar.animationDuration ??
      _sidebarTheme.animationDuration ??
      const Duration(milliseconds: 200);

  Curve get animationCurve =>
      sidebar.animationCurve ?? _sidebarTheme.animationCurve ?? Curves.linear;

  Color get borderColor => sidebar.borderColor ?? _theme.colorScheme.border;

  void extend() {
    if (_extended) return;

    setState(() => _extended = true);
    _animationController.forward();

    widget.onExtendedChange?.call(true);
  }

  void collapse() {
    if (!_extended) return;
    if (collapseMode.isNone) return;

    setState(() => _extended = false);

    _animationController.reverse();

    widget.onExtendedChange?.call(false);
  }

  void toggle(BuildContext context) {
    if (isMobile) {
      _extendedMobile ? _closeMobile(context) : _openMobile(context);
    } else {
      _extended ? collapse() : extend();
    }
  }

  void _openMobile(BuildContext context) {
    if (_extendedMobile) return;
    _extendedMobile = true;

    final animateInEffect = SlideEffect(
      begin: side.isLeft ? const Offset(-1, 0) : const Offset(1, 0),
      end: Offset.zero,
      curve: Curves.easeInOut,
      duration: const Duration(milliseconds: 500),
    );
    final animateOutEffect = SlideEffect(
      begin: Offset.zero,
      end: side.isLeft ? const Offset(-1, 0) : const Offset(1, 0),
      curve: Curves.easeInOut,
      duration: const Duration(milliseconds: 300),
    );

    showShadSheet<void>(
      context: context,
      side: side.isLeft ? ShadSheetSide.left : ShadSheetSide.right,
      animateIn: [animateInEffect],
      animateOut: [animateOutEffect],
      builder: (context) {
        return ShadSheet(
          constraints: BoxConstraints(maxWidth: mobileWidth),
          padding: const EdgeInsetsDirectional.only(end: 1),
          closeIcon: const SizedBox.shrink(),
          scrollable: false,
          radius: BorderRadius.circular(0),
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: BorderDirectional(
                end: BorderSide(color: borderColor),
              ),
            ),
            child: SidebarControllerScope(
              state: this,
              collapseMode: collapseMode,
              extended: extended,
              isMobile: _isMobile,
              child: Builder(
                builder: (context) => sidebar,
              ),
            ),
          ),
        );
      },
    ).then((_) {
      if (_extendedMobile) {
        _extendedMobile = false;
      }
    });
  }

  void _closeMobile(BuildContext context) {
    if (!_extendedMobile) return;
    Navigator.maybePop(context);
    _extendedMobile = false;
  }

  void updateBreakpoint(double width) {
    final newIsMobile = width < mobileBreakPoint;
    if (newIsMobile != _isMobile) {
      setState(() => _isMobile = newIsMobile);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SidebarControllerScope(
      state: this,
      extended: _extended,
      isMobile: _isMobile,
      collapseMode: collapseMode,
      child: _buildByCollapseMode(sidebar),
    );
  }

  Widget _buildByCollapseMode(Widget sidebar) {
    return switch (collapseMode) {
      ShadSidebarCollapseMode.icons => AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          return SizedBox(
            width: lerpDouble(
              collapsedToIconsWidth,
              extendedWidth,
              animationController.value,
            ),
            child: child,
          );
        },
        child: sidebar,
      ),
      ShadSidebarCollapseMode.offScreen => SlideTransition(
        position:
            Tween<Offset>(
              begin: side.isLeft ? const Offset(-1, 0) : const Offset(1, 0),
              end: Offset.zero,
            ).animate(
              CurvedAnimation(
                parent: animationController,
                curve: animationCurve,
              ),
            ),
        child: SizedBox(width: extendedWidth, child: sidebar),
      ),
      ShadSidebarCollapseMode.none => SizedBox(
        width: extendedWidth,
        child: sidebar,
      ),
    };
  }
}
