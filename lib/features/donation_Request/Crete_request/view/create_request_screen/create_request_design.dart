import 'package:blood_donar/core/constants.dart';
import 'package:blood_donar/core/manager/colors_manager.dart';
import 'package:blood_donar/widgets/m_button.dart';
import 'package:blood_donar/widgets/text_field.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/styles/icons.dart';
import '../../controller/Request_controller.dart';
class Routing_request extends StatelessWidget {
  String Reciveid;
   Routing_request({Key? key,required this.Reciveid}) : super(key: key);
   final CreateRequest_controller controller=Get.put(CreateRequest_controller());


  @override
  Widget build(BuildContext context) {





    final size=MediaQuery.of(context).size;
    final height=size.height;
    final width=size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Request"),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: width/25,
        ),

        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon:  Icon(
            IconBroken.Arrow___Left_2,
            size: 35,
            color: ColorsManager.red,
          ),
          onPressed: () {
            Navigator.of(context).pop();

          },
        ),
        actions: [
          InkWell(
            onTap: () {

            },
            child: Padding(
              padding: const EdgeInsets.only(
                right: 10,
              ),
              child: CircleAvatar(
                radius: 24,
                backgroundColor: ColorsManager.red,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 22.5,
                  child: CachedNetworkImage(
                    imageUrl:
                    currentusermoreinfo!.pic.toString(),
                    placeholder: (context, url) => Center(
                        child: CircularProgressIndicator(
                          color: ColorsManager.red,
                          strokeWidth: 1.5,
                        )),
                    errorWidget: (context, url, error) => Icon(
                      Icons.error,
                      color: ColorsManager.red,
                    ),
                    imageBuilder: (context, imageProvider) =>
                        CircleAvatar(
                          backgroundImage: imageProvider,
                          radius: 21,
                        ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: GetBuilder<CreateRequest_controller>(
          init: CreateRequest_controller(),
          builder:(con)=> Container(
            height: height/1.2,
            child: Column(
              children: [
                Expanded(
                  flex: 6,
                    child: Center(
                      child: Container(
                        margin: EdgeInsets.all(width/25),
                        child: Column(
                         children: [
                           CustomTextFormField(
                             lines: 1,
                             label: "",controller:controller.loc ,hintText: "City",textDirection:TextDirection.ltr,isPassword: false,suffixIcon: Icon(IconBroken.Location,color: ColorsManager.red),
                           hintStyle: TextStyle(),
                           ),
                           CustomTextFormField(
                             lines: 1,
                             label: "",controller:controller.Hos ,hintText: "Hospital",textDirection:TextDirection.ltr,isPassword: false,suffixIcon: Icon(Icons.local_hospital_outlined,color: ColorsManager.red),
                             hintStyle: TextStyle(),
                           ),
                           CustomTextFormField(

                             keyboardType: TextInputType.phone,
                             lines: 1,
                             label: "",
                             controller:controller.mobile ,
                             hintText: "Mobile",
                             textDirection:TextDirection.ltr,
                             isPassword: false,suffixIcon: Icon(Icons.phone,color: ColorsManager.red),
                             hintStyle: TextStyle(),
                           ),



                           Text(
                            "",
                             style: TextStyle(
                               fontFamily: "Almarai",
                             ),
                           ),
                           const SizedBox(
                             height: 5,
                           ),
                           Container(padding: EdgeInsets.symmetric(horizontal: width/30),
                             alignment: Alignment.centerLeft,
                             decoration: BoxDecoration(

                               border: Border.all(color: Colors.black38),
                               borderRadius: BorderRadius.circular(width/80)
                             ),
                             width: width,

                             child: GetBuilder<CreateRequest_controller>(
                               builder:(con)=> DropdownButton<String>(
                                 borderRadius: BorderRadius.circular(20),

                                 value:"${con.blood_type==null?"choose blood type":con.blood_type}",
                                 //elevation: 5,
                                 style: TextStyle(color: Colors.black),
                                 alignment: Alignment.bottomLeft,
                                 underline: Container(
                                   color: Colors.transparent,
                                 ),
                                 iconEnabledColor: ColorsManager.red,


                                 items: <String>[
                                   "choose blood type",
                                   'A+',
                                   'A-',
                                   'o+',
                                   'O-',
                                   'B+',
                                   'B-',
                                   'AB',
                                 ].map<DropdownMenuItem<String>>((String value) {
                                   return DropdownMenuItem<String>(
                                     value: value,
                                     child: Text(value,textDirection: TextDirection.ltr,),
                                   );
                                 }).toList(),
                                 hint: Text(
                                   "Please choose a langauage",
                                   style: TextStyle(
                                       color: Colors.black,
                                       fontSize: 16,
                                       fontWeight: FontWeight.w600),
                                 ),
                                 onChanged: (String? val){
                                   con.Changebloodtype(val!);
                                   print(val);
                                   print(con.blood_type);
                                 },
                               ),
                             ),
                           ),
                           CustomTextFormField(

                             lines: 9,
                             label: "",
                             controller:controller.notes ,hintText: "Add a note",textDirection:TextDirection.ltr,isPassword: false,
                             hintStyle: TextStyle(),
                           ),
                         ],
                        ),

                        alignment: Alignment.center,
                ),
                    )),
                Expanded(
                  flex: 1,
                    child: Center(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: width/30),
                        child: Mbutton(width: width, height: height, colors: [ColorsManager.red,ColorsManager.red.withOpacity(.9),Colors.red,], txt: "Create Request", wid:Icon( IconBroken.Arrow___Right,color: Colors.white,), func:()=> (){
                          print("mahmoud");
                          con.Addrequest(recivedid:Reciveid, context: context, height: height, width: width);
                        }, txtcolor: Colors.white),

                ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
