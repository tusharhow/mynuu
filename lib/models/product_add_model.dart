import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    required this.category,
    required this.image,
    required this.productName,
    required this.description,
    required this.timesLiked,
    required this.timesViewed,
    required this.access,
    required this.price,
  });

  String? category;
  String? image;
  String? productName;
  String? description;
  String? timesLiked;
  String? timesViewed;
  String? access;
  String? price;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        category: json["category"] == null ? null : json["category"],
        image: json["image"] == null ? null : json["image"],
        productName: json["product_name"] == null ? null : json["product_name"],
        description: json["description"] == null ? null : json["description"],
        timesLiked: json["times_liked"] == null ? null : json["times_liked"],
        timesViewed: json["times_viewed"] == null ? null : json["times_viewed"],
        access: json["access"] == null ? null : json["access"],
        price: json["price"] == null ? null : json["price"],
      );

  Map<String, dynamic> toJson() => {
        "category": category == null ? null : category,
        "image": image == null ? null : image,
        "product_name": productName == null ? null : productName,
        "description": description == null ? null : description,
        "times_liked": timesLiked == null ? null : timesLiked,
        "times_viewed": timesViewed == null ? null : timesViewed,
        "access": access == null ? null : access,
        "price": price == null ? null : price,
      };
}
