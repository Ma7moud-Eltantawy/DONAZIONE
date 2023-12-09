import 'package:blood_donar/core/constants.dart';
import 'package:blood_donar/features/Auth/login/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Tutorial_controller extends GetxController{
  PageController boardController = PageController();
  bool isLast = false;
  bool?showcheck;
  cheklast(bool val)
  {
    isLast=val;
    update();
  }
  Future<void>Show_toturial()async
  {
    SharedPreferences sharedpref=await SharedPreferences.getInstance();
    await sharedpref.setBool('show', true);
    showcheck=await sharedpref.getBool('show');
    print(showcheck);
    update();
  }
  Navigator() async
  {
    await Show_toturial();
    Get.off(LoginScreen(),transition: kTransition2,duration: kTransitionDuration);

  }
}