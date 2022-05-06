import 'dart:html';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../components/navigate.dart';
import '../../controllers/product_controller.dart';
import '../favourite_products_details_page.dart';

class ViewMenu extends StatelessWidget {
  const ViewMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductController productController = Get.put(ProductController());
    final _size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title:  Text(
            'View Menu',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: Column(
          children: [
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
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SizedBox(
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
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Image.network(
                                          daha.image.toString(),
                                          fit: BoxFit.cover,
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
                                              fontSize: _size.height * 0.03,
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
                                        padding: const EdgeInsets.only(right: 20),
                                        child: Text(
                                          '\$${daha.price}',
                                          style: TextStyle(
                                            color: Colors.white,
                                              fontSize: _size.height * 0.03,
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
                      ),
                    );
                  }
                }),
          ],
        ));
  }
}
