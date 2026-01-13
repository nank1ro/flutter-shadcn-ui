import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

enum CarouselStyle {
  horizontal,
  vertical,
}

class CarouselPage extends StatefulWidget {
  const CarouselPage({super.key});

  @override
  State<CarouselPage> createState() => _CarouselPageState();
}

class _CarouselPageState extends State<CarouselPage> {
  final ShadCarouselController horizontalController = ShadCarouselController();
  final ShadCarouselController verticalController = ShadCarouselController();

  CarouselStyle _style = CarouselStyle.horizontal;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    horizontalController.dispose();
    verticalController.dispose();
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Style: '),
              DropdownButton<CarouselStyle>(
                value: _style,
                onChanged: (CarouselStyle? value) {
                  if (value != null) {
                    setState(() {
                      _style = value;
                    });
                  }
                },
                items: const [
                  DropdownMenuItem(
                    value: CarouselStyle.horizontal,
                    child: Text('Horizontal'),
                  ),
                  DropdownMenuItem(
                    value: CarouselStyle.vertical,
                    child: Text('Vertical'),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text('Example of a carousel with cards.'),
          SizedBox(
            height: 200,
            child: ShadCarousel(
              itemExtent: 150,
              controller: _style == CarouselStyle.horizontal
                  ? horizontalController
                  : verticalController,
              scrollDirection: _style == CarouselStyle.horizontal
                  ? Axis.horizontal
                  : Axis.vertical,
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
