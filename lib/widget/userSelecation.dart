import 'package:flutter/material.dart';

class UserSelecationFlow extends StatelessWidget {
  final String parent;
  final String childText;
  final Widget rightButton;

  const UserSelecationFlow(
      {Key key,
      @required this.parent,
      @required this.childText,
      this.rightButton})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
              top: 12.0,
              left: 19.0,
              right: 19.0,
              bottom: rightButton == null ? 12 : 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(parent.toUpperCase(),
                      style: TextStyle(
                          fontSize: 20,
                          color: childText == null ? Colors.black : Colors.grey,
                          fontWeight: FontWeight.w600)),
                  childText != null
                      ? Container(
                          margin: EdgeInsets.symmetric(horizontal: 8.0),
                          width: 6,
                          height: 6,
                          decoration: BoxDecoration(
                              color: Colors.black, shape: BoxShape.circle),
                        )
                      : Text(""),
                  childText != null
                      ? Text(childText.toUpperCase(),
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600))
                      : Text(""),
                ],
              ),
              rightButton != null ? rightButton : Text(""),
            ],
          ),
        ),
        Divider()
      ],
    );
  }
}
