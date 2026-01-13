import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../common/base_scaffold.dart';

class CarouselPage extends StatefulWidget {
  const CarouselPage({super.key});

  @override
  State<CarouselPage> createState() => _CarouselPageState();
}

class _CarouselPageState extends State<CarouselPage> {
  late final ShadCarouselController horizontalCarouselController =
      ShadCarouselController();
  late final ShadCarouselController verticalCarouselController =
      ShadCarouselController();

  @override
  dispose() {
    horizontalCarouselController.dispose();
    verticalCarouselController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBarTitle: 'Carousel',
      children: [
        Text('Example of a horizontal carousel with cards.'),
        SizedBox(
          height: 200,
          child: ShadCarousel(
            itemExtent: 150,
            controller: horizontalCarouselController,
            children: List.generate(
              10,
              (index) => ShadCard(
                child: Center(
                  child: Text(
                    'Item ${index + 1}',
                    style: ShadTheme.of(
                      context,
                    ).textTheme.small.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Text('Example of a vertical carousel with cards.'),
        SizedBox(
          height: 200,
          child: ShadCarousel(
            itemExtent: 150,
            controller: verticalCarouselController,
            scrollDirection: Axis.vertical,
            children: List.generate(
              10,
              (index) => ShadCard(
                child: Center(
                  child: Text(
                    'Item ${index + 1}',
                    style: ShadTheme.of(
                      context,
                    ).textTheme.small.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
