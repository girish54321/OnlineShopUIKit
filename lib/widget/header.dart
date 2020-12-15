import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlineShopUIKit/helper/helper.dart';

class AppHearder extends StatelessWidget {
  final List<Widget> rightAction;
  final Color leftButtonColor;
  final String buttonText;
  final bool leftButton;
  final Widget dropDwon;
  final bool hideBackButton;
  const AppHearder(
      {Key key,
      this.rightAction,
      this.buttonText,
      this.leftButtonColor,
      @required this.leftButton,
      this.dropDwon,
      @required this.hideBackButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            leftButton
                ? dropDwon != null
                    ? Row(
                        children: [
                          hideBackButton
                              ? Text("")
                              : BackIconButton(
                                  leftButtonColor: leftButtonColor,
                                ),
                          dropDwon,
                        ],
                      )
                    : buttonText != null
                        ? FlatButton(
                            onPressed: () {
                              Helper().goBack(context);
                            },
                            color: Colors.transparent,
                            child: Row(
                              children: <Widget>[
                                Icon(EvaIcons.arrowIosBack,
                                    color: leftButtonColor == null
                                        ? Colors.black
                                        : leftButtonColor),
                                Text(
                                  buttonText.toUpperCase(),
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: leftButtonColor == null
                                          ? Colors.black
                                          : leftButtonColor),
                                ),
                              ],
                            ),
                          )
                        : hideBackButton
                            ? Text("")
                            : BackIconButton(
                                leftButtonColor: leftButtonColor,
                              )
                : Text(""),
            Container(
              child: Row(children: [
                ...rightAction.asMap().entries.map((MapEntry map) {
                  return rightAction[map.key];
                }).toList(),
              ]),
            )
          ],
        ),
        // Divider()
      ],
    ));
  }
}

class BackIconButton extends StatelessWidget {
  final Color leftButtonColor;

  const BackIconButton({Key key, @required this.leftButtonColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(EvaIcons.arrowIosBack,
            color: leftButtonColor == null ? Colors.black : leftButtonColor),
        onPressed: () {
          Helper().goBack(context);
        });
  }
}
