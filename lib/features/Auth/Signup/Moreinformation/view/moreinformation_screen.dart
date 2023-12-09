
import 'dart:convert';
import 'dart:io';
import 'package:animate_do/animate_do.dart';
import 'package:blood_donar/features/Auth/Signup/Moreinformation/contraller/moreinfocontroller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path/path.dart' as path;


import 'package:blood_donar/core/manager/colors_manager.dart';
import 'package:blood_donar/features/Auth/Signup/Signup_screen/controller/Signup_Controller.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:googleapis/admob/v1.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;


import '../../../../../core/styles/icons.dart';
import '../../../../../widgets/m_button.dart';
import '../../../../../widgets/text_field.dart';



class MoreInformationScreen extends StatelessWidget {
  static const scid = "more_information";
  moreInfoController controller=Get.put(moreInfoController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
            title:Text(
              "MORE INFORMATION",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: ColorsManager.red,
              ),
            ),
            centerTitle: true,
          actions:[

          ]
        ),
        body: SingleChildScrollView(
          child: GetBuilder<moreInfoController>(
            builder: (con) {
              return ModalProgressHUD(

                progressIndicator: CircularProgressIndicator(),
                color: Colors.black54,
                inAsyncCall: false,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    Container(
                      alignment: Alignment.topCenter,
                      width: width,
                      margin: EdgeInsets.symmetric(horizontal: width / 25, vertical: height / 50),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              SizedBox(
                                height: height / 4,
                                width: width,
                                child: Card(
                                  shape: const CircleBorder(),
                                  color: ColorsManager.red.withOpacity(.2),
                                  child: GetBuilder<moreInfoController>(

                                    builder: (con) {
                                      return Container(
                                        decoration: BoxDecoration(
                                          image: con.imgfile == null
                                              ? const DecorationImage(
                                            image: AssetImage('assets/images/def_img.png'),
                                            fit: BoxFit.fill,
                                          )
                                              : DecorationImage(
                                            image: FileImage(File(con.imgfile!.path)),
                                            fit: BoxFit.cover,
                                          ),
                                          shape: BoxShape.circle,
                                          border: Border.all(color: ColorsManager.red.withOpacity(.3), width: width / 200),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: height / 30,
                                right: width / 5,
                                child: GestureDetector(
                                  onTap: () => showDialog(
                                    context: context,
                                    builder: (BuildContext context) => AlertDialog(
                                      actions: <Widget>[
                                        Center(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              TextButton(
                                                onPressed: () async {
                                                  con.Pickimagefromsource(ImageSource.camera);
                                                },
                                                child: ShaderMask(
                                                  shaderCallback: (bounds) {
                                                    return RadialGradient(
                                                      center: Alignment.topLeft,
                                                      radius: 3,
                                                      colors: [
                                                        ColorsManager.red,
                                                        Color.fromRGBO(255, 41, 41, 1.0),
                                                        Color.fromRGBO(255, 75, 75, 1),
                                                        Color.fromRGBO(255, 90, 90, 1),

                                                      ],
                                                      tileMode: TileMode.repeated,
                                                    ).createShader(bounds);
                                                  },
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Icon(IconBroken.Camera),
                                                      SizedBox(width: 10.0),
                                                      Text('Camera'),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              TextButton(
                                                onPressed: () async {
                                                 con.Pickimagefromsource(ImageSource.gallery);
                                                },
                                                child: ShaderMask(
                                                  shaderCallback: (bounds) {
                                                    return RadialGradient(
                                                      center: Alignment.topLeft,
                                                      radius: 3,
                                                      colors: [
                                                        ColorsManager.red,
                                                        Color.fromRGBO(255, 41, 41, 1.0),
                                                        Color.fromRGBO(255, 75, 75, 1),
                                                        Color.fromRGBO(255, 90, 90, 1),
                                                      ],
                                                      tileMode: TileMode.repeated,
                                                    ).createShader(bounds);
                                                  },
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Icon(IconBroken.Image_2),
                                                      SizedBox(width: 10.0),
                                                      Text('Gallery'),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  child: SizedBox(
                                    height: height / 20,
                                    width: width / 10,
                                    child: Card(
                                      shape: const CircleBorder(),
                                      color: Theme.of(context).unselectedWidgetColor,
                                      child: Container(
                                        child: Center(
                                          child: Icon(Icons.add, color: Colors.white, size: width / 22),
                                        ),
                                        decoration: BoxDecoration(
                                          color: ColorsManager.red.withOpacity(.6),
                                          shape: BoxShape.circle,
                                          border: Border.all(color: ColorsManager.red.withOpacity(.3), width: width / 200),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),


                    /*-----------------------------------------------------------------*/
                    Form(
                      key: _formKey,
                      child: Center(
                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal: width/20),
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: FadeIn(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(children: [
                                    Expanded(
                                      child: Container(
                                        child: CustomTextFormField(

                                          lines: 1,
                                          controller: controller.bil,
                                          hintText: "Enter Bilirubin value",
                                          requiredField: true, label: 'Bilirubin',
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: width/50,
                                    ),
                                    Expanded(
                                      child: Container(

                                        child: CustomTextFormField(
                                          lines: 1,
                                          controller: controller.chol,
                                          hintText: "Enter Cholostrol value",
                                          requiredField: true, label: 'Cholostrol',
                                        ),
                                      ),
                                    ),
                                  ],),

                                  SizedBox(
                                    height: width/25,
                                  ),
                                  Row(children: [
                                    Expanded(
                                      child: Container(
                                        child: CustomTextFormField(

                                          lines: 1,
                                          controller: controller.glucose,
                                          hintText: "Enter Glucose value",
                                          requiredField: true, label: 'Glucose',
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: width/50,
                                    ),
                                    Expanded(
                                      child: Container(

                                        child: CustomTextFormField(
                                          lines: 1,
                                          controller: controller.mvc,
                                          hintText: "Enter MVC value",
                                          requiredField: true, label: 'MVC:',
                                        ),
                                      ),
                                    ),
                                  ],),
                                  SizedBox(
                                    height: width/25,
                                  ),
                                  Row(children: [
                                    Expanded(
                                      child: Container(
                                        child: CustomTextFormField(

                                          lines: 1,
                                          controller: controller.plat,
                                          hintText: "Enter Platelets value",
                                          requiredField: true, label: 'Platelets:',
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: width/50,
                                    ),
                                    Expanded(
                                      child: Container(

                                        child: CustomTextFormField(
                                          lines: 1,
                                          controller: controller.rbc,
                                          hintText: "Enter RBC value",
                                          requiredField: true, label: 'RBC:',
                                        ),
                                      ),
                                    ),
                                  ],),
                                  SizedBox(
                                    height: width/15,
                                  ),

                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    /*-------------------*/







                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width / 28),
                      child: Mbutton(
                        width: width,
                        height: height,
                        func:()=> ()async{
                          print("mm");
                          con.uploaddata(context: context, height: height, width: width);


                          /*Future<String> uploadImageToFirebaseStorage(String filePath) async {

                          }*/




                        },
                        colors: [
                          ColorsManager.red,
                          Color.fromRGBO(255, 41, 41, 1.0),
                          Color.fromRGBO(255, 75, 75, 1),
                          Color.fromRGBO(255, 90, 90, 1),
                        ],
                        txt: "Save data & Signin",
                        wid: Icon(IconBroken.Arrow___Right_2, color: Colors.white, size: height / 30),
                        txtcolor: ColorsManager.white,
                      ),
                    ),
                    SizedBox(height: height / 80),

                    SizedBox(height: height / 320,),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        textDirection: TextDirection.ltr,
                        children: [
                          Text(
                            "do you wouldn't add your data info ?",
                            textDirection: TextDirection.ltr,
                            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: width / 30,
                              color: Colors.black26,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: width / 35,),
                          GestureDetector(
                            onTap: () {
                              //Navigator.of(context).pushNamed(Login_Screen.scid);
                            },
                            child: Text(
                              "Skip",
                              textDirection: TextDirection.ltr,
                              style: TextStyle(
                                fontSize: width / 28,
                                color: ColorsManager.red,
                                fontWeight: FontWeight.w600,

                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class Txt extends StatelessWidget {
  const Txt({required this.text});
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: Text(
        text!,
        textDirection: TextDirection.ltr,
        style: Theme.of(context).textTheme.bodyText1!.copyWith(

          fontSize: 14,
          color: Colors.black38,
          fontFamily: 'cairo',
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}