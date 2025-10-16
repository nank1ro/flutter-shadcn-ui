import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// A scaffold that arranges a sidebar, an end sidebar, and a body.
///
/// This widget is the main container for a layout that includes one or two
/// sidebars. It  provides methods to interact with them through
/// `ShadSidebarScaffold.of(context)`.
class ShadSidebarScaffold extends StatefulWidget {
  const ShadSidebarScaffold({
    super.key,
    this.bodyBackgroundColor,
    this.onSidebarChange,
    this.onEndSidebarChange,
    this.sidebar,
    this.endSidebar,
    required this.body,
  });

  /// A callback that is called when the sidebar's extended state changes.
  final ValueChanged<bool>? onSidebarChange;

  /// A callback that is called when the end sidebar's extended state changes.
  final ValueChanged<bool>? onEndSidebarChange;

  /// The main content of the scaffold.
  final Widget body;

  /// The sidebar to display on the start side of the screen.
  final ShadSidebar? sidebar;

  /// The sidebar to display on the end side of the screen.
  final ShadSidebar? endSidebar;

  /// {@template ShadSidebarScaffold.backgroundColor}
  /// The background color of the [body].
  ///
  /// It defaults to [ShadColorScheme.background].
  /// {@endtemplate}
  final Color? bodyBackgroundColor;

  static ShadSidebarScaffoldState of(BuildContext context) {
    final result = context.findAncestorStateOfType<ShadSidebarScaffoldState>();
    if (result != null) {
      return result;
    }
    throw FlutterError.fromParts(<DiagnosticsNode>[
      ErrorSummary(
        'ShadSidebarScaffold.of() called with a context that does not contain '
        'a ShadSidebarScaffold.',
      ),
      ErrorDescription(
        'No ShadSidebarScaffold ancestor could be found starting from the '
        'context that was passed to ShadSidebarScaffold.of(). This usually '
        'happens when the context provided is from the same StatefulWidget as '
        'that whose build function actually creates the ShadSidebarScaffold.',
      ),
      ErrorHint(
        'There are several ways to avoid this problem. The simplest is to use '
        'a Builder to get a context that is "under" the ShadSidebarScaffold.',
      ),
      context.describeElement('The context used was'),
    ]);
  }

  static ShadSidebarScaffoldState? maybeOf(BuildContext context) {
    return context.findAncestorStateOfType<ShadSidebarScaffoldState>();
  }

  @override
  State<ShadSidebarScaffold> createState() => ShadSidebarScaffoldState();
}

