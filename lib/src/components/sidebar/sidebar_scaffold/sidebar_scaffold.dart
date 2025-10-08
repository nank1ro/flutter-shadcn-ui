import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show LogicalKeyboardKey;
import 'package:shadcn_ui/shadcn_ui.dart';

part 'sidebar_scaffold_layout.dart';
part 'sidebar_animation_builder.dart';
part 'sidebar_wrapper.dart';

/// A sidebar component that can be extended or collapsed.
class ShadSidebarScaffold extends StatefulWidget {
  const ShadSidebarScaffold({
    super.key,
    this.initiallyExtended,
    this.collapseMode = ShadSidebarCollapseMode.offScreen,
    this.onExtendedChange,
    this.animationCurve,
    this.animationDuration,
    this.collapsedToIconsWidth,
    this.extendedWidth,
    this.mobileWidth,
    this.mobileBreakPoint,
    this.keyboardShortcut,
    this.side,
    this.variant,
    this.sidebarBorderColor,
    required this.body,
    required this.sidebarBuilder,
  });

  /// {@template ShadSidebarScaffold.sidebar}
  /// The sidebar of the scaffold.
  /// {@endtemplate}
  final ShadSidebar Function(BuildContext context) sidebarBuilder;

  /// {@template ShadSidebarScaffold.initiallyExtended}
  /// Whether the sidebar is initially extended. Defaults to `true`.
  /// {@endtemplate}
  final bool? initiallyExtended;

  /// {@template ShadSidebarScaffold.onExtendedChange}
  /// A callback that is called when the sidebar is extended or collapsed.
  /// {@endtemplate}
  final ValueChanged<bool>? onExtendedChange;

  /// {@template ShadSidebarScaffold.animationDuration}
  /// The duration of the animation when the sidebar is extended or collapsed.
  ///
  /// Defaults to `Duration(milliseconds: 200)`.
  /// {@endtemplate}
  final Duration? animationDuration;

  /// {@template ShadSidebarScaffold.animationCurve}
  /// The curve of the animation when the sidebar is extended or collapsed.
  ///
  /// Defaults to `Curves.linear`.
  /// {@endtemplate}
  final Curve? animationCurve;

  /// {@template ShadSidebarScaffold.collapsedToIconsWidth}
  /// The width of the sidebar when it [collapseMode] is
  ///  set to [ShadSidebarCollapseMode.icons].
  ///
  /// Defaults to `48`.
  /// {@endtemplate}
  final double? collapsedToIconsWidth;

  /// {@template ShadSidebarScaffold.extendedWidth}
  /// The minimum width of the sidebar when it is extended.
  ///
  /// Defaults to `256`.
  /// {@endtemplate}
  final double? extendedWidth;

  /// {@template ShadSidebarScaffold.mobileWidth}
  /// The minimum width of the sidebar when it is extended on mobile.
  ///
  /// Defaults to `288`.
  /// {@endtemplate}
  final double? mobileWidth;

  /// {@template ShadSidebarScaffold.collapseMode}
  /// The collapse mode of the sidebar.
  ///
  /// Defaults to [ShadSidebarCollapseMode.offScreen].
  /// {@endtemplate}
  final ShadSidebarCollapseMode? collapseMode;

  /// {@template ShadSidebarScaffold.sidebarSide}
  /// The side of the sidebar that will be displayed.
  /// This is agnostic to the [TextDirection] of the app.
  ///
  /// Defaults to [ShadSidebarSide.left].
  /// {@endtemplate}
  final ShadSidebarSide? side;

  /// {@template ShadSidebarScaffold.variant}
  ///
  /// Defaults to [ShadSidebarVariant.normal].
  /// {@endtemplate}
  final ShadSidebarVariant? variant;

  /// {@template ShadSidebarScaffold.mobileBreakPoint}
  /// The breakpoint at which....
  ///
  /// Defaults to `768`px.
  /// {@endtemplate}
  final double? mobileBreakPoint;

  /// {@template ShadSidebarScaffold.body}
  /// The body of the sidebar scaffold. This's the content that will be
  /// displayed beside the sidebar.
  /// {@endtemplate}
  final Widget body;

  /// {@template ShadSidebarScaffold.keyboardShortcut}
  /// The keyboard shortcut that will toggle the sidebar.
  ///
  /// Defaults to `CTRL+b` on Windows and Linux, and `CMD+b` on macOS.
  ///
  /// example:
  /// ```dart
  /// ShadSidebarScaffold(
  ///   keyboardShortcut: SingleActivator(LogicalKeyboardKey.keyB),
  ///   body: const Text('Hello World'),
  /// )
  /// ```
  /// {@endtemplate}
  final ShortcutActivator? keyboardShortcut;

  /// {@template ShadSidebarScaffold.sidebarBorderColor}
  /// The color of the sidebar border.
  ///
  /// Defaults to `ShadTheme.colorScheme.sidebarBorder`.
  /// {@endtemplate}
  final Color? sidebarBorderColor;

