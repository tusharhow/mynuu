import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import '../../../components/top_nav_bar.dart';

class DashboardDesktop extends StatelessWidget {
  const DashboardDesktop({
    Key? key,
    required Size size,
  })  : _size = size,
        super(key: key);

  final Size _size;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TopNavBar(size: _size),
          SizedBox(
            height: _size.height * 0.03,
          ),
          Stack(
            children: [
              Container(
                height: _size.height * 0.9,
                width: _size.width / 1.1,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              Positioned(
                top: _size.height * 0.03,
                left: _size.width * 0.03,
                right: _size.width * 0.03,
                bottom: _size.height * 0.03,
                child: Container(
                  height: _size.height * 0.8,
                  width: _size.width / 1.2,
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
                          top: _size.height * 0.03,
                          left: _size.height * 0.04,
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: _size.height * 0.04,
                              width: _size.width / 8,
                              decoration: BoxDecoration(
                                color: const Color(0xffB2B3B7),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: const Center(
                                child: Text(
                                  'View menu in browser',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: _size.width * 0.05,
                            ),
                            SizedBox(
                              width: _size.width * 0.2,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Search',
                                  hintStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                  suffixIcon: Icon(
                                    Icons.search,
                                    color: Colors.white,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 1,
                                    ),
                                  ),
                                  enabled: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 1,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Spacer(),
                            Padding(
                              padding: EdgeInsets.only(
                                right: _size.width * 0.03,
                              ),
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: Colors.white54,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Center(
                                  child: Image.asset(
                                    'assets/icons/set.png',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: _size.height * 0.03,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: _size.width * 0.01,
                          left: _size.width * 0.03,
                          right: _size.width * 0.03,
                        ),
                        child: Row(
                          children: [
                            Text(
                              'Item Number',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(width: _size.width * 0.03),
                            Text(
                              'Pictures',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(width: _size.width * 0.03),
                            Text(
                              'Name',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(width: _size.width * 0.03),
                            Text(
                              'Description',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(width: _size.width * 0.07),
                            Text(
                              'Filters',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(width: _size.width * 0.03),
                            Text(
                              'Times Liked',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(width: _size.width * 0.03),
                            Text(
                              'Times Viewed',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(width: _size.width * 0.03),
                            Text(
                              'Access',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: _size.height * 0.03,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: _size.width * 0.03,
                          right: _size.width * 0.03,
                        ),
                        child: GFAccordion(
                          contentBackgroundColor: Colors.black12,
                          collapsedTitleBackgroundColor: Colors.black,
                          expandedTitleBackgroundColor: Colors.white54,
                          title: 'Vegeterian',
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                          contentChild: Column(
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    '#35',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(width: _size.width * 0.03),
                                  Image.asset(
                                    'assets/images/dish2.png',
                                    height: _size.height * 0.05,
                                  ),
                                  SizedBox(width: _size.width * 0.03),
                                  const Text(
                                    'Roasted Cauliflower',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(width: _size.width * 0.03),
                                  const Text(
                                    'Cauliflower is a vegetable, often referred',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                    ),
                                  ),
                                  SizedBox(width: _size.width * 0.03),
                                  const Text(
                                    'Vegetables',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(width: _size.width * 0.03),
                                  const Text(
                                    '1,352',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(width: _size.width * 0.03),
                                  const Text(
                                    '158,500',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(width: _size.width * 0.03),
                                  Container(
                                    height: 15,
                                    width: 15,
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: _size.height * 0.01,
                              ),
                              Row(
                                children: [
                                  const Text(
                                    '#52',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(width: _size.width * 0.03),
                                  Image.asset(
                                    'assets/images/dish3.png',
                                    height: _size.height * 0.05,
                                  ),
                                  SizedBox(width: _size.width * 0.03),
                                  const Text(
                                    'Roasted Cauliflower',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(width: _size.width * 0.03),
                                  const Text(
                                    'Cauliflower is a vegetable, often referred',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                    ),
                                  ),
                                  SizedBox(width: _size.width * 0.03),
                                  const Text(
                                    'Vegetables',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(width: _size.width * 0.03),
                                  const Text(
                                    '1,352',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(width: _size.width * 0.03),
                                  const Text(
                                    '158,500',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(width: _size.width * 0.03),
                                  Container(
                                    height: 15,
                                    width: 15,
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: _size.height * 0.01,
                              ),
                              Row(
                                children: [
                                  const Text(
                                    '#52',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(width: _size.width * 0.03),
                                  // Image.asset(
                                  //   'assets/images/dish3.png',
                                  //   height: _size.height * 0.05,
                                  // ),
                                  Column(
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                          color: Colors.white54,
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        child: const Center(
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: _size.height * 0.01,
                                      ),
                                      const Text(
                                        'Add Image',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: _size.width * 0.03),
                                  const Text(
                                    'Roasted Cauliflower',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(width: _size.width * 0.03),
                                  const Text(
                                    'Cauliflower is a vegetable, often referred',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                    ),
                                  ),
                                  SizedBox(width: _size.width * 0.03),
                                  const Text(
                                    'Add filter',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(width: _size.width * 0.03),
                                  const Text(
                                    '',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(width: _size.width * 0.03),
                                  const Text(
                                    '-',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(width: _size.width * 0.03),
                                  Container(
                                    height: 15,
                                    width: 15,
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: _size.height * 0.01,
                              ),
                              Row(
                                children: [
                                  const Text(
                                    '#52',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(width: _size.width * 0.03),
                                  // Image.asset(
                                  //   'assets/images/dish3.png',
                                  //   height: _size.height * 0.05,
                                  // ),
                                  Column(
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                          color: Colors.white54,
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        child: const Center(
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: _size.height * 0.01,
                                      ),
                                      const Text(
                                        'Add Image',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: _size.width * 0.03),
                                  const Text(
                                    'Roasted Cauliflower',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(width: _size.width * 0.03),
                                  const Text(
                                    'Cauliflower is a vegetable, often referred',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                    ),
                                  ),
                                  SizedBox(width: _size.width * 0.03),
                                  const Text(
                                    'Add filter',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(width: _size.width * 0.03),
                                  const Text(
                                    '',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(width: _size.width * 0.03),
                                  const Text(
                                    '-',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(width: _size.width * 0.03),
                                  Container(
                                    height: 15,
                                    width: 15,
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: _size.height * 0.01,
                              ),
                              Row(
                                children: [
                                  const Text(
                                    '#52',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(width: _size.width * 0.03),
                                  // Image.asset(
                                  //   'assets/images/dish3.png',
                                  //   height: _size.height * 0.05,
                                  // ),
                                  Column(
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                          color: Colors.white54,
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        child: const Center(
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: _size.height * 0.01,
                                      ),
                                      const Text(
                                        'Add Image',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: _size.width * 0.03),
                                  const Text(
                                    'Roasted Cauliflower',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(width: _size.width * 0.03),
                                  const Text(
                                    'Cauliflower is a vegetable, often referred',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                    ),
                                  ),
                                  SizedBox(width: _size.width * 0.03),
                                  const Text(
                                    'Add filter',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(width: _size.width * 0.03),
                                  const Text(
                                    '',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(width: _size.width * 0.03),
                                  const Text(
                                    '-',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(width: _size.width * 0.03),
                                  Container(
                                    height: 15,
                                    width: 15,
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: _size.height * 0.01,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white54,
                                        ),
                                        child: Center(
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: _size.height * 0.01,
                                      ),
                                      Center(
                                        child: const Text(
                                          'Add new item',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
