// To parse this JSON data, do
//
//     final whatsNew = whatsNewFromJson(jsonString);

// import 'dart:convert';

// WhatsNew whatsNewFromJson(String str) => WhatsNew.fromJson(json.decode(str));

// String whatsNewToJson(WhatsNew data) => json.encode(data.toJson());

class WhatsNew {
  WhatsNew({
    this.whatsNew,
  });

  List<WhatsNewElement> whatsNew;

  factory WhatsNew.fromJson(Map<String, dynamic> json) => WhatsNew(
        whatsNew: json["whats_new"] == null
            ? null
            : List<WhatsNewElement>.from(
                json["whats_new"].map((x) => WhatsNewElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "whats_new": whatsNew == null
            ? null
            : List<dynamic>.from(whatsNew.map((x) => x.toJson())),
      };
}

class WhatsNewElement {
  WhatsNewElement({
    this.text,
    this.subtitle,
    this.imageUrl,
  });

  String text;
  String subtitle;
  String imageUrl;

  factory WhatsNewElement.fromJson(Map<String, dynamic> json) =>
      WhatsNewElement(
        text: json["text"] == null ? null : json["text"],
        subtitle: json["subtitle"] == null ? null : json["subtitle"],
        imageUrl: json["imageUrl"] == null ? null : json["imageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "text": text == null ? null : text,
        "subtitle": subtitle == null ? null : subtitle,
        "imageUrl": imageUrl == null ? null : imageUrl,
      };
}
