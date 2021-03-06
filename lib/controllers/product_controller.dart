import 'dart:async';
import 'dart:core';
import 'dart:io';
import 'package:uuid/uuid.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mynuu/models/product_model.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart';
import 'package:image_picker/image_picker.dart';

class ProductController extends GetxController {
  final TextEditingController ttitleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();

  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  bool uploading = false;
  File? photo;
  final ImagePicker _picker = ImagePicker();

  pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      photo = File(pickedFile.path);

      print(photo!.path);
      // uploadFile();
      print(photo!.path);
      update();
    } else {
      print('No image selected.');
    }
  }

  Future<String> uplaodImageAndSaveItemInfo() async {
    uploading = true;
    update();
    PickedFile? pickedFile;
    String? productId = const Uuid().v4();
    if (photo != null) {
      pickedFile = PickedFile(photo!.path);
      await uploadFile(pickedFile);
    } else {
      print("No image selected");
    }
    return productId;
  }

  /// Flutter web image upload to firebase storage
  Future<void> uploadFile(PickedFile? pickedFile) async {
    final String filePath = basename(pickedFile!.path);
    final ref = storage.ref().child(filePath);
    final uploadTask = ref.putFile(File(pickedFile.path));
    final downloadUrl = (await uploadTask);
    final String url = (await downloadUrl.ref.getDownloadURL());
    print("URL is $url");
    FirebaseFirestore.instance.collection('products').add({
// generate an id for the document
      'id':
          '${DateTime.now().day * DateTime.now().month * DateTime.now().second}',
      'name': "ttitleController.text",
      'price': "69",
      'description': "descriptionController.text",
      'image': url,
      'category': "categoryController.text",
      'times_likes': '',
      'times_viewed': '',
    });
    uploading = false;
    update();
  }

// search product
  List<ProductModel> searchList = [];
  searchProduct(String search) async {
    var result = await FirebaseFirestore.instance
        .collection('products')
        .where('name', isEqualTo: search)
        .get();
    update();
    if (result != null) {
      searchList =
          result.docs.map((e) => ProductModel.fromMap(e.data())).toList();
      update();
    }
    return searchList;
  }

  // get product by id and show in detail page
  ProductModel? product;

  // getProductById(String id, index) async {
  //   var result = await FirebaseFirestore.instance
  //       .collection('products')
  //       .where('id', isEqualTo: id)
  //       .get()
  //       .then((value) => {
  //             if (value != null)
  //               {
  //                 product = ProductModel.fromJson(value.docs[index].data()),
  //                 // print(product!.id),
  //                 update()
  //               }
  //             // print(product!.id),
  //             // update()
  //             // update(),
  //           });
  //   return product;
  // }

  // product wishlist
  List<ProductModel> wishList = [];
  addToWishList(ProductModel product) async {
    var result = await FirebaseFirestore.instance
        .collection('wishList')
        .add({'product': product.toMap()});
    update();
    if (result != null) {
      Get.snackbar('Success', 'Product added to wishlist',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
          margin: EdgeInsets.all(10),
          snackStyle: SnackStyle.FLOATING,
          duration: Duration(seconds: 2));
    } else {
      Get.snackbar('Error', 'Product not added to wishlist',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          margin: EdgeInsets.all(10),
          snackStyle: SnackStyle.FLOATING,
          duration: Duration(seconds: 2));
    }
  }

  List<ProductModel> getWishlist = [];
  // get wishlist data from product id
  getWishlistData() async {
    var result = await FirebaseFirestore.instance.collection('wishList').get();
    update();
    if (result != null) {
      getWishlist = result.docs
          .map((e) => ProductModel.fromMap(e.data()['product']))
          .toList();
      update();
    }
    return getWishlist;
  }

  // edit product

  // delete product
  deleteProduct(String id, context) async {
    var result = await FirebaseFirestore.instance
        .collection('products')
        .where('id', isEqualTo: id)
        .get();
    update();
    if (result != null) {
      for (var doc in result.docs) {
        doc.reference.delete();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Product deleted from wishlist'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        ));

        update();
      }
    }
    update();
  }

  // get all products
  List<ProductModel> products = [];

  // get all products and save in product model
  Future<List<ProductModel>> getProducts() async {
    var result = await FirebaseFirestore.instance
        .collection('products')
        .get()
        .then((value) {
      for (var doc in value.docs) {
        products.add(ProductModel.fromMap(doc.data()));
        // print(doc.data()['name']);
        update();
      }
    });
    return products;
  }

  // edit product by id
  editProduct(String id, context) async {
    var result = await FirebaseFirestore.instance
        .collection('products')
        .where('id', isEqualTo: id)
        .get();
    update();
    if (result != null) {
      for (var doc in result.docs) {
        doc.reference.update({
          'name': ttitleController.text == 0
              ? doc.data()['name']
              : ttitleController.text,
          'price': priceController.text == 0
              ? doc.data()['price']
              : priceController.text,
          'description': descriptionController.text == 0
              ? doc.data()['description']
              : descriptionController.text,
          'image': photo == null ? doc.data()['image'] : photo!.path,
          'category': categoryController.text == 0
              ? doc.data()['category']
              : categoryController.text,
          'times_likes': '',
          'times_viewed': '',
        });
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Product updated'),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
        ));
        update();
      }
    }
    update();
  }

  // update product properties individually without changing other properties
  // updateProduct(String id, String name, String price, String description,
  //     String category, String image, context) async {
  //   var result = await FirebaseFirestore.instance
  //       .collection('products')
  //       .where('id', isEqualTo: id)
  //       .get();
  //   update();
  //   if (result != null) {
  //     for (var doc in result.docs) {
  //       doc.reference.update({
  //         'name': name,
  //         'price': price,
  //         'description': description,
  //         'category': category,
  //         'image': image,
  //       });
  //     }
  //   }
  // }
// get product by id
  Future<ProductModel?> getProductById(String id) async {
    var result = await FirebaseFirestore.instance
        .collection('products')
        .where('id', isEqualTo: id)
        .get();
    update();
    if (result != null) {
      product = ProductModel.fromMap(result.docs[0].data());
      print(product!.name);
      update();
    }
    return product;
  }

// delete wishlist product
  deleteWishlistProduct(String productID, context) async {
    var result = await FirebaseFirestore.instance
        .collection('wishList')
        .where('product.id', isEqualTo: productID)
        .get();
    update();
    if (result != null) {
      for (var doc in result.docs) {
        doc.reference.delete();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Product deleted from wishlist'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        ));
        update();
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
    getProducts();
    getWishlistData();
  }
}
