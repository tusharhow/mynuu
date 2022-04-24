// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(
    json.decode(str).map((x) => ProductModel.fromJson(x)));

String productModelToJson(List<ProductModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
  ProductModel({
    required this.id,
    required this.category,
    required this.image,
    required this.name,
    required this.description,
    required this.timesLiked,
    required this.timesViewed,
    required this.access,
    required this.price,
  });

  String? category;
  String? image;
  String? name;
  String? description;
  String? timesLiked;
  String? timesViewed;
  String? access;
  String? price;
  String? id;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        category: json["category"] == null ? null : json["category"],
        image: json["image"] == null ? null : json["image"],
        name: json["name"] == null ? null : json["name"],
        description: json["description"] == null ? null : json["description"],
        timesLiked: json["times_liked"] == null ? null : json["times_liked"],
        timesViewed: json["times_viewed"] == null ? null : json["times_viewed"],
        access: json["access"] == null ? null : json["access"],
        price: json["price"] == null ? null : json["price"],
        id: json["id"] == null ? null : json["id"],
      );

  Map<String, dynamic> toJson() => {
        "category": category == null ? null : category,
        "image": image == null ? null : image,
        "name": name == null ? null : name,
        "description": description == null ? null : description,
        "times_liked": timesLiked == null ? null : timesLiked,
        "times_viewed": timesViewed == null ? null : timesViewed,
        "access": access == null ? null : access,
        "price": price == null ? null : price,
        "id": id == null ? null : id,
      };
}
