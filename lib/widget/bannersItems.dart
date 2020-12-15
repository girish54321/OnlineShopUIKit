import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:onlineShopUIKit/widget/appNetworkImage.dart';
import 'package:onlineShopUIKit/widget/appText.dart';
import 'package:onlineShopUIKit/modal/banners.dart';

class BannersItem extends StatelessWidget {
  final String imageUrl;
  final String text;

  const BannersItem({Key key, @required this.imageUrl, @required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AppNetWorkIamge(
          imageUrl: imageUrl,
          radius: 0,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: AppTextH1(
              textAlign: TextAlign.center,
              text: text,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}

class AppBanner extends StatelessWidget {
  final List<BannerData> banners;
  final bool bigBanner;

  const AppBanner({
    Key key,
    this.banners,
    @required this.bigBanner,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: bigBanner ? 300 : 220,
        width: double.infinity,
        child: Carousel(
          autoplayDuration: Duration(seconds: 10),
          animationCurve: Curves.easeIn,
          images: banners != null
              ? [
                  ...banners.asMap().entries.map((MapEntry map) {
                    return BannersItem(
                      imageUrl: banners[map.key].imageUrl,
                      text: banners[map.key].text,
                    );
                  }).toList(),
                ]
              : [
                  BannersItem(
                    imageUrl:
                        "https://images.unsplash.com/photo-1576995853123-5a10305d93c0?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8amVhbnN8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60",
                    text: "",
                  ),
                  BannersItem(
                    imageUrl:
                        "https://images.unsplash.com/photo-1542272604-787c3835535d?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Mnx8amVhbnN8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60",
                    text: "",
                  ),
                ],
          radius: Radius.circular(1.0),
          dotPosition: DotPosition.bottomRight,
          dotColor: Theme.of(context).accentColor,
          dotIncreasedColor: Colors.grey,
          indicatorBgPadding: 22.0,
          dotBgColor: Colors.transparent,
          borderRadius: true,
          showIndicator: true,
        ));
  }
}
