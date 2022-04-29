import 'package:flutter/material.dart';
import 'package:mynuu/firebase_options.dart';
import 'package:mynuu/screens/bottom_navigation_screens.dart';
import 'package:mynuu/screens/tes.dart';
import 'package:mynuu/screens/website/Responsive/dashboard_desktop.dart';
import 'package:mynuu/screens/website/onboard_page.dart';
import 'screens/auth/register_page.dart';
import 'screens/onboard/onboard_screen.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'screens/website/dashboard_page.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    print('Failed to initialize' + e.toString());
  }
  runApp(const MyApp());

   _connectionChecker();
  _init();
}

_connectionChecker() async {
  final bool isConnected = await InternetConnectionChecker().hasConnection;
  final StreamSubscription<InternetConnectionStatus> listener =
      InternetConnectionChecker().onStatusChange.listen(
    (InternetConnectionStatus status) {
      switch (status) {
        case InternetConnectionStatus.connected:

          // ignore: avoid_print
          print('Data connection is available.');
          break;
        case InternetConnectionStatus.disconnected:
          Get.snackbar('Error', 'No internet connection',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.red,
              colorText: Colors.white,
              margin: EdgeInsets.all(10),
              snackStyle: SnackStyle.FLOATING,
              duration: Duration(seconds: 2));

          break;
      }
    },
  );

  // close listener after 30 seconds, so the program doesn't run forever
  await Future<void>.delayed(const Duration(seconds: 30));
  await listener.cancel();
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
      home: const DashboardPage(),
    );
  }
}
