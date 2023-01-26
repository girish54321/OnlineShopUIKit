import 'package:flutter/material.dart';
import 'package:onlineShopUIKit/animasions/FadeAnimation.dart';
import 'package:onlineShopUIKit/auth/headerView.dart';
import 'package:onlineShopUIKit/widget/appIcon.dart';
import 'package:onlineShopUIKit/widget/appInputText.dart';
import 'package:onlineShopUIKit/widget/buttons.dart';
import 'package:onlineShopUIKit/widget/statusBarBuilder.dart';
import 'package:rules/rules.dart';

class SignUpUi extends StatelessWidget {
  final bool validEmail;
  final bool validPassword;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController nameController;
  final Function() changeVaildEmail;
  final Function() changevalidPassword;
  final Function() changeRemamberme;
  final Function() chagneValidName;
  final bool validName;
  final bool remamberme;
  final GlobalKey<FormState> formKey;
  final Function() loginUser;

  const SignUpUi(
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
      required this.loginUser,
      required this.nameController,
      required this.chagneValidName,
      required this.validName})
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
                          title: "Create\nYour Account",
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
                                    textEditingController: nameController,
                                    password: false,
                                    hint: "Name",
                                    onChnaged: (text) {
                                      final nameRule = Rule(
                                        text,
                                        name: 'Name',
                                        isRequired: true,
                                      );
                                      if (nameRule.hasError) {
                                        chagneValidName(false);
                                      } else {
                                        chagneValidName(true);
                                      }
                                    },
                                    rightIcon:
                                        validName ? RightIcon() : WorngIcon(),
                                    validator: (password) {
                                      final nameRule = Rule(password,
                                          name: 'Name',
                                          isRequired: true,
                                          isEmail: true);
                                      if (nameRule.hasError) {
                                        return nameRule.error;
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
                                        print("ERROR");
                                        changeVaildEmail(false);
                                      } else {
                                        print("NO ERROR");
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
                                          'Agree to terms and conditions',
                                          style: TextStyle(fontSize: 17.0),
                                        ),
                                      ],
                                    ),
                                    // Text(
                                    //   'Forgot Password',
                                    //   style: TextStyle(fontSize: 17.0),
                                    // ),
                                  ],
                                ),
                                FadeAnimation(
                                  1,
                                  Container(
                                      margin: EdgeInsets.only(top: 22),
                                      child: BlackButton(
                                        buttonText: "SIGN UP",
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
                                        buttonText: "SIGN UP WITH FACEBOOK",
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
      ),
    );
  }
}
