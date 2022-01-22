import 'dart:convert';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:onlineShopUIKit/animasions/FadeAnimation.dart';
import 'package:onlineShopUIKit/animasions/rightToLeft.dart';
import 'package:onlineShopUIKit/modal/clothingCategory.dart';
import 'package:onlineShopUIKit/modal/products.dart';
import 'package:onlineShopUIKit/modal/whatsNew.dart';
import 'package:onlineShopUIKit/network_utils/api.dart';
import 'package:onlineShopUIKit/modal/banners.dart';
import 'package:onlineShopUIKit/screens/productsByCategory/productsByCategoy.dart';
import 'package:onlineShopUIKit/screens/searchScreen/searchScreen.dart';
import 'package:onlineShopUIKit/widget/bannersItems.dart';
import 'package:onlineShopUIKit/helper/helper.dart';
import 'package:onlineShopUIKit/widget/listItems.dart';
import 'package:onlineShopUIKit/widget/header.dart';
import 'package:onlineShopUIKit/screens/allCategory/allCategroryScreen.dart';
import 'package:onlineShopUIKit/screens/productDetails/productDetails.dart';
import 'package:onlineShopUIKit/widget/seeAllTitle.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin<HomeScreen> {
  bool get wantKeepAlive => true;

  Banners banners;
  ClothingCategory clothingCategory;
  Products products;
  WhatsNew whatsNew;
  bool bannerLoading = true;
  bool categoryLoading = true;
  bool productsLoading = true;
  bool whatsNewLoading = true;

  _loadBanners() async {
    try {
      http.Response response = await Network()
          .getDataFormApi("https://api.jsonbin.io/b/5fd369f382e9306ae6004070");
      if (response.statusCode == 200) {
        var resBody = json.decode(response.body);
        print(resBody['banners'].length);
        banners = new Banners.fromJson(resBody);
        print(banners.banners[0].imageUrl);
        setState(() {
          bannerLoading = false;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  _loadWahtsNew() async {
    try {
      http.Response response = await Network()
          .getDataFormApi("https://api.jsonbin.io/b/5fef131914be547060185924");
      if (response.statusCode == 200) {
        var resBody = json.decode(response.body);
        whatsNew = new WhatsNew.fromJson(resBody);
        setState(() {
          whatsNewLoading = false;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  _categorys() async {
    try {
      http.Response response = await Network().getDataFormApi(
          "https://api.jsonbin.io/b/5fd36f7ffbb23c2e36a56cdb/4");
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

  _products() async {
    try {
      http.Response response = await Network().getDataFormApi(
          "https://api.jsonbin.io/b/5fd71e677e2e9559b15c92df/1");
      if (response.statusCode == 200) {
        var resBody = json.decode(response.body);
        setState(() {
          products = new Products.fromJson(resBody);
          productsLoading = false;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    _loadBanners();
    _categorys();
    _products();
    _loadWahtsNew();
  }

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: Helper().getPhysicsForPlatForm(),
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: FadeAnimation(
              0.5,
              Stack(
                children: [
                  !bannerLoading
                      ? AppBanner(
                          bigBanner: false,
                          banners: banners.banners,
                        )
                      : Center(
                          child: Container(
                              margin: EdgeInsets.all(56.0),
                              child: CircularProgressIndicator())),
                  SafeArea(
                    child: AppHearder(
                      buttonText: null,
                      leftButtonColor: Colors.white,
                      rightAction: [
                        IconButton(
                            icon: Icon(EvaIcons.heart, color: Colors.white),
                            onPressed: () {
                              _loadBanners();
                            }),
                        IconButton(
                            icon: Icon(EvaIcons.search, color: Colors.white),
                            onPressed: () {
                              Helper().goToPage(context, SearchScreen());
                            }),
                      ],
                      leftButton: false,
                      hideBackButton: false,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: FadeAnimation(
            0.5,
            SeeAppTitle(
              title: "Categories",
              function: () {
                Helper().goToPage(context, AllCategroryScreen());
              },
            ),
          )),
          SliverToBoxAdapter(
            child: FadeAnimation(
              0.5,
              Container(
                height: 220,
                child: categoryLoading
                    ? ListView.builder(
                        physics: Helper().getPhysicsForPlatForm(),
                        scrollDirection: Axis.horizontal,
                        itemCount: 2,
                        itemBuilder: (BuildContext context, int index) {
                          return RightToLeft(
                              child: CategoryBigItem(
                            text: "",
                            imageUrl:
                                "https://images.unsplash.com/photo-1467043237213-65f2da53396f?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Y2xvdGhlc3xlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60",
                          ));
                        },
                      )
                    : ListView.builder(
                        physics: Helper().getPhysicsForPlatForm(),
                        scrollDirection: Axis.horizontal,
                        itemCount: categoryLoading
                            ? 2
                            : clothingCategory.category.length,
                        itemBuilder: (BuildContext context, int index) {
                          return RightToLeft(
                              child: CategoryBigItem(
                            text: clothingCategory.category[index].text != null
                                ? clothingCategory.category[index].text
                                : "",
                            imageUrl: clothingCategory.category[index].imageUrl,
                          ));
                        },
                      ),
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: FadeAnimation(
            0.5,
            SeeAppTitle(
              title: "Recommended for you",
              function: () {
                Helper().goToPage(context, ProductsByCategory());
              }, //products
            ),
          )),
          SliverToBoxAdapter(
            child: FadeAnimation(
              0.5,
              productsLoading
                  ? Container(
                      height: 256,
                      child: ListView.builder(
                        physics: Helper().getPhysicsForPlatForm(),
                        scrollDirection: Axis.horizontal,
                        itemCount: 2,
                        itemBuilder: (BuildContext context, int index) {
                          return RightToLeft(
                              child: ProductItem(
                            function: () {},
                            name: "",
                            price: "",
                            imageUrl:
                                "https://images.unsplash.com/photo-1467043237213-65f2da53396f?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Y2xvdGhlc3xlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60",
                          ));
                        },
                      ),
                    )
                  : Container(
                      height: 256,
                      child: ListView.builder(
                        physics: Helper().getPhysicsForPlatForm(),
                        scrollDirection: Axis.horizontal,
                        itemCount: 12,
                        itemBuilder: (BuildContext context, int index) {
                          Product product = products.products[index];
                          return RightToLeft(
                              child: ProductItem(
                            function: () {
                              Helper().goToPage(
                                  context,
                                  ProductDetails(
                                    product: product,
                                  ));
                            },
                            imageUrl: product.image,
                            name: product.name,
                            price:
                                Helper().moneyFormat(product.price.toString()),
                          ));
                        },
                      ),
                    ),
            ),
          ),
          SliverToBoxAdapter(
            child: FadeAnimation(
              0.5,
              Container(
                margin: EdgeInsets.only(top: 26),
                child: !bannerLoading
                    ? AppBanner(
                        bigBanner: true,
                        banners: banners.banners,
                      )
                    : AppBanner(bigBanner: true, banners: null),
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: FadeAnimation(
            0.5,
            SeeAppTitle(
              title: "Recently viewed",
              function: () {
                Helper().goToPage(context, ProductsByCategory());
              },
            ),
          )),
          SliverToBoxAdapter(
            child: FadeAnimation(
              0.5,
              productsLoading
                  ? Container(
                      height: 256,
                      child: ListView.builder(
                        physics: Helper().getPhysicsForPlatForm(),
                        scrollDirection: Axis.horizontal,
                        itemCount: 2,
                        itemBuilder: (BuildContext context, int index) {
                          return RightToLeft(
                              child: ProductItem(
                            function: () {
                              Helper().goToPage(
                                  context,
                                  ProductDetails(
                                    product: null,
                                  ));
                            },
                            name: "",
                            price: "",
                            imageUrl:
                                "https://images.unsplash.com/photo-1467043237213-65f2da53396f?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Y2xvdGhlc3xlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60",
                          ));
                        },
                      ),
                    )
                  : Container(
                      height: 256,
                      child: ListView.builder(
                        physics: Helper().getPhysicsForPlatForm(),
                        scrollDirection: Axis.horizontal,
                        itemCount: 12,
                        itemBuilder: (BuildContext context, int index) {
                          Product product = products.products[index];
                          return RightToLeft(
                              child: ProductItem(
                            function: () {
                              Helper().goToPage(
                                  context,
                                  ProductDetails(
                                    product: product,
                                  ));
                            },
                            imageUrl: product.image,
                            name: product.name,
                            price:
                                Helper().moneyFormat(product.price.toString()),
                          ));
                        },
                      ),
                    ),
            ),
          ),
          SliverToBoxAdapter(
              child: FadeAnimation(
            0.5,
            SeeAppTitle(
              title: "Whats New",
              function: () {},
            ),
          )),
          SliverToBoxAdapter(
            child: FadeAnimation(
              0.5,
              whatsNewLoading
                  ? Container(
                      height: 220,
                      width: double.infinity,
                      child: ListView.builder(
                        physics: Helper().getPhysicsForPlatForm(),
                        scrollDirection: Axis.horizontal,
                        itemCount: 2,
                        itemBuilder: (BuildContext context, int index) {
                          return RightToLeft(
                              child: WhatsNewVIew(
                            title: "",
                            subTitle: "",
                            imageUrl:
                                "https://images.unsplash.com/photo-1467043237213-65f2da53396f?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Y2xvdGhlc3xlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60",
                          ));
                        },
                      ),
                    )
                  : Container(
                      height: 220,
                      width: double.infinity,
                      child: ListView.builder(
                        physics: Helper().getPhysicsForPlatForm(),
                        scrollDirection: Axis.horizontal,
                        itemCount: whatsNew.whatsNew.length,
                        itemBuilder: (BuildContext context, int index) {
                          return RightToLeft(
                              child: WhatsNewVIew(
                            title: whatsNew.whatsNew[index].text != null
                                ? whatsNew.whatsNew[index].text
                                : "",
                            subTitle: whatsNew.whatsNew[index].text,
                            imageUrl: whatsNew.whatsNew[index].imageUrl,
                          ));
                        },
                      ),
                    ),
            ),
          ),
          SliverToBoxAdapter(
              child: SizedBox(
            height: 26,
          )),
        ],
      ),
    );
  }
}
