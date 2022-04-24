import 'package:get/get.dart';

class DefaultController extends GetxController{

  // favourite button click
  bool isClicked = false;
  void onFavouriteButtonClicked(){
    isClicked = !isClicked;
    update();
  }

}