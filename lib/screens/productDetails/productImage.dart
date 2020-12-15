import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:onlineShopUIKit/widget/appNetworkImage.dart';

class ProductImage extends StatelessWidget {
  final List<String> images;
  final Function goToImageView;

  const ProductImage({Key key, this.images, this.goToImageView})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Carousel(
        onImageTap: (int i) {
          goToImageView(images);
        },
        animationCurve: Curves.linear,
        autoplay: false,
        radius: Radius.circular(1.0),
        dotSpacing: 15.0,
        dotIncreasedColor: Theme.of(context).accentColor,
        dotPosition: DotPosition.bottomRight,
        dotColor: Colors.white,
        dotSize: 6.0,
        indicatorBgPadding: 14.0,
        dotBgColor: Colors.transparent,
        borderRadius: true,
        showIndicator: true,
        images: [
          ...images.asMap().entries.map((MapEntry map) {
            return CachedNetworkImage(
              imageUrl: images[map.key],
              imageBuilder: (context, imageProvider) => Container(
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: imageProvider,
                  ),
                ),
              ),
              placeholder: (context, url) => AppPlaceholder(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            );
          }).toList(),
        ],
      ),
    );
  }
}
