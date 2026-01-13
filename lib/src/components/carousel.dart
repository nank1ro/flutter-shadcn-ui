// ignore_for_file: lines_longer_than_80_chars

import 'dart:math' as math;

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/theme/data.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/utils/gesture_detector.dart';

/// A carousel widget that displays items in a scrollable view with optional navigation buttons.
///
/// [ShadCarousel] provides a smooth scrolling experience with item snapping,
/// customizable navigation buttons, and support for both fixed-extent and
/// weighted layout modes. It follows the shadcn UI design system principles.
///
/// The carousel can be controlled either through user interaction (swiping) or
/// programmatically using [ShadCarouselController].
class ShadCarousel extends StatefulWidget {
  /// Creates a carousel widget.
  const ShadCarousel({
    super.key,
    this.padding,
    this.shape,
    this.controller,
    this.physics,
    this.scrollDirection,
    this.reverse,
    this.onTap,
    this.buttonSpacing,
    this.leading,
    this.trailing,
    this.clipBehavior,
    required this.itemExtent,
    required this.children,
  });

  /// The clip behavior of the carousel viewport.
  /// If null, defaults to [Clip.antiAlias] in the build method.
  final Clip? clipBehavior;

  /// The padding around each carousel item.
  ///
  /// Defaults to [EdgeInsets.all(4)].
  final EdgeInsetsGeometry? padding;

  /// The shape of the carousel container.
  ///
  /// If null, no shape is applied. Can be used to create rounded corners
  /// or custom borders.
  final ShapeBorder? shape;

  /// The scroll physics for the carousel.
  final ScrollPhysics? physics;

  /// An optional controller to programmatically control the carousel.
  ///
  /// If null, an internal controller is created automatically.
  /// Use this to navigate between items or listen to scroll events.
  final ShadCarouselController? controller;

  /// The direction of scrolling.
  ///
  /// Can be [Axis.horizontal] or [Axis.vertical]. Defaults to [Axis.horizontal].
  final Axis? scrollDirection;

  /// Whether the scroll direction is reversed.
  ///
  /// When true, scrolling direction is reversed relative to the [scrollDirection].
  /// Defaults to false.
  final bool? reverse;

  /// Callback triggered when an item is tapped.
  /// The callback receives the index of the tapped item.
  final ValueChanged<int>? onTap;

  /// The trailing widget, typically used for navigation buttons or indicators.
  final Widget? trailing;

  /// The leading widget, typically used for navigation buttons or indicators.
  final Widget? leading;

  /// The spacing around the navigation buttons.
  ///
  /// Controls the padding on all sides of the previous/next buttons.
  /// Defaults to 8.0.
  final double? buttonSpacing;

  /// The fixed width/height of each carousel item.
  /// When specified, all items have this fixed extent.
  final double itemExtent;

  /// The list of widgets to display in the carousel.
  ///
  /// Each widget represents one carousel item.
  final Iterable<Widget> children;

  @override
  State<ShadCarousel> createState() => _ShadCarouselState();
}

/// State class for [ShadCarousel].
///
/// Manages the carousel's internal state, including controller attachment,
/// item building, and event handling. Builds the carousel UI and navigation buttons.
class _ShadCarouselState extends State<ShadCarousel> {
  double itemExtent = 0;
  bool get consumeMaxWeight => true;
  ShadCarouselController? internalController;
  ShadCarouselController get controller =>
      widget.controller ?? internalController!;

  @override
  void initState() {
    super.initState();
    itemExtent = widget.itemExtent;
    if (widget.controller == null) {
      internalController = ShadCarouselController();
    }
    controller._attach(this);
  }

