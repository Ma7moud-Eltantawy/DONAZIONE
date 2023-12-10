import 'package:blood_donar/core/Models/Request_model.dart';
import 'package:blood_donar/core/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../data/Data_source/doners_data_source.dart';

class Requests_controller extends GetxController{
  bool loadingstate=false;
  final DonersBaseDataSource _donorremotedatasource=Donersremotedatasource();
  List<Requestdatamodel> Requests=[];
  
  Change_loading()
  {
    loadingstate=!loadingstate;

    update();
  }
  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    Change_loading();
    try{
      await _donorremotedatasource.GetRequests(id:currentuserdata!.id.toString()).then((value){
        Requests=value.data!.where((element) => element.donated==false).toList();


      });
    }
    catch(e)
    {

    }
    Change_loading();


    update();
    
  }

  void Adddonate({required String id}) async
  {
    print(id);
    try{
      await _donorremotedatasource.Adddonate(reciveid: id);
      onInit();
      update();
    }
    catch(e)
    {

    }

  }


}