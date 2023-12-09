import 'package:blood_donar/core/Models/useralldata.dart';
import 'package:blood_donar/core/networking/request_result.dart';
import 'package:blood_donar/data/Data_source/doners_data_source.dart';
import 'package:blood_donar/features/Category/view/Category.dart';
import 'package:blood_donar/features/Report_screen/view/report_screen_view.dart';
import 'package:get/get.dart';
import 'package:googleapis/doubleclickbidmanager/v2.dart';
import 'package:maps_launcher/maps_launcher.dart';

import '../../../../../core/constants.dart';
import '../../../../../data/Data_source/auth_data_source.dart';
import '../../../../Faqs/view/QuestionsScreen.dart';

class HomeScreen_Controller extends GetxController
{
  List<AllUsersdatamodel> allusers=[];

  Map<String,String> category={
    "Find Donors":"assets/icons/ion_search-outline.png",
    "Donates":"assets/icons/openmoji_blood-transfusion.png",
    "Order Bloods":"assets/icons/si-glyph_blood-bag.png",
    "Assistant":"assets/icons/maki_doctor-11.png",
    "Report":"assets/icons/la_file-medical-alt.png",
    "Campaign":"assets/icons/grommet-icons_announce.png",
  };
  Map<String, Function> categoriesFunction = {

    "Find Donors": () {
      Get.to(Categories_Screen(),transition: kTransition2,duration: kTransitionDuration);

    },
    "Donates": () {
      MapsLauncher.launchQuery("blood donation center");
    },
    "Order Bloods": () {
      MapsLauncher.launchQuery("blood donation center");
    },
    "Assistant": () {
      Get.to(QuestionsScreen(),transition: kTransition2,duration: kTransitionDuration);

      //MapsLauncher.launchQuery("blood donation center");
    },
    "Report": () {
      Get.to(Report_screen(),transition: kTransition2,duration: kTransitionDuration);
    },
    "Campaign": () {
      MapsLauncher.launchQuery("blood donation center");
    },
  };
  int current_index=0;
  changecurrentindex(index)
  {
    current_index=index;
    update();
  }

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