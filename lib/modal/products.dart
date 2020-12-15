// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

// import 'dart:convert';

// Products productsFromJson(String str) => Products.fromJson(json.decode(str));

// String productsToJson(Products data) => json.encode(data.toJson());

class Products {
  Products({
    this.products,
  });

  List<Product> products;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        products: json["products"] == null
            ? null
            : List<Product>.from(
                json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "products": products == null
            ? null
            : List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class Product {
  Product({
    this.id,
    this.category,
    this.name,
    this.rating,
    this.image,
    this.description,
    this.available,
    this.size,
    this.images,
    this.color,
    this.price,
    this.discount,
    this.mrp,
  });

  int id;
  String category;
  String name;
  int rating;
  String image;
  String description;
  bool available;
  List<dynamic> size;
  List<String> images;
  String color;
  int price;
  int discount;
  int mrp;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"] == null ? null : json["id"],
        category: json["category"] == null ? null : json["category"],
        name: json["name"] == null ? null : json["name"],
        rating: json["rating"] == null ? null : json["rating"],
        image: json["image"] == null ? null : json["image"],
        description: json["description"] == null ? null : json["description"],
        available: json["available"] == null ? null : json["available"],
        size: json["size"] == null
            ? null
            : List<dynamic>.from(json["size"].map((x) => x)),
        images: json["images"] == null
            ? null
            : List<String>.from(json["images"].map((x) => x)),
        color: json["color"] == null ? null : json["color"],
        price: json["price"] == null ? null : json["price"],
        discount: json["discount"] == null ? null : json["discount"],
        mrp: json["mrp"] == null ? null : json["mrp"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "category": category == null ? null : category,
        "name": name == null ? null : name,
        "rating": rating == null ? null : rating,
        "image": image == null ? null : image,
        "description": description == null ? null : description,
        "available": available == null ? null : available,
        "size": size == null ? null : List<dynamic>.from(size.map((x) => x)),
        "images":
            images == null ? null : List<dynamic>.from(images.map((x) => x)),
        "color": color == null ? null : color,
        "price": price == null ? null : price,
        "discount": discount == null ? null : discount,
        "mrp": mrp == null ? null : mrp,
      };
}
