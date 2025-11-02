import 'dart:ui';

import 'package:flutter/widgets.dart';

import 'package:shadcn_ui/src/components/sidebar/common/enums.dart';
import 'package:shadcn_ui/src/components/sidebar/sidebar.dart';
import 'package:shadcn_ui/src/components/sidebar/sidebar_controller.dart';
import 'package:shadcn_ui/src/theme/color_scheme/base.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/theme/themes/shadows.dart';

class ShadSidebarScaffoldInheritedWidget extends InheritedWidget {
  const ShadSidebarScaffoldInheritedWidget({
    super.key,
    required this.side,
    required this.controller,
    required super.child,
  });

  final ShadSidebarSide side;
  final ShadSidebarController? controller;

  @override
  bool updateShouldNotify(ShadSidebarScaffoldInheritedWidget oldWidget) {
    return (side != oldWidget.side) || (controller != oldWidget.controller);
  }

  static ShadSidebarScaffoldInheritedWidget? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<
          ShadSidebarScaffoldInheritedWidget
        >();
  }
}

/// A scaffold that arranges a sidebar, an end sidebar, and a body.
///
/// This widget is the main container for a layout that includes one or two
/// sidebars. It  provides methods to interact with them through
/// `ShadSidebarScaffold.of(context)`.
class ShadSidebarScaffold extends StatefulWidget {
  const ShadSidebarScaffold({
    super.key,
    this.bodyBackgroundColor,
    this.sidebar,
    this.endSidebar,
    this.sidebarController,
    this.endSidebarController,
    required this.body,
  });

  /// The main content of the scaffold.
  final Widget body;

  /// The sidebar to display on the start side of the screen.
  final ShadSidebar? sidebar;

  // TODO(dmouayad): consider removing this if not needed
  /// The sidebar controller to control the sidebar.
  final ShadSidebarController? sidebarController;

  /// The sidebar to display on the end side of the screen.
  final ShadSidebar? endSidebar;

  // TODO(dmouayad): consider removing this if not needed
  /// The sidebar controller to control the sidebar.
  final ShadSidebarController? endSidebarController;

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
  double? _lastMaxWidth;

  ShadSidebarController? _sidebarController;
  ShadSidebarController? _endSidebarController;

  ShadSidebarController? get _effectiveSidebarController =>
      widget.sidebarController ?? _sidebarController;

  ShadSidebarController? get _effectiveEndSidebarController =>
      widget.endSidebarController ?? _endSidebarController;

  @override
  void initState() {
    super.initState();

    if (widget.sidebar != null && widget.sidebarController == null) {
      _sidebarController = ShadSidebarController();
    }
    if (widget.endSidebar != null && widget.endSidebarController == null) {
      _endSidebarController = ShadSidebarController();
    }
    _effectiveSidebarController?.addListener(_rebuild);
    _effectiveEndSidebarController?.addListener(_rebuild);
  }

  @override
  void didUpdateWidget(ShadSidebarScaffold oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.sidebarController != oldWidget.sidebarController) {
      _effectiveSidebarController?.removeListener(_rebuild);
      _sidebarController?.dispose();
      _sidebarController = null;

      if (widget.sidebar != null && widget.sidebarController == null) {
        _sidebarController = ShadSidebarController();
      }

      _effectiveSidebarController?.addListener(_rebuild);
    }

