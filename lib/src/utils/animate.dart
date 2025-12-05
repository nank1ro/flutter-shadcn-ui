import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';

/// The Flutter Animate library makes adding beautiful animated effects to your
/// widgets simple. It supports both a declarative and chained API. The latter
/// is exposed via the `Widget.animate` extension, which simply wraps the widget
/// in `Animate`.
///
/// ```dart
/// // declarative:
/// Animate(child: foo, effects: [FadeEffect(), ScaleEffect()])
///
/// // chained API:
/// foo.animate().fade().scale() // equivalent to above
/// ```
///
/// Effects are always run in parallel (ie. the fade and scale effects in the
/// example above would be run simultaneously), but you can apply delays to
/// offset them or run them in sequence.
///
/// All effects classes are immutable, and can be shared between `Animate`
/// instances, which lets you create libraries of effects to reuse throughout
/// your app.
///
/// ```dart
/// List<Effect> transitionIn = [
///   FadeEffect(duration: 100.ms, curve: Curves.easeOut),
///   ScaleEffect(begin: 0.8, curve: Curves.easeIn)
/// ];
/// // then:
/// Animate(child: foo, effects: transitionIn)
/// // or:
/// foo.animate(effects: transitionIn)
/// ```
///
/// Effects inherit some of their properties (delay, duration, curve) from the
/// previous effect if unspecified. So in the examples above, the scale will use
/// the same duration as the fade that precedes it. All effects have
/// reasonable defaults, so they can be used simply: `foo.animate().fade()`
///
/// Note that all effects are composed together, not run sequentially. For
/// example, the following would not fade in myWidget, because the fadeOut
/// effect would still be applying an opacity of 0:
///
/// ```dart
/// myWidget.animate().fadeOut(duration: 200.ms).fadeIn(delay: 200.ms)
/// ```
///
/// See [SwapEffect] for one approach to work around this.
// ignore: must_be_immutable
class ShadAnimate extends Animate {
  ShadAnimate({
    super.key,
    super.child = const SizedBox.shrink(),
    super.effects,
    super.onInit,
    super.onPlay,
    super.onComplete,
    super.autoPlay = true,
    super.delay = Duration.zero,
    super.controller,
    super.adapter,
    super.value,
    super.target,
  });

  final List<EffectEntry> _entries = [];
  EffectEntry? _lastEntry;
  Duration _baseDelay = Duration.zero;
  Duration _duration = Duration.zero;

  @override
  Animate addEffect(Effect<dynamic> effect) {
    final prior = _lastEntry;

    const zero = Duration.zero;
    var delay = zero;
    if (effect is ThenEffect) {
      delay = _baseDelay = (prior?.end ?? zero) + (effect.delay ?? zero);
    } else if (effect.delay != null) {
      delay = _baseDelay + effect.delay!;
    } else {
      delay = prior?.delay ?? _baseDelay;
    }

    assert(delay >= zero, 'Calculated delay cannot be negative.');

    final entry = EffectEntry(
      effect: effect,
      delay: delay,
      duration: effect.duration ?? prior?.duration ?? Animate.defaultDuration,
      curve: effect.curve ?? prior?.curve ?? Animate.defaultCurve,
      owner: this,
    );

    _entries.add(entry);
    _lastEntry = entry;
    if (entry.end > _duration && effect is! ThenEffect) _duration = entry.end;
    return super.addEffect(effect);
  }

  @override
  State<Animate> createState() => _ShadAnimateState();
}

class _ShadAnimateState extends State<ShadAnimate>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isInternalController = false;
  Adapter? _adapter;
  Future<void>? _delayed;

  @override
  void initState() {
    super.initState();
    _restart();
  }

  @override
  void didUpdateWidget(ShadAnimate oldWidget) {
    if (oldWidget.controller != widget.controller ||
        oldWidget.duration != widget.duration) {
      _initController();
      _play();
    } else if (oldWidget.adapter != widget.adapter) {
      _initAdapter();
    } else if (widget.target != oldWidget.target ||
        widget.value != oldWidget.value) {
      _play();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Animate.restartOnHotReload) _restart();
  }

  void _restart() {
    _delayed?.ignore();
    _initController();
    _updateValue();
    if (widget.delay == Duration.zero) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) _play();
      });
    } else {
      _delayed = Future.delayed(widget.delay, _play);
    }
  }

  void _initController() {
    AnimationController? controller;
    var callback = false;

    if (widget.controller != null) {
      // externally provided AnimationController.
      _disposeController();
      controller = widget.controller;
    } else if (!_isInternalController) {
      // create a new internal AnimationController.
      controller = AnimationController(vsync: this);
      callback = _isInternalController = true;
    } else {
      // pre-existing controller.
    }

    if (controller != null) {
      // new controller.
      _controller = controller;
      _controller.addStatusListener(_handleAnimationStatus);
    }

    _controller.duration = widget.duration;

    _initAdapter();

    if (callback) widget.onInit?.call(_controller);
  }

  void _initAdapter() {
    _adapter?.detach();
    _adapter = widget.adapter;
    _adapter?.attach(_controller);
  }

  void _disposeController() {
    if (_isInternalController) _controller.dispose();
    _isInternalController = false;
  }

  @override
  void dispose() {
    print('Disposing ShadAnimate');
    _adapter?.detach();
    _delayed?.ignore();
    _disposeController();
    super.dispose();
  }

  void _handleAnimationStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      widget.onComplete?.call(_controller);
    }
  }

  void _play() {
    _delayed?.ignore(); // for poorly timed hot reloads.
    _updateValue();
    final pos = widget.target;
    if (pos != null) {
      _controller.animateTo(pos);
    } else if (widget.autoPlay && _adapter == null) {
      _controller.forward(from: widget.value ?? 0);
      widget.onPlay?.call(_controller);
    }
  }

  void _updateValue() {
    if (widget.value == null) return;
    _controller.value = widget.value!;
  }

  @override
  Widget build(BuildContext context) {
    var child = widget.child;
    final parent = child;
    final reparent =
        Animate.reparentTypes[child.runtimeType] as ReparentChildBuilder?;
    if (reparent != null) child = (child as dynamic).child as Widget;
    for (final entry in widget._entries) {
      child = entry.effect.build(context, child, _controller, entry);
    }
    return reparent?.call(parent, child) ?? child;
  }
}
