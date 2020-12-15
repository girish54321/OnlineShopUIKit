import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlineShopUIKit/screens/cartScreen/cartScreen.dart';
import 'package:onlineShopUIKit/screens/findShop/findShopScreen.dart';
import 'package:onlineShopUIKit/screens/home/Home.dart';
import 'package:onlineShopUIKit/screens/userAccount/userAccountScreen.dart';

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
            border: Border(
              top: BorderSide(
                color: Colors.white,
                width: 0.0,
                style: BorderStyle.solid,
              ),
            ),
            backgroundColor: Colors.white,
            currentIndex: pageIndex,
            onTap: onTap,
            activeColor: Color(0xFFea9f5a),
            inactiveColor: Colors.black,
            items: [
              BottomNavigationBarItem(
                icon: Icon(FluentIcons.home_20_filled),
              ),
              BottomNavigationBarItem(
                icon: Icon(FluentIcons.location_20_filled),
              ),
              BottomNavigationBarItem(
                icon: Icon(FluentIcons.person_20_filled),
              ),
              BottomNavigationBarItem(
                icon: Icon(FluentIcons.cart_20_filled),
              ),
              BottomNavigationBarItem(
                icon: Icon(FluentIcons.more_20_filled),
              ),
            ]));
  }
}
