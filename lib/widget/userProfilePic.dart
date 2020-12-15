import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:onlineShopUIKit/widget/appNetworkImage.dart';
import 'package:simple_animations/simple_animations.dart';

class UserProfilePic extends StatelessWidget {
  final bool isCheckOut;

  const UserProfilePic({Key key, this.isCheckOut}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return ControlledAnimation(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeIn,
      tween: Tween<double>(begin: 0, end: 1),
      builder: (context, scaleValue) {
        // return Transform.scale(
        //   scale: scaleValue,
        //   alignment: Alignment.center,
        //   child: Container(
        //     height: 150,
        //     width: 150,
        //     child:
        //         Icon(EvaIcons.checkmarkCircle, size: 110, color: Colors.white),
        //   ),
        // );
        return Transform.scale(
          scale: scaleValue,
          alignment: Alignment.center,
          child: Stack(
            children: [
              !isCheckOut
                  ? CachedNetworkImage(
                      fadeInCurve: Curves.elasticIn,
                      imageUrl:
                          "https://pbs.twimg.com/profile_images/563676176472743936/um4-Vko8.png",
                      imageBuilder: (context, imageProvider) => Container(
                        height: 130,
                        width: 130,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 6.0,
                            ),
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      placeholder: (context, url) => Container(
                        height: 130,
                        width: 130,
                        child: AppPlaceholder(),
                        decoration: BoxDecoration(
                          color: Theme.of(context).accentColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 6.0,
                            ),
                          ],
                          shape: BoxShape.circle,
                        ),
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    )
                  : Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 6),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 6.0,
                          ),
                        ],
                        shape: BoxShape.circle,
                        color: Theme.of(context).accentColor,
                      ),
                      child: Center(
                        child: FaIcon(
                          FontAwesomeIcons.shoppingBag,
                          color: Colors.white,
                          size: 66,
                        ),
                      ),
                      height: 130,
                      width: 130,
                    ),
              Positioned(
                bottom: 8,
                right: 1,
                child: Container(
                    height: 31,
                    width: 31,
                    decoration: BoxDecoration(
                        color: Colors.green, shape: BoxShape.circle),
                    child: Center(
                        child: Icon(EvaIcons.checkmark,
                            size: 32, color: Colors.white))),
              )
            ],
          ),
        );
      },
    );
  }
}
