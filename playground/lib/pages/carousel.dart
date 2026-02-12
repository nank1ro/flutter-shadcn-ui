import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class CarouselPage extends StatefulWidget {
  CarouselPage({super.key});

  @override
  State<CarouselPage> createState() => _CarouselPageState();
}

class _CarouselPageState extends State<CarouselPage> {
  late ShadCarouselController controller;

  @override
  void initState() {
    super.initState();
    controller = ShadCarouselController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carousel'),
      ),
      body: Column(
        children: [
          Text('Example of a horizontal carousel with cards.'),
          SizedBox(
            height: 200,
            child: ShadCarousel(
              itemExtent: 150,
              controller: controller,
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
              controller: controller,
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
      ),
    );
  }
}
