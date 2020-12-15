import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:onlineShopUIKit/animasions/FadeAnimation.dart';
import 'package:onlineShopUIKit/widget/buttons.dart';

class TwoFlothingSearchButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return FadeAnimation(
      1,
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              margin: EdgeInsets.only(left: 28),
              width: size.width - 108,
              child: BlackButton(
                buttonText: "SEARCH WITH CAMERA",
                function: () {},
              )),
          ClipOval(
            child: Material(
              color: Theme.of(context).accentColor,
              child: InkWell(
                splashColor: Colors.white,
                child: SizedBox(
                    width: 60,
                    height: 60,
                    child: Icon(
                      EvaIcons.imageOutline,
                      color: Colors.white,
                    )),
                onTap: () {},
              ),
            ),
          )
        ],
      ),
    );
  }
}

class FlothingSearchButton extends StatelessWidget {
  final String buttonText;
  final Function function;

  const FlothingSearchButton(
      {Key key, @required this.buttonText, @required this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return FadeAnimation(
      1,
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              height: 46,
              margin: EdgeInsets.only(left: 28),
              width: size.width - 108,
              child: BlackButton(
                buttonText: buttonText,
                function: function,
              )),
        ],
      ),
    );
  }
}
