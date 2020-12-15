import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class AppNetWorkIamge extends StatelessWidget {
  final String imageUrl;
  final int radius;
  const AppNetWorkIamge({Key key, this.imageUrl, this.radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl != null
          ? imageUrl
          : "https://target.scene7.com/is/image/Target//GUEST_6bdfe36e-d26d-4cee-918e-39cb9c377d44",
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius != null ? 0 : 4),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => AppPlaceholder(),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
    // return Placeholder();
  }
}

class AppPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: Icon(
          EvaIcons.shoppingBag,
          color: Colors.grey,
          size: 65,
        ),
      ),
    );
  }
}
