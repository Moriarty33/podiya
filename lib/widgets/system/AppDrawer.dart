import 'package:flutter/material.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';
import 'package:podiya/state/drawer.dart';

class AppDrawer extends StatefulWidget {
  final Widget child;

  AppDrawer({this.child});

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  void initState() {
    super.initState();
    toggleLeftDrawer.observe((value) {
      _innerDrawerKey.currentState
          .toggle(direction: InnerDrawerDirection.start);
    });
    toggleRightDrawer.observe((value) {
      _innerDrawerKey.currentState.toggle(direction: InnerDrawerDirection.end);
    });
  }

  @override
  Widget build(BuildContext context) {
    return InnerDrawer(
        key: _innerDrawerKey,
        onTapClose: true,
        swipe: true,
        proportionalChildArea: true,
        borderRadius: 24,
        leftAnimationType: InnerDrawerAnimation.static,
        backgroundDecoration: BoxDecoration(color: Colors.grey),
        colorTransitionScaffold: Colors.white54,
        leftChild: widget.left,
        rightChild: widget.right,
        scaffold: widget.main);
  }
}
