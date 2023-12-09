import 'dart:async';
import 'dart:convert';

import 'package:blood_donar/core/Models/userdatamodel.dart';
import 'package:blood_donar/features/Assistant_Screen/view/Assistant_screen.dart';
import 'package:blood_donar/features/Auth/Signup/Signup_screen/view/Signup_Screen.dart';
import 'package:blood_donar/features/Auth/Signup/blood_group/view/blood_group.dart';
import 'package:blood_donar/features/Auth/login/login_screen.dart';
import 'package:blood_donar/features/Report_screen/view/report_screen_view.dart';
import 'package:blood_donar/features/maps/view/map_screen.dart';
import 'package:blood_donar/features/toturial/Controller/toturial_controller.dart';
import 'package:blood_donar/features/toturial/view/tourorial.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:googleapis/keep/v1.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/Models/Request_model.dart';
import 'core/Models/moreinfomodel.dart';
import 'core/Models/useralldata.dart';
import 'core/networking/request_result.dart';
import 'core/theme/theme.dart';
import 'features/Auth/Signup/Moreinformation/view/moreinformation_screen.dart';
import 'features/Auth/verfication/view/otp_screen.dart';
import 'features/Donates/view/donates_screen.dart';
import 'features/Home/Home_Screen/Main_screen.dart';
import 'features/Home/Home_Screen/home_Screen/view/homescreen_view.dart';
import 'features/Profile/view/profile_screen.dart';
import 'features/Search_screen/view/search_screen_view.dart';
import 'features/Splash_screen/splash_screen_view.dart';
import 'features/donation_Request/Crete_request/view/create_request_screen/create_request_design.dart';
import 'features/donation_Request/Requests/view/Requests_screen.dart';
import 'firebase_options.dart';
import 'features/Home/Home_Screen/home_Screen/view/home2.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final FirebaseMessaging _fmessage=FirebaseMessaging.instance;
void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Geolocator.requestPermission();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,

  );

  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

      //initialBinding: AppBinding(),
      debugShowCheckedModeBanner: false,
      theme: appTheme(context),

      textDirection: TextDirection.ltr,

      home:Splash_screen(),
    );
  }
}




