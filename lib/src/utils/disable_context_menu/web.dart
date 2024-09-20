// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:html' as html;

import 'package:flutter/widgets.dart';

class DisableWebContextMenu extends StatefulWidget {
  const DisableWebContextMenu({
    super.key,
    required this.child,
    this.identifier,
  });

  final String? identifier;
  final Widget child;

  @override
  State<DisableWebContextMenu> createState() => _DisableWebContextMenuState();
}

class _DisableWebContextMenuState extends State<DisableWebContextMenu> {
  html.MutationObserver? observer;

  final _identifier = UniqueKey();

  String get identifier => widget.identifier ?? _identifier.toString();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final element = findElement();
      if (element != null) {
        element.setAttribute('oncontextmenu', 'return false;');
      } else {
        addObserver();
      }
    });
  }

  html.Element? findElement() => html.document
      .querySelector('flt-semantics-host')
      ?.querySelector('[flt-semantics-identifier="$identifier"]');

  void addObserver() {
    observer = html.MutationObserver((mutations, _) {
      for (final mutation in mutations) {
        if (mutation is! html.MutationRecord) continue;
        if (mutation.addedNodes?.isNotEmpty ?? false) {
          for (final node in mutation.addedNodes!) {
            if (node is html.HtmlElement) {
              final id = node.attributes['flt-semantics-identifier'];
              if (id == identifier) {
                node.setAttribute('oncontextmenu', 'return false;');
                removeObserver();
                break;
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

  void removeObserver() {
    observer?.disconnect();
  }

  @override
  void dispose() {
    removeObserver();
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