  @override
  void didUpdateWidget(covariant ShadCarousel oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller) {
      oldWidget.controller?._detach(this);
      if (widget.controller != null) {
        internalController?._detach(this);
        internalController = null;
        widget.controller?._attach(this);
      } else {
        assert(internalController == null);
        internalController = ShadCarouselController();
        controller._attach(this);
      }
    }
    if (widget.itemExtent != oldWidget.itemExtent) {
      itemExtent = widget.itemExtent;
      if (controller.hasClients) {
        (controller.position as CarouselPosition).itemExtent = itemExtent;
      }
    }
  }

  @override
  void dispose() {
    controller._detach(this);
    internalController?.dispose();
    super.dispose();
  }

  Axis get _effectiveScrollDirection =>
      widget.scrollDirection ?? Axis.horizontal;

  bool get _isReversed => widget.reverse ?? false;

  AxisDirection _getDirection(BuildContext context) {
    final scrollDirection = _effectiveScrollDirection;
    // Determines the scroll direction based on the carousel settings and text direction.
    // Converts Axis to AxisDirection, accounting for text directionality and reversal.
    switch (scrollDirection) {
      case Axis.horizontal:
        assert(debugCheckHasDirectionality(context));
        final textDirection = Directionality.of(context);
        final axisDirection = textDirectionToAxisDirection(textDirection);
        return _isReversed ? flipAxisDirection(axisDirection) : axisDirection;
      case Axis.vertical:
        return _isReversed ? AxisDirection.up : AxisDirection.down;
    }
  }

  Widget _buildCarouselItem(int index) {
    // Builds a single carousel item widget with padding, tap handlers, and splash effects.
    // Wraps the child widget with appropriate gestures and visual feedback based on settings.
    final effectivePadding = widget.padding ?? const EdgeInsets.all(4);
    var contents = widget.children.elementAt(index);
    if (widget.onTap != null) {
      contents = ShadGestureDetector(
        onTap: () => widget.onTap!(index),
        child: contents,
      );
    }

    return Padding(padding: effectivePadding, child: contents);
  }

  Widget _buildSliverCarousel(ShadThemeData theme) {
    // Builds the sliver carousel using standard SliverFixedExtentList.
    // Provides proper fixed-extent layout without custom rendering issues.
    return SliverFixedExtentList(
      itemExtent: itemExtent,
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return _buildCarouselItem(index);
      }, childCount: widget.children.length),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final axisDirection = _getDirection(context);
    final physics =
        widget.physics ??
        ScrollConfiguration.of(context).getScrollPhysics(context);

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final mainAxisExtent = switch (_effectiveScrollDirection) {
          Axis.horizontal => constraints.maxWidth,
          Axis.vertical => constraints.maxHeight,
        };
        itemExtent = clampDouble(widget.itemExtent, 0, mainAxisExtent);

        final carousel = Scrollable(
          axisDirection: axisDirection,
          controller: controller,
          physics: physics,
          viewportBuilder: (context, position) {
            return Viewport(
              cacheExtent: itemExtent,
              cacheExtentStyle: CacheExtentStyle.viewport,
              axisDirection: axisDirection,
              offset: position,
              clipBehavior: widget.clipBehavior ?? Clip.antiAlias,
              slivers: <Widget>[_buildSliverCarousel(theme)],
            );
          },
        );

        return Flex(
          direction: widget.scrollDirection ?? Axis.horizontal,
          children: <Widget>[
            if (widget.leading != null) widget.leading!,
            Expanded(child: carousel),
            if (widget.trailing != null) widget.trailing!,
          ],
        );
      },
    );
  }
}

/// Custom scroll physics for carousel widgets.
///
/// Provides snapping behavior that snaps carousel items to discrete positions
/// when the user finishes scrolling. Items snap to their center position with
/// spring animation.
class CarouselScrollPhysics extends ScrollPhysics {
  const CarouselScrollPhysics({super.parent});

  @override
  CarouselScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return CarouselScrollPhysics(parent: buildParent(ancestor));
  }

  double _getTargetPixels(
    CarouselPosition position,
    Tolerance tolerance,
    double velocity,
  ) {
    // Calculates the target scroll position for snapping based on velocity.
    // Returns the pixel position where the item should snap to.
    double fraction;

    if (position.itemExtent != null) {
      fraction = position.itemExtent! / position.viewportDimension;
    } else {
      assert(position.flexWeights != null);
      fraction = position.flexWeights!.first / position.flexWeights!.sum;
    }

    final itemWidth = position.viewportDimension * fraction;

    final actual = math.max(0, position.pixels) / itemWidth;
    final round = actual.roundToDouble();
    double item;
    if ((actual - round).abs() < precisionErrorTolerance) {
      item = round;
    } else {
      item = actual;
    }
    if (velocity < -tolerance.velocity) {
      item -= 0.5;
    } else if (velocity > tolerance.velocity) {
      item += 0.5;
    }
    return item.roundToDouble() * itemWidth;
  }

  @override
  Simulation? createBallisticSimulation(
    ScrollMetrics position,
    double velocity,
  ) {
    assert(
      position is CarouselPosition,
      'CarouselScrollPhysics can only be used with Scrollables that uses '
      'the CarouselController',
    );

    final metrics = position as CarouselPosition;
    if ((velocity <= 0.0 && metrics.pixels <= metrics.minScrollExtent) ||
        (velocity >= 0.0 && metrics.pixels >= metrics.maxScrollExtent)) {
      return super.createBallisticSimulation(metrics, velocity);
    }

    final tolerance = toleranceFor(metrics);
    final target = _getTargetPixels(metrics, tolerance, velocity);
    if (target != metrics.pixels) {
      return ScrollSpringSimulation(
        spring,
        metrics.pixels,
        target,
        velocity,
        tolerance: tolerance,
      );
    }
    return null;
  }

  @override
  bool get allowImplicitScrolling => true;
}

