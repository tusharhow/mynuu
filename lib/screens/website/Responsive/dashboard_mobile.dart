import 'dart:io';
import 'dart:io' show File;
//import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:mynuu/components/navigate.dart';
import 'package:mynuu/controllers/product_controller.dart';
import 'package:mynuu/screens/website/view_menu.dart';
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

import '../../bottom_navigation_screens.dart';
import '../../delete_product.dart';

class DashboardMobile extends StatefulWidget {
  const DashboardMobile({
    Key? key,
    required Size size,
  })  : _size = size,
        super(key: key);

  final Size _size;

  @override
  State<DashboardMobile> createState() => _DashboardMobileState();
}

List<Widget> itemPhotosWidgetList = <Widget>[];

final ImagePicker _picker = ImagePicker();
File? file;
List<XFile>? photo = <XFile>[];
List<XFile> itemImagesList = <XFile>[];

List<String> downloadUrl = <String>[];

bool uploading = false;
final productController = Get.put(ProductController());
final Uri _url = Uri.parse('http://menu.mynuutheapp.com/');
void _launchUrl() async {
  if (!await launchUrl(_url)) throw 'Could not launch $_url';
}

class _DashboardMobileState extends State<DashboardMobile> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _formKey,
      drawer: Drawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 25, right: 25),
              child: Row(
                children: [
                  Image.asset(
                    'assets/logos/logo3.png',
                    height: widget._size.height * 0.02,
                  ),
                  SizedBox(
                    width: widget._size.width * 0.03,
                  ),
                  Container(
                    height: 35,
                    width: 35,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black38,
                    ),
                    child: const Center(
                      child: Text(
                        'FG',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: widget._size.width * 0.01,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Tushar Mahmud',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: widget._size.height * 0.01,
                      ),
                      const Text(
                        'Cantina la 20',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Image.asset(
                    'assets/icons/set.png',
                  ),
                ],
              ),
            ),
            SizedBox(
              height: widget._size.height * 0.03,
            ),
            Stack(
              children: [
                Container(
                  height: widget._size.height * 1.20,
                  width: widget._size.width / 1.1,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                Positioned(
                  top: widget._size.height * 0.03,
                  left: widget._size.width * 0.03,
                  right: widget._size.width * 0.03,
                  bottom: widget._size.height * 0.03,
                  child: Container(
                    height: widget._size.height * 2,
                    width: widget._size.width / 1.2,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xff3A3B3D),
                          Color(0xff18191B),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: widget._size.height * 0.03,
                            left: widget._size.height * 0.04,
                          ),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: _launchUrl,
                                child: Container(
                                  height: widget._size.height * 0.03,
                                  width: widget._size.width / 5,
                                  decoration: BoxDecoration(
                                    color: const Color(0xffB2B3B7),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'View menu',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: widget._size.width * 0.05,
                              ),
                              SizedBox(
                                width: widget._size.width * 0.3,
                                height: widget._size.height * 0.03,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.all(10),
                                    hintText: 'Search',
                                    hintStyle: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                    suffixIcon: const Icon(
                                      Icons.search,
                                      color: Colors.white,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: const BorderSide(
                                        color: Colors.white,
                                        width: 1,
                                      ),
                                    ),
                                    enabled: true,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: const BorderSide(
                                        color: Colors.white,
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                              // Padding(
                              //   padding: const EdgeInsets.only(
                              //     left: 0,
                              //   ),
                              //   child: Row(
                              //     children: [
                              //       Text(
                              //         'Add new item',
                              //         style: TextStyle(
                              //           color: Colors.white,
                              //           fontSize: widget._size.width * 0.05,
                              //         ),
                              //       ),
                              //     ],
                              //   ),
                              // ),
                              SizedBox(
                                height: widget._size.height * 0.03,
                              ),
                              const Spacer(),
                              Padding(
                                padding: EdgeInsets.only(
                                  right: widget._size.width * 0.03,
                                ),
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.white54,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Center(
                                    child: Image.asset(
                                      'assets/icons/set.png',
                                      height: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: widget._size.height * 0.03,
                        ),
                        // SingleChildScrollView(
                        //   scrollDirection: Axis.horizontal,
                        //   child: Padding(
                        //     padding: EdgeInsets.only(
                        //       top: widget._size.width * 0.01,
                        //       left: widget._size.width * 0.03,
                        //       right: widget._size.width * 0.03,
                        //     ),
                        //     child: Row(
                        //       children: [
                        //         const Text(
                        //           'Item Number',
                        //           style: TextStyle(
                        //             color: Colors.white,
                        //             fontSize: 15,
                        //           ),
                        //         ),
                        //         SizedBox(width: widget._size.width * 0.03),
                        //         const Text(
                        //           'Pictures',
                        //           style: TextStyle(
                        //             color: Colors.white,
                        //             fontSize: 15,
                        //           ),
                        //         ),
                        //         SizedBox(width: widget._size.width * 0.03),
                        //         const Text(
                        //           'Name',
                        //           style: TextStyle(
                        //             color: Colors.white,
                        //             fontSize: 15,
                        //           ),
                        //         ),
                        //         SizedBox(width: widget._size.width * 0.03),
                        //         const Text(
                        //           'Description',
                        //           style: TextStyle(
                        //             color: Colors.white,
                        //             fontSize: 15,
                        //           ),
                        //         ),
                        //         SizedBox(width: widget._size.width * 0.07),
                        //         const Text(
                        //           'Filters',
                        //           style: TextStyle(
                        //             color: Colors.white,
                        //             fontSize: 15,
                        //           ),
                        //         ),
                        //         SizedBox(width: widget._size.width * 0.03),
                        //         const Text(
                        //           'Times Liked',
                        //           style: TextStyle(
                        //             color: Colors.white,
                        //             fontSize: 15,
                        //           ),
                        //         ),
                        //         SizedBox(width: widget._size.width * 0.03),
                        //         const Text(
                        //           'Times Viewed',
                        //           style: TextStyle(
                        //             color: Colors.white,
                        //             fontSize: 15,
                        //           ),
                        //         ),
                        //         SizedBox(width: widget._size.width * 0.03),
                        //         const Text(
                        //           'Access',
                        //           style: TextStyle(
                        //             color: Colors.white,
                        //             fontSize: 15,
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: widget._size.height * 0.03,
                        // ),
                        Padding(
                            padding: EdgeInsets.only(
                              left: widget._size.width * 0.03,
                              right: widget._size.width * 0.03,
                            ),
                            child: Column(
                              children: [
                                Form(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Add Product Name',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: widget._size.height * 0.03,
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 20),
                                            child: SizedBox(
                                              width: widget._size.width / 1.5,
                                              child: TextFormField(
                                                controller: productController
                                                    .titleController,
                                                decoration: InputDecoration(
                                                  labelText: 'Product Name',
                                                  labelStyle: TextStyle(
                                                    color: Colors.white54,
                                                    fontSize: 15,
                                                  ),
                                                  filled: true,
                                                  fillColor: Colors.white12,
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Colors.white,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
                                                  focusedBorder:
                                                      UnderlineInputBorder(
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
                                        height: widget._size.height * 0.01,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Add Product Description',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: widget._size.height * 0.01,
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 20),
                                            child: SizedBox(
                                              width: widget._size.width / 1.5,
                                              child: TextFormField(
                                                controller: productController
                                                    .descriptionController,
                                                decoration: InputDecoration(
                                                  labelText: 'Description',
                                                  labelStyle: TextStyle(
                                                    color: Colors.white54,
                                                    fontSize: 15,
                                                  ),
                                                  filled: true,
                                                  fillColor: Colors.white12,
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Colors.white,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
                                                  focusedBorder:
                                                      UnderlineInputBorder(
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
                                        height: widget._size.height * 0.03,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Product Price',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: widget._size.height * 0.01,
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 20),
                                            child: SizedBox(
                                              width: widget._size.width / 1.5,
                                              child: TextFormField(
                                                controller: productController
                                                    .priceController,
                                                decoration: InputDecoration(
                                                  labelText: 'Price',
                                                  labelStyle: TextStyle(
                                                    color: Colors.white54,
                                                    fontSize: 15,
                                                  ),
                                                  filled: true,
                                                  fillColor: Colors.white12,
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Colors.white,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
                                                  focusedBorder:
                                                      UnderlineInputBorder(
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
                                        height: widget._size.height * 0.03,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Product Category',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: widget._size.height * 0.01,
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 20),
                                            child: SizedBox(
                                              width: widget._size.width / 1.5,
                                              child: TextFormField(
                                                controller: productController
                                                    .categoryController,
                                                decoration: InputDecoration(
                                                  labelText: 'Category',
                                                  labelStyle: TextStyle(
                                                    color: Colors.white54,
                                                    fontSize: 15,
                                                  ),
                                                  filled: true,
                                                  fillColor: Colors.white12,
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Colors.white,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
                                                  focusedBorder:
                                                      UnderlineInputBorder(
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
                                        padding: const EdgeInsets.only(
                                            left: 20, top: 20),
                                        child: Row(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
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
                                                child: itemPhotosWidgetList
                                                        .isEmpty
                                                    ? Center(
                                                        child: MaterialButton(
                                                          onPressed:
                                                              pickPhotoFromGallery,
                                                          child: Container(
                                                            alignment: Alignment
                                                                .bottomCenter,
                                                            child: Center(
                                                              child:
                                                                  Image.network(
                                                                "https://static.thenounproject.com/png/3322766-200.png",
                                                                height: 80.0,
                                                                width: 80.0,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    : SingleChildScrollView(
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        child: Wrap(
                                                          spacing: 5.0,
                                                          direction:
                                                              Axis.horizontal,
                                                          children:
                                                              itemPhotosWidgetList,
                                                          alignment:
                                                              WrapAlignment
                                                                  .spaceEvenly,
                                                          runSpacing: 10.0,
                                                        ),
                                                      ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: widget._size.height * 0.07,
                                      ),
                                      Center(
                                        child: GestureDetector(
                                          onTap: uploading
                                              ? null
                                              : () =>
                                                  uplaodImageAndSaveItemInfo(),
                                          child: Container(
                                            height: 50,
                                            width: widget._size.width / 1.5,
                                            decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              border: Border.all(
                                                color: Colors.white,
                                                width: 2,
                                              ),
                                            ),
                                            child: const Center(
                                              child: Text(
                                                'Add Product',
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
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.02,
                                      ),
                                      Center(
                                        child: GestureDetector(
                                          onTap: () {
                                            push(
                                                context: context,
                                                widget: DeleteProduct());
                                          },
                                          child: Container(
                                            height: 50,
                                            width: widget._size.width / 1.5,
                                            decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              border: Border.all(
                                                color: Colors.white,
                                                width: 2,
                                              ),
                                            ),
                                            child: const Center(
                                              child: Text(
                                                'Delete/Edit Product',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
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
                                        height: widget._size.height * 0.01,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
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
    if (photo != null) {
      setState(() {
        itemImagesList = itemImagesList + photo!;
        addImage();
        photo!.clear();
      });
    } else {
      print("No image selected");
    }
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
    final String filePath = basename(pickedFile!.path);
    Reference reference = FirebaseStorage.instance.ref().child(filePath);
    await reference.putData(
      await pickedFile.readAsBytes(),
      SettableMetadata(contentType: 'image/jpeg'),
    );
    await reference.getDownloadURL().then((fileURL) {
      print('File URL: $fileURL');
      final res = FirebaseFirestore.instance.collection('products').add({
        'id': '${DateTime.now().millisecondsSinceEpoch}',
        'name': productController.titleController.text,
        'price': productController.priceController.text,
        'description': productController.descriptionController.text,
        'image': fileURL,
        'category': productController.categoryController.text,
        'times_likes': '',
        'times_viewed': '',
      });
      if (res != null) {
        setState(() {
          Get.snackbar(
            'Added',
            'Product Added Successfully',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white,
            borderRadius: 10,
            margin: EdgeInsets.all(10),
            borderColor: Colors.green,
            borderWidth: 2,
          );
        });
      }
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
