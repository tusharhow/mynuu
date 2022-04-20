import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  // Firebase user sign out
  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }

  // Save sign up user data to Firestore database
  Future<void> saveUserData(
      {required String number,
      required String fullName,
      required String countryCode,
      context}) async {
    if (number.isNotEmpty && fullName.isNotEmpty) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc()
          .set({
            'number': '$countryCode$number',
            'fullName': fullName,
          })
          .then((value) {})
          .catchError((error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Error: $error',
                  style: const TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.red,
              ),
            );
          });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill all the fields'),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }
}

// use firestore data to login
Future<void> loginUser({
  required String number,
  required String fullName,
  required ctx,
}) async {
  try {
    final user = await FirebaseFirestore.instance
        .collection('users')
        .where('number', isEqualTo: number)
        .get();
    if (user.docs.isNotEmpty) {
      final userData = user.docs[0].data();
      if (userData['number'] == number) {
        // Navigator.push(ctx, MaterialPageRoute(builder: (ctx) => HomePage()));
      } else {
        print('Password is incorrect');
      }
    } else {
      print('User does not exist');
    }
    print("User signed in: ${user.docs[0].id}");
    // Navigator.push(ctx, MaterialPageRoute(builder: (ctx) => HomePage()));
  } catch (e) {
    print(e.toString());
  }
}
