import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onlineShopUIKit/helper/theme.dart';
import 'package:provider/provider.dart';

class StatusBarBuilder extends StatelessWidget {
  final Widget child;
  final bool useProviderTheme;
  final bool dark;
  const StatusBarBuilder(
      {Key key,
      @required this.child,
      @required this.useProviderTheme,
      @required this.dark})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var idDakTheme = Provider.of<ThemeNotifier>(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: useProviderTheme
          ? idDakTheme.darkTheme
              ? SystemUiOverlayStyle.light
              : SystemUiOverlayStyle.dark
          : dark
              ? SystemUiOverlayStyle.dark
              : SystemUiOverlayStyle.light,
      child: child,
    );
  }
}
