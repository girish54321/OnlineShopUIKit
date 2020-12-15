class Banners {
  Banners({
    this.banners,
  });

  List<BannerData> banners;

  factory Banners.fromJson(Map<String, dynamic> json) => Banners(
        banners: json["banners"] == null
            ? null
            : List<BannerData>.from(
                json["banners"].map((x) => BannerData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "banners": banners == null
            ? null
            : List<dynamic>.from(banners.map((x) => x.toJson())),
      };
}

class BannerData {
  BannerData({
    this.text,
    this.imageUrl,
  });

  String text;
  String imageUrl;

  factory BannerData.fromJson(Map<String, dynamic> json) => BannerData(
        text: json["text"] == null ? null : json["text"],
        imageUrl: json["imageUrl"] == null ? null : json["imageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "text": text == null ? null : text,
        "imageUrl": imageUrl == null ? null : imageUrl,
      };
}
