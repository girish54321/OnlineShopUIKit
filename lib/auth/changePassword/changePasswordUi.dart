import 'package:flutter/material.dart';
import 'package:onlineShopUIKit/animasions/FadeAnimation.dart';
import 'package:onlineShopUIKit/widget/appIcon.dart';
import 'package:onlineShopUIKit/widget/appInputText.dart';
import 'package:onlineShopUIKit/widget/appText.dart';
import 'package:onlineShopUIKit/widget/buttons.dart';
import 'package:rules/rules.dart';

class ChangePasswordUi extends StatelessWidget {
  final bool validEmail;
  final bool validPassword;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController nameController;
  final Function changeVaildEmail;
  final Function changevalidPassword;
  final Function changeRemamberme;
  final Function chagneValidName;
  final bool validName;
  final bool remamberme;
  final GlobalKey<FormState> formKey;
  final Function loginUser;

  const ChangePasswordUi(
      {Key key,
      @required this.emailController,
      @required this.passwordController,
      @required this.validEmail,
      @required this.validPassword,
      @required this.changeVaildEmail,
      @required this.changevalidPassword,
      @required this.changeRemamberme,
      @required this.remamberme,
      @required this.formKey,
      @required this.loginUser,
      @required this.nameController,
      @required this.chagneValidName,
      @required this.validName})
      : super(key: key);

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
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GoBackButton(
                        function: () {
                          Navigator.pop(context);
                        },
                      ),
                      FadeAnimation(
                          0.6,
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 16,
                              right: 46,
                              left: 46,
                            ),
                            child: AppTextH1(
                              text: "Update your Password",
                            ),
                          )),
                      FadeAnimation(
                        0.7,
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 16,
                            right: 46,
                            left: 46,
                          ),
                          child: AppTextP1(
                            text: "Please enter you new password",
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      FadeAnimation(
                        0.7,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 46),
                          child: Column(
                            children: [
                              InputText(
                                  textEditingController: passwordController,
                                  password: true,
                                  hint: "Password",
                                  onChnaged: (text) {
                                    final emailRule = Rule(text,
                                        name: 'Password',
                                        isRequired: true,
                                        minLength: 6);
                                    if (emailRule.hasError) {
                                      changevalidPassword(false);
                                    } else {
                                      changevalidPassword(true);
                                    }
                                  },
                                  rightIcon:
                                      validPassword ? RightIcon() : WorngIcon(),
                                  validator: (password) {
                                    final passWordRule = Rule(password,
                                        name: 'Password',
                                        isRequired: true,
                                        minLength: 6);
                                    if (passWordRule.hasError) {
                                      return passWordRule.error;
                                    } else {
                                      return null;
                                    }
                                  }),
                              InputText(
                                  textEditingController: emailController,
                                  password: false,
                                  hint: "Email",
                                  onChnaged: (text) {
                                    final emailRule = Rule(text,
                                        name: 'Email',
                                        isRequired: true,
                                        isEmail: true);
                                    if (emailRule.hasError) {
                                      changeVaildEmail(false);
                                    } else {
                                      changeVaildEmail(true);
                                    }
                                  },
                                  rightIcon:
                                      validEmail ? RightIcon() : WorngIcon(),
                                  validator: (password) {
                                    final passWordRule = Rule(password,
                                        name: 'Email',
                                        isRequired: true,
                                        isEmail: true);
                                    if (passWordRule.hasError) {
                                      return passWordRule.error;
                                    } else {
                                      return null;
                                    }
                                  }),
                              SizedBox(
                                height: 8,
                              ),
                              FadeAnimation(
                                1,
                                Container(
                                    margin: EdgeInsets.only(top: 22),
                                    child: BlackButton(
                                      buttonText: "RESET PASSWORD",
                                      function: () {
                                        loginUser();
                                      },
                                    )),
                              ),
                              SizedBox(
                                height: 42.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          );
        },
      ),
    );
  }
}