  static ShadSidebarScaffoldState of(BuildContext context) {
    final scope = context
        .dependOnInheritedWidgetOfExactType<_ShadSidebarScaffoldScope>()!;
    return scope.state;
  }

  static ShadSidebarScaffoldState? maybeOf(BuildContext context) {
    final scope =
        context.dependOnInheritedWidgetOfExactType<_ShadSidebarScaffoldScope>();
    return scope?.state;
  }

  @override
  State<ShadSidebarScaffold> createState() => ShadSidebarScaffoldState();
}

class ShadSidebarScaffoldState extends State<ShadSidebarScaffold>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late SidebarAnimationBuilder _animationBuilder;
  late ShadSidebarCollapseMode _collapseMode;
  late Duration _animationDuration;
  late Curve _animationCurve;
  late bool _extended;
  bool _extendedMobile = false;
  bool _isMobile = false;

  bool get extended => _extended;
  bool get extendedMobile => _extendedMobile;
  bool get collapsedToIcons => !_extended && collapseMode.isIcons;
  bool get isMobile => _isMobile;

  @override
  void initState() {
    super.initState();
    _collapseMode = collapseMode;

    _extended = widget.initiallyExtended ?? true;

    if (collapseMode.isNone) {
      _extended = true;
    }

    _animationController = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
      value: extended ? 1.0 : 0.0,
    );
    _animationBuilder = _getAnimationBuilder();
  }

  void extend() {
    if (isMobile) {
      _openMobile();
    } else {
      if (_extended) return;
      setState(() => _extended = true);
      _onExtendedChanged();
    }
  }

  void collapse() {
    if (isMobile) {
      _closeMobile();
    } else {
      if (!_extended) return;
      setState(() => _extended = false);
      _onExtendedChanged();
    }
  }

  void toggle() {
    if (collapseMode.isNone) {
      if (!_extended) {
        setState(() => _extended = true);
        _onExtendedChanged();
      }
      return;
    }
    if (isMobile) {
      extendedMobile ? _closeMobile() : _openMobile();
    } else {
      setState(() => _extended = !_extended);
      _onExtendedChanged();
    }
  }

  void _openMobile() {
    if (extendedMobile) return;
    final theme = ShadTheme.of(context);
    setState(() => _extendedMobile = true);

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
                end: BorderSide(
                  color: theme.sidebarTheme.borderColor ??
                      theme.colorScheme.sidebarBorder,
                ),
              ),
            ),
            child: _ShadSidebarScaffoldScope(
              state: this,
              extended: _extended,
              extendedMobile: _extendedMobile,
              isMobile: _isMobile,
              side: side,
              variant: variant,
              collapseMode: collapseMode,
              extendedWidth: extendedWidth,
              collapsedToIconsWidth: collapsedToIconsWidth,
              borderColor: borderColor,
              // The Builder is used to get the correct BuildContext for the
              // sidebarBuilder. This allows calling
              // `ShadSidebarScaffold.of(context)` from within the sidebar.
              child: Builder(
                builder: widget.sidebarBuilder,
              ),
            ),
          ),
        );
      },
      animateIn: [animateInEffect],
      animateOut: [animateOutEffect],
    ).then((_) {
      if (mounted && _extendedMobile) {
        setState(() => _extendedMobile = false);
      }
    });
  }

  void _closeMobile() {
    if (!extendedMobile) return;
    Navigator.maybePop(context);
    if (mounted && _extendedMobile) {
      setState(() => _extendedMobile = false);
    }
  }

  void _onExtendedChanged() {
    if (collapseMode.isNone) {
      _animationController.forward();
      return;
    }
    extended ? _animationController.forward() : _animationController.reverse();
    widget.onExtendedChange?.call(extended);
  }

  @override
  void didUpdateWidget(covariant ShadSidebarScaffold oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.collapseMode != widget.collapseMode) {
      _collapseMode = collapseMode;
      _animationBuilder = _getAnimationBuilder();
    }

    if (oldWidget.extendedWidth != widget.extendedWidth ||
        oldWidget.collapsedToIconsWidth != widget.collapsedToIconsWidth ||
        oldWidget.animationDuration != widget.animationDuration ||
        oldWidget.animationCurve != widget.animationCurve ||
        oldWidget.side != widget.side ||
        oldWidget.collapseMode != widget.collapseMode ||
        oldWidget.initiallyExtended != widget.initiallyExtended) {
      _updateAnimation();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_collapseMode != collapseMode) {
      _animationBuilder = _getAnimationBuilder();
      _collapseMode = collapseMode;
    }
    _updateAnimation();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  SidebarAnimationBuilder _getAnimationBuilder() {
    return SidebarAnimationBuilder.byCollapseMode(this, collapseMode);
  }

  void _updateAnimation() {
    _animationDuration = widget.animationDuration ??
        ShadTheme.of(context).sidebarScaffoldTheme.animationDuration ??
        kThemeAnimationDuration;
    _animationCurve = widget.animationCurve ??
        ShadTheme.of(context).sidebarScaffoldTheme.animationCurve ??
        Curves.linear;

    _animationController.duration = _animationDuration;
    _animationBuilder.setup(_animationDuration, _animationCurve);
  }

  ShortcutActivator get keyboardShortcut =>
      widget.keyboardShortcut ??
      ShadTheme.of(context).sidebarScaffoldTheme.keyboardShortcut ??
      const SingleActivator(LogicalKeyboardKey.keyB, control: true);

  ShadSidebarCollapseMode get collapseMode =>
      widget.collapseMode ??
      ShadTheme.of(context).sidebarScaffoldTheme.collapseMode ??
      ShadSidebarCollapseMode.offScreen;

  ShadSidebarSide get side =>
      widget.side ??
      ShadTheme.of(context).sidebarScaffoldTheme.side ??
      ShadSidebarSide.left;

  ShadSidebarVariant get variant =>
      widget.variant ??
      ShadTheme.of(context).sidebarScaffoldTheme.variant ??
      ShadSidebarVariant.normal;

  double get collapsedToIconsWidth =>
      widget.collapsedToIconsWidth ??
      ShadTheme.of(context).sidebarScaffoldTheme.collapsedToIconsWidth ??
      48;

  double get mobileBreakPoint {
    final theme = ShadTheme.of(context);
    return widget.mobileBreakPoint ??
        theme.sidebarScaffoldTheme.mobileBreakPoint ??
        768;
  }

  double get extendedWidth {
    final theme = ShadTheme.of(context);
    return widget.extendedWidth ??
        theme.sidebarScaffoldTheme.extendedWidth ??
        256;
  }

  double get mobileWidth {
    final theme = ShadTheme.of(context);
    return widget.mobileWidth ?? theme.sidebarScaffoldTheme.mobileWidth ?? 288;
  }

  Color get borderColor {
    final theme = ShadTheme.of(context);

    return widget.sidebarBorderColor ??
        theme.sidebarScaffoldTheme.sidebarBorderColor ??
        theme.colorScheme.sidebarBorder;
  }

  @override
  Widget build(BuildContext context) {
    return _ShadSidebarScaffoldScope(
      state: this,
      // Internal state
      extended: _extended,
      extendedMobile: _extendedMobile,
      isMobile: _isMobile,
      // Props from widget/theme
      side: side,
      variant: variant,
      collapseMode: collapseMode,
      extendedWidth: extendedWidth,
      collapsedToIconsWidth: collapsedToIconsWidth,
      borderColor: borderColor,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < mobileBreakPoint;

          if (isMobile != _isMobile) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (mounted) {
                setState(() => _isMobile = isMobile);
              }
            });
          }

          // On mobile, we only show the body and the sidebar is handled by
          // the sheet.
          if (isMobile) return widget.body;

          // On desktop, we build the full scaffold with the inline sidebar.
          return CallbackShortcuts(
            bindings: {
              keyboardShortcut: toggle,
            },
            child: Focus(
              child: Builder(
                builder: (context) {
                  final wrappedSidebar = SidebarWrapper.byVariant(
                    variant,
                    widget.sidebarBuilder(context),
                  );

                  final sidebar =
                      _animationBuilder.animatedSidebar(wrappedSidebar);
                  return _SidebarScaffoldLayout.build(
                    context,
                    sidebar,
                    widget.body,
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class _ShadSidebarScaffoldScope extends InheritedWidget {
  const _ShadSidebarScaffoldScope({
    required this.state,
    required this.extended,
    required this.extendedMobile,
    required this.isMobile,
    required this.side,
    required this.variant,
    required this.collapseMode,
    required this.extendedWidth,
    required this.collapsedToIconsWidth,
    required this.borderColor,
    required super.child,
  });

  final ShadSidebarScaffoldState state;
  final bool extended;
  final bool extendedMobile;
  final bool isMobile;
  final ShadSidebarSide side;
  final ShadSidebarVariant variant;
  final ShadSidebarCollapseMode collapseMode;
  final double extendedWidth;
  final double collapsedToIconsWidth;
  final Color borderColor;

  @override
  bool updateShouldNotify(_ShadSidebarScaffoldScope oldWidget) {
    return extended != oldWidget.extended ||
        extendedMobile != oldWidget.extendedMobile ||
        isMobile != oldWidget.isMobile ||
        side != oldWidget.side ||
        variant != oldWidget.variant ||
        collapseMode != oldWidget.collapseMode ||
        extendedWidth != oldWidget.extendedWidth ||
        collapsedToIconsWidth != oldWidget.collapsedToIconsWidth ||
        borderColor != oldWidget.borderColor;
  }
}
