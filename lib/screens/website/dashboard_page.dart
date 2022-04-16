import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Scaffold(body: LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 1150 || constraints.maxHeight < 870) {
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
                                        contentPadding:
                                            const EdgeInsets.all(10),
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
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide: BorderSide(
                                            color: Colors.white,
                                            width: 1,
                                          ),
                                        ),
                                        enabled: true,
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide: BorderSide(
                                            color: Colors.white,
                                            width: 1,
                                          ),
                                        ),
                                      ),
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Spacer(),
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
                                        Text(
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
                                        Text(
                                          'Roasted Cauliflower',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                          ),
                                        ),
                                        SizedBox(width: _size.width * 0.03),
                                        Text(
                                          'Cauliflower is a vegetable, often referred',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                          ),
                                        ),
                                        SizedBox(width: _size.width * 0.03),
                                        Text(
                                          'Vegetables',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                          ),
                                        ),
                                        SizedBox(width: _size.width * 0.03),
                                        Text(
                                          '1,352',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                          ),
                                        ),
                                        SizedBox(width: _size.width * 0.03),
                                        Text(
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
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: _size.height * 0.01,
                                    ),
                                    Row(
                                      children: [
                                        Text(
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
                                        Text(
                                          'Roasted Cauliflower',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                          ),
                                        ),
                                        SizedBox(width: _size.width * 0.03),
                                        Text(
                                          'Cauliflower is a vegetable, often referred',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                          ),
                                        ),
                                        SizedBox(width: _size.width * 0.03),
                                        Text(
                                          'Vegetables',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                          ),
                                        ),
                                        SizedBox(width: _size.width * 0.03),
                                        Text(
                                          '1,352',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                          ),
                                        ),
                                        SizedBox(width: _size.width * 0.03),
                                        Text(
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
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: _size.height * 0.01,
                                    ),
                                    Row(
                                      children: [
                                        Text(
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
                                            Text(
                                              'Add Image',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: _size.width * 0.03),
                                        Text(
                                          'Roasted Cauliflower',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                          ),
                                        ),
                                        SizedBox(width: _size.width * 0.03),
                                        Text(
                                          'Cauliflower is a vegetable, often referred',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                          ),
                                        ),
                                        SizedBox(width: _size.width * 0.03),
                                        Text(
                                          'Add filter',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                          ),
                                        ),
                                        SizedBox(width: _size.width * 0.03),
                                        Text(
                                          '',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                          ),
                                        ),
                                        SizedBox(width: _size.width * 0.03),
                                        Text(
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
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: _size.height * 0.01,
                                    ),
                                    Row(
                                      children: [
                                        Text(
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
                                            Text(
                                              'Add Image',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: _size.width * 0.03),
                                        Text(
                                          'Roasted Cauliflower',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                          ),
                                        ),
                                        SizedBox(width: _size.width * 0.03),
                                        Text(
                                          'Cauliflower is a vegetable, often referred',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                          ),
                                        ),
                                        SizedBox(width: _size.width * 0.03),
                                        Text(
                                          'Add filter',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                          ),
                                        ),
                                        SizedBox(width: _size.width * 0.03),
                                        Text(
                                          '',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                          ),
                                        ),
                                        SizedBox(width: _size.width * 0.03),
                                        Text(
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
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: _size.height * 0.01,
                                    ),
                                    Row(
                                      children: [
                                        Text(
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
                                            Text(
                                              'Add Image',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: _size.width * 0.03),
                                        Text(
                                          'Roasted Cauliflower',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                          ),
                                        ),
                                        SizedBox(width: _size.width * 0.03),
                                        Text(
                                          'Cauliflower is a vegetable, often referred',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                          ),
                                        ),
                                        SizedBox(width: _size.width * 0.03),
                                        Text(
                                          'Add filter',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                          ),
                                        ),
                                        SizedBox(width: _size.width * 0.03),
                                        Text(
                                          '',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                          ),
                                        ),
                                        SizedBox(width: _size.width * 0.03),
                                        Text(
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
                                            borderRadius:
                                                BorderRadius.circular(30),
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
        } else {
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
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide: BorderSide(
                                            color: Colors.white,
                                            width: 1,
                                          ),
                                        ),
                                        enabled: true,
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
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
                                        Text(
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
                                        Text(
                                          'Roasted Cauliflower',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                          ),
                                        ),
                                        SizedBox(width: _size.width * 0.03),
                                        Text(
                                          'Cauliflower is a vegetable, often referred',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                          ),
                                        ),
                                        SizedBox(width: _size.width * 0.03),
                                        Text(
                                          'Vegetables',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                          ),
                                        ),
                                        SizedBox(width: _size.width * 0.03),
                                        Text(
                                          '1,352',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                          ),
                                        ),
                                        SizedBox(width: _size.width * 0.03),
                                        Text(
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
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: _size.height * 0.01,
                                    ),
                                    Row(
                                      children: [
                                        Text(
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
                                        Text(
                                          'Roasted Cauliflower',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                          ),
                                        ),
                                        SizedBox(width: _size.width * 0.03),
                                        Text(
                                          'Cauliflower is a vegetable, often referred',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                          ),
                                        ),
                                        SizedBox(width: _size.width * 0.03),
                                        Text(
                                          'Vegetables',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                          ),
                                        ),
                                        SizedBox(width: _size.width * 0.03),
                                        Text(
                                          '1,352',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                          ),
                                        ),
                                        SizedBox(width: _size.width * 0.03),
                                        Text(
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
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: _size.height * 0.01,
                                    ),
                                    Row(
                                      children: [
                                        Text(
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
                                            Text(
                                              'Add Image',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: _size.width * 0.03),
                                        Text(
                                          'Roasted Cauliflower',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                          ),
                                        ),
                                        SizedBox(width: _size.width * 0.03),
                                        Text(
                                          'Cauliflower is a vegetable, often referred',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                          ),
                                        ),
                                        SizedBox(width: _size.width * 0.03),
                                        Text(
                                          'Add filter',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                          ),
                                        ),
                                        SizedBox(width: _size.width * 0.03),
                                        Text(
                                          '',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                          ),
                                        ),
                                        SizedBox(width: _size.width * 0.03),
                                        Text(
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
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: _size.height * 0.01,
                                    ),
                                    Row(
                                      children: [
                                        Text(
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
                                            Text(
                                              'Add Image',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: _size.width * 0.03),
                                        Text(
                                          'Roasted Cauliflower',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                          ),
                                        ),
                                        SizedBox(width: _size.width * 0.03),
                                        Text(
                                          'Cauliflower is a vegetable, often referred',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                          ),
                                        ),
                                        SizedBox(width: _size.width * 0.03),
                                        Text(
                                          'Add filter',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                          ),
                                        ),
                                        SizedBox(width: _size.width * 0.03),
                                        Text(
                                          '',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                          ),
                                        ),
                                        SizedBox(width: _size.width * 0.03),
                                        Text(
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
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: _size.height * 0.01,
                                    ),
                                    Row(
                                      children: [
                                        Text(
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
                                            Text(
                                              'Add Image',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: _size.width * 0.03),
                                        Text(
                                          'Roasted Cauliflower',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                          ),
                                        ),
                                        SizedBox(width: _size.width * 0.03),
                                        Text(
                                          'Cauliflower is a vegetable, often referred',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                          ),
                                        ),
                                        SizedBox(width: _size.width * 0.03),
                                        Text(
                                          'Add filter',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                          ),
                                        ),
                                        SizedBox(width: _size.width * 0.03),
                                        Text(
                                          '',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                          ),
                                        ),
                                        SizedBox(width: _size.width * 0.03),
                                        Text(
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
                                            borderRadius:
                                                BorderRadius.circular(30),
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
      },
    ));
  }
}

class TopNavBar extends StatelessWidget {
  const TopNavBar({
    Key? key,
    required Size size,
  })  : _size = size,
        super(key: key);

  final Size _size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 25, right: 25),
      child: Row(
        children: [
          Image.asset(
            'assets/logos/logo3.png',
          ),
          SizedBox(
            width: _size.width * 0.03,
          ),
          Container(
            height: 40,
            width: 40,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black38,
            ),
            child: const Center(
              child: Text(
                'FG',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
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
                  fontSize: 18,
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
                  fontSize: 14,
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
    );
  }
}
