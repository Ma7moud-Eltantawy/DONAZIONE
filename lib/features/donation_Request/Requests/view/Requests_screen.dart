import 'package:blood_donar/core/manager/colors_manager.dart';
import 'package:blood_donar/features/donation_Request/Crete_request/controller/Request_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/constants.dart';
import '../../../../core/styles/icons.dart';
import '../../../../widgets/profile_bottom_sheet.dart';
import '../../../../widgets/req_listview.dart';
import '../../../Acceptation/view/Acceptation_view.dart';
import '../../Crete_request/view/create_request_screen/create_request_design.dart';
import '../contraller/Requests_controller.dart';
class Requests_Screen extends StatelessWidget {
  const Requests_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Requests_controller controller=Get.put(Requests_controller());
    final size=MediaQuery.of(context).size;
    final height=size.height;
    final width=size.width;
    return SafeArea(
      child: GetBuilder<Requests_controller>(
        init: Requests_controller(),

        builder:(con)=> con.loadingstate==true?
        My_Shimmer(width: width, height: height):Scaffold(
          backgroundColor: Colors.white,
          appBar:  AppBar(

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
                        currentusermoreinfo!.pic,
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
            child: Padding(
              padding: EdgeInsets.all(width/50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Blood Donation ٌRquests',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    'Contribute if you can donate.',
                    style: TextStyle(fontSize: 20, color: ColorsManager.red),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  InkWell(
                    onTap: (){

                      Get.to(Acceptation_Screen(),transition: kTransition2,duration: kTransitionDuration);
                    },
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'History of previous donations',
                              style: TextStyle(color: Colors.grey),
                            ),


                            Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                BorderRadius.circular(6.0),
                              ),
                              child: Icon(
                                Icons.history,
                                color: ColorsManager.red,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding:
                    EdgeInsets.symmetric(vertical: width/50),
                    child: Text(
                      'Requests:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),

                  con.Requests.length<1?Container(
                      height: height/2,
                      child: Center(child:Text("There are no requests currently.",style: TextStyle(
                        color: Colors.black38,
                        fontSize: width/30
                      ),))):GlowingOverscrollIndicator(
                      axisDirection: AxisDirection.down,
                      color: ColorsManager.red,
                      child: ListView.separated(
                        separatorBuilder: (context,index)=>SizedBox(height: height/150,),
                        shrinkWrap: true,
                        physics:NeverScrollableScrollPhysics(),
                        itemCount: con.Requests.length,
                        itemBuilder: (context,index)=>
                            InkWell(
                              onTap: ()
                              {

                                Profile_bottom_sheet(context: context,reqmodel: con.Requests[index], height: height,width: width);
                              },
                              child: Card(
                                elevation: 0.5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(width/10), // Adjust the radius value as needed
                                ),
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: width/20,vertical: width/80),
                                  padding: EdgeInsets.symmetric(horizontal: width/15,vertical: width/40),
                                  height: height/5,
                                  width: width,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(width/10)
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,


                                    children: [
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Name:",style: TextStyle(color: Colors.black38),),
                                          Container(
                                              width: width/2.5,
                                              child: Text(con.Requests[index].name!,overflow: TextOverflow.ellipsis,softWrap: true,maxLines: 1,)),
                                          SizedBox(height:height/250,),
                                          Text("Location:",style: TextStyle(color: Colors.black38),),
                                          Container(
                                              width: width/2.5,
                                              child: Text(con.Requests[index].lang!,overflow: TextOverflow.ellipsis,softWrap: true,maxLines: 1,)),

                                          SizedBox(height:height/250,),
                                          Container(
                                              width: width/2.5,
                                              child: DateTime.now().difference(DateTime.parse(con.Requests[index].time!)).inHours<24?
                                              Text("${DateTime.now().difference(DateTime.parse(con.Requests[index].time!)).inHours} Hours Ago"
                                                ,style: TextStyle(color: Colors.black38),
                                                overflow: TextOverflow.ellipsis,softWrap: true,maxLines: 1,)
                                                  :Text("${DateTime.now().difference(DateTime.parse(con.Requests[index].time!)).inDays} Days Ago"
                                                ,style: TextStyle(color: Colors.black38),
                                                overflow: TextOverflow.ellipsis,softWrap: true,maxLines: 1,)),

                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            height: height/15,
                                            width: width/10,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage("assets/images/Blood Group.png",),
                                                    fit: BoxFit.fill
                                                )
                                            ),
                                            child: Center(child: Text(con.Requests[index].bloodtype!,textDirection: TextDirection.ltr,style: TextStyle(
                                                color: Colors.white
                                            ),)),
                                          ),
                                          InkWell(
                                            overlayColor:MaterialStateProperty.all(Colors.red),
                                            onTap: (){
                                              con.Adddonate(id: con.Requests[index].id!);

                                            },
                                            child: Text("Donate",style: TextStyle(
                                                color: ColorsManager.red,
                                                fontWeight: FontWeight.bold
                                            ),),
                                          ),

                                        ],
                                      )
                                    ],
                                  ),

                                ),
                              ),
                            ),

                      )
                      ),


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class My_Shimmer extends StatelessWidget {
  const My_Shimmer({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(width/25),
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[200]!,
                    highlightColor: Colors.grey[50]!,
                    child: Column(
                      children: [
                        Shimmer_tile(width: width, height: height),
                        SizedBox(height: height/30,),
                        Shimmer_tile(width: width, height: height),
                        SizedBox(height: height/30,),
                        Shimmer_tile(width: width, height: height),
                        SizedBox(height: height/30,),
                        Shimmer_tile(width: width, height: height),
                        SizedBox(height: height/30,),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Shimmer_tile extends StatelessWidget {
  const Shimmer_tile({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Expanded(

      child: Container(

        child: Row(
          children: [

            Container(
              width: width/3,
              height: height/6,
              decoration:BoxDecoration(
                borderRadius: BorderRadius.circular(width/25),
                color: Colors.grey[100],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(width/25),
                        color: Colors.grey[100],
                      ),
                      margin: EdgeInsets.all(width/50),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(width/50),
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(width/25),
                        color: Colors.grey[100],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(width/50),
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(width/25),
                        color: Colors.grey[100],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(width/50),
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(width/25),
                        color: Colors.grey[100],
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),

        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(width/25),
        ),

      ),
    );
  }
}


