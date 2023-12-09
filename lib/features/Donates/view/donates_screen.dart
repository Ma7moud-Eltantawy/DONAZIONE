import 'package:blood_donar/core/constants.dart';
import 'package:blood_donar/core/manager/colors_manager.dart';
import 'package:blood_donar/core/styles/icons.dart';
import 'package:blood_donar/features/Category/controller/category_controller.dart';
import 'package:blood_donar/features/donation_Request/Crete_request/controller/Request_controller.dart';
import 'package:blood_donar/widgets/profile_bottom_sheet.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

import '../../Search_screen/view/search_screen_view.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../donation_Request/Crete_request/view/create_request_screen/create_request_design.dart';


class Donates_Screen extends StatefulWidget {
  const Donates_Screen({Key? key}) : super(key: key);

  @override
  State<Donates_Screen> createState() => _Donates_ScreenState();

}

class _Donates_ScreenState extends State<Donates_Screen> {


  @override
  Widget build(BuildContext context) {
    category_controller controller=Get.put(category_controller());
    var size=MediaQuery.of(context).size;
    var height=size.height;
    var width=size.width;
    return Scaffold(
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
                'Many Users ',
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                'Available to donate:',
                style: TextStyle(fontSize: 20, color: ColorsManager.red),
              ),
              SizedBox(
                height: 15.0,
              ),

          ListView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: List.generate(
              AllUsersData.length,
                  (index) => Padding(
                    padding: EdgeInsets.only(bottom: height/60,right: width/60,left: width/60),
                    child: InkWell(
                onTap: () {
                 // Profile_bottom_sheet(context,height,width,AllUsersData[index].name.toString(),AllUsersData[index][0].location.toString(),LatLng(double.parse(Requests[0].lat.toString()), double.parse(Requests[0].lat.toString())));

                  // Handle onTap action
                    // Get.to(controller.Category_list[index].navscreen, transition: kTransition2, duration: kTransitionDuration);
                },
                child: Slidable(
                    startActionPane: ActionPane(
                      // A motion is a widget used to control how the pane animates.
                      motion: ScrollMotion(),

                      // All actions are defined in the children parameter.
                      children: [
                        // A SlidableAction can have an icon and/or a label.
                        SlidableAction(
                          onPressed:(BuildContext context){
                            Get.to(Routing_request(Reciveid: AllUsersData[index].id!,),transition: kTransition2,duration: kTransitionDuration );
                          } ,
                          backgroundColor: ColorsManager.red,
                          foregroundColor: Colors.white,
                          icon: IconBroken.Plus,
                          label: 'Request',
                          spacing: 1,
                        ),
                        SlidableAction(
                          onPressed:(BuildContext context)=>luncherfunc(context: context,phonenumber: AllUsersData[index].phone!) ,
                          backgroundColor: ColorsManager.blue,
                          foregroundColor: Colors.white,
                          icon: Icons.phone,
                          label: 'Call Now',
                        ),
                      ],
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: height/8.5,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.grey[50],),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                        tileColor: Colors.grey[50],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        leading:  Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          width: width/5,
                          height: double.infinity,
                          child: CachedNetworkImage(
                            imageUrl:AllUsersData[index].pic.toString(),
                            fit: BoxFit.cover,
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) => Center(
                              child: CircularProgressIndicator(
                                strokeWidth: 1.5,
                                color: ColorsManager.red,
                              ),
                            ),
                            errorWidget: (context, url, error) => Icon(
                              Icons.error,
                              color: ColorsManager.red,
                            ),
                          ),
                        ),
                        title: Container(
                          height: height/20, // Adjust height as needed
                          width: width/5, // Adjust width as needed
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(

                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("${AllUsersData[index].name!}",style: TextStyle(
                                fontSize: width/35,
                                fontWeight: FontWeight.w300
                              ),),
                              Row(
                                children: [
                                  Icon(IconBroken.Location,size: width/40,color: ColorsManager.red,),
                                  SizedBox(width: width/120,),
                                  Text("${AllUsersData[index].location!}",
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,

                                    style: TextStyle(
                                      fontSize: width/40,
                                      fontWeight: FontWeight.w200
                                  ),),
                                ],
                              )
                            ],
                          ),
                        ),
                        trailing:Container(
                          alignment: Alignment.centerLeft,
                          height: height/18,
                          width: width/13,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/images/Blood Group.png",),
                                  fit: BoxFit.fill
                              )
                          ),
                          child: Center(child: Text("${AllUsersData[index].bloodtype!}",textDirection: TextDirection.ltr,style: TextStyle(
                            fontSize: width/40,
                              color: Colors.white
                          ),)),
                        ) ,
                      ),
                    ),
                ),
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

void luncherfunc({required BuildContext context, required String phonenumber}) {
  UrlLauncher.launch("tel://$phonenumber");
}