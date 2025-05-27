import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ShadPortalPage extends StatefulWidget {
  const ShadPortalPage({super.key});

  @override
  State<ShadPortalPage> createState() => _ShadPortalPageState();
}

class _ShadPortalPageState extends State<ShadPortalPage> {
  var visible = false;
  late final Timer timer;
  var alignmentIndex = 0;
  final alignments = [
    Alignment.topLeft,
    Alignment.topCenter,
    Alignment.topRight,
    Alignment.centerLeft,
    Alignment.center,
    Alignment.centerRight,
    Alignment.bottomLeft,
    Alignment.bottomCenter,
    Alignment.bottomRight,
  ];

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        alignmentIndex = (alignmentIndex + 1) % alignments.length;
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final alignment = alignments[alignmentIndex];
    return Scaffold(
      appBar: AppBar(
        title: const Text('ShadPortal with ShadAncorAuto'),
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Text(alignments[alignmentIndex].toString()),
          ),
          Align(
            child: ShadPortal(
              anchor: ShadAnchorAuto(followerAnchor: alignment),
              visible: visible,
              portalBuilder: (context) {
                return ShadMouseArea(
                  groupId: 'center',
                  child: Container(
                    color: Colors.blue,
                    width: 200,
                    height: 200,
                    alignment: Alignment.center,
                    child: const Text('200x200'),
                  ),
                );
              },
              child: ShadMouseArea(
                groupId: 'center',
                onEnter: (_) {
                  setState(() {
                    visible = true;
                  });
                },
                onExit: (_) {
                  setState(() {
                    visible = false;
                  });
                },
                child: Container(
                  color: Colors.red,
                  width: 100,
                  height: 100,
                  alignment: Alignment.center,
                  child: const Text('100x100'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
