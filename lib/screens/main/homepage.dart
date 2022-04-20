import 'package:flutter/material.dart';
import 'package:mynuu/controllers/auth_controller.dart';
import 'package:get/get.dart';
import 'package:mynuu/controllers/product_controller.dart';

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
                    productController.addProduct();
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
                          height: 200,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: cont.searchList.length,
                              itemBuilder: (context, index) {
                                final data = productController.products[index];
                                return Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: _size.height * 0.2,
                                        width: _size.width * 0.35,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                _foodNetworkImages[index]),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
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
                  height: _size.height * 0.005,
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
                SizedBox(
                  height: 230,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
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
                                height: _size.height * 0.12,
                                width: _size.width * 0.30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image:
                                        NetworkImage(_foodNetworkImages[index]),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: _size.height * 0.02,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _mainCoursedFood[index],
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                  SizedBox(
                                    height: _size.height * 0.01,
                                  ),
                                  Text(
                                    'This is a very good food',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
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
                        ),
                      );
                    },
                    itemCount: _foodNetworkImages.length,
                    shrinkWrap: true,
                  ),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
