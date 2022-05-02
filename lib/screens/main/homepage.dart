import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mynuu/components/navigate.dart';
import 'package:mynuu/controllers/auth_controller.dart';
import 'package:get/get.dart';
import 'package:mynuu/controllers/product_controller.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mynuu/screens/favourite_products_details_page.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    final formatCurrency = new NumberFormat.simpleCurrency();
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
                      onPressed: () {},
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

                // ElevatedButton(
                //   onPressed: () {
                //     productController.pickImage(ImageSource.gallery);
                //   },
                //   child: Text('Add img'),
                // ),
                // ElevatedButton(
                //   onPressed: () {
                //     productController.uploadFile();
                //   },
                //   child: Text('Add Product'),
                // ),

                // ElevatedButton(
                //   onPressed: () {
                //     productController
                //         .uploadFile(PickedFile(productController.photo!.path));
                //   },
                //   child: Text('Add Product'),
                // ),
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
                                // print(data.name);
                                return GestureDetector(
                                  onTap: () {
                                    push(
                                        context: context,
                                        widget: FavouriteProductDetailsScreen(
                                          product: cont.products[index],
                                        ));

                                    print(cont.products[index].name);
                                    // var dui = productController.getProductById(
                                    //     data.id.toString(), index);
                                    // print(cont.product!.name);

                                    // print(cont.product!.id);

                                    // print(
                                    //     'product id: ${cont.getprodbyID[index].price}');
                                  },
                                  child: Padding(
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
                        return SizedBox(
                          height: 230,
                          child: ListView.builder(
                            reverse: true,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              // productController.products.shuffle();
                              var daha = productController.products[index];
                              // var rev = productController.products.reversed;
                              // print(rev.elementAt(index).name);
                              return GestureDetector(
                                onTap: () {
                                  push(
                                      context: context,
                                      widget: FavouriteProductDetailsScreen(
                                        product: cont.products[index],
                                      ));
                                },
                                child: Padding(
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
                                              maxLines: 1,
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
