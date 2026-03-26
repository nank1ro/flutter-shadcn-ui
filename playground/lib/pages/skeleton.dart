import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class SkeletonPage extends StatelessWidget {
  const SkeletonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 200,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShadSkeleton(
                  width: 40,
                  height: 40,
                  borderRadius: BorderRadius.circular(20),
                ),
                const SizedBox(width: 16),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShadSkeleton(width: 150, height: 16),
                    SizedBox(height: 8),
                    ShadSkeleton(width: 100, height: 16),
                  ],
                ),
              ],
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 320),
              child: SizedBox(
                width: double.infinity,
                child: ShadCard(
                  columnCrossAxisAlignment: CrossAxisAlignment.stretch,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final w = constraints.maxWidth;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ShadSkeleton(
                            width: w * 2 / 3,
                            height: 16,
                          ),
                          const SizedBox(height: 4),
                          ShadSkeleton(width: w * 0.5, height: 16),
                          const SizedBox(
                            height: 16,
                          ),
                          AspectRatio(
                            aspectRatio: 16 / 9,
                            child: ShadSkeleton(
                              width: w,
                              height: w * 9 / 16,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