    if (widget.endSidebarController != oldWidget.endSidebarController) {
      _effectiveEndSidebarController?.removeListener(_rebuild);
      _endSidebarController?.dispose();
      _endSidebarController = null;

      if (widget.endSidebar != null && widget.endSidebarController == null) {
        _endSidebarController = ShadSidebarController();
      }

      _effectiveEndSidebarController?.addListener(_rebuild);
    }
  }

  @override
  void dispose() {
    _effectiveSidebarController?.removeListener(_rebuild);
    _effectiveEndSidebarController?.removeListener(_rebuild);
    _sidebarController?.dispose();
    _endSidebarController?.dispose();

    super.dispose();
  }

  void _rebuild() => setState(() {});

  void toggleSidebar() => _effectiveSidebarController?.toggle();
  void extendSidebar() => _effectiveSidebarController?.extend();
  void collapseSidebar() => _effectiveSidebarController?.collapse();

  void toggleEndSidebar() => _effectiveEndSidebarController?.toggle();
  void extendEndSidebar() => _effectiveEndSidebarController?.extend();
  void collapseEndSidebar() => _effectiveEndSidebarController?.collapse();

  /// Returns whether the sidebar is currently extended.
  bool isSidebarExtended() => _effectiveSidebarController?.extended ?? false;

  /// Returns whether the end sidebar is currently extended.
  bool isEndSidebarExtended() =>
      _effectiveEndSidebarController?.extended ?? false;

  ShadSidebarState? get _sidebarState => _effectiveSidebarController?.state;

  ShadSidebarState? get _endSidebarState =>
      _effectiveEndSidebarController?.state;

  @override
  Widget build(BuildContext context) {
    final isRtl = Directionality.of(context) == TextDirection.rtl;
    final theme = ShadTheme.of(context);
    final colorScheme = theme.colorScheme;

    final effectiveBodyColor =
        widget.bodyBackgroundColor ??
        theme.sidebarScaffoldTheme.bodyBackgroundColor ??
        theme.colorScheme.background;

    final animation = Listenable.merge([
      if (_sidebarState != null) _sidebarState!.animation,

      if (_endSidebarState != null) _endSidebarState!.animation,
    ]);

    return LayoutBuilder(
      builder: (context, constraints) {
        if (_lastMaxWidth != constraints.maxWidth) {
          _updateIsMobile(constraints);
        }

        final isMobile =
            (_sidebarState?.isMobile ?? false) ||
            (_endSidebarState?.isMobile ?? false);

        final isInsetLayout =
            !isMobile &&
            (_sidebarState?.variant == ShadSidebarVariant.inset ||
                _endSidebarState?.variant == ShadSidebarVariant.inset);

        return ColoredBox(
          color: (isInsetLayout ? colorScheme.sidebar : effectiveBodyColor),
          child: Stack(
            children: [
              if (widget.sidebar != null)
                Positioned(
                  left: isRtl ? null : 0,
                  right: isRtl ? 0 : null,
                  top: 0,
                  bottom: 0,
                  child: Offstage(
                    offstage: _sidebarState?.isMobile ?? false,
                    child: ShadSidebarScaffoldInheritedWidget(
                      side: ShadSidebarSide.start,
                      controller: _effectiveSidebarController,
                      child: widget.sidebar!,
                    ),
                  ),
                ),

              if (widget.endSidebar != null)
                Positioned(
                  left: isRtl ? 0 : null,
                  right: isRtl ? null : 0,
                  top: 0,
                  bottom: 0,
                  child: Offstage(
                    offstage: _endSidebarState?.isMobile ?? false,
                    child: ShadSidebarScaffoldInheritedWidget(
                      side: ShadSidebarSide.end,
                      controller: _effectiveEndSidebarController,
                      child: widget.endSidebar!,
                    ),
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

  void _updateIsMobile(BoxConstraints constraints) {
    // Defer the update to avoid calling setState during build.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        final sidebarTheme = ShadTheme.of(context).sidebarTheme;

        _effectiveSidebarController?.updateIsMobile(
          constraints.maxWidth,
          _sidebarState?.widget.mobileBreakPoint ??
              sidebarTheme.mobileBreakPoint ??
              768,
        );
        _effectiveEndSidebarController?.updateIsMobile(
          constraints.maxWidth,
          _endSidebarState?.widget.mobileBreakPoint ??
              sidebarTheme.mobileBreakPoint ??
              768,
        );

        setState(() => _lastMaxWidth = constraints.maxWidth);
      }
    });
  }

  double _collapsedWidth(ShadSidebarState state) {
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
    final state = _sidebarState;
    if (state == null || state.isMobile) {
      return 0;
    }
    return lerpDouble(
          _collapsedWidth(state),
          state.extendedWidth,
          state.animation.value,
        ) ??
        0;
  }

  double get _rightBodyPadding {
    final state = _endSidebarState;

    if (state == null || state.isMobile) {
      return 0;
    }
    return lerpDouble(
          _collapsedWidth(state),
          state.extendedWidth,
          state.animation.value,
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
