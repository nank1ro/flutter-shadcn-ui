import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:example/common/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class BaseScaffold extends StatelessWidget {
  const BaseScaffold({
    super.key,
    required this.children,
    required this.appBarTitle,
    this.editable,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.wrapChildrenInScrollable = true,
    this.wrapSingleChildInColumn = true,
    this.alignment,
    this.gap = 8,
  });

  final List<Widget> children;
  final String appBarTitle;
  final List<Widget>? editable;
  final CrossAxisAlignment crossAxisAlignment;
  final bool wrapChildrenInScrollable;
  final bool wrapSingleChildInColumn;
  final Alignment? alignment;
  final double gap;

  @override
  Widget build(BuildContext context) {
    Widget left = Align(
      alignment: alignment ?? Alignment.center,
      child: children.length == 1 && !wrapSingleChildInColumn
          ? children[0]
          : Column(
              crossAxisAlignment: crossAxisAlignment,
              children: children.separatedBy(SizedBox(height: gap)),
            ),
    );

    if (wrapChildrenInScrollable) {
      left = SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: left,
      );
    }

    final Widget? right = editable == null
        ? null
        : SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: editable!.separatedBy(SizedBox(height: gap)),
              ),
            ),
          );

    return Scaffold(
      appBar: MyAppBar(title: appBarTitle),
      body: right != null
          ? Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: ShadResizablePanelGroup(
                    showHandle: true,
                    children: [
                      ShadResizablePanel(
                        id: 0,
                        defaultSize: .7,
                        minSize: .5,
                        child: left,
                      ),
                      ShadResizablePanel(
                        id: 1,
                        defaultSize: .3,
                        minSize: .2,
                        child: right,
                      ),
                    ],
                  ),
                ),
              ],
            )
          : left,
    );
  }
}
