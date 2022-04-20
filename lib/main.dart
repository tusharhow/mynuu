import 'package:flutter/material.dart';
import 'package:mynuu/screens/bottom_navigation_screens.dart';
import 'screens/auth/register_page.dart';
import 'screens/onboard/onboard_screen.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  _init();
}

_init() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('userId');
  if (token != null) {
    Get.offAll(const HomePageMain());
    print(token);
  } else {
    Get.offAll(const RegisterPage());
    print(token);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Mynuu',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:const OnboardScreen(),
    );
  }
}
