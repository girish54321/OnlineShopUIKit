import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:onlineShopUIKit/screens/productDetails/productViewImages.dart';
import 'package:onlineShopUIKit/widget/appNetworkImage.dart';
import 'package:page_transition/page_transition.dart';

class ShopStatus extends StatelessWidget {
  final bool shopOpen;

  const ShopStatus({Key key, @required this.shopOpen}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          ////Color(0xFFefefef)
          borderRadius: BorderRadius.all(Radius.circular(2)),
          color: Colors.white),
      child: Row(
        children: [
          Text(shopOpen ? "OPEN" : "CLOSE"),
          SizedBox(
            width: 8,
          ),
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: shopOpen ? Colors.green : Colors.red),
          )
        ],
      ),
    );
  }
}

class ShopImage extends StatelessWidget {
  final Size size;
  final List<String> images;

  const ShopImage({Key key, @required this.size, @required this.images})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.width * 0.7,
      child: Stack(
        children: [
          Container(
              child: AppNetWorkIamge(radius: 0,
            imageUrl: images[0],
          )),
          Positioned(
              right: 8,
              bottom: 8,
              child: ClipOval(
                child: Material(
                  color: Theme.of(context).accentColor,
                  child: InkWell(
                    splashColor: Colors.white,
                    child: SizedBox(
                        width: 54,
                        height: 54,
                        child: Icon(
                          EvaIcons.externalLink,
                          color: Colors.white,
                        )),
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: ProductImageView(
                                images: images,
                              )));
                    },
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
