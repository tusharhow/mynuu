import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class DashboardMobile extends StatelessWidget {
  const DashboardMobile({
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
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 25, right: 25),
            child: Row(
              children: [
                Image.asset(
                  'assets/logos/logo3.png',
                  height: _size.height * 0.02,
                ),
                SizedBox(
                  width: _size.width * 0.03,
                ),
                Container(
                  height: 35,
                  width: 35,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black38,
                  ),
                  child: const Center(
                    child: Text(
                      'FG',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: _size.width * 0.01,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Tushar Mahmud',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: _size.height * 0.01,
                    ),
                    const Text(
                      'Cantina la 20',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Image.asset(
                  'assets/icons/set.png',
                ),
              ],
            ),
          ),
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
                              height: _size.height * 0.03,
                              width: _size.width / 5,
                              decoration: BoxDecoration(
                                color: const Color(0xffB2B3B7),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: const Center(
                                child: Text(
                                  'View menu',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: _size.width * 0.05,
                            ),
                            SizedBox(
                              width: _size.width * 0.3,
                              height: _size.height * 0.03,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(10),
                                  hintText: 'Search',
                                  hintStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                  suffixIcon: const Icon(
                                    Icons.search,
                                    color: Colors.white,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: const BorderSide(
                                      color: Colors.white,
                                      width: 1,
                                    ),
                                  ),
                                  enabled: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: const BorderSide(
                                      color: Colors.white,
                                      width: 1,
                                    ),
                                  ),
                                ),
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                            const Spacer(),
                            Padding(
                              padding: EdgeInsets.only(
                                right: _size.width * 0.03,
                              ),
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  color: Colors.white54,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Center(
                                  child: Image.asset(
                                    'assets/icons/set.png',
                                    height: 15,
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
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: _size.width * 0.01,
                            left: _size.width * 0.03,
                            right: _size.width * 0.03,
                          ),
                          child: Row(
                            children: [
                              const Text(
                                'Item Number',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(width: _size.width * 0.03),
                              const Text(
                                'Pictures',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(width: _size.width * 0.03),
                              const Text(
                                'Name',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(width: _size.width * 0.03),
                              const Text(
                                'Description',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(width: _size.width * 0.07),
                              const Text(
                                'Filters',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(width: _size.width * 0.03),
                              const Text(
                                'Times Liked',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(width: _size.width * 0.03),
                              const Text(
                                'Times Viewed',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(width: _size.width * 0.03),
                              const Text(
                                'Access',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
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
                          textStyle: const TextStyle(
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
