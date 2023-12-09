import 'dart:ffi';
import 'dart:io';

import 'package:blood_donar/core/Models/userdatamodel.dart';
import 'package:blood_donar/core/enums.dart';
import 'package:blood_donar/features/Auth/Signup/Moreinformation/view/moreinformation_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;


import '../../../../../core/constants.dart';
import '../../../../../data/Data_source/auth_data_source.dart';
import '../../../../../widgets/Motion_toast.dart';
import '../../../../Home/Home_Screen/Main_screen.dart';
import '../../../../Home/Home_Screen/home_Screen/view/homescreen_view.dart';
import '../../../../maps/controller/mapcontroller.dart';
import '../../../../maps/view/map_screen.dart';

class signup_Controller extends GetxController{
  MapController con2=Get.put(MapController());
  final BaseAuthDataSource _remmoteDataSource = AuthRemoteDataSource();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phonecontroller = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool loading = false;
  late String userid;
  late String currenttloc;
  late LatLng currentlatlng;

  //bloodgroub_screen variables
  List <String>blood_groub=["A+","O+","B+","Ab+","A-","O-","B-","Ab-"];
  double current_weight=0;
  int ? blood_type_index;
  changeLoadingValue() {
    loading = !loading;
    update();
  }


  Future<void>CreatenewAccount() async
  {
    changeLoadingValue();
    await _remmoteDataSource.SignUp(email: emailController.text, pass:passwordController.text).then((value){
      print(value.data!.user!.email);
      print("-------------");
      if(value.data!=null)
      {
        userid=value.data!.user!.uid;
        print(userid);
        Get.to(LocScreen(),transition: kTransition2,duration: kTransitionDuration);
      }

    });
    changeLoadingValue();
    currenttloc=con2.myLoc.toString();
    currentlatlng=con2.currentLatLng!;

    update();


  }


  //more_info variables




  /* Future Signup() async {
    changeLoadingValue();
    final result = await _remmoteDataSource(
      email: emailController.text.trim(),
      pass: passwordController.text,
    );
    if (result.requestState == RequestState.success) {
      if (result.data!.user != null) {
        saveUserInLocal(result.data!.user!);
        navigateUserAfterLoginSuccess();
        changeLoadingValue();
      }
    } else if (result.requestState == RequestState.failed) {
      //snackBarError(result.errorMessage!);
      changeLoadingValue();
    }
  }*/





//bloodgroub_screen functions
  changeweight(double weight)
  {
    current_weight=weight;
    update();
  }
  choose_bloodtype(int index)
  {
    blood_type_index= index;
    update();
  }


}