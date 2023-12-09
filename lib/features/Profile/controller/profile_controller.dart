import 'package:get/get.dart';

class profile_Controller extends GetxController{
  bool availabledonate=true;
  void Changeavailabledonate()
  {
    availabledonate=!availabledonate;
    update();
  }
}