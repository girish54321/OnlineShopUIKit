import 'package:flutter/material.dart';
import 'package:onlineShopUIKit/animasions/FadeAnimation.dart';
import 'package:onlineShopUIKit/auth/changePassword/changePasswordScren.dart';
import 'package:onlineShopUIKit/helper/helper.dart';
import 'package:onlineShopUIKit/widget/appIcon.dart';
import 'package:onlineShopUIKit/widget/appInputText.dart';
import 'package:onlineShopUIKit/widget/appText.dart';
import 'package:onlineShopUIKit/widget/buttons.dart';
import 'package:onlineShopUIKit/widget/statusBarBuilder.dart';
import 'package:rules/rules.dart';

class ForgotPasswordUi extends StatelessWidget {
  final bool validEmail;

  final TextEditingController emailController;

  final Function() changeVaildEmail;

  final GlobalKey<FormState> formKey;
  final Function() userPassword;

  const ForgotPasswordUi(
      {Key? key,
      required this.emailController,
      required this.validEmail,
      required this.changeVaildEmail,
      required this.formKey,
      required this.userPassword})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StatusBarBuilder(
        dark: false,
        useProviderTheme: true,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: viewportConstraints.maxHeight,
                  ),
                  child: Form(
                    key: formKey,
                    child: Column(
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
                                top: 34,
                                right: 46,
                                left: 46,
                              ),
                              child: AppTextH1(
                                text: "Forgot password?",
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
                              text:
                                  "Enter your email and will will send you your password.",
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
                                FadeAnimation(
                                  1,
                                  Container(
                                      margin: EdgeInsets.only(top: 22),
                                      child: BlackButton(
                                        buttonText: "SEND",
                                        function: () {
                                          Helper().goToPage(
                                              context, ChangePasswordScreen());
                                          userPassword();
                                        },
                                      )),
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
