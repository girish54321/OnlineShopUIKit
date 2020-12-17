import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class AppTextH1 extends StatelessWidget {
  final String text;
  final Color color;
  final TextAlign textAlign;

  const AppTextH1({Key key, @required this.text, this.color, this.textAlign})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign == null ? TextAlign.start : textAlign,
      style: TextStyle(
          height: 1.3, fontSize: 40, color: color, fontWeight: FontWeight.bold),
    );
  }
}

class AppTextP1 extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final int numberOfLine;

  const AppTextP1({
    Key key,
    @required this.text,
    this.fontWeight,
    this.numberOfLine,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.start,
      maxLines: numberOfLine != null ? numberOfLine : 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 19,
        height: 1.3,
        fontWeight: fontWeight != null ? fontWeight : FontWeight.normal,
      ),
    );
  }
}

class BrandText extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final Color color;

  const BrandText({
    Key key,
    @required this.text,
    this.fontWeight,
    this.color,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.start,
      style: TextStyle(
          fontSize: 16,
          height: 1.4,
          fontWeight: fontWeight != null ? fontWeight : FontWeight.normal,
          color: color),
    );
  }
}

class CategoryText extends StatelessWidget {
  final String text;
  final Color color;

  const CategoryText({
    Key key,
    @required this.text,
    this.color,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      textAlign: TextAlign.start,
      maxLines: 2,
      style: TextStyle(
          fontSize: 24,
          height: 1.3,
          color: color != null ? color : Colors.white,
          fontWeight: FontWeight.bold),
    );
  }
}

class PriceText extends StatelessWidget {
  final String text;

  const PriceText({
    Key key,
    @required this.text,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.start,
      style: TextStyle(
        fontSize: 16,
        height: 1.3,
        color: Colors.grey,
      ),
    );
  }
}

class HtmlText extends StatelessWidget {
  final String text;

  const HtmlText({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Html(
      data: text,
      onLinkTap: (url) {
        // open url in a webview
      },
      style: {
        // "div": Style(
        //   block: Block(
        //     margin: EdgeInsets.all(16),
        //     border: Border.all(width: 6),
        //     backgroundColor: Colors.grey,
        //   ),
        //   textStyle: TextStyle(
        //     color: Colors.red,
        //   ),
        // ),
      },
      onImageTap: (src) {
        // Display the image in large form.
      },
    );
  }
}
