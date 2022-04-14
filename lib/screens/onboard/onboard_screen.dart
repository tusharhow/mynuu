import 'package:flutter/material.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/logos/logo.png',
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Applicable taxes and 18% service\ncharge will be  added to your bill.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: _size.height * 0.08,
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 50,
              width: _size.width / 1.05,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
              ),
              child: Center(
                child: Text(
                  'Tap to Start',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: _size.height * 0.15,
          ),
          Center(
            child: Text(
              'Follow us',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(
            height: _size.height * 0.03,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icons/facebook.png',
                height: _size.height * 0.05,
              ),
              SizedBox(
                width: _size.width * 0.05,
              ),
              Image.asset(
                'assets/icons/instagram.png',
                height: _size.height * 0.05,
              ),
            ],
          ),
          SizedBox(
            height: _size.height * 0.09,
          ),
          Center(
            child: Text(
              'Powered',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
          Image.asset(
            'assets/logos/logo2.png',
            height: _size.height * 0.05,
          ),
        ],
      ),
    );
  }
}
