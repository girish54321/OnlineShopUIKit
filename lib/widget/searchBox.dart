import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  final double height;
  const SearchBox({Key key, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height == null ? 37 : height,
      padding: EdgeInsets.only(left: 18),
      decoration: BoxDecoration(
          color: Color(0xFFefefef), borderRadius: BorderRadius.circular(24.7)),
      child: Center(
        child: TextField(
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          decoration: InputDecoration(
              suffixIcon: Icon(
                EvaIcons.search,
                color: Colors.black
              ),
              border: InputBorder.none,
              hintText: 'Search',
              hintStyle:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
        ),
      ),
    );
  }
}
