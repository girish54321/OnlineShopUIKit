import 'dart:convert';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:onlineShopUIKit/animasions/FadeAnimation.dart';
import 'package:onlineShopUIKit/helper/theme.dart';
import 'package:onlineShopUIKit/modal/products.dart';
import 'package:onlineShopUIKit/network_utils/api.dart';
import 'package:onlineShopUIKit/provider/productsProvider.dart';
import 'package:onlineShopUIKit/screens/searchScreen/searchScreen.dart';
import 'package:onlineShopUIKit/widget/header.dart';
import 'package:onlineShopUIKit/helper/helper.dart';
import 'package:onlineShopUIKit/widget/listItems.dart';
import 'package:onlineShopUIKit/screens/filterScreen/filterScreen.dart';
import 'package:onlineShopUIKit/screens/productDetails/productDetails.dart';
import 'package:onlineShopUIKit/widget/userSelecation.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class ProductsByCategory extends StatefulWidget {
  @override
  _ProductsByCategoryState createState() => _ProductsByCategoryState();
}

class _ProductsByCategoryState extends State<ProductsByCategory> {
  Products products;
  bool productsLoading = true;

  _products() async {
    try {
      http.Response response = await Network().getHomeScreenPlayList(
          "https://api.jsonbin.io/b/5fd71e677e2e9559b15c92df/1");
      if (response.statusCode == 200) {
        var resBody = json.decode(response.body);
        setState(() {
          productsLoading = false;
          products = new Products.fromJson(resBody);
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    _products();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final double itemWidth = size.width / 2;
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
                  expandedHeight: 126,
                  floating: false,
                  pinned: true,
                  leading: IconButton(
                    icon: Icon(EvaIcons.arrowIosBack,
                        color:
                            notifier.darkTheme ? Colors.white : Colors.black),
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
                            leftButtonColor: notifier.darkTheme
                                ? Colors.white
                                : Colors.black,
                            rightAction: [
                              IconButton(
                                  icon: Icon(EvaIcons.search,
                                      color: notifier.darkTheme
                                          ? Colors.white
                                          : Colors.black),
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
                          childText: "t shirt".toUpperCase(),
                          parent: "WOMAN".toUpperCase(),
                          rightButton: IconButton(
                              icon: Icon(EvaIcons.options2,
                                  color: notifier.darkTheme
                                      ? Colors.white
                                      : Colors.black),
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
                productsLoading
                    ? SliverToBoxAdapter(
                        child: FadeAnimation(
                          0.5,
                          Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      )
                    : SliverGrid(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: (itemWidth / 316),
                        ),
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            Product product = products.products[index];
                            return FadeAnimation(
                                0.5,
                                new ProductGridItem(
                                  function: () {
                                    Helper().goToPage(
                                        context,
                                        ProductDetails(
                                          product: product,
                                        ));
                                  },
                                  imageUrl: product.image,
                                  price: Helper()
                                      .moneyFormat(product.price.toString()),
                                  text: product.name,
                                ));
                          },
                          childCount: products.products.length,
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
