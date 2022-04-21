import 'package:flutter/material.dart';
import 'package:mynuu/components/navigate.dart';
import 'package:mynuu/screens/favourite_products_details_page.dart';
import 'package:get/get.dart';
import '../controllers/product_controller.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

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
    final productController = Get.put(ProductController());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
        ),
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          // search bar

          const SizedBox(height: 20),

          GetBuilder<ProductController>(
              init: ProductController(),
              builder: (cont) {
                if (cont.getWishlist.length == 0) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return SizedBox(
                    height: _size.height,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            push(
                                context: context,
                                widget: const FavouriteProductDetailsScreen());
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
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: _size.height * 0.10,
                                      width: _size.width * 0.30,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          image: NetworkImage(cont
                                              .getWishlist[index].image
                                              .toString()),
                                          fit: BoxFit.cover,
                                        ),
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
                                            cont.getWishlist[index].name
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
                                        cont.getWishlist[index].description
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
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 15.0),
                                        child: Image.asset(
                                          'assets/icons/cross.png',
                                        ),
                                      ),
                                      SizedBox(
                                        height: _size.height * 0.04,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 20),
                                        child: Text(
                                          '\$ ${cont.getWishlist[index].price}',
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
                          ),
                        );
                      },
                      itemCount: cont.getWishlist.length,
                      shrinkWrap: true,
                    ),
                  );
                }
              }),
        ])));
  }
}
