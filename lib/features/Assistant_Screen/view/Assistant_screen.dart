import 'package:alan_voice/alan_voice.dart';
import 'package:blood_donar/core/manager/colors_manager.dart';
import 'package:blood_donar/core/styles/icons.dart';
import 'package:blood_donar/features/Profile/view/profile_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:googleapis/mybusinessbusinessinformation/v1.dart';
import 'package:googleapis/webfonts/v1.dart';
import 'package:lottie/lottie.dart';

import '../../../core/constants.dart';
import '../../../main.dart';
import '../assistant_controller.dart';
class Assistant_screen extends StatelessWidget {
   Assistant_screen({Key? key}) : super(key: key);
   AssistantController controller=Get.put(AssistantController());


  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    final height=size.height;
    final width=size.width;
    return GetBuilder<AssistantController>(
      init: AssistantController(),



      builder:(con)=> Scaffold(
        backgroundColor: ColorsManager.red,
        appBar: AppBar(
          centerTitle: true,
          title: Text("Assistant",style: TextStyle(
            color: Colors.white,
            fontSize: width/18
          ),),
          backgroundColor: ColorsManager.red,
          leading: IconButton(
            icon:  Icon(
              IconBroken.Arrow___Left_2,
              size: 35,
              color: ColorsManager.white,
            ),
            onPressed: () {
              Navigator.of(context).pop();

            },
          ),
          actions: [
            InkWell(
              onTap: () {
                Get.to(My_profile(),transition: kTransition2,duration: kTransitionDuration);

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
        body: Container(
          decoration:  BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(width/15),
              topRight: Radius.circular(width/15),
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: width/40, vertical: height/220),
                  decoration:  BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(width/15),
                      topRight: Radius.circular(width/15),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius:  BorderRadius.only(
                      topLeft: Radius.circular(width/15),
                      topRight: Radius.circular(width/15),
                    ),
                    child: con.msgs.isEmpty?Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Lottie.asset("assets/lottie/Animation - 1701833779426.json",height: height/5),
                      Text("What's in your mind?",style: TextStyle(
                        fontSize: width/30,
                        color: Colors.black38,
                      ),),
                        ],

                      ),

                    ):GlowingOverscrollIndicator(
                      axisDirection: AxisDirection.down,
                      color: ColorsManager.red.withOpacity(.009),

                      child: ListView.builder(
                        controller:con.scrollController,

                        reverse: false,
                        padding: const EdgeInsets.only(top: 15),
                        itemCount: con.msgs.length,
                        itemBuilder: (context, index) =>


                           con.msgs[index].sendByMe!=true?
                           Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Container(
                                   height: height/20,
                                   width: width/10,
                                   child: Lottie.asset("assets/lottie/Animation - 1701833779426.json")),
                               Align(
                                 alignment:
                                 Alignment.topLeft,
                                 child: Container(
                                   margin: const EdgeInsets.all(8.0),
                                   padding: const EdgeInsets.all(12.0),
                                   decoration: BoxDecoration(
                                      color:ColorsManager.blue.withOpacity(.2),
                                     borderRadius: BorderRadius.circular(8.0),
                                   ),
                                   child: Text(
                                     con.msgs[index].msgTxt,
                                     style: const TextStyle(color: Colors.black),
                                   ),
                                 ),
                               ),
                             ],
                           )

                               : Align(
                            alignment:
                             Alignment.topRight ,
                            child: Container(
                              margin: const EdgeInsets.all(8.0),
                              padding: const EdgeInsets.all(12.0),
                              decoration: BoxDecoration(
                                color: ColorsManager.red.withOpacity(.2),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Text(
                                con.msgs[index].msgTxt,
                                style: const TextStyle(color: Colors.black),
                              ),
                            ),
                          )

                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: ColorsManager.blue.withOpacity(.2),
                    borderRadius: BorderRadius.circular(width/5)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   Container(

                     child: SvgPicture.asset(
                       "assets/images/logo.svg"
                     ),
                     height: height/15,
                     width: width/25,
                     alignment: Alignment.center,
                     margin: EdgeInsets.symmetric(vertical: width/200,horizontal: width/20),
                   ),
                    Expanded(
                      child: Container(
                        child: TextField(
                          cursorColor: ColorsManager.red,
                          controller: con.msgController,

                          decoration: InputDecoration(
                              hintText: 'Type Your Message...',
                              border: InputBorder.none,
                              suffixIcon: IconButton(onPressed: (){
                                con.sendMsg();
                              }, icon: Icon(Icons.send,color: ColorsManager.red,))
                          ),

                        ),
                      ),
                    ),

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
