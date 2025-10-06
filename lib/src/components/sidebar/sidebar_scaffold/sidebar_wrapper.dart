part of 'sidebar_scaffold.dart';

sealed class SidebarWrapper extends StatelessWidget {
  const SidebarWrapper(this.sidebar, {super.key});

  factory SidebarWrapper.byVariant(
    ShadSidebarVariant variant,
    Widget sidebar,
  ) {
    return switch (variant) {
      ShadSidebarVariant.normal => _SidebarNormalVariant(sidebar),
      ShadSidebarVariant.floating => _SidebarFloatingVariant(sidebar),
      ShadSidebarVariant.inset => _SidebarInsetVariant(sidebar),
    };
  }

  final Widget sidebar;
}

class _SidebarNormalVariant extends SidebarWrapper {
  const _SidebarNormalVariant(super.sidebar);

  @override
  Widget build(BuildContext context) {
    final state = ShadSidebarScaffold.of(context);
    final side = state.side;
    final width = !state.extended && state.collapseMode.isIcons
        ? state.collapsedToIconsWidth
        : state.extendedWidth;
    var isHovered = false;

    return Stack(
      children: [
        sidebar,
        Positioned(
          top: 0,
          bottom: 0,
          left: side.isRight ? null : (width - 16),
          right: side.isRight ? (width - 16) : null,
          child: StatefulBuilder(
            builder: (context, mSetState) {
              return SizedBox(
                width: 16,
                child: InkWell(
                  mouseCursor: SystemMouseCursors.resizeColumn,
                  onTap: state.toggle,
                  onHover: (value) => mSetState(() => isHovered = value),
                  child: Container(
                    alignment: side.isRight
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                    child: VerticalDivider(
                      width: 1,
                      thickness: isHovered ? 2 : 0,
                      color: state.borderColor,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _SidebarFloatingVariant extends SidebarWrapper {
  const _SidebarFloatingVariant(super.sidebar);

  @override
  Widget build(BuildContext context) {
    final scaffold = ShadSidebarScaffold.of(context);
    final theme = ShadTheme.of(context);

    return Container(
      margin: const EdgeInsets.all(8),
      child: ShadDecorator(
        decoration: ShadDecoration(
          border: ShadBorder.all(
            radius: theme.radius,
            width: 1,
            color: scaffold.borderColor,
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

class _SidebarInsetVariant extends SidebarWrapper {
  const _SidebarInsetVariant(super.sidebar);

  @override
  Widget build(BuildContext context) {
    return sidebar;
  }
}
