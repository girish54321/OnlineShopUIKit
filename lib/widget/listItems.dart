import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:onlineShopUIKit/animasions/showUp.dart';
import 'package:onlineShopUIKit/widget/appNetworkImage.dart';
import 'package:onlineShopUIKit/widget/appText.dart';
import 'package:floating_action_row/floating_action_row.dart';
import 'package:onlineShopUIKit/widget/shopStatus.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

class CategoryBigItem extends StatelessWidget {
  final String text;
  final String imageUrl;

  const CategoryBigItem({Key key, @required this.text, @required this.imageUrl})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: 190,
      margin: EdgeInsets.only(
        left: 16,
      ),
      child: Stack(
        children: [
          AppNetWorkIamge(
            imageUrl: imageUrl,
          ),
          Positioned(
            bottom: 1,
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Container(
                width: 190,
                child: CategoryText(
                  text: text,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CategoryListItem extends StatelessWidget {
  final String imageUrl;
  final String text;

  final Function function;

  const CategoryListItem(
      {Key key,
      @required this.function,
      @required this.imageUrl,
      @required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      onTap: function,
      child: Container(
        height: 150,
        width: double.infinity,
        margin: EdgeInsets.only(left: 16, right: 16, top: 18),
        child: Stack(
          children: [
            AppNetWorkIamge(
              imageUrl: imageUrl,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withOpacity(0.5),
                        Colors.black.withOpacity(0.0),
                        Colors.black.withOpacity(0.0),
                        Colors.black.withOpacity(0.0),
                        Colors.black.withOpacity(0.0),
                      ])),
            ),
            Positioned(
              bottom: 1,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: CategoryText(
                  text: text,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SubCategoryListItem extends StatelessWidget {
  final String imageUrl;
  final String text;
  final Function function;

  const SubCategoryListItem(
      {Key key,
      @required this.function,
      @required this.imageUrl,
      @required this.text})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          // margin: EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 14),
            onTap: function,
            leading: CachedNetworkImage(
              imageUrl: imageUrl,
              imageBuilder: (context, imageProvider) => CircleAvatar(
                radius: 33.0,
                backgroundImage: imageProvider,
                backgroundColor: Colors.transparent,
              ),
              placeholder: (context, url) => CircleAvatar(
                radius: 33.0,
                backgroundColor: Colors.transparent,
              ),
            ),
            title: AppTextP1(
              fontWeight: FontWeight.bold,
              text: text,
            ),
            trailing: IconButton(
                icon: Icon(
                  EvaIcons.arrowIosForward,
                ),
                onPressed: () {}),
          ),
        ),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 18.0), child: Divider())
      ],
    );
  }
}

class ProductItem extends StatelessWidget {
  final String name;
  final String price;
  final String imageUrl;
  final Function function;

  const ProductItem(
      {Key key,
      @required this.function,
      @required this.name,
      @required this.price,
      @required this.imageUrl})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        margin: EdgeInsets.only(
          left: 16,
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: 200,
                width: 160,
                child: AppNetWorkIamge(
                  imageUrl: imageUrl,
                )),
            Padding(
              padding: const EdgeInsets.only(top: 6.0),
              child: Container(
                width: 160,
                child: AppTextP1(
                  numberOfLine: 1,
                  text: name,
                ),
              ),
            ),
            PriceText(
              text: price,
            ),
          ],
        ),
      ),
    );
  }
}

class ProductGridItem extends StatelessWidget {
  final Function function;
  final String text;
  final String imageUrl;
  final String price;
  const ProductGridItem(
      {Key key,
      @required this.function,
      @required this.text,
      @required this.imageUrl,
      @required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        margin: EdgeInsets.only(
          right: 14,
          left: 14,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                width: double.infinity,
                height: 240,
                child: AppNetWorkIamge(
                  imageUrl: imageUrl,
                )),
            Padding(
              padding: EdgeInsets.only(top: 6),
              child: AppTextP1(
                numberOfLine: 1,
                fontWeight: FontWeight.w600,
                text: text,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 4,
              ),
              child: PriceText(
                text: price,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListItemsWithDvider extends StatelessWidget {
  final String text;
  final String rightText;
  final EdgeInsetsGeometry padding;
  final Widget rightIcon;

  const ListItemsWithDvider(
      {Key key,
      @required this.text,
      this.padding,
      @required this.rightText,
      @required this.rightIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: padding != null
              ? padding
              : const EdgeInsets.symmetric(vertical: 11),
          child: rightText == null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BrandText(
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).accentColor,
                      text: text,
                    ),
                    rightIcon == null ? Text("") : rightIcon
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BrandText(
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).accentColor,
                      text: text,
                    ),
                    rightIcon == null
                        ? BrandText(
                            color: Theme.of(context).accentColor,
                            text: rightText,
                          )
                        : rightIcon
                  ],
                ),
        ),
        Divider()
      ],
    );
  }
}

