import 'package:blood_donar/core/Models/Categories_model.dart';
import 'package:blood_donar/features/Report_screen/view/report_screen_view.dart';
import 'package:blood_donar/features/Search_screen/view/search_screen_view.dart';
import 'package:get/get.dart';
import 'package:maps_launcher/maps_launcher.dart';

import '../../../core/Models/camainitemsmodel.dart';
import '../../Faqs/view/QuestionsScreen.dart';

class Campaign_controoler extends GetxController{
  List<Campain_item_model> campaignCategory_list=[
    Campain_item_model(
      Title: 'Awareness campaign', img: 'assets/images/categories/mh.jpg',
      func: (){
        MapsLauncher.launchQuery("Awareness campaign");
      }

    ),
    Campain_item_model(
      Title: 'Blood donation campaigns', img: 'assets/images/categories/blooddonationcampain.jpg',
        func: (){

          MapsLauncher.launchQuery("Blood donation campaigns");
        }

    ),
    Campain_item_model(
      Title: 'Medical labs', img: 'assets/images/categories/lab.jpg',
        func: (){
          MapsLauncher.launchQuery("Medical labs");

        }

    ),
    Campain_item_model(
      Title: 'Hospitals', img: 'assets/images/categories/hos.jpg',
        func: (){
          MapsLauncher.launchQuery("Hospitals");
        }

    ),
    Campain_item_model(
      Title: 'Pharmacies', img: 'assets/images/categories/ph.jpg',
        func: (){
          MapsLauncher.launchQuery("Pharmacies");
        }

    ),
    Campain_item_model(
      Title: 'Medical services centers (hearing-visual)', img: 'assets/images/categories/hear.jpg',
        func: (){
          MapsLauncher.launchQuery("Medical services centers (hearing-visual)");
        }


    ),

  ];
}