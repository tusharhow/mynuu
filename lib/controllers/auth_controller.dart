import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mynuu/components/navigate.dart';
import 'package:mynuu/screens/add_new_product_desktop.dart';
import 'package:mynuu/screens/auth/register_page.dart';
import 'package:mynuu/screens/bottom_navigation_screens.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class AuthService {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  void createRecord(
      String name, String phone, String countryCode, context) async {
    final databaseReference = FirebaseFirestore.instance;

    DocumentReference ref = await databaseReference
        .collection("users")
        .doc(phone)
        .collection(name)
        .add({
      'fullName': nameController.text,
      'phone': '$countryCode$phone',
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userId', ref.id);
    pushRemove(context: context, widget: const HomePageMain());
    if (ref != null) {
      Get.snackbar('Success', 'Registration successfull',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
          margin: EdgeInsets.all(10),
          snackStyle: SnackStyle.FLOATING,
          duration: Duration(seconds: 2));
    } else {
      Get.snackbar('Error', 'Registration failed',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          margin: EdgeInsets.all(10),
          snackStyle: SnackStyle.FLOATING,
          duration: Duration(seconds: 2));
    }
  }

  Future<void> handleSignIn() async {
    var _googleSignIn = GoogleSignIn(
      clientId:
          '955240982479-qjqjqjqjqjqjqjqjqjqjqjqjqjqjqjq.apps.googleusercontent.com',
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );
    try {
      await _googleSignIn.signIn();
      print('Signed in');
    } catch (error) {
      print(error);
    }
  }

  //sign out
  void signOut(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var str = prefs.remove('userId');
    pushRemove(context: context, widget: const RegisterPage());
    if (str == null) {
      Get.snackbar('Success', 'Logout successfull',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
          margin: EdgeInsets.all(10),
          snackStyle: SnackStyle.FLOATING,
          duration: Duration(seconds: 2));
    } else {
      Get.snackbar('Error', 'Logout failed',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          margin: EdgeInsets.all(10),
          snackStyle: SnackStyle.FLOATING,
          duration: Duration(seconds: 2));
    }
  }
}
