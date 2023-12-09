import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:blood_donar/core/Models/Request_model.dart';
import 'package:blood_donar/core/manager/colors_manager.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../core/constants.dart';
import '../core/styles/icons.dart';
import '../features/Donates/view/donates_screen.dart';
import '../features/Profile/view/profile_screen.dart';
import '../features/donation_Request/Crete_request/view/create_request_screen/create_request_design.dart';
import '../features/maps/controller/mapcontroller.dart';
import '../features/maps/controller/req_map.dart';
import 'contact_me.dart';
import 'material_button.dart';
import 'package:url_launcher/url_launcher.dart';


TextEditingController emailController = TextEditingController();

TextEditingController fullNameController = TextEditingController();

TextEditingController phoneController = TextEditingController();


var formState = GlobalKey<FormState>();

void Profile_bottom_sheet({required BuildContext context,required double height,required double width,required Requestdatamodel reqmodel})
{
  MapController controller=Get.put(MapController());
  showFlexibleBottomSheet(
    minHeight: 0,
    initHeight: 0.85,
    maxHeight: 0.85,
    bottomSheetColor: Colors.transparent,

    context: context,
    builder: (context,
        ScrollController scrollController,
        double bottomSheetOffset)=>Stack(
          children: [
            Container(

              child: Container(
                width: width,

                child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(

          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topRight: Radius.circular(width/25),topLeft: Radius.circular(width/25)),
          ),
          height: height/10,width: width,),
                Container(
                  color: Colors.white,
                  child: Column(
                    children: [


                      SizedBox(height: height/40,),
                      Text(reqmodel.name.toString(),style: TextStyle(fontSize: width/20,fontWeight:FontWeight.bold ),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Icon(IconBroken.Location,color: ColorsManager.red,size: width/18,),
                          SizedBox(width: width/50,),


                          Container(
                            width: width/2,
                            child: Text(reqmodel.location.toString(),
                              style: TextStyle(
                                  fontSize: width/20,
                                  color: Colors.black54
                              ),
                              textDirection: TextDirection.ltr,
                              overflow: TextOverflow.ellipsis,

                            ),),


                        ],
                      ),
                      SizedBox(height: height/30,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [

                          Container(
                            height: height/15,
                            child: Column(
                              children: [
                                Icon(Icons.timeline,color: ColorsManager.red,size: width/15,),
                                Row(

                                  children: [



                                    Text(reqmodel.numofdonate.toString(),
                                      style: TextStyle(
                                          color: ColorsManager.red,
                                          fontSize: width/20,
                                          fontWeight: FontWeight.bold
                                      ),

                                    ),
                                    SizedBox(width: width/60,),

                                    Text("Times Donated", style: TextStyle(
                                        color: ColorsManager.black.withOpacity(.8),
                                        fontSize: width/20,
                                        fontWeight: FontWeight.bold
                                    ),

                                    ),


                                  ],
                                ),

                              ],
                            ),
                          ),
                          Container(
                            height: height/15,
                            child: Column(
                              children: [
                                Icon(Icons.bloodtype_outlined,color: ColorsManager.red,size: width/15,),
                                Row(

                                  children: [
                                    Text("Blood Type", style: TextStyle(
                                        color: ColorsManager.black.withOpacity(.8),
                                        fontSize: width/20,
                                        fontWeight: FontWeight.bold
                                    ),

                                    ),

                                    SizedBox(width: width/60,),
                                    Text(reqmodel.bloodtype.toString(),textDirection: TextDirection.ltr,
                                      style: TextStyle(
                                          color: ColorsManager.red,
                                          fontSize: width/20,
                                          fontWeight: FontWeight.bold
                                      ),

                                    ),






                                  ],
                                ),

                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height/30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(

                            padding:EdgeInsets.all(width/60) ,
                            width: width/2.8,
                            height: height/16,
                            decoration: BoxDecoration(
                              color: ColorsManager.red,
                              borderRadius: BorderRadius.circular(width/60),
                            ),
                            child:Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                InkWell(
                                  child: Container(

                                    child: Text("Request",
                                      style: TextStyle(
                                          color: Colors.white
                                      ),
                                      textDirection: TextDirection.ltr,
                                      overflow: TextOverflow.ellipsis,

                                    ),),
                                  onTap: (){
                                    Get.to(Routing_request(Reciveid: reqmodel.id.toString(),),transition: kTransition2,duration: kTransitionDuration );
                                  },
                                ),
                                SizedBox(width: width/50,),
                                Icon(IconBroken.Plus,color: ColorsManager.white,size: width/18,),

                              ],
                            ) ,
                          ),
                          InkWell(
                            onTap: (){
                              luncherfunc(context: context,phonenumber: reqmodel.phone.toString());
                            },
                            child: Container(

                              padding:EdgeInsets.all(width/60) ,
                              width: width/2.8,
                              height: height/16,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(104, 149, 147, 1),
                                borderRadius: BorderRadius.circular(width/60),
                              ),
                              child:Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Container(

                                    child: Text("Call Now",
                                      style: TextStyle(
                                          color: Colors.white
                                      ),
                                      textDirection: TextDirection.ltr,
                                      overflow: TextOverflow.ellipsis,

                                    ),),
                                  SizedBox(width: width/50,),
                                  Icon(IconBroken.Calling,color: ColorsManager.white,size: width/18,),

                                ],
                              ) ,
                            ),
                          ),


                        ],
                      ),

                      SizedBox(height: height/30,),
                      Container(
                        height: height/3,
                        width: width/1.1,
                        decoration: BoxDecoration(
                          borderRadius:BorderRadius.circular(width/20) ,
                        ),
                        child:  GetBuilder<req_mapcontroller>(
                          init: req_mapcontroller(req_latlng:LatLng(double.parse(reqmodel.lat.toString()),double.parse(reqmodel.lang.toString()))),
                          builder:(con)=>ClipRRect(
                            borderRadius: BorderRadius.circular(width/20),
                            child: con.loading==true?Center(child: CircularProgressIndicator(color: Colors.red,),):GoogleMap(
                              markers:con.reqmarkers.values.toSet(),
                              onMapCreated: con.onMapCreated,
                              initialCameraPosition:
                              CameraPosition(target:LatLng(double.parse(reqmodel.lat.toString()),double.parse(reqmodel.lang.toString())), zoom: 10.0),
                              mapType: con.type,

                            ),
                          ),

                        ),

                      ),
                      SizedBox(height: height/30,),

                    ],
                  ),
                )



      ],
    ),
              ),
            ),




            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                alignment: Alignment.center,
                child: CachedNetworkImage(
                  imageUrl: reqmodel.picurl.toString(),
                  placeholder: (context, url) =>
                      Center(
                          child: CircularProgressIndicator(
                            color: ColorsManager.red,
                            strokeWidth: 1.5,
                          )),
                  errorWidget: (context, url, error) =>
                      Icon(
                        Icons.error,
                        color:ColorsManager.red ,
                      ),
                  imageBuilder: (context, imageProvider) =>
                      Container(
                        height: height/6,
                        width: width/3,
                        decoration: BoxDecoration(
                            border: Border.all(width:width /80,color: Colors.white),
                            borderRadius: BorderRadius.circular(width/30),

                            image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover
                            )
                        ),

                      ),
                ),
              ),
            ),
          ],


        ),
    isExpand: false,
  );




}
Future<void>Launch_link(String link)async{
  var urlink=link;
  if(await canLaunch((urlink))){
    await launch (urlink);
  }
  else{
    await launch (urlink);
  }
}
Widget _buildBottomSheet(
    BuildContext context,
    ScrollController scrollController,
    double bottomSheetOffset,
    ) {
  return Material(
    child: Container(
      child: ListView(
          controller: scrollController,
          shrinkWrap: true,

      ),
    ),
  );}
