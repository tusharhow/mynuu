import 'package:flutter/material.dart';
import 'package:mynuu/components/navigate.dart';
import 'package:mynuu/controllers/product_controller.dart';
import 'package:get/get.dart';
import 'package:mynuu/screens/favourite_products_details_page.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    String search = '';
    ProductController productController = Get.put(ProductController());
    final TextEditingController searchController = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          elevation: 0,
          title: SizedBox(
            height: 50,
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear, color: Colors.white),
                    onPressed: () {
                      searchController.clear();
                    },
                  ),
                  hintText: 'Search',
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 16,fontFamily: 'Intro',
                  )),
              onChanged: (value) {
                search = value;
                productController.searchProduct(search);
              },
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,fontFamily: 'Intro',
              ),
            ),
          ),
        ),
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          GetBuilder<ProductController>(builder: (cont) {
            if (cont.searchList.isEmpty) {
              return const Padding(
                padding: EdgeInsets.only(top: 250),
                child: Center(
                  child: Text(
                    'No Products Found',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,fontFamily: 'Intro',
                    ),
                  ),
                ),
              );
            } else {
              return SizedBox(
                height: 300,
                child: ListView.builder(
                    itemCount: cont.searchList.length,
                    scrollDirection: Axis.vertical,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      if (cont.searchList.length == 0) {
                        return Center(
                          child: Text(
                            '',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,fontFamily: 'Intro',
                            ),
                          ),
                        );
                      } else {
                        return SizedBox(
                          height: _size.height,
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: cont.searchList.length,
                            itemBuilder: (context, index) {
                              // final data = cont.searchList[index];
                              return GestureDetector(
                                onTap: () {
                                  push(
                                      context: context,
                                      widget: FavouriteProductDetailsScreen(
                                          product: cont.searchList[index]));
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
                                          height: _size.height * 0.15,
                                          width: _size.width * 0.30,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                              image: NetworkImage(cont
                                                  .searchList[index].image
                                                  .toString()),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: _size.height * 0.02,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  cont.searchList[index].name
                                                      .toString(),
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: _size.height * 0.01,
                                            ),
                                            Text(
                                              cont.searchList[index].description
                                                  .toString(),
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,fontFamily: 'Intro',
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Spacer(),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                searchController.text = '';
                                                cont.searchList.clear();
                                              },
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 20),
                                                child: Image.asset(
                                                  'assets/icons/cross.png',
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: _size.height * 0.04,
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(right: 20),
                                              child: Text(
                                                '\$ ${cont.searchList[index].price}',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12,fontFamily: 'Intro',
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                            shrinkWrap: true,
                          ),
                        );
                      }
                    }),
              );
            }
          }),
          // search bar
          // Container(
          //   margin: const EdgeInsets.only(top: 20),
          //   padding: const EdgeInsets.symmetric(horizontal: 20),
          //   decoration: BoxDecoration(
          //       color: Colors.white, borderRadius: BorderRadius.circular(20)),
          //   child: Row(
          //     children: const [
          //       Expanded(
          //         child: TextField(
          //           decoration: InputDecoration(
          //               hintText: 'Search',
          //               border: InputBorder.none,
          //               hintStyle: TextStyle(
          //                 color: Colors.grey,
          //                 fontSize: 16,
          //               )),
          //         ),
          //       ),
          //       Icon(
          //         Icons.search,
          //         color: Colors.grey,
          //       )
          //     ],
          //   ),
          // ),
          // const SizedBox(height: 30),
          // Padding(
          //   padding: const EdgeInsets.only(left: 20, bottom: 20),
          //   child: Row(
          //     children: const [
          //       Text(
          //         'Recent searches',
          //         style: TextStyle(
          //           color: Colors.white,
          //           fontSize: 18,
          //           fontWeight: FontWeight.bold,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),

          // GetBuilder<ProductController>(
          //     init: ProductController(),
          //     builder: (cont) {
          //       if (cont.products.length == 0) {
          //         return Center(
          //           child: CircularProgressIndicator(),
          //         );
          //       } else {
          //         return SizedBox(
          //           height: 200,
          //           child: ListView.builder(
          //               scrollDirection: Axis.horizontal,
          //               itemCount: productController.products.length,
          //               itemBuilder: (context, index) {
          //                 final data = productController.products[index];
          //                 return Padding(
          //                   padding: const EdgeInsets.only(left: 20),
          //                   child: Column(
          //                     crossAxisAlignment: CrossAxisAlignment.start,
          //                     children: [
          //                       // Container(
          //                       //   height: _size.height * 0.2,
          //                       //   width: _size.width * 0.35,
          //                       //   decoration: BoxDecoration(
          //                       //     borderRadius: BorderRadius.circular(20),
          //                       //     image: DecorationImage(
          //                       //       image: NetworkImage(
          //                       //           _foodNetworkImages[index]),
          //                       //       fit: BoxFit.cover,
          //                       //     ),
          //                       //   ),
          //                       // ),
          //                       SizedBox(
          //                         height: _size.height * 0.01,
          //                       ),
          //                       Text(
          //                         data.name.toString(),
          //                         style: TextStyle(
          //                           color: Colors.white,
          //                           fontSize: 15,
          //                           fontWeight: FontWeight.bold,
          //                         ),
          //                       ),
          //                     ],
          //                   ),
          //                 );
          //               }),
          //         );
          //       }
          //     }),
        ])));
  }
}
