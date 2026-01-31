import 'package:flutter/material.dart';
import 'package:motor/motor.dart';

/// A playground for learning motor library spring physics.
///
/// This page demonstrates the differences between:
/// 1. Curve-based animations (traditional Flutter)
/// 2. Spring-based animations (motor library)
///
/// Try rapidly clicking the toggle button to see how springs handle
/// interruption more gracefully than curves.
class MotorPlaygroundPage extends StatefulWidget {
  const MotorPlaygroundPage({super.key});

  @override
  State<MotorPlaygroundPage> createState() => _MotorPlaygroundPageState();
}

class _MotorPlaygroundPageState extends State<MotorPlaygroundPage> {
  bool expanded = false;
  int toastCount = 1;
  bool isHovered = false;

  // Gap between toasts
  static const double gap = 12.0;
  // Height of each toast
  static const double toastHeight = 72.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Motor Physics Playground'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ===============================================================
            // LESSON 1: Spring vs Curve Comparison
            // ===============================================================
            _buildSectionHeader('Lesson 1: Spring vs Curve Comparison'),
            const Text(
              'Rapidly click the toggle button to see how springs handle '
              'interruption gracefully while curves "snap" or restart.',
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => setState(() => expanded = !expanded),
              child: Text(expanded ? 'Collapse' : 'Expand'),
            ),
            const SizedBox(height: 24),
            SingleMotionBuilder(
              motion: const Motion.snappySpring(
                duration: Duration(milliseconds: 100),
              ),
              value: expanded ? 300.0 : 60.0,
              builder: (context, width, child) {
                return SingleMotionBuilder(
                  motion: const Motion.bouncySpring(),
                  value: expanded ? 200.0 : 60.0,
                  builder: (context, height, child) {
                    return Container(
                      height: height,
                      width: width,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        'Motion.snappySpring()',
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  },
                );
              },
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Curve-based animation
                Expanded(
                  child: Column(
                    children: [
                      const Text(
                        'Curve Animation',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeOutCubic,
                        height: expanded ? 200 : 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          'Curves.easeOutCubic',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                // Spring-based animation
                Expanded(
                  child: Column(
                    children: [
                      const Text(
                        'Spring Animation',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      SingleMotionBuilder(
                        motion: const Motion.snappySpring(),
                        value: expanded ? 200.0 : 60.0,
                        builder: (context, height, child) {
                          return Container(
                            height: height,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            alignment: Alignment.center,
                            child: const Text(
                              'Motion.snappySpring()',
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 48),

            // ===============================================================
            // LESSON 2: Different Spring Types
            // ===============================================================
            _buildSectionHeader('Lesson 2: Spring Types'),
            const Text(
              'Different springs have different "feel". Try each one:',
            ),
            const SizedBox(height: 16),
            _buildSpringRow('snappySpring()', const Motion.snappySpring()),
            _buildSpringRow('bouncySpring()', const Motion.bouncySpring()),
            _buildSpringRow(
              'CupertinoMotion.smooth()',
              const CupertinoMotion.smooth(),
            ),
            _buildSpringRow(
              'CupertinoMotion.bouncy()',
              const CupertinoMotion.bouncy(),
            ),
            const SizedBox(height: 48),

            // ===============================================================
            // LESSON 3: Toast Stack Simulation
            // ===============================================================
            _buildSectionHeader('Lesson 3: Toast Stack Simulation'),
            const Text(
              'This simulates toast stacking behavior. Hover/tap the stack '
              'to expand, add toasts and watch them animate into position.',
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () => setState(() {
                    if (toastCount < 5) toastCount++;
                  }),
                  child: const Text('Add Toast'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () => setState(() {
                    if (toastCount > 1) toastCount--;
                  }),
                  child: const Text('Remove Toast'),
                ),
                const SizedBox(width: 16),
                Text('Count: $toastCount'),
              ],
            ),
            const SizedBox(height: 16),
            _buildToastStack(),
            const SizedBox(height: 48),

            // ===============================================================
            // LESSON 4: Position Calculation
            // ===============================================================
            _buildSectionHeader('Lesson 4: Understanding Position Calculation'),
            const Text(
              'Each toast\'s Y position is calculated based on:\n'
              '• Collapsed: positionedIndex * gap\n'
              '• Expanded: sum of all heights above + gaps\n\n'
              'The spring animates TO the calculated target position.',
              style: TextStyle(fontFamily: 'monospace'),
            ),
            const SizedBox(height: 16),
            _buildPositionDebugView(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }

  Widget _buildSpringRow(String label, Motion motion) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          SizedBox(
            width: 180,
            child: Text(label, style: const TextStyle(fontFamily: 'monospace')),
          ),
          Expanded(
            child: SingleMotionBuilder(
              motion: motion,
              value: expanded ? 1.0 : 0.0,
              builder: (context, progress, child) {
                return Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: Color.lerp(
                      Colors.grey[300],
                      Colors.purple,
                      progress,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: FractionallySizedBox(
                    widthFactor: 0.1 + (progress * 0.9),
                    child: Container(
                      height: 24,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildToastStack() {
    // Calculate total height for the container
    final collapsedHeight = toastHeight + (toastCount - 1) * gap + 20;
    final expandedHeight = toastCount * (toastHeight + gap) + 20;

    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: () => setState(() => isHovered = !isHovered),
        child: SingleMotionBuilder(
          motion: const Motion.snappySpring(),
          value: isHovered ? expandedHeight : collapsedHeight,
          builder: (context, height, _) {
            return Container(
              height: height,
              width: 350,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: isHovered ? Colors.blue : Colors.grey[400]!,
                  width: 2,
                ),
              ),
              child: Stack(
                clipBehavior: Clip.none,
                children: List.generate(toastCount, (index) {
                  // Position from bottom (newest toast at bottom)
                  final positionedIndex = toastCount - 1 - index;

                  // Calculate target Y position
                  final targetY = _calculateToastY(
                    positionedIndex: positionedIndex,
                    isHovered: isHovered,
                  );

                  // Calculate scale (collapsed = smaller for older toasts)
                  final targetScale = isHovered
                      ? 1.0
                      : 1.0 - (positionedIndex * 0.03);

                  return _buildAnimatedToast(
                    index: index,
                    targetY: targetY,
                    targetScale: targetScale,
                    positionedIndex: positionedIndex,
                  );
                }),
              ),
            );
          },
        ),
      ),
    );
  }

  double _calculateToastY({
    required int positionedIndex,
    required bool isHovered,
  }) {
    if (isHovered) {
      // Expanded: each toast gets its full height + gap
      return positionedIndex * (toastHeight + gap);
    } else {
      // Collapsed: only gaps are visible
      return positionedIndex * gap;
    }
  }

  Widget _buildAnimatedToast({
    required int index,
    required double targetY,
    required double targetScale,
    required int positionedIndex,
  }) {
    // Using the pattern from zentoast: function that returns Widget + .motion()
    return (double y, double scale) {
      return Positioned(
        bottom: y,
        left: 0,
        right: 0,
        child: Transform.scale(
          scale: scale,
          alignment: Alignment.bottomCenter,
          child: Container(
            height: toastHeight,
            decoration: BoxDecoration(
              color: _toastColors[index % _toastColors.length],
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Toast ${index + 1}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Position: $positionedIndex | Y: ${targetY.toStringAsFixed(1)}',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white.withValues(alpha: 0.8),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }.motion(
      MotionArgument.single(targetY, const Motion.snappySpring()),
      MotionArgument.single(targetScale, const Motion.snappySpring()),
    );
  }

  Widget _buildPositionDebugView() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Current State: ${isHovered ? "EXPANDED" : "COLLAPSED"}',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          for (var i = 0; i < toastCount; i++)
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text(
                'Toast $i: positionedIndex=${toastCount - 1 - i}, '
                'Y=${_calculateToastY(
                  positionedIndex: toastCount - 1 - i,
                  isHovered: isHovered,
                ).toStringAsFixed(1)}',
                style: const TextStyle(fontFamily: 'monospace', fontSize: 12),
              ),
            ),
        ],
      ),
    );
  }

  static const List<Color> _toastColors = [
    Color(0xFF6366F1), // Indigo
    Color(0xFF8B5CF6), // Violet
    Color(0xFFEC4899), // Pink
    Color(0xFFF97316), // Orange
    Color(0xFF10B981), // Emerald
  ];
}

// =============================================================================
// Motor Function Extension (from zentoast pattern)
// =============================================================================
// This allows calling .motion() on a function that returns a Widget.
// It's a cleaner API than nesting MotionBuilder widgets.

typedef MotionFunction2Builder<T1 extends Object, T2 extends Object> =
    Widget Function(T1, T2);

extension MotionFunction2<T1 extends Object, T2 extends Object>
    on MotionFunction2Builder<T1, T2> {
  Widget motion(MotionArgument<T1> c1, MotionArgument<T2> c2) {
    return MotionBuilder<T1>(
      value: c1.value,
      motion: c1.motion,
      converter: c1.converter,
      builder: (context, value1, _) => MotionBuilder<T2>(
        value: c2.value,
        motion: c2.motion,
        converter: c2.converter,
        builder: (context, value2, _) => this(value1, value2),
      ),
    );
  }
}

/// Helper class for motion arguments
class MotionArgument<T> {
  const MotionArgument(
    this.value,
    this.converter, [
    this.motion = const Motion.bouncySpring(),
  ]);

  static MotionArgument<double> single(
    double value, [
    Motion motion = const Motion.bouncySpring(),
  ]) => MotionArgument<double>(value, MotionConverter.single, motion);

  static MotionArgument<Offset> offset(
    Offset value, [
    Motion motion = const Motion.bouncySpring(),
  ]) => MotionArgument<Offset>(value, MotionConverter.offset, motion);

  final T value;
  final Motion motion;
  final MotionConverter<T> converter;
}
