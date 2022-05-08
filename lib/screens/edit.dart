//import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:mynuu/controllers/product_edit_controller.dart';
import 'package:flutter/material.dart';

import 'dart:core';
import 'package:get/get.dart';

class EditProduct extends StatelessWidget {
  late final ProductEditController controller;

  EditProduct({Key? key, required String pID}) : super(key: key) {
    controller = Get.put(ProductEditController(pID));
  }

  // List<Widget> itemPhotosWidgetList = <Widget>[];

  // final ImagePicker _picker = ImagePicker();
  // File? file;
  // List<XFile>? photo = <XFile>[];
  // List<XFile> itemImagesList = <XFile>[];
  //
  // List<String> downloadUrl = <String>[];
  // final TextEditingController ttitleController = TextEditingController();
  // final TextEditingController descriptionController = TextEditingController();
  // final TextEditingController priceController = TextEditingController();
  // final TextEditingController categoryController = TextEditingController();
  // bool uploading = false;

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
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
                    children: const [
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
                        child: Obx(() {
                          return TextFormField(
                            controller: controller.titleController.value,
                            decoration: InputDecoration(
                              labelText: 'Product Name',
                              labelStyle: const TextStyle(
                                color: Colors.white54,
                                fontSize: 15,
                              ),
                              filled: true,
                              fillColor: Colors.white12,
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.white,
                                  ),
                                  borderRadius: BorderRadius.circular(5)),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          );
                        }),
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
                    children: const [
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
                        child: Obx(() {
                          return TextFormField(
                            controller: controller.descriptionController.value,
                            decoration: InputDecoration(
                              labelText: 'Description',
                              labelStyle: const TextStyle(
                                color: Colors.white54,
                                fontSize: 15,
                              ),
                              filled: true,
                              fillColor: Colors.white12,
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.white,
                                  ),
                                  borderRadius: BorderRadius.circular(5)),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                            maxLines: 2,
                          );
                        }),
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
                    children: const [
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
                        child: Obx(() {
                          return TextFormField(
                            controller: controller.priceController.value,
                            decoration: InputDecoration(
                              labelText: 'Price',
                              labelStyle: const TextStyle(
                                color: Colors.white54,
                                fontSize: 15,
                              ),
                              filled: true,
                              fillColor: Colors.white12,
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.white,
                                  ),
                                  borderRadius: BorderRadius.circular(5)),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          );
                        }),
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
                    children: const [
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
                        child: Obx(() {
                          return TextFormField(
                            controller: controller.categoryController.value,
                            decoration: InputDecoration(
                              labelText: 'Category',
                              labelStyle: const TextStyle(
                                color: Colors.white54,
                                fontSize: 15,
                              ),
                              filled: true,
                              fillColor: Colors.white12,
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.white,
                                  ),
                                  borderRadius: BorderRadius.circular(5)),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          );
                        }),
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
                        child: Obx(() {
                          return Center(
                            child: controller.itemPhotosWidgetList.isEmpty
                                ? Center(
                                    child: MaterialButton(
                                      onPressed: () {
                                        controller.pickPhotoFromGallery();
                                      },
                                      child: Container(
                                        alignment: Alignment.bottomCenter,
                                        child: Center(
                                          child: Image.network(
                                            "https://static.thenounproject.com/png/3322766-200.png",
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
                                      children: controller.itemPhotosWidgetList,
                                      alignment: WrapAlignment.spaceEvenly,
                                      runSpacing: 10.0,
                                    ),
                                  ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: _size.height * 0.03,
                ),
                Center(
                  child: InkWell(
                    onTap: () async {
                      await controller.uploadImageAndSaveItemInfo();

                      print("uploaded");
                      Get.back();
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
      ),
    );
  }
}
