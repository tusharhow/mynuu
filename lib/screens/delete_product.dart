import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/navigate.dart';
import '../controllers/product_controller.dart';
import 'edit.dart';
import 'favourite_products_details_page.dart';

class DeleteProduct extends StatefulWidget {
  const DeleteProduct({Key? key}) : super(key: key);

  @override
  State<DeleteProduct> createState() => _DeleteProductState();
}

class _DeleteProductState extends State<DeleteProduct> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    ProductController productController = Get.put(ProductController());
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          GetBuilder<ProductController>(
              init: ProductController(),
              builder: (cont) {
                if (cont.products.length == 0) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return SizedBox(
                    height: _size.height,
                    child: ListView.builder(
                      reverse: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        // productController.products.shuffle();
                        var daha = productController.products[index];
                        // var rev = productController.products.reversed;
                        // print(rev.elementAt(index).name);
                        // RIGHT TO LEFT DELETE

                        return Dismissible(
                          background: Container(
                            color: Colors.red,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          key: UniqueKey(),
                          onDismissed: (direction) {
                            setState(() {
                              cont.deleteProduct(daha.id.toString(), context);
                              cont.products.removeAt(index);
                            });
                            print(daha.id);
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
                                      image: DecorationImage(
                                        image:
                                            NetworkImage(daha.image.toString()),
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
                                  Row(
                                    children: [
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
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 20),
                                        child: IconButton(
                                          icon: Icon(
                                            Icons.edit,
                                            color: Colors.white,
                                          ),
                                          onPressed: () {
                                            push(
                                                context: context,
                                                widget: EditProduct(
                                                  pID: daha.id.toString(),
                                                ));
                                            print(daha.id);
                                          },
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
                      itemCount: productController.products.length,
                      shrinkWrap: true,
                    ),
                  );
                }
              }),
        ],
      ),
    );
  }
}
