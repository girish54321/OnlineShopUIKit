import 'dart:convert';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:onlineShopUIKit/animasions/FadeAnimation.dart';
import 'package:onlineShopUIKit/modal/SubCategory.dart';
import 'package:onlineShopUIKit/network_utils/api.dart';
import 'package:onlineShopUIKit/screens/searchScreen/searchScreen.dart';
import 'package:onlineShopUIKit/helper/helper.dart';
import 'package:onlineShopUIKit/widget/listItems.dart';
import 'package:onlineShopUIKit/screens/productsByCategory/productsByCategoy.dart';
import 'package:onlineShopUIKit/widget/userSelecation.dart';
import 'package:http/http.dart' as http;

class SubCategroryScreen extends StatefulWidget {
  @override
  _SubCategroryScreenState createState() => _SubCategroryScreenState();
}

class _SubCategroryScreenState extends State<SubCategroryScreen> {
  SubCategory subCategory;
  bool subCategoryLoading = true;

  _subcategorys() async {
    try {
      http.Response response = await Network().getHomeScreenPlayList(
          "https://api.jsonbin.io/b/5fd766efbef8b7699e59716e/1");
      if (response.statusCode == 200) {
        var resBody = json.decode(response.body);
        setState(() {
          subCategory = new SubCategory.fromJson(resBody);
          subCategoryLoading = false;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    _subcategorys();
  }

  @override
  Widget build(BuildContext context) {
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
            actions: [
              IconButton(
                  icon: Icon(EvaIcons.search, color: Colors.black),
                  onPressed: () {
                    Helper().goToPage(context, SearchScreen());
                  }),
            ],
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
              background: FadeAnimation(
                0.5,
                SafeArea(
                  child: Container(
                    margin: EdgeInsets.only(top: 60),
                    child: FadeAnimation(
                      0.6,
                      UserSelecationFlow(
                        childText: "CLOTHING".toUpperCase(),
                        parent: "WOMAN".toUpperCase(),
                        rightButton: null,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          subCategoryLoading
              ? SliverToBoxAdapter(
                  child: FadeAnimation(
                    0.5,
                    Center(
                      child: Container(
                          margin: EdgeInsets.only(top: 16),
                          child: CircularProgressIndicator()),
                    ),
                  ),
                )
              : SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      SubCategoryElement subCategoryElement =
                          subCategory.subCategory[index];
                      return FadeAnimation(
                        0.5,
                        SubCategoryListItem(
                          function: () {
                            Helper().goToPage(context, ProductsByCategory());
                          },
                          imageUrl: subCategoryElement.imageUrl,
                          text: subCategoryElement.text,
                        ),
                      );
                    },
                    childCount: subCategory.subCategory.length,
                  ),
                ),
        ],
      ),
    );
  }
}
