import 'package:flutter/material.dart';

class LeftToRight extends StatefulWidget {
  final Widget child;
  final int delay;

  LeftToRight({required this.child, required this.delay});

  @override
  _LeftToRightState createState() => _LeftToRightState();
}

class _LeftToRightState extends State<LeftToRight> {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
