import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:onlineShopUIKit/animasions/FadeAnimation.dart';
import 'package:onlineShopUIKit/animasions/rightToLeft.dart';
import 'package:onlineShopUIKit/helper/helper.dart';
import 'package:onlineShopUIKit/modal/shop.dart';
import 'package:onlineShopUIKit/screens/shopDetails/shopDetails.dart';
import 'package:onlineShopUIKit/widget/searchBox.dart';
import 'package:onlineShopUIKit/widget/appText.dart';
import 'package:onlineShopUIKit/widget/listItems.dart';

class FindShopScreen extends StatefulWidget {
  @override
  _FindShopScreenState createState() => _FindShopScreenState();
}

class _FindShopScreenState extends State<FindShopScreen>
    with AutomaticKeepAliveClientMixin<FindShopScreen> {
  bool get wantKeepAlive => true;
  List<Shop> shopList = [
    new Shop(
        "Inorbit Mall, Malad",
        "https://images.unsplash.com/photo-1441986300917-64674bd600d8?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1050&q=80",
        "Mumbai",
        true, [
      "https://images.unsplash.com/photo-1441986300917-64674bd600d8?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1050&q=80"
    ]),
    new Shop(
        "Benzer, Mahalaxmi",
        "https://images.unsplash.com/photo-1441984904996-e0b6ba687e04?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1050&q=80",
        "Mumbai",
        true, [
      "https://images.unsplash.com/photo-1441984904996-e0b6ba687e04?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1050&q=80"
    ]),
    new Shop(
        "AND Store, Lower Parel",
        "https://images.unsplash.com/photo-1551201602-3f9456f0fbf8?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=967&q=80",
        "Mumbai",
        false, [
      "https://images.unsplash.com/photo-1551201602-3f9456f0fbf8?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=967&q=80"
    ]),
    new Shop(
        "Kalki, Worli",
        "https://images.unsplash.com/photo-1470309864661-68328b2cd0a5?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1050&q=80",
        "Mumbai",
        true, [
      "https://images.unsplash.com/photo-1470309864661-68328b2cd0a5?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1050&q=80"
    ])
  ];
  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverToBoxAdapter(
              child: Container(
            height: 230,
            width: double.infinity,
            child: Stack(
              children: [
                Positioned(
                  right: 1,
                  child: RightToLeft(
                    child: Container(
                      margin: EdgeInsets.only(right: 10, top: 38),
                      child: FlatButton(
                        onPressed: () {},
                        color: Colors.transparent,
                        child: Row(
                          children: <Widget>[
                            Text(
                              "Mumbai",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(width: 8),
                            FaIcon(
                              FontAwesomeIcons.mapMarkerAlt,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 1,
                  child: FadeAnimation(
                      0.5,
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 28),
                        child: AppTextH1(
                          text: "Find all appName\nstors here",
                        ),
                      )),
                ),
              ],
            ),
          )),
          SliverToBoxAdapter(
              child: FadeAnimation(
            0.5,
            Container(
              height: 46,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      width: size.width * 0.8,
                      child: SearchBox(
                        height: 46,
                      )),
                  ClipOval(
                    child: Material(
                      color: Theme.of(context).accentColor,
                      child: InkWell(
                        splashColor: Colors.white,
                        child: SizedBox(
                            width: 46,
                            height: 46,
                            child: Icon(
                              EvaIcons.navigation2,
                              color: Colors.white,
                            )),
                        onTap: () {},
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
          SliverToBoxAdapter(
              child: SizedBox(
            height: 32,
          )),
          SliverToBoxAdapter(child: Divider()), //StoreListItem
          SliverToBoxAdapter(
            child: FadeAnimation(
              0.5,
              Container(
                margin: EdgeInsets.symmetric(horizontal: 18, vertical: 16),
                child: CategoryText(
                  text: "All Stores",
                ),
              ),
            ),
          ),
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              Shop shop = shopList[index];
              return Hero(
                tag: index.toString(),
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  child: FadeAnimation(
                    0.5,
                    Container(
                      child: StoreListItem(
                        imageUrl: shop.shopimage,
                        isOpen: shop.open,
                        shopName: shop.shopname,
                        size: size,
                        function: () {
                          Helper().goToPage(
                              context,
                              ShopDetailsScreen(
                                heroTag: index.toString(),
                                shop: shop,
                              ));
                        },
                      ),
                    ),
                  ),
                ),
              );
            }, childCount: shopList.length),
          ),
        ],
      ),
    );
  }
}
