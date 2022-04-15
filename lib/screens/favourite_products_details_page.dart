import 'package:flutter/material.dart';

class FavouriteProductDetailsScreen extends StatelessWidget {
  const FavouriteProductDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/images/dish.png',
                  fit: BoxFit.cover,
                ),
                const Positioned(
                  bottom: 200,
                  left: 50,
                  child: Text(
                    '21.00',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                const Positioned(
                  bottom: 170,
                  left: 50,
                  child: Text(
                    'Langostinos',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                const Positioned(
                  bottom: 120,
                  left: 50,
                  child: Text(
                    'Grilled giant prawns with garlic-lime butter\nand served with white rice.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 70,
                  right: 80,
                  child: Image.asset(
                    'assets/icons/heart.png',
                    color: Colors.white,
                  ),
                ),
                const Positioned(
                    bottom: 70,
                    right: 40,
                    child: Icon(
                      Icons.share,
                      color: Colors.white,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