/// Scroll metrics for carousel widgets.
///
/// Extends [FixedScrollMetrics] to include carousel-specific information
/// like item extent, flex weights, and max weight consumption mode.
class CarouselMetrics extends FixedScrollMetrics {
  CarouselMetrics({
    required super.minScrollExtent,
    required super.maxScrollExtent,
    required super.pixels,
    required super.viewportDimension,
    required super.axisDirection,
    this.itemExtent,
    this.flexWeights,
    this.consumeMaxWeight,
    required super.devicePixelRatio,
  });

  final double? itemExtent;
  final List<int>? flexWeights;
  final bool? consumeMaxWeight;

  @override
  CarouselMetrics copyWith({
    double? minScrollExtent,
    double? maxScrollExtent,
    double? pixels,
    double? viewportDimension,
    AxisDirection? axisDirection,
    double? itemExtent,
    List<int>? flexWeights,
    bool? consumeMaxWeight,
    double? devicePixelRatio,
  }) {
    return CarouselMetrics(
      minScrollExtent:
          minScrollExtent ??
          (hasContentDimensions ? this.minScrollExtent : null),
      maxScrollExtent:
          maxScrollExtent ??
          (hasContentDimensions ? this.maxScrollExtent : null),
      pixels: pixels ?? (hasPixels ? this.pixels : null),
      viewportDimension:
          viewportDimension ??
          (hasViewportDimension ? this.viewportDimension : null),
      axisDirection: axisDirection ?? this.axisDirection,
      itemExtent: itemExtent ?? this.itemExtent,
      flexWeights: flexWeights ?? this.flexWeights,
      consumeMaxWeight: consumeMaxWeight ?? this.consumeMaxWeight,
      devicePixelRatio: devicePixelRatio ?? this.devicePixelRatio,
    );
  }
}

