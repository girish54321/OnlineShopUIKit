import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:onlineShopUIKit/animasions/FadeAnimation.dart';
import 'package:onlineShopUIKit/animasions/rightToLeft.dart';
import 'package:onlineShopUIKit/auth/signIn/signInScreen.dart';
import 'package:onlineShopUIKit/auth/signUp/signUpScreen.dart';
import 'package:onlineShopUIKit/helper/helper.dart';
import 'package:onlineShopUIKit/widget/appText.dart';
import 'package:onlineShopUIKit/widget/buttons.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/banner.jpg'),
                fit: BoxFit.cover)),
        child: SafeArea(
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
                                text: "Ideal store for your shopping",
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
                            1,
                            AppButton(
                                color: Colors.white,
                                function: () {
                                  Helper().goToPage(context, SignUpScreen());
                                },
                                child: Center(
                                  child: Text(
                                    "SIGN UP WITH EMAIL",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                          ),
                          SizedBox(
                            height: 22,
                          ),
                          FadeAnimation(
                            1.2,
                            AppButton(
                                color: Colors.transparent,
                                function: null,
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.facebookSquare,
                                        color: Colors.white,
                                        size: 33,
                                      ),
                                      Text(
                                        "CONTINUE WITH FACEBOOK",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                )),
                          )
                        ]))
                  ],
                ),
              ),
              Positioned(
                right: 1,
                child: RightToLeft(
                  child: GoForWordButton(
                    buttonText: "SIGN IN",
                    function: () {
                      Helper().goToPage(context, SignInScreen());
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
