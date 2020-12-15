import 'package:flutter/material.dart';
import 'package:onlineShopUIKit/auth/changePassword/changePasswordUi.dart';
import 'package:onlineShopUIKit/auth/userLogedIn/userLogedIn.dart';
import 'package:onlineShopUIKit/helper/helper.dart';

class ChangePasswordScreen extends StatefulWidget {
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
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

  void loginUser() {
    if (_formKey.currentState.validate()) {
    } else {
      // Helper().vibratPhone();
      Helper().goToPage(context, UserLogedIn());
    }
  }

  void chagneValidName(bool value) {
    setState(() {
      validName = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangePasswordUi(
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
