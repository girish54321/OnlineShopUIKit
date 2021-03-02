import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onlineShopUIKit/animasions/FadeAnimation.dart';
import 'package:onlineShopUIKit/helper/theme.dart';
import 'package:onlineShopUIKit/provider/productsProvider.dart';
import 'package:onlineShopUIKit/widget/header.dart';
import 'package:onlineShopUIKit/widget/listItems.dart';
import 'package:onlineShopUIKit/widget/userProfileHader.dart';
import 'package:provider/provider.dart';

class UserAccountScreen extends StatefulWidget {
  @override
  _UserAccountScreenState createState() => _UserAccountScreenState();
}

class _UserAccountScreenState extends State<UserAccountScreen>
    with AutomaticKeepAliveClientMixin<UserAccountScreen> {
  bool get wantKeepAlive => true;
  List<String> settings = [
    "Account Details",
    "Loyalty card & offers",
    "Notifications",
    "Dilivery information",
    "Payment information",
    "Language ",
    "Privacy Settings",
    "Contact Us",
  ];

  Widget _diveder() {
    return Container(
      color: Colors.grey,
      width: 1,
      height: 28,
    );
  }

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var idDakTheme = Provider.of<ThemeNotifier>(context);
    return Consumer<ProductsProvider>(
      builder: (context, loginStateProvider, child) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: idDakTheme.darkTheme
              ? SystemUiOverlayStyle.light
              : SystemUiOverlayStyle.dark,
          child: Scaffold(
            body: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: FadeAnimation(
                    0.5,
                    Column(
                      children: [
                        SafeArea(
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: 8.0,
                            ),
                            child: AppHearder(
                              hideBackButton: false,
                              buttonText: "ACCOUNT",
                              leftButtonColor: idDakTheme.darkTheme
                                  ? Colors.white
                                  : Colors.black,
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
                  child: SizedBox(
                    height: 21,
                  ),
                ),
                SliverToBoxAdapter(
                    child: Container(
                  margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 27),
                  child: FadeAnimation(
                    0.5,
                    UserProfileHeader(
                      size: size,
                      userName: "Pallavi",
                      imageUrl:
                          "https://images.unsplash.com/photo-1570752321219-41822a21a761?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NzJ8fGdpcmx8ZW58MHwyfDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60",
                    ),
                  ),
                )),
                SliverToBoxAdapter(
                  child: FadeAnimation(
                    0.5,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        FlatButton.icon(
                            onPressed: () {},
                            icon: Icon(EvaIcons.cube),
                            label: Text("My Order")),
                        _diveder(),
                        FlatButton.icon(
                            onPressed: () {},
                            icon: Icon(EvaIcons.flag),
                            label: Text("My Address")),
                        _diveder(),
                        FlatButton.icon(
                            onPressed: () {},
                            icon: Icon(EvaIcons.settings),
                            label: Text("Settings"))
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                    child: Container(
                  margin: EdgeInsets.only(top: 4),
                  child: Divider(),
                )),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    return Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 0.0, horizontal: 27),
                      child: FadeAnimation(
                        0.5,
                        ListItemsWithDvider(
                          text: settings[index],
                          rightText: null,
                          rightIcon: Icon(EvaIcons.arrowIosForward,
                              color: Colors.grey),
                        ),
                      ),
                    );
                  }, childCount: settings.length),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
