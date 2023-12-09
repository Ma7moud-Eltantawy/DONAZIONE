import 'package:blood_donar/core/constants.dart';
import 'package:blood_donar/features/Home/Home_Screen/Main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/Data_source/auth_data_source.dart';
import '../../Auth/login/login_screen.dart';
import '../../toturial/view/tourorial.dart';

class Splash_Controller extends GetxController {
  LocationPermission ? _per;
  Position ? pos;
  String?Myloc;
  bool? Showcheck;
  final BaseAuthDataSource _remmoteDataSource = AuthRemoteDataSource();
  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    update();



  }
  Future<void> _requestLocationPermission() async {
    final permission = await Geolocator.requestPermission ();
    _per=permission;
  }
  void getPlacemark(double latitude, double longitude) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(
        latitude, longitude);

    if (placemarks.isNotEmpty) {
      Placemark placemark = placemarks[0];
      // Access the properties of the placemark
      String? name = placemark.name;
      String? thoroughfare = placemark.thoroughfare;
      String? subThoroughfare = placemark.subThoroughfare;
      String? locality = placemark.locality;
      String? subLocality = placemark.subLocality;
      String? administrativeArea = placemark.administrativeArea;
      String? subAdministrativeArea = placemark.subAdministrativeArea;
      String? postalCode = placemark.postalCode;
      String? country = placemark.country;
      String? isoCountryCode = placemark.isoCountryCode;

      // Use the properties as needed
      print('Name: $name');
      print('Address: $thoroughfare, $locality, $administrativeArea');
      current_location='$name , $thoroughfare, $locality';
      update();
    }
  }

  Future<void> check_Show_toturial()async
  {
    try {
      SharedPreferences sharedpref=await SharedPreferences.getInstance();
      Showcheck=await sharedpref.getBool('show');
      print("show state ${Showcheck.toString()}");
      update();
    }
    catch(e)
    {
      Showcheck=false;
      update();
    }
    update();
  }

  Navigation()
  async {
    try{
      await check_Show_toturial();
      print(Showcheck.toString());
      await _remmoteDataSource.getuserfromDB().then((val) async {
        await _remmoteDataSource.Getmoreinformationuser(id: val.data!.id!);
      });
      print(currentuserdata!.id!);
    }
    catch(e)
    {

    }

    Showcheck==true?
        currentuserdata!=null?Get.offAll(MainScreen(),transition:kTransition2 ,duration: kTransitionDuration):
    Get.offAll(LoginScreen(),transition:kTransition2 ,duration: kTransitionDuration)
        :
    Get.offAll(onBoarding_screen(),transition:kTransition2 ,duration: kTransitionDuration);
    update();
  }


}