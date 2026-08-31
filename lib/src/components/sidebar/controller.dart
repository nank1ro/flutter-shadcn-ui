import 'package:flutter/foundation.dart';

/// Controls the open/close state of a `ShadSidebar`.
///
/// The controller only manages **logical** state (open vs closed).
/// The animation is driven by the `ShadSidebarScaffold`'s State, which
/// listens to this controller and forwards changes to an
/// `AnimationController`. The running animation value is then exposed
/// through `ShadSidebarScope` so any descendant can react to it.
///
/// Usage:
/// ```dart
/// final controller = ShadSidebarController();          // open by default
/// final controller = ShadSidebarController(isOpen: false); // start collapsed
///
/// controller.toggle();
/// controller.open();
/// controller.close();
///
/// // Listen to changes
/// controller.addListener(() {
///   print('Sidebar is now ${controller.isOpen ? "open" : "closed"}');
/// });
/// ```
class ShadSidebarController extends ChangeNotifier {
  ShadSidebarController({bool isOpen = true}) : _isOpen = isOpen;

  bool _isOpen;

  /// Whether the sidebar is currently open (expanded).
  bool get isOpen => _isOpen;

  /// Opens the sidebar. No-op if already open.
  void open() {
    if (_isOpen) return;
    _isOpen = true;
    notifyListeners();
  }

  /// Closes (collapses) the sidebar. No-op if already closed.
  void close() {
    if (!_isOpen) return;
    _isOpen = false;
    notifyListeners();
  }

  /// Toggles between open and closed.
  void toggle() {
    _isOpen = !_isOpen;
    notifyListeners();
  }
}
