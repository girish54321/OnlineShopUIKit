import 'package:flutter/material.dart';
import 'package:onlineShopUIKit/auth/welcome/welcomeScreen.dart';
import 'package:onlineShopUIKit/helper/theme.dart';
import 'package:onlineShopUIKit/provider/productsProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductsProvider>(
            create: (context) => ProductsProvider()),
        ChangeNotifierProvider<ThemeNotifier>(
            create: (context) => ThemeNotifier()),
      ],
      child: Consumer<ProductsProvider>(
        builder: (context, loginStateProvider, child) {
          return Consumer<ThemeNotifier>(
            builder: (context, ThemeNotifier notifier, child) {
              return MaterialApp(
                  theme: notifier.darkTheme ? dark : light,
                  title: 'Online Shop',
                  home: WelcomeScreen());
            },
          );
        },
      ),
    );
  }
}
