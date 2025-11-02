enum ShadSidebarVariant {
  /// A sidebar with a left\right border.
  normal,

  /// A sidebar with full borders and a drop shadow.
  floating,

  /// A sidebar without any borders.
  inset;

  bool get isNormal => this == normal;
  bool get isFloating => this == floating;
  bool get isInset => this == inset;
}

enum ShadSidebarCollapseMode {
  /// A sidebar that will collapse to icons.
  icons,

  /// The sidebar will slides in from the left of right of the screen.
  offScreen,

  /// A non-collapsible sidebar.
  none;

  bool get isNone => this == none;
  bool get isIcons => this == icons;
  bool get isOffScreen => this == offScreen;
}

enum ShadSidebarSide {
  /// The sidebar is on the start side of the screen.
  /// It is on the left for LTR and on the right for RTL.
  start,

  /// The sidebar is on the end side of the screen.
  /// It is on the right for LTR and on the left for RTL.
  end;

  bool get isStart => this == start;
  bool get isEnd => this == end;
}
