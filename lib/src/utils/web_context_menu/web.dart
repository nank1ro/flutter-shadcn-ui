// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:html' as html;

import 'package:flutter/semantics.dart';
import 'package:flutter/widgets.dart';

class WebContextMenu extends StatefulWidget {
  const WebContextMenu({
    super.key,
    required this.child,
    this.identifier,
    this.onContextMenu,
  });

  final String? identifier;
  final Widget child;
  final void Function(Offset offset)? onContextMenu;

  @override
  State<WebContextMenu> createState() => _WebContextMenuState();
}

class _WebContextMenuState extends State<WebContextMenu> {
  html.MutationObserver? observer;
  late final SemanticsHandle semanticsHandle;

  final _identifier = UniqueKey();

  String get identifier => widget.identifier ?? _identifier.toString();

  @override
  void initState() {
    super.initState();
    print('provided identifier: ${widget.identifier}');
    print('identifier: $identifier');

    semanticsHandle = SemanticsBinding.instance.ensureSemantics();
    searchForElementOrAddObserver();
  }

  @override
  void didUpdateWidget(covariant WebContextMenu oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.identifier != oldWidget.identifier) {
      print('identifier changed to ${widget.identifier}');
      searchForElementOrAddObserver();
    }
  }

  void searchForElementOrAddObserver() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final element = findElement();
      if (element != null) {
        print('found element with id $identifier');
        disableContextMenuForElement(element);
      } else {
        addObserver();
      }
    });
  }

  html.Element? findElement() =>
      html.document.querySelector('[flt-semantics-identifier="$identifier"]');

  void addObserver() {
    observer = html.MutationObserver((mutations, _) {
      for (final mutation in mutations) {
        if (mutation is! html.MutationRecord) continue;
        if (mutation.addedNodes?.isNotEmpty ?? false) {
          for (final node in mutation.addedNodes!) {
            if (node is html.HtmlElement) {
              final id = node.attributes['flt-semantics-identifier'];
              if (id == identifier) {
                print('found element with observer and id $identifier');
                disableContextMenuForElement(node);
                // removeObserver();
                // break;
              }
            }
          }
        }
      }
    });

    observer!.observe(
      html.document,
      childList: true,
      subtree: true,
      attributes: true,
      attributeFilter: ['flt-semantics-identifier'],
    );
  }

  void disableContextMenuForElement(html.Element element) {
    element
      ..setAttribute('oncontextmenu', 'return false;')
      ..addEventListener(
        'contextmenu',
        (event) {
          event.preventDefault();
          if (event is html.PointerEvent) {
            widget.onContextMenu?.call(
              Offset(event.client.x.toDouble(), event.client.y.toDouble()),
            );
          }
        },
        false,
      );
  }

  void removeObserver() {
    observer?.disconnect();
  }

  @override
  void dispose() {
    removeObserver();
    semanticsHandle.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      identifier: identifier,
      child: widget.child,
    );
  }
}
