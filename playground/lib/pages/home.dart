import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:playground/routes.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final routesWithoutHome = [...routes]..removeAt(0);

    return Scaffold(
      body: GridView.builder(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          mainAxisExtent: 200,
          maxCrossAxisExtent: 300,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        itemCount: routesWithoutHome.length,
        itemBuilder: (context, index) => ShadGestureDetector(
          cursor: SystemMouseCursors.click,
          onTap: () => context.go(routesWithoutHome[index].path),
          child: ShadCard(
            title: Text(
              routesWithoutHome[index].path.substring(1),
            ),
          ),
        ),
      ),
    );
  }
}
