import 'package:flutter/material.dart';

import 'package:shadcn_ui/shadcn_ui.dart';

enum ShadResizableStyle {
  basic,
  vertical,
  handle,
}

class ResizablePage extends StatelessWidget {
  const ResizablePage({
    super.key,
    required this.style,
  });

  final ShadResizableStyle style;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 600),
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: switch (style) {
            ShadResizableStyle.basic => const BasicResizable(),
            ShadResizableStyle.vertical => const VerticalResizable(),
            ShadResizableStyle.handle => const HandleResizable(),
          },
        ),
      ),
    );
  }
}

class BasicResizable extends StatelessWidget {
  const BasicResizable({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 200),
      child: ShadDecorator(
        decoration: ShadDecoration(
          border: ShadBorder.all(
            color: theme.colorScheme.border,
            radius: theme.radius,
          ),
        ),
        child: ClipRRect(
          borderRadius: theme.radius,
          child: ShadResizablePanelGroup(
            children: [
              ShadResizablePanel(
                defaultSize: .5,
                minSize: .2,
                maxSize: .8,
                child: Center(
                  child: Text('One', style: theme.textTheme.large),
                ),
              ),
              ShadResizablePanel(
                defaultSize: .5,
                child: ShadResizablePanelGroup(
                  axis: Axis.vertical,
                  children: [
                    ShadResizablePanel(
                      defaultSize: .3,
                      child: Center(
                          child: Text('Two', style: theme.textTheme.large)),
                    ),
                    ShadResizablePanel(
                      defaultSize: .7,
                      child: Align(
                          child: Text('Three', style: theme.textTheme.large)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class VerticalResizable extends StatelessWidget {
  const VerticalResizable({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 200),
      child: ShadDecorator(
        decoration: ShadDecoration(
          border: ShadBorder.all(
            color: theme.colorScheme.border,
            radius: theme.radius,
          ),
        ),
        child: ClipRRect(
          borderRadius: theme.radius,
          child: ShadResizablePanelGroup(
            axis: Axis.vertical,
            children: [
              ShadResizablePanel(
                defaultSize: 0.3,
                minSize: 0.1,
                child: Center(
                  child: Text('Header', style: theme.textTheme.large),
                ),
              ),
              ShadResizablePanel(
                defaultSize: 0.7,
                minSize: 0.1,
                child: Center(
                  child: Text('Footer', style: theme.textTheme.large),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HandleResizable extends StatelessWidget {
  const HandleResizable({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 200),
      child: ShadDecorator(
        decoration: ShadDecoration(
          border: ShadBorder.all(
            width: 1,
            color: theme.colorScheme.border,
            radius: theme.radius,
          ),
        ),
        child: ClipRRect(
          borderRadius: theme.radius,
          child: ShadResizablePanelGroup(
            showHandle: true,
            children: [
              ShadResizablePanel(
                defaultSize: .5,
                minSize: .2,
                child: Center(
                  child: Text('Sidebar', style: theme.textTheme.large),
                ),
              ),
              ShadResizablePanel(
                defaultSize: .5,
                minSize: .2,
                child: Center(
                  child: Text('Content', style: theme.textTheme.large),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
