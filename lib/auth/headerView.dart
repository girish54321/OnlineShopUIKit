import 'package:flutter/material.dart';
import 'package:onlineShopUIKit/animasions/FadeAnimation.dart';
import 'package:onlineShopUIKit/widget/appText.dart';
import 'package:onlineShopUIKit/widget/buttons.dart';

class HeaderView extends StatelessWidget {
  final String title;

  const HeaderView({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Colors.black.withOpacity(0.8),
        Colors.black,
        Colors.black,
      ])),
      child: Stack(
        children: [
          GoBackButton(
            color: Colors.white,
            function: () {
              Navigator.pop(context);
            },
          ),
          Positioned(
            bottom: 1,
            child: FadeAnimation(
                0.6,
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 46, vertical: 36),
                  child: AppTextH1(
                    text: title,
                    color: Colors.white,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
