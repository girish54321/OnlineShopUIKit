import 'package:flutter/material.dart';
import 'package:onlineShopUIKit/animasions/FadeAnimation.dart';
import 'package:onlineShopUIKit/widget/appText.dart';
import 'package:onlineShopUIKit/widget/buttons.dart';
import 'package:onlineShopUIKit/helper/helper.dart';
import 'package:onlineShopUIKit/screens/homeMain/homeMain.dart';
import 'package:quiver/async.dart';

class GenderSelection extends StatefulWidget {
  GenderSelection({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _GenderSelectionState createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
  int elapsed = 0;
  bool isVisible = true;
  bool her = true;
  final cd = CountdownTimer(Duration(hours: 1), Duration(seconds: 5));

  @override
  void initState() {
    super.initState();
    startImageSlideShow();
  }

  startImageSlideShow() {
    cd.listen((data) {
      setState(() {
        elapsed = cd.elapsed.inSeconds;
        isVisible = !isVisible;
      });
    }, onDone: () {
      cd.cancel();
    });
  }

  @override
  void dispose() {
    super.dispose();
    cd.cancel();
  }

  Widget mainView() {
    return SafeArea(
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(""),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 33),
                    child: Column(children: [
                      FadeAnimation(
                          0.6,
                          AppTextH1(
                            text: "Make Yor purchases as",
                            color: Colors.white,
                          )),
                      SizedBox(
                        height: 22,
                      ),
                      Container(
                        height: 1,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      FadeAnimation(
                        1.2,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GenderButtons(
                              color: her ? Colors.white : Colors.transparent,
                              function: () {
                                Helper().goToPage(context, HomeMain());
                                setState(() {
                                  her = true;
                                });
                              },
                              child: Container(
                                width: 100,
                                child: Center(
                                  child: Text(
                                    "WOMAN",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color:
                                            !her ? Colors.white : Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            GenderButtons(
                              color: !her ? Colors.white : Colors.transparent,
                              function: () {
                                Helper().goToPage(context, HomeMain());
                                setState(() {
                                  her = false;
                                });
                              },
                              child: Container(
                                width: 100,
                                child: Center(
                                  child: Text(
                                    "MAN",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color:
                                            her ? Colors.white : Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ]))
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedSwitcher(
            child: isVisible
                ? Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/woman.jpg'),
                            fit: BoxFit.cover)),
                    key: UniqueKey(),
                  )
                : Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/man.jpg'),
                            fit: BoxFit.cover)),
                    key: UniqueKey(),
                  ),
            duration: Duration(seconds: 2),
          ),
          mainView(),
        ],
      ),
    );
  }
}
