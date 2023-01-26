// import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlineShopUIKit/helper/theme.dart';
import 'package:onlineShopUIKit/screens/cartScreen/cartScreen.dart';
import 'package:onlineShopUIKit/screens/findShop/findShopScreen.dart';
import 'package:onlineShopUIKit/screens/home/Home.dart';
import 'package:onlineShopUIKit/screens/userAccount/userAccountScreen.dart';
import 'package:provider/provider.dart';

class HomeMain extends StatefulWidget {
  @override
  _HomeMainState createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  int pageIndex = 0;
  Animation<double> animation;
  CurvedAnimation curve;
  PageController pageController;
  final iconList = <IconData>[
    Icons.home,
    Icons.home,
    Icons.home,
    Icons.home,
    Icons.home,
  ];

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  onPageChanged(int pageIndex) {
    setState(() {
      this.pageIndex = pageIndex;
    });
  }

  onTap(int pageIndex) {
    print(pageIndex);
    setState(() {
      this.pageIndex = pageIndex;
    });
    pageController.animateToPage(
      pageIndex,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, ThemeNotifier notifier, child) {
        return Scaffold(
            body: PageView(
              children: <Widget>[
                HomeScreen(),
                FindShopScreen(),
                UserAccountScreen(),
                CartScreen(),
              ],
              controller: pageController,
              onPageChanged: onPageChanged,
              physics: NeverScrollableScrollPhysics(),
            ),
            bottomNavigationBar: CupertinoTabBar(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                currentIndex: pageIndex,
                onTap: onTap,
                activeColor: Color(0xFFea9f5a),
                // inactiveColor: notifier.darkTheme ? Colors.white : Colors.black,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(FluentIcons.home),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(FluentIcons.home),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(FluentIcons.home),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(FluentIcons.home),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(FluentIcons.home),
                  ),
                ]));
      },
    );
  }
}
