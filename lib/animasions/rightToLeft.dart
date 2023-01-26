import 'package:flutter/material.dart';

class RightToLeft extends StatefulWidget {
  final Widget child;
  final int delay;

  RightToLeft({required this.child, required this.delay});

  @override
  _RightToLeftState createState() => _RightToLeftState();
}

class _RightToLeftState extends State<RightToLeft> {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
