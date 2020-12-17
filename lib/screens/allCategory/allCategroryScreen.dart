import 'dart:convert';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:onlineShopUIKit/animasions/FadeAnimation.dart';
import 'package:onlineShopUIKit/helper/helper.dart';
import 'package:onlineShopUIKit/helper/theme.dart';
import 'package:onlineShopUIKit/modal/clothingCategory.dart';
import 'package:onlineShopUIKit/network_utils/api.dart';
import 'package:onlineShopUIKit/provider/productsProvider.dart';
import 'package:onlineShopUIKit/screens/searchScreen/searchScreen.dart';
import 'package:onlineShopUIKit/screens/subCategory/subCategoryScreen.dart';
import 'package:onlineShopUIKit/widget/header.dart';
import 'package:onlineShopUIKit/widget/listItems.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class AllCategroryScreen extends StatefulWidget {
  @override
  _AllCategroryScreenState createState() => _AllCategroryScreenState();
}

class _AllCategroryScreenState extends State<AllCategroryScreen> {
  int _value = 1;

  ClothingCategory clothingCategory;
  bool categoryLoading = true;

  _categorys() async {
    try {
      http.Response response = await Network().getHomeScreenPlayList(
          "https://api.jsonbin.io/b/5fd7604f7e2e9559b15ca8ed/1");
      if (response.statusCode == 200) {
        var resBody = json.decode(response.body);
        setState(() {
          clothingCategory = new ClothingCategory.fromJson(resBody);
          categoryLoading = false;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    _categorys();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductsProvider>(
      builder: (context, loginStateProvider, child) {
        return Consumer<ThemeNotifier>(
            builder: (context, ThemeNotifier notifier, child) {
          return Scaffold(
            body: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: <Widget>[
                SliverAppBar(
                  elevation: 0,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  expandedHeight: 60,
                  floating: false,
                  pinned: true,
                  actions: [
                    IconButton(
                        icon: Icon(EvaIcons.heart,
                            color: notifier.darkTheme
                                ? Colors.white
                                : Colors.black),
                        onPressed: () {}),
                    IconButton(
                        icon: Icon(EvaIcons.search,
                            color: notifier.darkTheme
                                ? Colors.white
                                : Colors.black),
                        onPressed: () {
                          Helper().goToPage(context, SearchScreen());
                        }),
                  ],
                  leading: IconButton(
                    icon: Icon(EvaIcons.arrowIosBack,
                        color:
                            notifier.darkTheme ? Colors.white : Colors.black),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  flexibleSpace: FlexibleSpaceBar(
                    background: FadeAnimation(
                      0.5,
                      SafeArea(
                        child: AppHearder(
                          dropDwon: Container(
                            margin: EdgeInsets.only(left: 62.0, top: 4),
                            child: DropdownButton(
                                underline: Text(""),
                                icon: Padding(
                                  padding: const EdgeInsets.only(left: 4.0),
                                  child: Icon(
                                    EvaIcons.arrowIosDownward,
                                    color: notifier.darkTheme
                                        ? Colors.white
                                        : Colors.black,
                                    size: 18,
                                  ),
                                ),
                                value: _value,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: notifier.darkTheme
                                        ? Colors.white
                                        : Colors.black,
                                    fontWeight: FontWeight.w600),
                                items: [
                                  DropdownMenuItem(
                                    child: Text(
                                      "WOMAN",
                                    ),
                                    value: 1,
                                  ),
                                  DropdownMenuItem(
                                    child: Text(
                                      "MAN",
                                    ),
                                    value: 2,
                                  ),
                                ],
                                onChanged: (value) {
                                  setState(() {
                                    _value = value;
                                  });
                                }),
                          ),
                          buttonText: null,
                          leftButtonColor: Colors.black,
                          rightAction: [],
                          leftButton: true,
                          hideBackButton: true,
                        ),
                      ),
                    ),
                  ),
                ),
                categoryLoading
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
                            Category category =
                                clothingCategory.category[index];
                            return FadeAnimation(
                              0.6,
                              CategoryListItem(
                                function: () {
                                  Helper()
                                      .goToPage(context, SubCategroryScreen());
                                },
                                imageUrl: category.imageUrl,
                                text: category.text,
                              ),
                            );
                          },
                          childCount: clothingCategory.category.length,
                        ),
                      ),
              ],
            ),
          );
        });
      },
    );
  }
}
