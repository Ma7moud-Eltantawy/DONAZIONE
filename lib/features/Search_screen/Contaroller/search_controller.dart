// search_controller.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:googleapis/customsearch/v1.dart';

import '../../../core/Models/useralldata.dart';
import '../../../core/constants.dart';
import '../../../core/networking/request_result.dart';
import '../../../data/Data_source/auth_data_source.dart';
import '../../../data/Data_source/doners_data_source.dart';

class Search_Controller extends GetxController {
  RxBool isTapped = true.obs;
  RxBool isExpanded = false.obs;
  List<AllUsersdatamodel> allusers=[];
  List<AllUsersdatamodel> searchusers=[];
  List<AllUsersdatamodel> usedusers=[];
  RxList<String> selectedFilters = <String>[].obs;

  bool loadingstate=false;




  final DonersBaseDataSource _donorremotedatasource=Donersremotedatasource();
  final BaseAuthDataSource _authremotedatasource=AuthRemoteDataSource();

  @override
  void onInit() async{
    try {
      changeloadingstste();
      RequestResult<List<AllUsersdatamodel>> value = await _donorremotedatasource.Getallusers();
      allusers = value.data!;
      AllUsersData = value.data!;
      usedusers=allusers;

      changeloadingstste();
      update();
    } catch (error) {
      // Handle errors appropriately
      print("Error fetching users: $error");
    }
  }
  void GetSearch({required String Searchkey})
  {
    if(Searchkey.isNotEmpty)
      {
        searchusers=AllUsersData.where((element) =>element.name!.contains(Searchkey)).toList();
        usedusers=searchusers;
      }
    else{
      usedusers=AllUsersData;
    }

    update();
  }
  Getfilter()
  {
    if (selectedFilters.isNotEmpty) {
      usedusers = searchusers.where((element) {
        for (var x in selectedFilters) {
          if (element.bloodtype == x) {
            return true;
          }
        }
        return false; // Return false if no match is found for any filter
      }).toList();
    }
  }
  changeloadingstste()
  {
    loadingstate=!loadingstate;
    update();
  }

    cahangeonTap()
  {
    isTapped.toggle();
    update();
  }

  onHighlightChanged(bool val)
  {
    isExpanded.value = val;
    update();
  }




  final List<String> availableFilters = Bloodtype;

  void toggleFilter(String filter) {
    if (selectedFilters.contains(filter)) {
      selectedFilters.remove(filter);
    } else {
      selectedFilters.add(filter);
    }
  }

  void clearFilters() {
    selectedFilters.clear();
  }
}