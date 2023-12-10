import 'package:blood_donar/core/Models/Request_model.dart';
import 'package:blood_donar/core/constants.dart';
import 'package:get/get.dart';

import '../../../../data/Data_source/doners_data_source.dart';

class Acceptation_controller extends GetxController{
  bool loadingstate=false;
  final DonersBaseDataSource _donorremotedatasource=Donersremotedatasource();
  List<Requestdatamodel> Acceptedlist=[];

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
      await _donorremotedatasource.GetRequests(id: currentuserdata!.id!).then((value){
        Acceptedlist=value.data!.where((element) => element.donated==true).toList();
        print(value.data![0].donated);


      });
    }
    catch(e)
    {

    }
    Change_loading();

    update();

  }

}