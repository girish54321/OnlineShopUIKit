class ClothingCategory {
  ClothingCategory({
    this.category,
  });

  List<Category> category;

  factory ClothingCategory.fromJson(Map<String, dynamic> json) =>
      ClothingCategory(
        category: json["category"] == null
            ? null
            : List<Category>.from(
                json["category"].map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "category": category == null
            ? null
            : List<dynamic>.from(category.map((x) => x.toJson())),
      };
}

class Category {
  Category({
    this.categoryName,
    this.imageUrl,
    this.text,
  });

  String categoryName;
  String imageUrl;
  String text;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        categoryName:
            json["category_name"] == null ? null : json["category_name"],
        imageUrl: json["imageUrl"] == null ? null : json["imageUrl"],
        text: json["text"] == null ? null : json["text"],
      );

  Map<String, dynamic> toJson() => {
        "category_name": categoryName == null ? null : categoryName,
        "imageUrl": imageUrl == null ? null : imageUrl,
        "text": text == null ? null : text,
      };
}
