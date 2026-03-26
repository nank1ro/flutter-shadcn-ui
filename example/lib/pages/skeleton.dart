import 'package:example/common/base_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class SkeletonPage extends StatelessWidget {
  const SkeletonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBarTitle: 'Skeleton',
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShadSkeleton(
              width: 48,
              height: 48,
              borderRadius: BorderRadius.circular(24),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ShadSkeleton(width: 250, height: 16),
                const SizedBox(height: 8),
                const ShadSkeleton(width: 200, height: 16),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
