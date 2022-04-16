import 'package:flutter/material.dart';

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
