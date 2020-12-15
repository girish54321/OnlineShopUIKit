import 'package:onlineShopUIKit/const/appConst.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginStateProvider with ChangeNotifier {
  bool logedIn = false;

  LoginStateProvider() {
    checkUserLogin();
  }

  checkUserLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final isLogin = prefs.getBool(LOGIN);
    print("isLogin");
    print(isLogin);
    if (isLogin == null) {
      logedIn = false;
      notifyListeners();
    } else {
      logedIn = true;
      notifyListeners();
    }
  }

  logOutUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(LOGIN, null);
    await prefs.setString(EMAIL, null);
    logedIn = false;
    notifyListeners();
  }

  changeLoginState(bool state) {
    logedIn = state;
    notifyListeners();
  }
}
