import 'package:blood_donar/core/Models/Request_model.dart';
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
    await _donorremotedatasource.GetRequests(id: "foNau8WfoDNNsHP4FZSJUqq64c22").then((value){
      Acceptedlist=value.data!.where((element) => element.donated==true).toList();
      print(value.data![0].donated);

      Change_loading();
    });

    update();

  }

}