import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:onlineShopUIKit/animasions/FadeAnimation.dart';
import 'package:onlineShopUIKit/widget/searchBox.dart';
import 'package:onlineShopUIKit/widget/listItems.dart';
import 'package:onlineShopUIKit/screens/filterScreen/filterScreen.dart';
import 'package:onlineShopUIKit/widget/floatingSerachButton.dart';
import 'package:onlineShopUIKit/screens/searchScreen/recentSearch.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<BrandName> brandList = [
    new BrandName(0, "Arrow"),
    new BrandName(1, "American Crew"),
    new BrandName(2, "Ducati"),
    new BrandName(3, "Flying Machine"),
    new BrandName(4, "HIGHLANDER"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            elevation: 0,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            expandedHeight: 0,
            floating: false,
            pinned: false,
            title: SearchBox(),
            leading: IconButton(
              icon: Icon(
                EvaIcons.arrowIosBack,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          SliverToBoxAdapter(
              child: FadeAnimation(
            0.5,
            Container(
              child: Center(
                child: RecentSearchTitle(),
              ),
            ),
          )),
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              BrandName brandName = brandList[index];
              return Container(
                margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 27),
                child: FadeAnimation(
                  0.5,
                  ListItemsWithDvider(
                      text: brandName.name, rightText: null, rightIcon: null),
                ),
              );
            }, childCount: brandList.length),
          ),
          SliverToBoxAdapter(
              child: SizedBox(
            height: 80,
          )),
        ],
      ),
      floatingActionButton: TwoFlothingSearchButton(),
    );
  }
}
