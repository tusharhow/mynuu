import 'package:flutter/material.dart';

import '../../components/navigate.dart';
import 'dashboard_page.dart';

class OnboardPageWebsiteView extends StatelessWidget {
  const OnboardPageWebsiteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            height: _size.height * 0.5,
          ),
          Center(
            child: Image.asset(
              'assets/logos/logo3.png',
            ),
          ),
          SizedBox(height: _size.height * 0.05),
          GestureDetector(
            onTap: () {
              push(context: context, widget: const DashboardPage());
            },
            child: Container(
              height: 50,
              width: _size.width / 5,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Image.asset(
                      'assets/icons/google.png',
                      width: _size.width * 0.03,
                      height: _size.height * 0.03,
                    ),
                  ),
                  SizedBox(
                    width: _size.width * 0.03,
                  ),
                  const Text(
                    'Continue with Google',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