class CartItem extends StatelessWidget {
  final Size size;
  final String title;
  final String imageUrl;
  final String price;
  final Function function;

  const CartItem(
      {Key key,
      @required this.size,
      @required this.title,
      @required this.imageUrl,
      @required this.price,
      @required this.function})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 18),
            height: 190.00,
            width: size.width * 0.90,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    height: 190.00,
                    width: 156.50,
                    child: AppNetWorkIamge(
                      imageUrl: imageUrl,
                    )),
                Container(
                  padding: EdgeInsets.only(left: 16, top: 8, bottom: 12),
                  // color: Colors.red,
                  width: size.width * 0.46,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppTextP1(
                              fontWeight: FontWeight.bold,
                              text:
                                  "Red & Golden Printed A-Line Sustainable Kurta",
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 6),
                              child: PriceText(
                                text: "REF 15487",
                              ),
                            ),
                            BrandText(
                              fontWeight: FontWeight.bold,
                              text: "M",
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppTextP1(
                              fontWeight: FontWeight.bold,
                              text: price,
                            ),
                            FloatingActionRow(
                              elevation: 0,
                              height: 36,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(24)),
                              color: Color(0xffF0F0F0),
                              children: <Widget>[
                                FloatingActionRowButton(
                                    icon: Icon(
                                      Icons.remove,
                                      color: Colors.black,
                                    ),
                                    onTap: () {}),
                                FloatingActionRowDivider(),
                                ShowUp(
                                  delay: 400,
                                  child: Container(
                                    width: 18,
                                    child: Text(
                                      "1",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                                FloatingActionRowDivider(),
                                FloatingActionRowButton(
                                    icon: Icon(
                                      Icons.add,
                                      color: Colors.black,
                                    ),
                                    onTap: () {}),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(margin: EdgeInsets.only(bottom: 18), child: Divider())
        ],
      ),
    );
  }
}

class AddressItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTextP1(
              fontWeight: FontWeight.bold,
              text: "Calista Wise",
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: PriceText(
                text: "7292 Dictum Av.\nSan Antonio MI 47096\n(492) 709-6392",
              ),
            )
          ],
        ),
        IconButton(icon: Icon(EvaIcons.arrowIosForward), onPressed: () {})
      ],
    );
  }
}

class MasterCardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.creditCard,
                      size: 33,
                    ),
                    SizedBox(
                      width: 18,
                    ),
                    AppTextP1(
                      fontWeight: FontWeight.bold,
                      text: "6589 1879 1546 ****",
                    ),
                  ],
                ),
                IconButton(
                    icon: Icon(EvaIcons.arrowIosForward), onPressed: () {})
              ],
            )),
        Divider()
      ],
    );
  }
}

class StoreListItem extends StatelessWidget {
  final String shopName;
  final String imageUrl;
  final bool isOpen;
  final Size size;
  final Function function;

  const StoreListItem(
      {Key key,
      @required this.size,
      @required this.function,
      @required this.shopName,
      @required this.isOpen,
      @required this.imageUrl})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        height: size.width * 0.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(34)),
        ),
        child: Stack(
          children: [
            Container(
                child: AppNetWorkIamge(
              imageUrl: imageUrl,
            )),
            Positioned(
                right: 1,
                child: ShopStatus(
                  shopOpen: isOpen,
                )),
            Positioned(
                bottom: 1,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: CategoryText(text: shopName),
                ))
          ],
        ),
      ),
    );
  }
}

class WorkKingDaysListItem extends StatelessWidget {
  final String text;
  final String rightText;

  const WorkKingDaysListItem({
    Key key,
    @required this.text,
    @required this.rightText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BrandText(
              fontWeight: FontWeight.w500,
              color: Theme.of(context).accentColor,
              text: text,
            ),
            BrandText(
              color: Theme.of(context).accentColor,
              text: rightText,
            )
          ],
        ));
  }
}
