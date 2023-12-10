import 'package:blood_donar/core/Models/useralldata.dart';
import 'package:blood_donar/core/networking/request_result.dart';
import 'package:blood_donar/data/Data_source/doners_data_source.dart';
import 'package:blood_donar/features/Category/view/Category.dart';
import 'package:blood_donar/features/Report_screen/view/report_screen_view.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:googleapis/doubleclickbidmanager/v2.dart';
import 'package:maps_launcher/maps_launcher.dart';

import '../../../../../core/constants.dart';
import '../../../../../data/Data_source/auth_data_source.dart';
class dis_fromuser{
  final double? distance;
  final AllUsersdatamodel? model;

  dis_fromuser({required this.distance,required this.model});

}


class MainScreen_Controller extends GetxController
{
  List<AllUsersdatamodel> allusers=[];


  final DonersBaseDataSource _donorremotedatasource=Donersremotedatasource();
  final BaseAuthDataSource _authremotedatasource=AuthRemoteDataSource();

  @override
  void onInit() async{
    try {
      RequestResult<List<AllUsersdatamodel>> value = await _donorremotedatasource.Getallusers();
      print(value.data![0].pic);
      allusers = value.data!;
      AllUsersData = value.data!;

      print(AllUsersData[0].location);
      update();
    } catch (error) {
      // Handle errors appropriately
      print("Error fetching users: $error");
    }



  }

}