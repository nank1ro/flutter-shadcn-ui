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
  /// The sidebar is on the left side of the screen.
  /// Regardless of the `TextDirection` of the app.
  left,

  /// The sidebar is on the right side of the screen.
  /// Regardless of the `TextDirection` of the app.
  right;

  bool get isLeft => this == left;
  bool get isRight => this == right;
}