/// Scroll position for carousel widgets.
///
/// Manages the scroll position and state for carousel scrolling. Handles item
/// extent updates, flex weights, and provides helper methods for converting
/// between item indices and pixel positions. Caches state for viewport resizing.
class CarouselPosition extends ScrollPositionWithSingleContext
    implements CarouselMetrics {
  CarouselPosition({
    required super.physics,
    required super.context,
    this.initialItem = 0,
    double? itemExtent,
    List<int>? flexWeights,
    bool consumeMaxWeight = true,
    super.oldPosition,
  }) : assert(
         flexWeights != null && itemExtent == null ||
             flexWeights == null && itemExtent != null,
       ),
       _itemToShowOnStartup = initialItem.toDouble(),
       _consumeMaxWeight = consumeMaxWeight,
       super(initialPixels: null);

  int initialItem;
  final double _itemToShowOnStartup;
  double? _cachedItem;

  @override
  bool get consumeMaxWeight => _consumeMaxWeight;
  bool _consumeMaxWeight;
  set consumeMaxWeight(bool value) {
    if (_consumeMaxWeight == value) {
      return;
    }
    if (hasPixels && flexWeights != null) {
      final leadingItem = updateLeadingItem(flexWeights, value);
      final newPixel = getPixelsFromItem(leadingItem, flexWeights, itemExtent);
      forcePixels(newPixel);
    }
    _consumeMaxWeight = value;
  }

  @override
  double? get itemExtent => _itemExtent;
  double? _itemExtent;
  set itemExtent(double? value) {
    if (_itemExtent == value) {
      return;
    }
    if (hasPixels && _itemExtent != null && viewportDimension != 0.0) {
      final leadingItem = getItemFromPixels(pixels, viewportDimension);
      final newPixel = getPixelsFromItem(leadingItem, flexWeights, value);
      forcePixels(newPixel);
    }
    _itemExtent = value;
  }

  @override
  List<int>? get flexWeights => _flexWeights;
  List<int>? _flexWeights;
  set flexWeights(List<int>? value) {
    if (flexWeights == value) {
      return;
    }
    final oldWeights = _flexWeights;
    if (hasPixels && oldWeights != null) {
      final leadingItem = updateLeadingItem(value, consumeMaxWeight);
      final newPixel = getPixelsFromItem(leadingItem, value, itemExtent);
      forcePixels(newPixel);
    }
    _flexWeights = value;
  }

  double updateLeadingItem(
    List<int>? newFlexWeights,
    bool newConsumeMaxWeight,
  ) {
    // Calculates the leading item index when weights or consume mode changes.
    // Ensures smooth transition of visible items during layout updates.
    final double maxItem;
    if (hasPixels && flexWeights != null) {
      final leadingItem = getItemFromPixels(pixels, viewportDimension);
      maxItem = consumeMaxWeight
          ? leadingItem
          : leadingItem + flexWeights!.indexOf(flexWeights!.max);
    } else {
      maxItem = _itemToShowOnStartup;
    }
    if (newFlexWeights != null && !newConsumeMaxWeight) {
      var smallerWeights = 0;
      for (final weight in newFlexWeights) {
        if (weight == newFlexWeights.max) {
          break;
        }
        smallerWeights += 1;
      }
      return maxItem - smallerWeights;
    }
    return maxItem;
  }

  double getItemFromPixels(double pixels, double viewportDimension) {
    // Converts a scroll pixel position to the corresponding item index (as a double).
    // Handles both fixed-extent and weighted layout modes.
    assert(viewportDimension > 0.0);
    double fraction;
    if (itemExtent != null) {
      fraction = itemExtent! / viewportDimension;
    } else {
      assert(flexWeights != null);
      fraction = flexWeights!.first / flexWeights!.sum;
    }

    final actual = math.max(0, pixels) / (viewportDimension * fraction);
    final round = actual.roundToDouble();
    if ((actual - round).abs() < precisionErrorTolerance) {
      return round;
    }
    return actual;
  }

  double getPixelsFromItem(
    double item,
    List<int>? flexWeights,
    double? itemExtent,
  ) {
    // Converts an item index (as a double) to the corresponding scroll pixel position.
    // Inverse operation of [getItemFromPixels].
    double fraction;
    if (viewportDimension == 0.0) {
      return 0;
    }
    if (itemExtent != null) {
      fraction = itemExtent / viewportDimension;
    } else {
      assert(flexWeights != null);
      fraction = flexWeights!.first / flexWeights.sum;
    }

    return item * viewportDimension * fraction;
  }

  @override
  bool applyViewportDimension(double viewportDimension) {
    final oldViewportDimensions = hasViewportDimension
        ? this.viewportDimension
        : null;
    if (viewportDimension == oldViewportDimensions) {
      return true;
    }
    final result = super.applyViewportDimension(viewportDimension);
    final oldPixels = hasPixels ? pixels : null;
    double item;
    if (oldPixels == null) {
      item = updateLeadingItem(flexWeights, consumeMaxWeight);
    } else if (oldViewportDimensions == 0.0) {
      item = _cachedItem!;
    } else {
      item = getItemFromPixels(
        oldPixels,
        oldViewportDimensions ?? viewportDimension,
      );
    }
    final newPixels = getPixelsFromItem(item, flexWeights, itemExtent);
    _cachedItem = (viewportDimension == 0.0) ? item : null;

    if (newPixels != oldPixels) {
      correctPixels(newPixels);
      return false;
    }
    return result;
  }

  @override
  void absorb(ScrollPosition other) {
    super.absorb(other);

    if (other is! CarouselPosition) {
      return;
    }

    _cachedItem = other._cachedItem;
    _itemExtent = other._itemExtent;
  }

  @override
  CarouselMetrics copyWith({
    double? minScrollExtent,
    double? maxScrollExtent,
    double? pixels,
    double? viewportDimension,
    AxisDirection? axisDirection,
    double? itemExtent,
    List<int>? flexWeights,
    bool? consumeMaxWeight,
    double? devicePixelRatio,
  }) {
    return CarouselMetrics(
      minScrollExtent:
          minScrollExtent ??
          (hasContentDimensions ? this.minScrollExtent : null),
      maxScrollExtent:
          maxScrollExtent ??
          (hasContentDimensions ? this.maxScrollExtent : null),
      pixels: pixels ?? (hasPixels ? this.pixels : null),
      viewportDimension:
          viewportDimension ??
          (hasViewportDimension ? this.viewportDimension : null),
      axisDirection: axisDirection ?? this.axisDirection,
      itemExtent: itemExtent ?? this.itemExtent,
      flexWeights: flexWeights ?? this.flexWeights,
      consumeMaxWeight: consumeMaxWeight ?? this.consumeMaxWeight,
      devicePixelRatio: devicePixelRatio ?? this.devicePixelRatio,
    );
  }
}

