import 'package:blood_donar/core/Models/Request_model.dart';
import 'package:blood_donar/core/constants.dart';
import 'package:blood_donar/core/enums.dart';
import 'package:blood_donar/data/Data_source/doners_data_source.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:googleapis/apigeeregistry/v1.dart';

import '../../../../widgets/Motion_toast.dart';

class CreateRequest_controller extends GetxController
{
  TextEditingController loc=TextEditingController();
  TextEditingController Hos=TextEditingController();
  TextEditingController mobile=TextEditingController();
  TextEditingController notes=TextEditingController();

  String ? blood_type;
  DonersBaseDataSource _donorsbasedatasource=Donersremotedatasource();

  @override
  void onInit() {
    super.onInit();
    print("__________");
     // Access 'phone' from Get.arguments

   loc.text=currentuserdata!.location!.toString();
    mobile.text=currentuserdata!.phone!.toString();
    //blood_type=currentuserdata!.bloodtype!.toString();



    update();
  }


  void Changebloodtype(String bloodtype)
  {
    blood_type=bloodtype;
    update();
  }
  Future<void> Addrequest({required String recivedid,required BuildContext context,required double height,required double width,}) async
  {
    await _donorsbasedatasource.AddRequest(reciveid: recivedid, req: Requestdatamodel(
        lang:currentuserdata!.lang.toString() ,
        lat: currentuserdata!.lat.toString() ,
        id: currentuserdata!.id.toString() ,
        donated: false,
        name: currentuserdata!.name.toString() ,
        bloodtype: currentuserdata!.bloodtype.toString() ,
        location: currentuserdata!.location.toString() ,
        time: DateTime.now().toString(),
        phone: currentuserdata!.phone.toString() ,
        picurl: currentusermoreinfo!.pic.toString() ,
        numofdonate: "3" )).then((value){
          value.requestState==RequestState.success?
          Succes_toast(ctx: context, height: height, width: width, desc: 'Request sended',):
          Fail_toast(ctx: context,title:'Failed!' ,height: height,width: width,desc: "Request not sended");
    });

  }


}