import 'package:blood_donar/core/manager/colors_manager.dart';
import 'package:blood_donar/features/donation_Request/Crete_request/controller/Request_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/constants.dart';
import '../../../../core/styles/icons.dart';
import '../../../../widgets/req_listview.dart';
import '../../../Acceptation/view/Acceptation_view.dart';
import '../../Crete_request/view/create_request_screen/create_request_design.dart';
import '../contraller/Acceptation_controller.dart';
class Acceptation_Screen extends StatelessWidget {
  const Acceptation_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Acceptation_controller controller=Get.put(Acceptation_controller());
    final size=MediaQuery.of(context).size;
    final height=size.height;
    final width=size.width;
    return SafeArea(
      child: GetBuilder<Acceptation_controller>(
        init: Acceptation_controller(),

        builder:(con)=> con.loadingstate==true?
        My_Shimmer(width: width, height: height):con.Acceptedlist.length<1?Center(

          child:Text("You never donated.",style: TextStyle(
            color: Colors.black38,
            fontSize: width/30
          ),)
        ):Scaffold(
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
                    'Previous donation list.',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    'Contribute more.',
                    style: TextStyle(fontSize: 20, color: ColorsManager.red),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),


                  Padding(
                    padding:
                    EdgeInsets.symmetric(vertical: width/50),
                    child: Text(
                      'Requests:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),

                      GlowingOverscrollIndicator(
                      axisDirection: AxisDirection.down,
                      color: ColorsManager.red,
                      child:  Requests_Listview(height: height, width: width,scroll: false,Requests: con.Acceptedlist,)
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


