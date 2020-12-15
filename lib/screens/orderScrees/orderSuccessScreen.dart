import 'package:flutter/material.dart';
import 'package:onlineShopUIKit/animasions/FadeAnimation.dart';
import 'package:onlineShopUIKit/widget/appText.dart';
import 'package:onlineShopUIKit/widget/buttons.dart';
import 'package:onlineShopUIKit/widget/userProfilePic.dart';

class OrderSuccessScreen extends StatefulWidget {
  @override
  _OrderSuccessScreenState createState() => _OrderSuccessScreenState();
}

class _OrderSuccessScreenState extends State<OrderSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UserProfilePic(
                  isCheckOut: true,
                ),
                AppTextH1(
                  text: "Success!",
                  color: Colors.black,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8,
                  ),
                  child: Center(
                    child: PriceText(
                      text:
                          "Your order is successful placed.\nfor more information, go to My Order.",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 1,
            left: 1,
            right: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FadeAnimation(
                  0.1,
                  Container(
                    margin: EdgeInsets.only(bottom: 16),
                    width: size.width * 0.86,
                    child: AppButton(
                        color: Colors.white,
                        function: () {},
                        child: Center(
                          child: Text(
                            "MY ORDERS",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                  ),
                ),
                FadeAnimation(
                  0.1,
                  Container(
                    margin: EdgeInsets.only(bottom: 16),
                    width: size.width * 0.86,
                    alignment: Alignment.center,
                    child: Center(
                      child: BlackButton(
                        function: () {
                          // Navigator.of(context).pop();
                        },
                        buttonText: "continue shopping".toUpperCase(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
