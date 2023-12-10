import 'package:blood_donar/core/constants.dart';
import 'package:blood_donar/data/Data_source/auth_data_source.dart';
import 'package:blood_donar/features/Auth/login/login_screen.dart';
import 'package:get/get.dart';

class profile_Controller extends GetxController{
  BaseAuthDataSource _baseAuthDataSource=AuthRemoteDataSource();
  bool availabledonate=true;
  void Changeavailabledonate()
  {
    availabledonate=!availabledonate;
    update();
  }
  void logout()
  {
    _baseAuthDataSource.logout();
    Get.offAll(LoginScreen(),transition: kTransition2,duration: kTransitionDuration);
    update();
  }
}