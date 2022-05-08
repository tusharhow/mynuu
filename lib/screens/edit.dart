import 'dart:io';
import 'dart:io' show File;
//import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:mynuu/components/navigate.dart';
import 'package:mynuu/controllers/product_controller.dart';
import 'package:mynuu/models/product_model.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:uuid/uuid.dart';
import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../components/top_nav_bar.dart';
import 'bottom_navigation_screens.dart';
import 'delete_product.dart';
import 'website/view_menu.dart';

class EditProduct extends StatefulWidget {
  @override
  State<EditProduct> createState() => _EditProductState();
}

List<Widget> itemPhotosWidgetList = <Widget>[];

final ImagePicker _picker = ImagePicker();
File? file;
List<XFile>? photo = <XFile>[];
List<XFile> itemImagesList = <XFile>[];

List<String> downloadUrl = <String>[];
bool loader = false;
TextEditingController titleController = TextEditingController();
TextEditingController descriptionController = TextEditingController();
TextEditingController priceController = TextEditingController();
TextEditingController categoryController = TextEditingController();
bool uploading = false;
final productController = Get.put(ProductController());

class _EditProductState extends State<EditProduct> {
  ProductModel _productModel = Get.arguments;
  @override
  void initState() {
    titleController = TextEditingController(text: _productModel.name);
    descriptionController = TextEditingController(text: _productModel.description);
    priceController = TextEditingController(text: _productModel.price);
    categoryController = TextEditingController(text: _productModel.category);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final productController = Get.put(ProductController());

    return Scaffold(
      backgroundColor: Colors.black,
      body: GetBuilder<ProductController>(
          init: productController,
          builder: (cont) {
            return Column(
              children: [
                Form(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                        ),
                        child: Row(
                          children: [
                            Text(
                              'Update item',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: _size.width * 0.02,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: _size.height * 0.04,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Row(
                          children: [
                            Text(
                              'Add Product Name',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: _size.height * 0.01,
                      ),

                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: SizedBox(
                              width: _size.width * 0.25,
                              child: TextFormField(
                                controller: titleController,
                                decoration: InputDecoration(
                                  labelText: 'Product Name',
                                  labelStyle: TextStyle(
                                    color: Colors.white54,
                                    fontSize: 15,
                                  ),
                                  filled: true,
                                  fillColor: Colors.white12,
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                      ),
                                      borderRadius: BorderRadius.circular(5)),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: _size.height * 0.01,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Row(
                          children: [
                            Text(
                              'Add Product Description',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: _size.height * 0.01,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: SizedBox(
                              width: _size.width * 0.25,
                              child: TextFormField(
                                controller: descriptionController,
                                decoration: InputDecoration(
                                  labelText: 'Description',
                                  labelStyle: TextStyle(
                                    color: Colors.white54,
                                    fontSize: 15,
                                  ),
                                  filled: true,
                                  fillColor: Colors.white12,
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                      ),
                                      borderRadius: BorderRadius.circular(5)),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                                maxLines: 2,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: _size.height * 0.01,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Row(
                          children: [
                            Text(
                              'Product Price',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: _size.height * 0.01,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: SizedBox(
                              width: _size.width * 0.25,
                              child: TextFormField(
                                controller: priceController,
                                decoration: InputDecoration(
                                  labelText: 'Price',
                                  labelStyle: TextStyle(
                                    color: Colors.white54,
                                    fontSize: 15,
                                  ),
                                  filled: true,
                                  fillColor: Colors.white12,
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                      ),
                                      borderRadius: BorderRadius.circular(5)),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: _size.height * 0.01,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Row(
                          children: [
                            Text(
                              'Product Category',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: _size.height * 0.01,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: SizedBox(
                              width: _size.width * 0.25,
                              child: TextFormField(
                                controller: categoryController,
                                decoration: InputDecoration(
                                  labelText: 'Category',
                                  labelStyle: TextStyle(
                                    color: Colors.white54,
                                    fontSize: 15,
                                  ),
                                  filled: true,
                                  fillColor: Colors.white12,
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                      ),
                                      borderRadius: BorderRadius.circular(5)),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 20),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                color: Colors.white70,
                                // boxShadow: [
                                //   BoxShadow(
                                //     color: Colors.grey.shade200,
                                //     offset: const Offset(0.0, 0.5),
                                //     blurRadius: 30.0,
                                //   )
                                // ]
                              ),
                              width: 150,
                              height: 150.0,
                              child: Center(
                                child: itemPhotosWidgetList.isEmpty
                                    ? Center(
                                        child: MaterialButton(
                                          onPressed: pickPhotoFromGallery,
                                          child: Container(
                                            alignment: Alignment.bottomCenter,
                                            child: Center(
                                              child: Image.network(
                                                _productModel.image.toString(),
                                                height: 80.0,
                                                width: 80.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    : SingleChildScrollView(
                                        scrollDirection: Axis.vertical,
                                        child: Wrap(
                                          spacing: 5.0,
                                          direction: Axis.horizontal,
                                          children: itemPhotosWidgetList,
                                          alignment: WrapAlignment.spaceEvenly,
                                          runSpacing: 10.0,
                                        ),
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: _size.height * 0.03,
                      ),
                      Center(
                        child: Container(
                          height: 50,
                          child: loader
                              ? const Center(
                               child: CircularProgressIndicator(),
                          )
                              : GestureDetector(
                            onTap: () {
                              setState(() {
                                loader = true;
                              });
                              itemPhotosWidgetList.isNotEmpty?
                              uplaodImageAndSaveItemInfo()
                              : print("old image");
                              setState(() {
                                loader = false;
                              });
                            },
                            child: Container(
                              height: 50,
                              width: _size.width / 1.5,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  'Update Product',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: _size.height * 0.01,
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     Padding(
                      //       padding: const EdgeInsets.only(
                      //         top: 50.0,
                      //         left: 100.0,
                      //         right: 100.0,
                      //       ),
                      //       child: FlatButton(
                      //           shape: RoundedRectangleBorder(
                      //             borderRadius:
                      //                 BorderRadius.circular(10),
                      //           ),
                      //           padding: const EdgeInsets.symmetric(
                      //               horizontal: 20.0, vertical: 15.0),
                      //           color: const Color.fromRGBO(
                      //               0, 35, 102, 1),
                      //           onPressed: uploading
                      //               ? null
                      //               : () =>
                      //                   uplaodImageAndSaveItemInfo(),
                      //           child: uploading
                      //               ? const SizedBox(
                      //                   child:
                      //                       CircularProgressIndicator(),
                      //                   height: 15.0,
                      //                 )
                      //               : const Text(
                      //                   "Add Product",
                      //                   style: TextStyle(
                      //                     color: Colors.white,
                      //                     fontSize: 20.0,
                      //                     fontWeight: FontWeight.bold,
                      //                   ),
                      //                 )),
                      //     ),
                      //   ],
                      // ),
                      // GetBuilder<ProductController>(
                      //     init: ProductController(),
                      //     builder: (c) {
                      //       return GetBuilder<ProductController>(
                      //           init: ProductController(),
                      //           builder: (con) {
                      //             return con.photo == null
                      //                 ? Column(
                      //                     children: [
                      //                       SizedBox(
                      //                         width: _size.width / 6,
                      //                         height: 50,
                      //                         child: ElevatedButton(
                      //                           onPressed: () {
                      //                             productController
                      //                                 .pickImage(
                      //                                     ImageSource
                      //                                         .gallery);
                      //                           },
                      //                           child: const Center(
                      //                             child: Text(
                      //                               'Pick Profile Picture',
                      //                               style: TextStyle(
                      //                                 color: Colors
                      //                                     .white,
                      //                                 fontSize: 15,
                      //                               ),
                      //                             ),
                      //                           ),
                      //                         ),
                      //                       )
                      //                     ],
                      //                   )
                      //                 : AspectRatio(
                      //                     aspectRatio: 16 / 9,
                      //                     child: Container(
                      //                       child: kIsWeb
                      //                           ? Image.network(
                      //                               File(con.photo!
                      //                                       .path)
                      //                                   .path,
                      //                             )
                      //                           : Image.file(
                      //                               File(con
                      //                                   .photo!.path),
                      //                             ),
                      //                     ),
                      //                   );
                      //           });
                      //     }),
                      // SizedBox(
                      //   height: _size.height * 0.2,
                      // ),
                      // Center(
                      //   child: GestureDetector(
                      //     onTap: () {
                      //       productController
                      //           .uplaodImageAndSaveItemInfo();
                      //     },
                      //     child: Container(
                      //       height: 50,
                      //       width: _size.width / 5,
                      //       decoration: BoxDecoration(
                      //         color: Colors.black,
                      //         borderRadius: BorderRadius.circular(30),
                      //         border: Border.all(
                      //           color: Colors.white,
                      //           width: 2,
                      //         ),
                      //       ),
                      //       child: const Center(
                      //         child: Text(
                      //           'Add Product',
                      //           style: TextStyle(
                      //             color: Colors.white,
                      //             fontSize: 15,
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      SizedBox(
                        height: _size.height * 0.01,
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }

  addImage() {
    for (var bytes in photo!) {
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
    photo = await _picker.pickMultiImage();
    setState(() {
        itemImagesList = itemImagesList + photo!;
        addImage();
        photo!.clear();
      });

  }

  Future<String> uplaodImageAndSaveItemInfo() async {
    setState(() {
      uploading = true;
    });
    PickedFile? pickedFile;
    String? productId = const Uuid().v4();
    for (int i = 0; i < itemImagesList.length; i++) {
      file = File(itemImagesList[i].path);
      pickedFile = PickedFile(file!.path);
      await uploadImageToStorage(pickedFile, productId);
    }
    return productId;
  }

  uploadImageToStorage(PickedFile? pickedFile, String productId) async {
    final String? filePath = basename(pickedFile!.path);
    Reference reference = FirebaseStorage.instance.ref().child(filePath!);
    await reference.putData(
      await pickedFile.readAsBytes(),
      SettableMetadata(contentType: 'image/jpeg'),
    );
    await reference.getDownloadURL().then((fileURL) async {
      print('File URL: $fileURL');
      var result = await FirebaseFirestore.instance
          .collection('products')
          .where('id',)
          .get();
      print("image uploaded: $fileURL");
    });
    if (itemImagesList.length == itemImagesList.length) {
      setState(() {
        uploading = false;
      });
    } else {
      print("error");
    }
  }



}
