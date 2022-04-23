import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mynuu/controllers/auth_controller.dart';
import 'package:get/get.dart';
import 'package:mynuu/controllers/product_controller.dart';
import 'package:mynuu/models/product_model.dart';
import 'package:image_picker/image_picker.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    List<String> _foodNetworkImages = [
      'https://images.unsplash.com/photo-1541832676-9b763b0239ab?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8c3RlYW1lZCUyMHZlZ2V0YWJsZXN8ZW58MHx8MHx8&w=1000&q=80',
      'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/food-styling-tips4-1591717115.jpg?crop=1.00xw:0.834xh;0,0.0568xh&resize=480:*',
      'https://i.guim.co.uk/img/media/333ee9d52eb49a4a5056c5d42183029ad11487fe/0_126_2979_3374/master/2979.jpg?width=465&quality=45&auto=format&fit=max&dpr=2&s=5a684e1432f94e1fa60c57b547a8a9ac',
      'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aGVhbHRoeSUyMGZvb2R8ZW58MHx8MHx8&w=1000&q=80',
    ];
    List<String> _foodName = [
      'Pizza',
      'Burger',
      'Pasta',
      'Noodles',
    ];
    List<String> _mainCoursedFood = [
      'Roasted Cauliflower',
      'Molcajete de Pollo',
      'Sopes de Pollo',
      'Huanchinango Frito',
    ];
    AuthService authService = Get.put(AuthService());
    ProductController productController = Get.put(ProductController());
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.black,
      //   elevation: 0,
      // ),
      key: _scaffoldKey,
      drawer: Drawer(
          child: Column(
        children: [
          SizedBox(
            height: _size.height * 0.1,
          ),
          ElevatedButton(
            onPressed: () {
              authService.signOut(context);
            },
            child: Text('Logout'),
          ),
        ],
      )),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            height: _size.height * 0.06,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    _scaffoldKey.currentState!.openDrawer();
                  },
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: const BoxDecoration(
                      // borderRadius: BorderRadius.circular(20),
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: const Center(
                      child: Text(
                        'FG',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),
                GetBuilder<ProductController>(builder: (cont) {
                  return IconButton(
                      onPressed: () {
                        // cont.getProducts();
                      },
                      icon: Icon(
                        Icons.replay_rounded,
                        color: Colors.white,
                        size: 25,
                      ));
                }),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Image.asset(
              'assets/logos/logo.png',
            ),
          ),
          // SizedBox(
          //   height: _size.height * 0.07,
          // ),
          SizedBox(
            height: _size.height * 0.7,
            child: ListView(
              shrinkWrap: true,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: const [
                      Text(
                        'Good evening',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    productController.pickImage(ImageSource.gallery);
                  },
                  child: Text('Add img'),
                ),
                // ElevatedButton(
                //   onPressed: () {
                //     productController.uploadFile();
                //   },
                //   child: Text('Add Product'),
                // ),

                ElevatedButton(
                  onPressed: () {
                    productController
                        .uploadFile(PickedFile(productController.photo!.path));
                  },
                  child: Text('Add Product'),
                ),
                SizedBox(
                  height: _size.height * 0.05,
                ),
                GetBuilder<ProductController>(
                    init: ProductController(),
                    builder: (cont) {
                      if (cont.products.length == 0) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return SizedBox(
                          height: 180,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: cont.products.length,
                              itemBuilder: (context, index) {
                                final data = productController.products[index];
                                print(data.name);
                                return Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: _size.height * 0.20,
                                        width: _size.width * 0.32,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                data.image.toString()),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      // ElevatedButton(
                                      //   onPressed: () {
                                      //     productController.addToWishList(
                                      //         ProductModel(
                                      //             category: data.category,
                                      //             image: data.image,
                                      //             name: data.name,
                                      //             description: data.description,
                                      //             timesLiked: data.timesLiked,
                                      //             timesViewed: data.timesViewed,
                                      //             access: data.access,
                                      //             price: data.price));
                                      //   },
                                      //   child: Text('Add wishlist'),
                                      // ),
                                      SizedBox(
                                        height: _size.height * 0.01,
                                      ),
                                      Text(
                                        data.name.toString(),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        );
                      }
                    }),
                SizedBox(
                  height: _size.height * 0.03,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Text(
                        'Main course',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: _size.height * 0.02,
                ),

                GetBuilder<ProductController>(
                    init: ProductController(),
                    builder: (cont) {
                      if (cont.products.length == 0) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        // return SizedBox(
                        //   height: 180,
                        //   child: ListView.builder(
                        //       scrollDirection: Axis.vertical,
                        //       itemCount: cont.products.length,
                        //       itemBuilder: (context, index) {
                        //         // final data = productController.products[index];
                        //         // shuffle data
                        //         productController.products.shuffle();
                        //         var daha = productController.products[index];
                        //         print(daha.name);
                        //         return Padding(
                        //           padding: const EdgeInsets.only(left: 20),
                        //           child: Column(
                        //             crossAxisAlignment:
                        //                 CrossAxisAlignment.start,
                        //             children: [
                        //               Container(
                        //                 height: _size.height * 0.20,
                        //                 width: _size.width * 0.32,
                        //                 decoration: BoxDecoration(
                        //                   borderRadius:
                        //                       BorderRadius.circular(20),
                        //                   image: DecorationImage(
                        //                     image: NetworkImage(
                        //                         daha.image.toString()),
                        //                     fit: BoxFit.cover,
                        //                   ),
                        //                 ),
                        //               ),

                        //               SizedBox(
                        //                 height: _size.height * 0.01,
                        //               ),
                        //               Text(
                        //                 daha.name.toString(),
                        //                 style: TextStyle(
                        //                   color: Colors.white,
                        //                   fontSize: 15,
                        //                   fontWeight: FontWeight.bold,
                        //                 ),
                        //               ),
                        //             ],
                        //           ),
                        //         );
                        //       }),
                        // );
                        return SizedBox(
                          height: 230,
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              productController.products.shuffle();
                              var daha = productController.products[index];
                              return Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white24.withOpacity(0.15),
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: _size.height * 0.12,
                                        width: _size.width * 0.30,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                daha.image.toString()),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      // ElevatedButton(
                                      //   onPressed: () {
                                      //     productController.addToWishList(
                                      //         ProductModel(
                                      //             price: '',
                                      //             category: daha.category,
                                      //             image: daha.image,
                                      //             name: daha.name,
                                      //             description: daha.description,
                                      //             timesLiked: daha.timesLiked,
                                      //             timesViewed: daha.timesViewed,
                                      //             access: daha.access));
                                      //   },
                                      //   child: Text('Add wishlist'),
                                      // ),
                                      SizedBox(
                                        width: _size.height * 0.02,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            daha.name.toString(),
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                            ),
                                          ),
                                          SizedBox(
                                            height: _size.height * 0.01,
                                          ),
                                          Text(
                                            daha.description.toString(),
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Spacer(),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 20),
                                        child: Text(
                                          '\$${daha.price}',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            itemCount: productController.products.length,
                            shrinkWrap: true,
                          ),
                        );
                      }
                    }),
                SizedBox(
                  height: _size.height * 0.1,
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
