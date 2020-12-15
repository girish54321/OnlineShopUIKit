// To parse this JSON data, do
//
//     final subCategory = subCategoryFromJson(jsonString);

// import 'dart:convert';

// SubCategory subCategoryFromJson(String str) => SubCategory.fromJson(json.decode(str));

// String subCategoryToJson(SubCategory data) => json.encode(data.toJson());

class SubCategory {
  SubCategory({
    this.subCategory,
  });

  List<SubCategoryElement> subCategory;

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
        subCategory: json["sub_category"] == null
            ? null
            : List<SubCategoryElement>.from(json["sub_category"]
                .map((x) => SubCategoryElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "sub_category": subCategory == null
            ? null
            : List<dynamic>.from(subCategory.map((x) => x.toJson())),
      };
}

class SubCategoryElement {
  SubCategoryElement({
    this.categoryName,
    this.imageUrl,
    this.text,
  });

  String categoryName;
  String imageUrl;
  String text;

  factory SubCategoryElement.fromJson(Map<String, dynamic> json) =>
      SubCategoryElement(
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
