import 'package:flutter/material.dart';
import 'package:onlineShopUIKit/auth/forgotPassword/ForgotPasswordUi.dart';
import 'package:onlineShopUIKit/helper/helper.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool validEmail = false, validPassword = false, remamberme = true;

  void goBack(context) {
    Helper().goBack(context);
  }

  void changeVaildEmail(bool value) {
    print("validEmail");
    print(value);
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

  void userPassword() {
    if (_formKey.currentState.validate()) {
    } else {
      Helper().vibratPhone();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ForgotPasswordUi(
      emailController: emailController,
      validEmail: validEmail,
      changeVaildEmail: changeVaildEmail,
      formKey: _formKey,
      userPassword: userPassword,
    );
  }
}
