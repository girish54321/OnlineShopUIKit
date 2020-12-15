import 'dart:async';

import 'package:flutter/material.dart';

class LeftToRight extends StatefulWidget {
  final Widget child;
  final int delay;

  LeftToRight({@required this.child, this.delay});

  @override
  _LeftToRightState createState() => _LeftToRightState();
}

class _LeftToRightState extends State<LeftToRight>
    with TickerProviderStateMixin {
  AnimationController _animController;
  Animation<Offset> _animOffset;

  @override
  void initState() {
    super.initState();

    _animController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    final curve =
        CurvedAnimation(curve: Curves.decelerate, parent: _animController);
    _animOffset = Tween<Offset>(
      begin: const Offset(
        -10.0,
        1.0,
      ),
      end: Offset.zero,
    ).animate(curve);

    if (widget.delay == null) {
      _animController.forward();
    } else {
      Timer(Duration(milliseconds: widget.delay), () {
        _animController.forward();
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _animController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      child: SlideTransition(
        position: _animOffset,
        child: widget.child,
      ),
      opacity: _animController,
    );
  }
}
