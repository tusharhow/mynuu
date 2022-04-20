import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mynuu/models/product_model.dart';

class ProductController extends GetxController {
  void addProduct() async {
    var result = await FirebaseFirestore.instance.collection('products').add({
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
        update();
      }
    });
    return products;
  }

  @override
  void onInit() {
    super.onInit();
    getProducts();
  }
}
