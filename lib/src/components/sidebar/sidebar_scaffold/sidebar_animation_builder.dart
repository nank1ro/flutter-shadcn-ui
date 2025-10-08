part of 'sidebar_scaffold.dart';

abstract class SidebarAnimationBuilder {
  const SidebarAnimationBuilder(this.state);

  factory SidebarAnimationBuilder.byCollapseMode(
    ShadSidebarScaffoldState state,
    ShadSidebarCollapseMode collapseMode,
  ) {
    return switch (collapseMode) {
      ShadSidebarCollapseMode.icons => IconsBuilder(state),
      ShadSidebarCollapseMode.offScreen => OffScreenBuilder(state),
      ShadSidebarCollapseMode.none => NoneBuilder(state),
    };
  }

  final ShadSidebarScaffoldState state;

  double get width;

  double get bodyPadding;

  Widget animatedSidebar(Widget sidebar);

  void setup(Duration duration, Curve curve);
}

class OffScreenBuilder extends SidebarAnimationBuilder {
  OffScreenBuilder(super.state);

  late Animation<Offset> _offsetAnimation;

  @override
  double get width => state.extendedWidth;

  @override
  double get bodyPadding => state._animationController.value * width;

  @override
  Widget animatedSidebar(Widget sidebar) {
    return SlideTransition(
      position: _offsetAnimation,
      child: SizedBox(
        width: state.extendedWidth,
        child: sidebar,
      ),
    );
  }

  @override
  void setup(Duration duration, Curve curve) {
    final offset = state.side.isLeft ? const Offset(-1, 0) : const Offset(1, 0);
    _offsetAnimation = Tween<Offset>(
      begin: offset,
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: state._animationController,
        curve: curve,
      ),
    );
  }
}

class IconsBuilder extends SidebarAnimationBuilder {
  IconsBuilder(super.state);

  @override
  double get width =>
      bodyPadding +
      ((!state.variant.isNormal && state.collapsedToIcons) ? 8 : 0);

  @override
  double get bodyPadding => lerpDouble(
        state.collapsedToIconsWidth,
        state.extendedWidth,
        state._animationController.value,
      )!;

  @override
  Widget animatedSidebar(Widget sidebar) {
    return sidebar;
  }

  @override
  void setup(Duration duration, Curve curve) {}
}

class NoneBuilder extends SidebarAnimationBuilder {
  NoneBuilder(super.state);

  @override
  double get width => state.extendedWidth;

  @override
  double get bodyPadding => state.extendedWidth;

  @override
  Widget animatedSidebar(Widget sidebar) {
    return SizedBox(
      width: state.extendedWidth,
      child: sidebar,
    );
  }

  @override
  void setup(Duration duration, Curve curve) {}
}
