import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/theme/theme.dart';

/// {@template ShadSkeleton}
/// Placeholder shown while content is loading.
/// {@endtemplate}
class ShadSkeleton extends StatefulWidget {
  /// {@macro ShadSkeleton}
  const ShadSkeleton({
    super.key,
    this.width,
    this.height,
    this.color,
    this.borderRadius,
    this.pulseHalfDuration,
    this.pulseCurve,
    this.minPulseOpacity,
    this.semanticsLabel,
    this.excludeSemantics = false,
  });

  /// The width of the skeleton.
  final double? width;

  /// The height of the skeleton.
  final double? height;

  /// {@template ShadSkeleton.color}
  /// Fill color; defaults to the theme color scheme's muted color.
  /// {@endtemplate}
  final Color? color;

  /// {@template ShadSkeleton.borderRadius}
  /// Corner radius; defaults to the theme radius (`rounded-md`).
  /// {@endtemplate}
  final BorderRadiusGeometry? borderRadius;

  /// {@macro ShadSkeletonTheme.pulseHalfDuration}
  final Duration? pulseHalfDuration;

  /// {@macro ShadSkeletonTheme.pulseCurve}
  final Curve? pulseCurve;

  /// {@macro ShadSkeletonTheme.minPulseOpacity}
  final double? minPulseOpacity;

  /// {@template ShadSkeleton.semanticsLabel}
  /// Accessibility label; when null the skeleton is treated as decorative.
  /// {@endtemplate}
  final String? semanticsLabel;

  /// When true, the subtree is excluded from the semantics tree.
  final bool excludeSemantics;

  @override
  State<ShadSkeleton> createState() => _ShadSkeletonState();
}

class _ShadSkeletonState extends State<ShadSkeleton>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  CurvedAnimation? _curved;
  Animation<double>? _opacityFactor;
  Duration? _lastHalfDuration;
  Curve? _lastCurve;
  double? _lastMinOpacity;

  @override
  void dispose() {
    _curved?.dispose();
    _controller?.dispose();
    super.dispose();
  }

  void _ensureAnimation(
    Duration half,
    Curve curve,
    double minOp,
  ) {
    _controller ??= AnimationController(vsync: this, duration: half);
    if (_controller!.duration != half) {
      _controller!.duration = half;
    }

    final needsNewChain =
        _opacityFactor == null ||
        _lastHalfDuration != half ||
        _lastCurve != curve ||
        _lastMinOpacity != minOp;

    if (needsNewChain) {
      _lastHalfDuration = half;
      _lastCurve = curve;
      _lastMinOpacity = minOp;
      _curved?.dispose();
      _curved = CurvedAnimation(
        parent: _controller!,
        curve: curve,
        reverseCurve: curve,
      );
      _opacityFactor = Tween<double>(begin: 1, end: minOp).animate(_curved!);
    }
  }

  void _syncDriving() {
    final theme = ShadTheme.of(context);
    final sk = theme.skeletonTheme;
    final half =
        widget.pulseHalfDuration ??
        sk.pulseHalfDuration ??
        const Duration(seconds: 1);
    final curve =
        widget.pulseCurve ?? sk.pulseCurve ?? const Cubic(0.4, 0, 0.6, 1);
    final minOp = widget.minPulseOpacity ?? sk.minPulseOpacity ?? 0.5;

    _ensureAnimation(half, curve, minOp);

    final disable = MediaQuery.disableAnimationsOf(context);
    if (disable) {
      _controller!.stop();
      _controller!.value = 0;
    } else {
      if (!_controller!.isAnimating) {
        _controller!.repeat(reverse: true);
      }
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _syncDriving();
  }

  @override
  void didUpdateWidget(covariant ShadSkeleton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.pulseHalfDuration != oldWidget.pulseHalfDuration ||
        widget.pulseCurve != oldWidget.pulseCurve ||
        widget.minPulseOpacity != oldWidget.minPulseOpacity) {
      _lastHalfDuration = null;
      _lastCurve = null;
      _lastMinOpacity = null;
    }
    _syncDriving();
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final sk = theme.skeletonTheme;
    final effectiveColor = widget.color ?? sk.color ?? theme.colorScheme.muted;
    final effectiveRadius =
        widget.borderRadius ?? sk.borderRadius ?? theme.radius;
    final disable = MediaQuery.disableAnimationsOf(context);
    final effectiveLabel = widget.semanticsLabel ?? sk.semanticsLabel;

    final opacityAnim = _opacityFactor;

    Widget core;
    if (disable || opacityAnim == null) {
      core = SizedBox(
        width: widget.width,
        height: widget.height,
        child: ClipRRect(
          borderRadius: effectiveRadius,
          child: ColoredBox(color: effectiveColor),
        ),
      );
    } else {
      core = AnimatedBuilder(
        animation: opacityAnim,
        builder: (context, child) {
          final factor = opacityAnim.value;
          final paintColor = effectiveColor.withValues(
            alpha: (effectiveColor.a * factor).clamp(0.0, 1.0),
          );
          return SizedBox(
            width: widget.width,
            height: widget.height,
            child: ClipRRect(
              borderRadius: effectiveRadius,
              child: ColoredBox(color: paintColor),
            ),
          );
        },
      );
    }

    if (widget.excludeSemantics) {
      core = ExcludeSemantics(child: core);
    } else if (effectiveLabel != null) {
      core = Semantics(label: effectiveLabel, child: core);
    }

    return core;
  }
}
