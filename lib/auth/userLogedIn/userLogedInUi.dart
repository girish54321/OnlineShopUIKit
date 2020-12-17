import 'package:flutter/material.dart';
import 'package:onlineShopUIKit/animasions/FadeAnimation.dart';
import 'package:onlineShopUIKit/helper/helper.dart';
import 'package:onlineShopUIKit/screens/genderSelection/genderSelection.dart';
import 'package:onlineShopUIKit/widget/appText.dart';
import 'package:onlineShopUIKit/widget/buttons.dart';
import 'package:onlineShopUIKit/widget/userProfilePic.dart';

class UserLogedInUi extends StatelessWidget {
  const UserLogedInUi({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 55,
                      right: 46,
                      left: 46,
                    ),
                    child: Center(
                        child: UserProfilePic(
                      isCheckOut: false,
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 22,
                      right: 46,
                      left: 46,
                    ),
                    child: Center(
                      child: AppTextH1(
                        text: "Hello Girish!",
                      ),
                    ),
                  ),
                  FadeAnimation(
                    0.7,
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 16,
                        right: 46,
                        left: 46,
                      ),
                      child: Center(
                        child: AppTextP1(
                          text: "Your password has been reset!",
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  FadeAnimation(
                    0.8,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 46),
                      child: Column(
                        children: [
                          FadeAnimation(
                            1,
                            Container(
                                margin: EdgeInsets.only(top: 22),
                                child: BlackButton(
                                  buttonText: "START SHOPPING",
                                  function: () {
                                    Helper()
                                        .goToPage(context, GenderSelection());
                                  },
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
