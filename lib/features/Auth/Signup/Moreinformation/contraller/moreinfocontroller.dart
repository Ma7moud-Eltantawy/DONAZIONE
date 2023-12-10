import 'dart:ffi';
import 'dart:io';

import 'package:blood_donar/core/Models/moreinfomodel.dart';
import 'package:blood_donar/core/Models/userdatamodel.dart';
import 'package:blood_donar/core/enums.dart';
import 'package:blood_donar/features/Auth/Signup/Moreinformation/view/moreinformation_screen.dart';
import 'package:blood_donar/features/Auth/Signup/Signup_screen/view/Signup_Screen.dart';
import 'package:blood_donar/features/maps/controller/mapcontroller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;


import '../../../../../core/constants.dart';
import '../../../../../data/Data_source/auth_data_source.dart';
import '../../../../../widgets/Motion_toast.dart';
import '../../../../Home/Home_Screen/Main_screen.dart';
import '../../../../Home/Home_Screen/home_Screen/view/homescreen_view.dart';
import '../../Signup_screen/controller/Signup_Controller.dart';

class moreInfoController extends GetxController{
  XFile? imgfile;
  bool loading = false;
  signup_Controller con2=Get.put(signup_Controller());
  MapController con3=Get.put(MapController());



  final BaseAuthDataSource _remmoteDataSource = AuthRemoteDataSource();
  final TextEditingController bil = TextEditingController();
  final TextEditingController chol = TextEditingController();
  final TextEditingController glucose = TextEditingController();
  final TextEditingController mvc = TextEditingController();
  final TextEditingController plat = TextEditingController();
  final TextEditingController rbc = TextEditingController();






  Pickimagefromsource(ImageSource source) async
  {

    final ImagePicker _picker = ImagePicker();
    final pickedFile = await _picker.pickImage(source: source);
    imgfile= XFile(pickedFile!.path);
    print(imgfile!.path);

    update();

  }
  changeLoadingValue() {
    loading = !loading;
    update();
  }


  //Signin function

  Future<void> uploaddata({ required BuildContext context,required double height,required double width}) async{
    changeLoadingValue();

    _remmoteDataSource.Uploadimgtostorage(img: imgfile!).then((value) async {

      print(con3.myLoc);

      if(value.requestState==RequestState.success)
      {
        print(con2.nameController);
        createuserdata(id: con2.userid.toString()).whenComplete(() async {
          await uploadmoreinfo(id: con2.userid, img: value.data!);
          await _remmoteDataSource.Getuserdata(id:con2.userid).then((value){
            //print(value.data!.numberofdonation);
            try{
              _remmoteDataSource.cleanDB();
              _remmoteDataSource.SaveuserinDB(user: value.data!);
              _remmoteDataSource.getuserfromDB().then((value) async {
                if(value.requestState!=RequestState.failed)
                {
                  await _remmoteDataSource.Getmoreinformationuser(id: con2.userid);
                  Get.offAll(MainScreen(),transition: kTransition2,duration: kTransitionDuration);
                  Succes_toast(ctx: context, height: height, width: width, desc: "Succes sign in");

                }
                else{
                  Fail_toast(ctx: context, height: height, width: width, desc: "Failed sign in",title: "error");
                }

              });
            }
            catch(e)
            {
              Fail_toast(ctx: context, height: height, width: width, desc: "Failed sign in",title: "error");
            }


          });

        });
      }
      else
      {
        Fail_toast(ctx: context, height: height, width: width, desc: "Failed sign in",title: "error");
      }

    });
    changeLoadingValue();
    update();

  }




  Future<void>createuserdata({required id})
  async {
    _remmoteDataSource.uploaduserdata(user:
    Userdatamodel(

      id: id,
      name: con2.nameController.text,
      bloodtype: con2.blood_groub[con2.blood_type_index!],
      location: con3.myLoc,
      weight: con2.current_weight.toString(),
      email: con2.emailController.text,
      phone: con2.phonecontroller.text,
      open_ofdonation: true,
      lang: con3.currentLatLng!.longitude.toString(),
      lat: con3.currentLatLng!.longitude.toString(),
      fcmtoken: "token",

    ));
  }
  Future<void>uploadmoreinfo({required String id,required String img})
  async {
    _remmoteDataSource.uploadmoreinformationdata(id: id,
        user:moreinfodatamodel(
            bilirubin: bil.text,
            rbc: rbc.text,
            pic: img.toString(),
            cholestrol: chol.text,
            glucose: glucose.text,
            mvc: mvc.text,
            platelets: plat.text)
    );
  }



}