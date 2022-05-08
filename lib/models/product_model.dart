
import '../firebase_collections.dart';

class ProductModel {
  late String? id;
  late String? category;
  late String? image;
  late String? name;
  late String? description;
  late String? timesLiked;
  late String? timesViewed;
  late String? access;
  late String? price;
  ProductModel({
    this.id,
    required this.category,
    required this.image,
    required this.name,
    required this.description,
    required this.timesLiked,
    required this.timesViewed,
    required this.access,
    required this.price,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductModel &&
        other.id == id &&
        other.name == name &&
        other.image == image &&
        other.description == description &&
        other.timesLiked == timesLiked &&
        other.access == access &&
        other.category == category &&
        other.timesViewed == timesViewed &&
        other.price == price;
  }

  @override
  int get hashCode {
    return id.hashCode ^
    name.hashCode ^
    image.hashCode ^
    description.hashCode ^
    timesLiked.hashCode ^
    category.hashCode ^
    timesViewed.hashCode ^
    price.hashCode ^
    access.hashCode;
  }

  @override
  String toString() {
    return 'ProductModel(id: $id, name: $name, image: $image, description: $description, timesLiked: $timesLiked, price: $price, access: $access, timesViewed: $timesViewed, category: $category)';
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'description': description,
      'timesLiked': timesLiked,
      'timesViewed': timesViewed,
      'category': category,
      'price': price,
      'access': access,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'],
      name: map['name'],
      image: map['image'],
      description: map['description'],
      timesLiked: map['timesLiked'],
      price: map['price'],
      timesViewed: map['timesViewed'],
      category: map['category'],
      access: map['access'],
    );
  }

  ProductModel copyWith({
    String? id,
    String? name,
    String? image,
    String? description,
    String? timesLiked,
    String? price,
    String? timesViewed,
    String? category,
    String? access,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      description: description ?? this.description,
      timesLiked: timesLiked ?? this.timesLiked,
      price: price ?? this.price,
      timesViewed: timesViewed ?? this.timesViewed,
      category: category ?? this.category,
      access: access ?? this.access,
    );
  }

  save() async {
    await FirebaseCollections.PRODUCTCOLLECTION.doc(id).set(toMap());
  }

  static Stream<List<ProductModel>> getProducts() {
    try {
      return FirebaseCollections.PRODUCTCOLLECTION.snapshots().map((snapshot) {
        return snapshot.docs.map((doc) {
          return ProductModel.fromMap(doc.data() as Map<String, dynamic>)
            ..id = doc.id;
        }).toList();
      });
    } on Exception catch (e) {
      rethrow;
    }
  }

  update() async {
    await FirebaseCollections.PRODUCTCOLLECTION.doc(id).update(toMap());
  }

  delete() async {
    await FirebaseCollections.PRODUCTCOLLECTION.doc(id).delete();
  }

  static Stream<List<ProductModel>> getAll() {
    return FirebaseCollections.PRODUCTCOLLECTION
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return ProductModel.fromMap(doc.data() as Map<String, dynamic>)
          ..id = doc.id;
      }).toList();
    });
  }
}
