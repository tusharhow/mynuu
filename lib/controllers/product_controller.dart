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
      'id': '${DateTime.now().millisecondsSinceEpoch}',
      'name': "ttitleController.text",
      'price': "priceController.text",
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

  //

  @override
  void onInit() {
    super.onInit();
    getProducts();
    getWishlistData();
  }
}
