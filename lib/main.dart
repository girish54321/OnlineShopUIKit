import 'package:flutter/material.dart';
import 'package:onlineShopUIKit/auth/welcome/welcomeScreen.dart';
import 'package:onlineShopUIKit/provider/productsProvider.dart';
import 'dart:math';

import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

MaterialColor generateMaterialColor(Color color) {
  return MaterialColor(color.value, {
    50: tintColor(color, 0.9),
    100: tintColor(color, 0.8),
    200: tintColor(color, 0.6),
    300: tintColor(color, 0.4),
    400: tintColor(color, 0.2),
    500: color,
    600: shadeColor(color, 0.1),
    700: shadeColor(color, 0.2),
    800: shadeColor(color, 0.3),
    900: shadeColor(color, 0.4),
  });
}

int tintValue(int value, double factor) =>
    max(0, min((value + ((255 - value) * factor)).round(), 255));

Color tintColor(Color color, double factor) => Color.fromRGBO(
    tintValue(color.red, factor),
    tintValue(color.green, factor),
    tintValue(color.blue, factor),
    1);

int shadeValue(int value, double factor) =>
    max(0, min(value - (value * factor).round(), 255));

Color shadeColor(Color color, double factor) => Color.fromRGBO(
    shadeValue(color.red, factor),
    shadeValue(color.green, factor),
    shadeValue(color.blue, factor),
    1);

class Palette {
  static const Color primary = Color(0xFF000000);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductsProvider>(
            create: (context) => ProductsProvider()),
      ],
      child: Consumer<ProductsProvider>(
        builder: (context, loginStateProvider, child) {
          return MaterialApp(
              title: 'Online Shop',
              theme: ThemeData(
                  primarySwatch: generateMaterialColor(Palette.primary),
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                  fontFamily: 'Rubik'),
              home: WelcomeScreen());
        },
      ),
    );
  }
}
