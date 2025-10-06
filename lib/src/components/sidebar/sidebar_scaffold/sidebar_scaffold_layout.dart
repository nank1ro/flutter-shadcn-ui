part of 'sidebar_scaffold.dart';

sealed class _SidebarScaffoldLayout extends StatelessWidget {
  const _SidebarScaffoldLayout({
    required this.sidebar,
    required this.body,
  });

  factory _SidebarScaffoldLayout.build(
    BuildContext context,
    Widget sidebar,
    Widget body,
  ) {
    final state = ShadSidebarScaffold.of(context);
    final variant = state.variant;
    final collapseMode = state.collapseMode;

    return switch (variant) {
      ShadSidebarVariant.normal => collapseMode.isNone
          ? _FixedNormalLayout(sidebar: sidebar, body: body)
          : _NormalLayout(sidebar: sidebar, body: body),
      ShadSidebarVariant.floating =>
        _NormalLayout(sidebar: sidebar, body: body),
      ShadSidebarVariant.inset => _InsetLayout(sidebar: sidebar, body: body),
    };
  }

  final Widget sidebar;
  final Widget body;
}

class _NormalLayout extends _SidebarScaffoldLayout {
  const _NormalLayout({
    required super.sidebar,
    required super.body,
  });

  @override
  Widget build(BuildContext context) {
    final state = ShadSidebarScaffold.of(context);
    final side = state.side;
    return AnimatedBuilder(
      animation: state._animationController,
      builder: (context, _) {
        final behavior = state._animationBuilder;
        final bodyPadding = behavior.bodyPadding;
        return Stack(
          children: [
            Positioned(
              left: side.isRight ? null : 0,
              right: side.isRight ? 0 : null,
              top: 0,
              bottom: 0,
              width: behavior.width,
              child: Offstage(
                offstage: state.collapseMode.isOffScreen && bodyPadding < 10,
                child: sidebar,
              ),
            ),
            Padding(
              padding: side.isRight
                  ? EdgeInsets.only(right: bodyPadding)
                  : EdgeInsets.only(left: bodyPadding),
              child: body,
            ),
          ],
        );
      },
    );
  }
}

class _InsetLayout extends _SidebarScaffoldLayout {
  const _InsetLayout({
    required super.sidebar,
    required super.body,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return ColoredBox(
      color: theme.sidebarTheme.backgroundColor ?? theme.colorScheme.sidebar,
      child: _NormalLayout(
        sidebar: sidebar,
        body: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            boxShadow: ShadShadows.sm,
            borderRadius: BorderRadius.circular(12),
            color: theme.colorScheme.background,
          ),
          child: body,
        ),
      ),
    );
  }
}

class _FixedNormalLayout extends _SidebarScaffoldLayout {
  const _FixedNormalLayout({
    required super.sidebar,
    required super.body,
  });

  @override
  Widget build(BuildContext context) {
    final state = ShadSidebarScaffold.of(context);
    final side = state.side;
    return Row(
      textDirection: side.isLeft ? TextDirection.ltr : TextDirection.rtl,
      children: [sidebar, Expanded(child: body)],
    );
  }
}
