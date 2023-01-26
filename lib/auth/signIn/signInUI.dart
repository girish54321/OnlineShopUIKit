import 'package:flutter/material.dart';
import 'package:onlineShopUIKit/animasions/FadeAnimation.dart';
import 'package:onlineShopUIKit/auth/forgotPassword/ForgotPasswordScreen.dart';
import 'package:onlineShopUIKit/auth/headerView.dart';
import 'package:onlineShopUIKit/helper/helper.dart';
import 'package:onlineShopUIKit/widget/appIcon.dart';
import 'package:onlineShopUIKit/widget/appInputText.dart';
import 'package:onlineShopUIKit/widget/buttons.dart';
import 'package:onlineShopUIKit/widget/statusBarBuilder.dart';
import 'package:rules/rules.dart';

class SignInUi extends StatelessWidget {
  final bool validEmail;
  final bool validPassword;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final Function() changeVaildEmail;
  final Function() changevalidPassword;
  final Function() changeRemamberme;
  final bool remamberme;
  final GlobalKey<FormState> formKey;
  final Function() loginUser;

  const SignInUi(
      {Key? key,
      required this.emailController,
      required this.passwordController,
      required this.validEmail,
      required this.validPassword,
      required this.changeVaildEmail,
      required this.changevalidPassword,
      required this.changeRemamberme,
      required this.remamberme,
      required this.formKey,
      required this.loginUser})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatusBarBuilder(
      dark: false,
      useProviderTheme: false,
      child: Scaffold(
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
                      children: [
                        HeaderView(
                          title: "Login Into \nYour Account",
                        ),
                        SizedBox(
                          height: 44,
                        ),
                        FadeAnimation(
                          0.7,
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 46),
                            child: Column(
                              children: [
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
                                    rightIcon: validPassword
                                        ? RightIcon()
                                        : WorngIcon(),
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
                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      children: [
                                        SizedBox(
                                            height: 24.0,
                                            width: 24.0,
                                            child: Checkbox(
                                              value: remamberme,
                                              onChanged: (bool value) {
                                                changeRemamberme(value);
                                              },
                                            )),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text(
                                          'Remamber me',
                                          style: TextStyle(fontSize: 16.0),
                                        ),
                                      ],
                                    ),
                                    GestureDetector(
                                        onTap: () {
                                          Helper().goToPage(
                                              context, ForgotPasswordScreen());
                                        },
                                        child: Text(
                                          'Forgot Password',
                                          style: TextStyle(fontSize: 16.0),
                                        )),
                                  ],
                                ),
                                FadeAnimation(
                                  1,
                                  Container(
                                      margin: EdgeInsets.only(top: 22),
                                      child: BlackButton(
                                        buttonText: "SIGN IN",
                                        function: () {
                                          loginUser();
                                        },
                                      )),
                                ),
                                FadeAnimation(
                                  1.2,
                                  Container(
                                      margin: EdgeInsets.only(top: 18),
                                      child: FaceBookButton(
                                        buttonText: "SIGN IN WITH FACEBOOK",
                                      )),
                                ),
                                SizedBox(
                                  height: 34,
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
      ),
    );
  }
}
