import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:onlineShopUIKit/animasions/FadeAnimation.dart';
import 'package:onlineShopUIKit/screens/searchScreen/searchScreen.dart';
import 'package:onlineShopUIKit/widget/header.dart';
import 'package:onlineShopUIKit/helper/helper.dart';
import 'package:onlineShopUIKit/widget/listItems.dart';
import 'package:onlineShopUIKit/screens/filterScreen/filterScreen.dart';
import 'package:onlineShopUIKit/screens/productDetails/productDetails.dart';
import 'package:onlineShopUIKit/widget/userSelecation.dart';

class WishListScreen extends StatefulWidget {
  @override
  _WishListScreenState createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final double itemWidth = size.width / 2;
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            elevation: 0,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            expandedHeight: 126,
            floating: false,
            pinned: true,
            leading: IconButton(
              icon: Icon(
                EvaIcons.arrowIosBack,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            flexibleSpace: FlexibleSpaceBar(
                background: Column(
              children: [
                FadeAnimation(
                  0.5,
                  SafeArea(
                    child: AppHearder(
                      hideBackButton: true,
                      buttonText: null,
                      leftButtonColor: Colors.black,
                      rightAction: [
                        IconButton(
                            icon: Icon(EvaIcons.search, color: Colors.black),
                            onPressed: () {
                              Helper().goToPage(context, SearchScreen());
                            }),
                      ],
                      leftButton: true,
                    ),
                  ),
                ),
                FadeAnimation(
                  0.5,
                  UserSelecationFlow(
                    childText: null,
                    parent: "wishlist".toUpperCase(),
                    rightButton: IconButton(
                        icon: Icon(EvaIcons.options2, color: Colors.black),
                        onPressed: () {
                          Helper().goToPage(context, FilterScreen());
                        }),
                  ),
                )
              ],
            )),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 21,
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: (itemWidth / 316),
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return FadeAnimation(0.5, new ProductGridItem(
                  function: () {
                    Helper().goToPage(context, ProductDetails());
                  },
                ));
              },
              childCount: 8,
            ),
          ),
        ],
      ),
    );
  }
}
