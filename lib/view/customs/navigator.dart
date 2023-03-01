import 'package:get/get.dart';

class Navigators{
  static void moveTo(page){
    Get.to(page , transition: Transition.zoom);
  } static void moveAndRemoveAll(page){
    Get.offAll(page , transition: Transition.zoom);
  }
}