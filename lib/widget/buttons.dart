import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:onlineShopUIKit/animasions/leftToRight.dart';

class AppButton extends StatelessWidget {
  final Widget child;
  final Color color;
  final Function function;

  const AppButton({Key key, this.color, this.child, @required this.function})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
          side: BorderSide(
              color: Colors.white, width: 2.0, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(30.0)),
      onPressed: function,
      color: color,
      textColor: Colors.black,
      child: Container(
        height: 55,
        child: child,
      ),
    );
  }
}

class GenderButtons extends StatelessWidget {
  final Widget child;
  final Color color;
  final Function function;

  const GenderButtons(
      {Key key, this.color, this.child, @required this.function})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
          side: BorderSide(
              color: Colors.white, width: 2.0, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(30.0)),
      onPressed: function,
      color: color,
      textColor: Colors.black,
      child: Container(
        height: 55,
        child: child,
      ),
    );
  }
}

class BlackButton extends StatelessWidget {
  final String buttonText;
  final Function function;

  const BlackButton(
      {Key key, @required this.buttonText, @required this.function})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      onPressed: function,
      color: Theme.of(context).accentColor,
      textColor: Colors.white,
      child: Container(
        height: 55,
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class FaceBookButton extends StatelessWidget {
  final String buttonText;

  const FaceBookButton({Key key, @required this.buttonText}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      onPressed: () {},
      color: Color(0xFF3a66be),
      textColor: Colors.white,
      child: Container(
        height: 50,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FaIcon(
                FontAwesomeIcons.facebookSquare,
                color: Colors.white,
                size: 33,
              ),
              Text(
                buttonText,
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GoBackButton extends StatelessWidget {
  final Color color;
  final Function function;

  const GoBackButton({Key key, @required this.color, @required this.function})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return LeftToRight(
      child: Container(
        margin: EdgeInsets.only(right: 10, top: 42),
        height: 33,
        width: 106,
        child: FlatButton(
          onPressed: function,
          color: Colors.transparent,
          child: Row(
            children: <Widget>[
              Icon(EvaIcons.arrowIosBack, color: color),
              Text(
                "BACK",
                style: TextStyle(fontSize: 18, color: color),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GoForWordButton extends StatelessWidget {
  final String buttonText;
  final Function function;

  const GoForWordButton(
      {Key key, @required this.buttonText, @required this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10, top: 14),
      width: 113,
      height: 33,
      child: FlatButton(
        onPressed: function,
        color: Colors.transparent,
        child: Row(
          children: <Widget>[
            Text(
              buttonText,
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            Icon(EvaIcons.arrowIosForward, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
