import 'package:flutter/widgets.dart';

import 'package:shadcn_ui/src/components/sidebar/sidebar.dart';

class ShadSidebarController extends ChangeNotifier {
  ShadSidebarController({
    this.initiallyExtended = true,
    this.onExtendedChange,
  }) : _extended = initiallyExtended;

  final bool initiallyExtended;
  final ValueChanged<bool>? onExtendedChange;

  ShadSidebarState? _state;
  ShadSidebarState? get state => _state;

  void attach(ShadSidebarState state) {
    _state = state;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }

  void detach(ShadSidebarState state) {
    if (_state == state) {
      _state = null;
    }
  }

  bool _extended;
  bool _isMobile = false;
  bool _extendedMobile = false;

  bool get extended => _extended;
  bool get isMobile => _isMobile;
  bool get extendedMobile => _extendedMobile;

  void _setExtended(bool value) {
    if (_extended == value) return;
    _extended = value;
    onExtendedChange?.call(_extended);
    notifyListeners();
  }

  void extend() {
    _setExtended(true);
  }

  void collapse() {
    _setExtended(false);
  }

  void toggle() {
    if (isMobile) {
      _extendedMobile = !_extendedMobile;
      notifyListeners();
    } else {
      _setExtended(!_extended);
    }
  }

  void openMobile() {
    if (_extendedMobile) return;
    _extendedMobile = true;
    notifyListeners();
  }

  void closeMobile() {
    if (!_extendedMobile) return;
    _extendedMobile = false;
    notifyListeners();
  }

  void updateIsMobile(double width, double mobileBreakPoint) {
    final newIsMobile = width < mobileBreakPoint;
    if (newIsMobile != _isMobile) {
      _isMobile = newIsMobile;
      notifyListeners();
    }
  }
}
