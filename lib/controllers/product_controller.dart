import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mynuu/models/product_model.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart';
import 'package:image_picker/image_picker.dart';

class ProductController extends GetxController {
  void addProduct() async {
    var result = await FirebaseFirestore.instance.collection('products').add({
      // unique product id
      'id': '${DateTime.now().millisecondsSinceEpoch}',
      'name': 'Sandwich2',
      'price': "565",
      'description': 'description',
      'image': 'image',
      'category': 'category',
      'times_likes': 'subCategory',
      'times_viewed': 'userId',
    });

    update();
    if (result != null) {
      Get.snackbar('Success', 'Product added successfully',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
          margin: EdgeInsets.all(10),
          snackStyle: SnackStyle.FLOATING,
          duration: Duration(seconds: 2));
    } else {
      Get.snackbar('Error', 'Product not added',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          margin: EdgeInsets.all(10),
          snackStyle: SnackStyle.FLOATING,
          duration: Duration(seconds: 2));
    }
  }

  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  File? photo;
  final ImagePicker _picker = ImagePicker();

  Future pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      photo = File(pickedFile.path);
      print(photo!.path);
      uploadFile();
      update();
    } else {
      print('No image selected.');
    }
  }

  // add product with image
  Future uploadFile() async {
    final storageReference =
        storage.ref().child('images/${basename(photo!.path)}');
    final uploadTask = storageReference.putFile(photo!);
    await uploadTask;
    print('File Uploaded');
    storageReference.getDownloadURL().then((fileURL) {
      print('File URL: $fileURL');
      FirebaseFirestore.instance.collection('products').add({
        'id': '${DateTime.now().millisecondsSinceEpoch}',
        'name': 'Shwarma',
        'price': "565",
        'description': 'description',
        'image': fileURL,
        'category': 'category',
        'times_likes': 'subCategory',
        'times_viewed': 'userId',
      });
    });
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
          result.docs.map((e) => ProductModel.fromJson(e.data())).toList();
      update();
    }
    return searchList;
  }

  // product wishlist
  List<ProductModel> wishList = [];
  addToWishList(ProductModel product) async {
    var result = await FirebaseFirestore.instance
        .collection('wishList')
        .add({'product': product.toJson()});
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
          .map((e) => ProductModel.fromJson(e.data()['product']))
          .toList();
      update();
    }
    return getWishlist;
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
        products.add(ProductModel.fromJson(doc.data()));
        // print(doc.data()['name']);
        update();
      }
    });
    return products;
  }

  @override
  void onInit() {
    super.onInit();
    getProducts();
    getWishlistData();
  }
}
