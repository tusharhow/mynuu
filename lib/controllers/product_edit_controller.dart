import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path/path.dart';

import '../models/product_model.dart';

class ProductEditController extends GetxController {
  final String pid;

  var titleController = TextEditingController().obs;

  var descriptionController = TextEditingController().obs;

  var priceController = TextEditingController().obs;

  var categoryController = TextEditingController().obs;

  var itemPhotosWidgetList = <Widget>[].obs;

  ProductEditController(this.pid);

  final photos = <XFile>[].obs;

  final uploading = false.obs;
  final file = Rxn<File>();
  final product = Rxn<ProductModel>();

  void addImage(List<XFile> images) {
    for (var bytes in images) {
      itemPhotosWidgetList.add(Padding(
        padding: const EdgeInsets.all(1.0),
        child: SizedBox(
          height: 100.0,
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Container(
              child: kIsWeb
                  ? Image.network(File(bytes.path).path)
                  : Image.file(
                      File(bytes.path),
                    ),
            ),
          ),
        ),
      ));
    }
  }

  pickPhotoFromGallery() async {
    var images = await ImagePicker().pickMultiImage();
    if (images != null) {
      photos.addAll(images);
      addImage(photos);
      images.clear();
    } else {
      print("No image selected");
    }
  }

  Future<String> uploadImageAndSaveItemInfo() async {
    uploading.value = true;

    PickedFile? pickedFile;
    String? productId = const Uuid().v4();
    if (photos.isNotEmpty) {
      for (int i = 0; i < photos.length; i++) {
        file.value = File(photos[i].path);
        pickedFile = PickedFile(file.value!.path);

        final imageUrl = await uploadImageToStorage(pickedFile);
        print("imageUrl: $imageUrl");
        await updateProduct(imageUrl: imageUrl);
      }
    } else {
      await updateProduct();
    }
    return productId;
  }

  Future<String> uploadImageToStorage(PickedFile? pickedFile) async {
    final String? filePath = basename(pickedFile!.path);
    Reference reference = FirebaseStorage.instance.ref().child(filePath!);
    await reference.putData(
      await pickedFile.readAsBytes(),
      SettableMetadata(contentType: 'image/jpeg'),
    );
    final imageUrl = await reference.getDownloadURL();

    return imageUrl;
  }

  updateProduct({String? imageUrl}) async {
    var result = await FirebaseFirestore.instance
        .collection('products')
        .where('id', isEqualTo: pid)
        .get();

    if (result.docs.isNotEmpty) {
      for (var doc in result.docs) {
        if (imageUrl != null) {
          doc.reference.update({
            'name': titleController.value.text,
            'price': priceController.value.text,
            'description': descriptionController.value.text,
            'image': imageUrl,
            'category': categoryController.value.text,
            'times_likes': '',
            'times_viewed': '',
          });
        } else {
          doc.reference.update({
            'name': titleController.value.text,
            'price': priceController.value.text,
            'description': descriptionController.value.text,
            'category': categoryController.value.text,
            'times_likes': '',
            'times_viewed': '',
          });
        }

        print('Hjjjjjjjjjjjjjjjjjjjjjjjjj');

        Get.snackbar(
          result.docs[0].data()['name'],
          'Product update Successfully',
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white,
        );
      }
    } else {
      print('No data');
    }
  }

  Future<ProductModel?> getProductById(String id) async {
    var db = FirebaseFirestore.instance;
    var result =
        await db.collection('products').where('id', isEqualTo: id).get();
    print("RES: ${result.docs.length}");
    product.value = ProductModel.fromDocumentSnapshot(result.docs[0]);
    print(product.value!.name);
    titleController.value = TextEditingController(text: product.value!.name);

    descriptionController.value =
        TextEditingController(text: product.value!.description);

    priceController.value = TextEditingController(text: product.value!.price);

    categoryController.value =
        TextEditingController(text: product.value!.category);
    return product.value;
  }

  @override
  void onInit() async {
    super.onInit();
    print("PID: $pid");
    await getProductById(pid);
  }
}
