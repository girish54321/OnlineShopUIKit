import 'package:flutter/material.dart';
import 'package:onlineShopUIKit/auth/signIn/signInUI.dart';

import 'package:onlineShopUIKit/helper/helper.dart';
import 'package:onlineShopUIKit/screens/genderSelection/genderSelection.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool validEmail = false, validPassword = false, remamberme = true;

  void goBack(context) {
    Helper().goBack(context);
  }

  void changeVaildEmail(bool value) {
    setState(() {
      validEmail = value;
    });
  }

  void changevalidPassword(bool value) {
    setState(() {
      validPassword = value;
    });
  }

  void changeRemamberme(bool value) {
    setState(() {
      remamberme = value;
    });
  }

  void loginUser() {
    if (_formKey.currentState.validate()) {
      Helper().goToPage(context, GenderSelection());
    } else {
      Helper().vibratPhone();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SignInUi(
        emailController: emailController,
        passwordController: passwordController,
        validEmail: validEmail,
        validPassword: validPassword,
        changeVaildEmail: changeVaildEmail,
        changevalidPassword: changevalidPassword,
        changeRemamberme: changeRemamberme,
        remamberme: remamberme,
        formKey: _formKey,
        loginUser: loginUser);
  }
}
