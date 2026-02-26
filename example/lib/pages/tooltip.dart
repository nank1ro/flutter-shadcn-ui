import 'package:example/common/base_scaffold.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class TooltipPage extends StatefulWidget {
  const TooltipPage({super.key});

  @override
  State<TooltipPage> createState() => _TooltipPageState();
}

class _TooltipPageState extends State<TooltipPage> {

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBarTitle: 'Tooltip',
      children: [
        ShadTooltip(
          builder: (context) => const Text('Add to library'),
          child: ShadButton.outline(
            child: const Text('Hover/Focus'),
          ),
        ),
        ShadTooltip(
          anchor: ShadAnchorAuto(
            offset: Offset(0, 4),
            followerAnchor: Alignment.bottomCenter,
            targetAnchor: Alignment.bottomCenter,
          ),
          builder: (context) => const Text('Add to library'),
          child: ShadButton.outline(
            child: const Text('Hover/Focus'),
          ),
        ),
      ],
    );
  }
}
