import 'package:flutter/material.dart';
import 'package:onlineShopUIKit/helper/helper.dart';
import 'package:onlineShopUIKit/helper/theme.dart';
import 'package:onlineShopUIKit/widget/appNetworkImage.dart';
import 'package:provider/provider.dart';

import 'appText.dart';

class UserProfileHeader extends StatelessWidget {
  final String userName;
  final String imageUrl;
  final Size size;

  const UserProfileHeader(
      {Key? key,
      required this.size,
      required this.userName,
      required this.imageUrl})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var isTablet = Helper().isTablet(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 18),
          height: isTablet ? 150 : size.width * 0.2,
          width: size.width * 0.86,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: isTablet ? 150 : size.width * 0.2,
                width: isTablet ? 150 : size.width * 0.2,
                child: AppNetWorkIamge(
                  imageUrl: imageUrl,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 16, top: 8, bottom: 12),
                width: size.width * 0.49,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppTextP1(
                          fontWeight: FontWeight.bold,
                          text: userName,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: PriceText(
                            text: "MEMBER SEENS 2020",
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: Text(
                        "EDITE ACCOUNT",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Divider(),
        Consumer<ThemeNotifier>(
          builder: (context, notifier, child) => SwitchListTile(
            title: Text("Dark Mode"),
            onChanged: (val) {
              notifier.toggleTheme();
            },
            value: notifier.darkTheme,
          ),
        ),
        Container(margin: EdgeInsets.only(bottom: 18), child: Divider()),
      ],
    );
  }
}
