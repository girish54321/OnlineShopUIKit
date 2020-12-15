import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:onlineShopUIKit/animasions/FadeAnimation.dart';
import 'package:onlineShopUIKit/animasions/leftToRight.dart';
import 'package:onlineShopUIKit/modal/shop.dart';
import 'package:onlineShopUIKit/widget/appText.dart';
import 'package:onlineShopUIKit/widget/buttons.dart';
import 'package:onlineShopUIKit/widget/header.dart';
import 'package:onlineShopUIKit/widget/listItems.dart';
import 'package:onlineShopUIKit/widget/shopStatus.dart';

class Days {
  final String day;
  final String timeing;

  Days(this.day, this.timeing);
}

class ShopDetailsScreen extends StatefulWidget {
  final String heroTag;
  final Shop shop;
  const ShopDetailsScreen(
      {Key key, @required this.heroTag, @required this.shop})
      : super(key: key);

  @override
  _ShopDetailsScreenState createState() => _ShopDetailsScreenState();
}

class _ShopDetailsScreenState extends State<ShopDetailsScreen>
    with AutomaticKeepAliveClientMixin<ShopDetailsScreen> {
  bool get wantKeepAlive => true;
  List<Days> dayList = [
    new Days("Sunday", "8.00 - 11.00"),
    new Days("Monday", "8.00 - 9.00"),
    new Days("Tuesday", "8.00 - 9.00"),
    new Days("Wednesday", "8.00 - 9.00"),
    new Days("Thursday ", "8.00 - 9.00"),
    new Days("Friday", "8.00 - 9.00"),
    new Days("Saturday ", "8.00 - 9.00"),
  ];

  List<String> images = [
    "https://images.unsplash.com/photo-1441986300917-64674bd600d8?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8c2hvcHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60",
    "https://images.unsplash.com/photo-1570857502809-08184874388e?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Mnx8c2hvcHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60",
    "https://images.unsplash.com/photo-1551201602-3f9456f0fbf8?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTR8fHNob3B8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60",
    "https://images.unsplash.com/photo-1579108189501-b3af293abbf8?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NzZ8fHNob3B8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60",
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
            child: LeftToRight(
              child: Column(
                children: [
                  SafeArea(
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 8.0,
                      ),
                      child: AppHearder(
                        hideBackButton: false,
                        buttonText: widget.shop.shopname,
                        leftButtonColor: Colors.black,
                        rightAction: [],
                        leftButton: true,
                      ),
                    ),
                  ),
                  Divider(),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: Hero(
            tag: widget.heroTag,
            child: ShopImage(
              size: size,
              images: [widget.shop.shopimage],
            ),
          )),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 22,
            ),
          ),
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              Days days = dayList[index];
              return Container(
                margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 27),
                child: FadeAnimation(
                  0.5,
                  WorkKingDaysListItem(
                    text: days.day,
                    rightText: days.timeing,
                  ),
                ),
              );
            }, childCount: dayList.length),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 16,
            ),
          ),
          SliverToBoxAdapter(
            child: Divider(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 16,
            ),
          ),
          SliverToBoxAdapter(
            child: FadeAnimation(
              0.5,
              Container(
                margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 27),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BrandText(
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).accentColor,
                      text: widget.shop.shopname,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: BrandText(
                        color: Theme.of(context).accentColor,
                        text: "Maharashtra 400064",
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: SizedBox(
            height: 16,
          )),
          SliverToBoxAdapter(
              child: FadeAnimation(
            0.5,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    width: size.width - 108,
                    child: BlackButton(
                      buttonText: "GO TO THE SHOP",
                      function: () {},
                    )),
                ClipOval(
                  child: Material(
                    color: Theme.of(context).accentColor,
                    child: InkWell(
                      splashColor: Colors.white,
                      child: SizedBox(
                          width: 60,
                          height: 60,
                          child: Icon(
                            EvaIcons.phone,
                            color: Colors.white,
                          )),
                      onTap: () {},
                    ),
                  ),
                )
              ],
            ),
          )),
          SliverToBoxAdapter(
              child: SizedBox(
            height: 24,
          )),
        ],
      ),
    );
  }
}
