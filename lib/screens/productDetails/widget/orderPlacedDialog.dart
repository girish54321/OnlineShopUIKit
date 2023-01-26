import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:onlineShopUIKit/animasions/FadeAnimation.dart';
import 'package:onlineShopUIKit/widget/appText.dart';
import 'package:onlineShopUIKit/widget/buttons.dart';
import 'package:onlineShopUIKit/widget/userProfilePic.dart';
import 'package:lottie/lottie.dart';

class OrderPlacedDialog extends StatelessWidget {
  const OrderPlacedDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Stack(
        children: [
          SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Container(
                  height: 220,
                  child: Lottie.asset('assets/lottie/done.json', repeat: false),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8,
                  ),
                  child: Center(
                    child: AppTextH1(
                      text: "Success!",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8,
                  ),
                  child: Center(
                    child: AppTextP1(
                      text: "1 product has been added to cart",
                    ),
                  ),
                ),
                FadeAnimation(
                  0.1,
                  Container(
                    margin: const EdgeInsets.only(top: 34, bottom: 24),
                    child: BlackButton(
                      function: () {
                        Navigator.of(context).pop();
                      },
                      buttonText: "CHECKOUT",
                    ),
                  ),
                )
              ],
            ),
          ),
          // Positioned(
          //   right: 1,
          //   child: IconButton(
          //       icon: Icon(
          //         EvaIcons.close,
          //         size: 32,
          //       ),
          //       onPressed: () {
          //         Navigator.of(context).pop();
          //       }),
          // )
        ],
      ),
    );
  }
}
