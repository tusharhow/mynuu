import 'package:flutter/material.dart';
import 'package:mynuu/controllers/product_controller.dart';
import 'package:get/get.dart';
import 'package:mynuu/models/product_model.dart';
import '../controllers/default_controller.dart';

class FavouriteProductDetailsScreen extends StatelessWidget {
  FavouriteProductDetailsScreen({Key? key, required this.product})
      : super(key: key);
  ProductModel product;
  @override
  Widget build(BuildContext context) {
    final productController = Get.put(ProductController());
    final dController = Get.put(DefaultController());
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                // Image.asset(
                //   'assets/images/dish.png',
                //   fit: BoxFit.cover,
                // ),
                // Image.network(
                //   product.image.toString(),
                //   fit: BoxFit.cover,
                // ),
                Image.network(
                  product.image.toString(),
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                ),
                Positioned(
                  bottom: 200,
                  left: 50,
                  child: Text(
                    '\$${product.price.toString()}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 170,
                  left: 50,
                  child: Text(
                    product.name.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 120,
                  left: 50,
                  child: Text(
                    product.description.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 70,
                  right: 80,
                  child: GestureDetector(
                    onTap: () {
                      dController.onFavouriteButtonClicked();

                      productController.addToWishList(product);
                    },
                    child: GetBuilder<DefaultController>(builder: (cont) {
                      return Image.asset(
                        'assets/icons/heart.png',
                        color: cont.isClicked ? Colors.red : Colors.white,
                      );
                    }),
                  ),
                ),
                Positioned(
                    bottom: 70,
                    right: 40,
                    child: GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.share,
                        color: Colors.white,
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
