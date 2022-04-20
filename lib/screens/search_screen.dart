import 'package:flutter/material.dart';
import 'package:mynuu/controllers/product_controller.dart';
import 'package:get/get.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    List<String> _foodNetworkImages = [
      'https://images.unsplash.com/photo-1541832676-9b763b0239ab?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8c3RlYW1lZCUyMHZlZ2V0YWJsZXN8ZW58MHx8MHx8&w=1000&q=80',
      'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/food-styling-tips4-1591717115.jpg?crop=1.00xw:0.834xh;0,0.0568xh&resize=480:*',
      'https://i.guim.co.uk/img/media/333ee9d52eb49a4a5056c5d42183029ad11487fe/0_126_2979_3374/master/2979.jpg?width=465&quality=45&auto=format&fit=max&dpr=2&s=5a684e1432f94e1fa60c57b547a8a9ac',
      'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aGVhbHRoeSUyMGZvb2R8ZW58MHx8MHx8&w=1000&q=80',
    ];

    List<String> _mainCoursedFood = [
      'Roasted Cauliflower',
      'Molcajete de Pollo',
      'Sopes de Pollo',
      'Huanchinango Frito',
    ];
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
                  hintText: 'Search',
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  )),
              onChanged: (value) {
                search = value;
                productController.searchProduct(search);
              },
            ),
          ),
        ),
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          GetBuilder<ProductController>(builder: (cont) {
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
                          'No results found',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
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
                                      height: _size.height * 0.15,
                                      width: _size.width * 0.30,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              _foodNetworkImages[index]),
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
                                              MainAxisAlignment.spaceBetween,
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
                                            fontSize: 12,
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
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 20),
                                          child: Image.asset(
                                            'assets/icons/cross.png',
                                          ),
                                        ),
                                        SizedBox(
                                          height: _size.height * 0.04,
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(right: 20),
                                          child: Text(
                                            '\$10',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
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
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 20),
            child: Row(
              children: const [
                Text(
                  'Recent searches',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
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
                    height: 200,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: productController.products.length,
                        itemBuilder: (context, index) {
                          final data = productController.products[index];
                          return Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Container(
                                //   height: _size.height * 0.2,
                                //   width: _size.width * 0.35,
                                //   decoration: BoxDecoration(
                                //     borderRadius: BorderRadius.circular(20),
                                //     image: DecorationImage(
                                //       image: NetworkImage(
                                //           _foodNetworkImages[index]),
                                //       fit: BoxFit.cover,
                                //     ),
                                //   ),
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
        ])));
  }
}
