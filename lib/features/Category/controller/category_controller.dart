import 'package:blood_donar/core/Models/Categories_model.dart';
import 'package:blood_donar/features/Campaign/view/campaign_screen.dart';
import 'package:blood_donar/features/Report_screen/view/report_screen_view.dart';
import 'package:blood_donar/features/Search_screen/view/search_screen_view.dart';
import 'package:get/get.dart';

import '../../Faqs/view/QuestionsScreen.dart';

class category_controller extends GetxController{
 List<Categories_model> Category_list=[
  Categories_model(
 Title: 'Find Donors', img: 'assets/images/categories/search.jpg',
 navscreen: Search_Screen(),
   
  ),
  Categories_model(
   Title: 'Report', img: 'assets/images/categories/Medical lab blood test from sample tube in human hand.jpg',
   navscreen: Report_screen(),

  ),
  Categories_model(
   Title: 'Donates', img: 'assets/images/categories/2690217.jpg',
   navscreen: QuestionsScreen(),

  ),
  Categories_model(
   Title: 'Campaign', img: 'assets/images/categories/campaign.jpg',
   navscreen: Campaign_Screen(),

  ),
  Categories_model(
   Title: 'FAQS', img: 'assets/images/categories/faqs.jpg',
   navscreen: QuestionsScreen(),

  ),
  Categories_model(
   Title: 'Order Bloods', img: 'assets/images/categories/bloodstation.jpg',
   navscreen: QuestionsScreen(),

  ),

 ];
}