class ShadSidebarScaffoldState extends State<ShadSidebarScaffold>
    with TickerProviderStateMixin {
  final _sidebarKey = GlobalKey<ShadSidebarControllerState>();
  final _endSidebarKey = GlobalKey<ShadSidebarControllerState>();
  ShadSidebarController? _sidebarController;
  ShadSidebarController? _endSidebarController;
  double? _lastMaxWidth;
  TextDirection? _direction;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final direction = Directionality.of(context);
    if (direction != _direction) {
      _direction = direction;
      _initSidebarController();
      _initEndSidebarController();
    }
  }

  @override
  void didUpdateWidget(ShadSidebarScaffold oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.sidebar != oldWidget.sidebar) {
      _initSidebarController();
    }
    if (widget.endSidebar != oldWidget.endSidebar) {
      _initEndSidebarController();
    }
  }

  void _initSidebarController() {
    if (widget.sidebar != null) {
      final isRtl = _direction == TextDirection.rtl;
      _sidebarController = ShadSidebarController(
        key: _sidebarKey,
        onExtendedChange: widget.onSidebarChange,
        sidebar: widget.sidebar!,
        side: isRtl ? ShadSidebarSide.right : ShadSidebarSide.left,
      );
    } else {
      _sidebarController = null;
    }
    // Rebuild after the first frame to make `_sidebarKey.currentState`
    // available for the body padding calculation.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) setState(() {});
    });
  }

  void _initEndSidebarController() {
    if (widget.endSidebar != null) {
      final isRtl = _direction == TextDirection.rtl;
      _endSidebarController = ShadSidebarController(
        key: _endSidebarKey,
        onExtendedChange: widget.onEndSidebarChange,
        sidebar: widget.endSidebar!,
        side: isRtl ? ShadSidebarSide.left : ShadSidebarSide.right,
      );
    } else {
      _endSidebarController = null;
    }
    // Rebuild after the first frame to make `_endSidebarKey.currentState`
    // available for the body padding calculation.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) setState(() {});
    });
  }

  /// Extends the sidebar.
  void toggleSidebar() => _sidebarKey.currentState?.toggle(context);

  /// Extends the end sidebar.
  void toggleEndSidebar() => _endSidebarKey.currentState?.toggle(context);

  /// Returns whether the sidebar is currently extended.
  bool isSidebarExtended() => _sidebarKey.currentState?.extended ?? false;

  /// Returns whether the end sidebar is currently extended.
  bool isEndSidebarExtended() => _endSidebarKey.currentState?.extended ?? false;

  @override
  Widget build(BuildContext context) {
    final isRtl = Directionality.of(context) == TextDirection.rtl;
    final theme = ShadTheme.of(context);
    final colorScheme = theme.colorScheme;

    final effectiveBodyColor = widget.bodyBackgroundColor ??
        theme.sidebarScaffoldTheme.bodyBackgroundColor ??
        theme.colorScheme.background;

    final animation = Listenable.merge([
      if (_sidebarKey.currentState != null)
        _sidebarKey.currentState!.animationController,
      if (_endSidebarKey.currentState != null)
        _endSidebarKey.currentState!.animationController,
    ]);
    return LayoutBuilder(
      builder: (context, constraints) {
        if (_lastMaxWidth != constraints.maxWidth) {
          _updateMobileBreakpoints(constraints);
        }

        final isMobile = (_sidebarKey.currentState?.isMobile ?? false) ||
            (_endSidebarKey.currentState?.isMobile ?? false);

        final isInsetLayout = !isMobile &&
            (_sidebarKey.currentState?.variant == ShadSidebarVariant.inset ||
                _endSidebarKey.currentState?.variant ==
                    ShadSidebarVariant.inset);

        return ColoredBox(
          color: (isInsetLayout ? colorScheme.sidebar : effectiveBodyColor),
          child: Stack(
            children: [
              if (_sidebarController != null)
                Positioned(
                  left: isRtl ? null : 0,
                  right: isRtl ? 0 : null,
                  top: 0,
                  bottom: 0,
                  child: Offstage(
                    offstage: _sidebarKey.currentState?.isMobile ?? false,
                    child: _sidebarController,
                  ),
                ),
              if (_endSidebarController != null)
                Positioned(
                  left: isRtl ? 0 : null,
                  right: isRtl ? null : 0,
                  top: 0,
                  bottom: 0,
                  child: Offstage(
                    offstage: _endSidebarKey.currentState?.isMobile ?? false,
                    child: _endSidebarController,
                  ),
                ),
              AnimatedBuilder(
                animation: animation,
                builder: (context, child) {
                  return Padding(
                    padding: EdgeInsets.only(
                      left: isRtl ? _rightBodyPadding : _leftBodyPadding,
                      right: isRtl ? _leftBodyPadding : _rightBodyPadding,
                    ),
                    child: child,
                  );
                },
                child: isInsetLayout
                    ? _insetBodyWrapper(widget.body, effectiveBodyColor)
                    : widget.body,
              ),
            ],
          ),
        );
      },
    );
  }

  void _updateMobileBreakpoints(BoxConstraints constraints) {
    // Defer the update to avoid calling setState during build.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _sidebarKey.currentState?.updateBreakpoint(constraints.maxWidth);
        _endSidebarKey.currentState?.updateBreakpoint(constraints.maxWidth);
        setState(() => _lastMaxWidth = constraints.maxWidth);
      }
    });
  }

  double _collapsedWidth(ShadSidebarControllerState state) {
    switch (state.collapseMode) {
      case ShadSidebarCollapseMode.icons:
        return state.collapsedToIconsWidth;
      case ShadSidebarCollapseMode.offScreen:
        return 0;
      case ShadSidebarCollapseMode.none:
        return state.extendedWidth;
    }
  }

  double get _leftBodyPadding {
    final state = _sidebarKey.currentState;
    if (state == null || state.isMobile) {
      return 0;
    }
    return lerpDouble(
          _collapsedWidth(state),
          state.extendedWidth,
          state.animationController.value,
        ) ??
        0;
  }

  double get _rightBodyPadding {
    final state = _endSidebarKey.currentState;
    if (state == null || state.isMobile) {
      return 0;
    }

    return lerpDouble(
          _collapsedWidth(state),
          state.extendedWidth,
          state.animationController.value,
        ) ??
        0;
  }

  Widget _insetBodyWrapper(Widget body, Color bodyBackgroundColor) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        boxShadow: ShadShadows.sm,
        borderRadius: BorderRadius.circular(12),
        color: bodyBackgroundColor,
      ),
      child: body,
    );
  }
}
