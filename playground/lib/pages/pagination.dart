import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class PaginationPage extends StatelessWidget {
  const PaginationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PaginationExample();
  }
}

class PaginationExample extends StatefulWidget {
  const PaginationExample({super.key});

  @override
  State<PaginationExample> createState() => _PaginationExampleState();
}

class _PaginationExampleState extends State<PaginationExample> {
  final ShadPaginationController _controller = ShadPaginationController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Pagination Example',
          style: ShadTheme.of(context).textTheme.h2,
        ),
        const SizedBox(height: 20),
        // Add your pagination widget implementation here
        ShadPagination(
          totalPages: 10,
          initialPage: 1,
          controller: _controller,
          onPageChanged: (value) {
            print('Page changed to ${value + 1}');
          },
        ),
      ],
    );
  }
}
