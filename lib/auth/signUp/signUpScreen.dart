import 'package:flutter/material.dart';
import 'package:onlineShopUIKit/auth/signUp/signUpUI.dart';
import 'package:onlineShopUIKit/helper/helper.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  bool validEmail = false,
      validPassword = false,
      validName = false,
      remamberme = true;

  void goBack(context) {
    Helper().goBack(context);
  }

  void changeVaildEmail(bool value) {
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

  void loginUser() {
    if (_formKey.currentState.validate()) {
    } else {
      Helper().vibratPhone();
    }
  }

  void chagneValidName(bool value) {
    setState(() {
      validName = true;
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SignUpUi(
        emailController: emailController,
        passwordController: passwordController,
        validEmail: validEmail,
        validPassword: validPassword,
        changeVaildEmail: changeVaildEmail,
        changevalidPassword: changevalidPassword,
        changeRemamberme: changeRemamberme,
        remamberme: remamberme,
        formKey: _formKey,
        nameController: nameController,
        loginUser: loginUser,
        validName: validName,
        chagneValidName: chagneValidName);
  }
}
