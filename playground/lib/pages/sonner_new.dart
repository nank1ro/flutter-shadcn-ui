import 'dart:math';

import 'package:flutter/material.dart';

import 'package:shadcn_ui/shadcn_ui.dart';

class SonnerNewPage extends StatelessWidget {
  const SonnerNewPage({super.key});

  /// Runs a synchronized comparison test on both Old and New Sonner
  void _runComparisonTest(BuildContext context) async {
    final oldSonner = ShadSonner.of(context);
    final newSonner = ShadSonnerNew.of(context);

    // Test 1: Add single toast to both
    await Future.delayed(const Duration(milliseconds: 500));
    oldSonner.show(
      ShadToast(
        id: UniqueKey(),
        title: const Text('Toast 1 - Single'),
        description: const Text('Testing basic entry animation'),
      ),
    );
    newSonner.show(
      ShadToast(
        id: UniqueKey(),
        title: const Text('Toast 1 - Single'),
        description: const Text('Testing basic entry animation'),
      ),
    );

    // Test 2: Add 3 toasts rapidly (tests stacking)
    await Future.delayed(const Duration(seconds: 2));
    for (var i = 2; i <= 4; i++) {
      await Future.delayed(const Duration(milliseconds: 150));
      oldSonner.show(
        ShadToast(
          id: UniqueKey(),
          title: Text('Toast $i - Rapid'),
          description: const Text('Testing stack animation'),
        ),
      );
      newSonner.show(
        ShadToast(
          id: UniqueKey(),
          title: Text('Toast $i - Rapid'),
          description: const Text('Testing stack animation'),
        ),
      );
    }

    // Test 3: Expand stacks (simulate hover)
    await Future.delayed(const Duration(seconds: 1));
    oldSonner.setExpanded(true);
    newSonner.setExpanded(true);

    // Hold expanded for 2 seconds
    await Future.delayed(const Duration(seconds: 2));

    // Collapse stacks
    oldSonner.setExpanded(false);
    newSonner.setExpanded(false);

    // Test 4: Add a long toast (tests height normalization)
    await Future.delayed(const Duration(seconds: 2));
    oldSonner.show(
      ShadToast(
        id: UniqueKey(),
        title: const Text('Long Toast - Height normalization test test test'),
        description: const Text(
          'This tests how variable heights are handledhandledhandledhandledhandledhandled handledhandledhandledhandledhandledhandled handledhandledhandled',
        ),
      ),
    );
    newSonner.show(
      ShadToast(
        id: UniqueKey(),
        title: const Text('Long Toast - Height normalization test test test'),
        description: const Text(
          'This tests how variable heights are handledhandledhandledhandledhandledhandled handledhandledhandledhandledhandledhandled handledhandledhandled',
        ),
      ),
    );

    // Test 5: Expand again with mixed heights
    await Future.delayed(const Duration(seconds: 1));
    oldSonner.setExpanded(true);
    newSonner.setExpanded(true);

    await Future.delayed(const Duration(seconds: 2));

    oldSonner.setExpanded(false);
    newSonner.setExpanded(false);

    // Test 6: Add while stack is at max (tests overflow/hidden queue)
    await Future.delayed(const Duration(seconds: 2));
    for (var i = 5; i <= 6; i++) {
      await Future.delayed(const Duration(milliseconds: 200));
      oldSonner.show(
        ShadToast(
          id: UniqueKey(),
          title: Text('Toast $i - Overflow'),
          description: const Text('Testing hidden toast queue'),
        ),
      );
      newSonner.show(
        ShadToast(
          id: UniqueKey(),
          title: Text('Toast $i - Overflow'),
          description: const Text('Testing hidden toast queue'),
        ),
      );
    }

    // Test complete - toasts will auto-dismiss
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 32),
                // COMPARISON TEST BUTTON
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        '🎬 Comparison Test',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Adds toasts to BOTH Old and New Sonner simultaneously.\n'
                        'Position Old (top-right) and New (bottom-left) for recording.',
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      ShadButton(
                        size: ShadButtonSize.lg,
                        child: const Text('▶ Run Comparison Test'),
                        onPressed: () => _runComparisonTest(context),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 48),
                const Text(
                  'Sonner New (Motor Physics)',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Physics-based spring animations with swipe-to-dismiss',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  alignment: WrapAlignment.center,
                  children: [
                    ShadButton.outline(
                      child: const Text('Add Toast'),
                      onPressed: () {
                        final sonner = ShadSonnerNew.of(context);
                        final id = Random().nextInt(10000);
                        final now = DateTime.now();
                        sonner.show(
                          ShadToast(
                            id: id,
                            title: const Text('Event has been created'),
                            description: Text(
                              DateFormat.yMd().add_jms().format(now),
                            ),
                            action: ShadButton(
                              child: const Text('Undo'),
                              onPressed: () => sonner.hide(id),
                            ),
                          ),
                        );
                      },
                    ),
                    ShadButton.outline(
                      child: const Text('Add Long Toast'),
                      onPressed: () {
                        final sonner = ShadSonnerNew.of(context);
                        final id = Random().nextInt(10000);
                        final now = DateTime.now();
                        sonner.show(
                          ShadToast(
                            id: id,
                            title: const Text(
                              'Event has been created created created created created created created created created created created',
                            ),
                            description: Text(
                              DateFormat.yMd().add_jms().format(now),
                            ),
                            action: ShadButton(
                              child: const Text('Undo'),
                              onPressed: () => sonner.hide(id),
                            ),
                          ),
                        );
                      },
                    ),
                    ShadButton.outline(
                      child: const Text('Add 3 Rapidly'),
                      onPressed: () {
                        final sonner = ShadSonnerNew.of(context);
                        for (var i = 0; i < 3; i++) {
                          Future.delayed(Duration(milliseconds: i * 100), () {
                            final id = Random().nextInt(10000);
                            sonner.show(
                              ShadToast(
                                id: id,
                                title: Text('Toast ${i + 1}'),
                                description: const Text('Added rapidly'),
                              ),
                            );
                          });
                        }
                      },
                    ),
                    ShadButton.destructive(
                      child: const Text('Destructive'),
                      onPressed: () {
                        final sonner = ShadSonnerNew.of(context);
                        final id = Random().nextInt(10000);
                        sonner.show(
                          ShadToast.destructive(
                            id: id,
                            title: const Text('Error occurred'),
                            description: const Text('Something went wrong!'),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 48),
                const Text(
                  'Old Sonner (AnimationController)',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  alignment: WrapAlignment.center,
                  children: [
                    ShadButton.outline(
                      child: const Text('Add Toast'),
                      onPressed: () {
                        final sonner = ShadSonner.of(context);
                        final id = Random().nextInt(10000);
                        final now = DateTime.now();
                        sonner.show(
                          ShadToast(
                            id: id,
                            title: const Text('Event has been created'),
                            description: Text(
                              DateFormat.yMd().add_jms().format(now),
                            ),
                            action: ShadButton(
                              child: const Text('Undo'),
                              onPressed: () => sonner.hide(id),
                            ),
                          ),
                        );
                      },
                    ),
                    ShadButton.outline(
                      child: const Text('Add Long Toast'),
                      onPressed: () {
                        final sonner = ShadSonner.of(context);
                        final id = Random().nextInt(10000);
                        final now = DateTime.now();
                        sonner.show(
                          ShadToast(
                            id: id,
                            title: const Text(
                              'Event has been created created created created created created created created created created created',
                            ),
                            description: Text(
                              DateFormat.yMd().add_jms().format(now),
                            ),
                            action: ShadButton(
                              child: const Text('Undo'),
                              onPressed: () => sonner.hide(id),
                            ),
                          ),
                        );
                      },
                    ),
                    ShadButton.outline(
                      child: const Text('Add 3 Rapidly'),
                      onPressed: () {
                        final sonner = ShadSonner.of(context);
                        for (var i = 0; i < 3; i++) {
                          Future.delayed(Duration(milliseconds: i * 100), () {
                            final id = Random().nextInt(10000);
                            sonner.show(
                              ShadToast(
                                id: id,
                                title: Text('Toast ${i + 1}'),
                                description: const Text('Added rapidly'),
                              ),
                            );
                          });
                        }
                      },
                    ),
                    ShadButton.destructive(
                      child: const Text('Destructive'),
                      onPressed: () {
                        final sonner = ShadSonner.of(context);
                        final id = Random().nextInt(10000);
                        sonner.show(
                          ShadToast.destructive(
                            id: id,
                            title: const Text('Error occurred'),
                            description: const Text('Something went wrong!'),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 48),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Theme.of(
                      context,
                    ).colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tips:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text('• Hover over toasts to expand the stack'),
                      Text('• Swipe down to dismiss a toast'),
                      Text(
                        '• Click "Add 3 Rapidly" to see interruptible springs',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