/// Controller for [ShadCarousel] widget.
///
/// Provides programmatic control over carousel item navigation and scroll position.
/// Use this controller to animate to specific items or listen to scroll events.
class ShadCarouselController extends ScrollController {
  /// Creates a carousel controller.
  ///
  /// The [initialItem] specifies which item should be displayed when the carousel
  /// is first rendered. Defaults to 0 (first item).
  ShadCarouselController({this.initialItem = 0});

  /// The item index to display initially.
  final int initialItem;

  _ShadCarouselState? _carouselState;

  void _attach(_ShadCarouselState anchor) {
    _carouselState = anchor;
  }

  void _detach(_ShadCarouselState anchor) {
    if (_carouselState == anchor) {
      _carouselState = null;
    }
  }

  Future<void> animateToItem(
    int index, {
    Duration duration = const Duration(milliseconds: 300),
    Curve curve = Curves.ease,
  }) async {
    if (!hasClients || _carouselState == null) {
      return;
    }

    final clampedIndex = index.clamp(
      0,
      _carouselState!.widget.children.length - 1,
    );
    await Future.wait<void>(<Future<void>>[
      for (final CarouselPosition position
          in positions.cast<CarouselPosition>())
        position.animateTo(
          _getTargetOffset(position, clampedIndex, false),
          duration: duration,
          curve: curve,
        ),
    ]);
  }

  Future<void> nextItem({
    Duration duration = const Duration(milliseconds: 300),
    Curve curve = Curves.ease,
  }) async {
    if (!hasClients || _carouselState == null) {
      return;
    }

    final position = positions.first as CarouselPosition;
    final itemCount = _carouselState!.widget.children.length;

    final currentItem = position.pixels / (_carouselState?.itemExtent ?? 1.0);

    final nextItemIndex = (currentItem.round() + 1).clamp(0, itemCount - 1);
    await animateToItem(nextItemIndex, duration: duration, curve: curve);
  }

  Future<void> previousItem({
    Duration duration = const Duration(milliseconds: 300),
    Curve curve = Curves.ease,
  }) async {
    if (!hasClients || _carouselState == null) {
      return;
    }

    final position = positions.first as CarouselPosition;
    final itemCount = _carouselState!.widget.children.length;

    final currentItem = position.pixels / (_carouselState?.itemExtent ?? 1.0);

    final previousItemIndex = (currentItem.round() - 1).clamp(0, itemCount - 1);
    await animateToItem(previousItemIndex, duration: duration, curve: curve);
  }

  double _getTargetOffset(
    CarouselPosition position,
    int index,
    bool hasFlexWeights,
  ) {
    return index * (_carouselState?.itemExtent ?? 1.0);
  }

  @override
  ScrollPosition createScrollPosition(
    ScrollPhysics physics,
    ScrollContext context,
    ScrollPosition? oldPosition,
  ) {
    assert(_carouselState != null);
    return CarouselPosition(
      physics: physics,
      context: context,
      initialItem: initialItem,
      itemExtent: _carouselState!.itemExtent,
      consumeMaxWeight: _carouselState!.consumeMaxWeight,
      oldPosition: oldPosition,
    );
  }

  @override
  void attach(ScrollPosition position) {
    super.attach(position);
    final carouselPosition = position as CarouselPosition;
    carouselPosition.itemExtent = _carouselState!.itemExtent;
    carouselPosition.consumeMaxWeight = _carouselState!.consumeMaxWeight;
  }
}
