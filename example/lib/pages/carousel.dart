import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../common/base_scaffold.dart';

class CarouselPage extends StatefulWidget {
  const CarouselPage({super.key});

  @override
  State<CarouselPage> createState() => _CarouselPageState();
}

class _CarouselPageState extends State<CarouselPage> {
  late ShadCarouselController _verticalController;
  late ShadCarouselController _horizontalController;

  @override
  void initState() {
    super.initState();
    _verticalController = ShadCarouselController();
    _horizontalController = ShadCarouselController();
  }

  @override
  void dispose() {
    _verticalController.dispose();
    _horizontalController.dispose();
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
            controller: _horizontalController,
            showNextButton: false,
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
            controller: _verticalController,
            scrollDirection: Axis.vertical,
            showNextButton: false,
            showPreviousButton: false,
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
