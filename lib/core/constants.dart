import 'package:blood_donar/core/Models/moreinfomodel.dart';
import 'package:blood_donar/core/Models/useralldata.dart';
import 'package:blood_donar/core/Models/userdatamodel.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

const kTransitionDuration = Duration(milliseconds: 300);
Transition kTransition1 = Transition.fadeIn;
Transition kTransition2 = Transition.rightToLeftWithFade;
const kCarStatusHiveBox = 'car_status';
const kUserTokenHiveBox = 'user_token';
const kBoardingHiveBox = 'boarding_seen';
String current_location="";
List<String> Bloodtype=["A+","A-","B+","B-","O+","AB+","AB-"];
Userdatamodel ? currentuserdata;
moreinfodatamodel?currentusermoreinfo;
List<AllUsersdatamodel>AllUsersData=[];

