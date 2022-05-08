import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../screens/edit.dart';

class AppRoutes {
  static const String INITAL = "/";
  static const String EDITPRODUCT = "/editproduct";


  static List<GetPage> routes = [
    GetPage(
        name: EDITPRODUCT,
        page: () => EditProduct(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.cupertino),
  ];
}
