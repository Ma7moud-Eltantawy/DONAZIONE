import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/manager/colors_manager.dart';
import '../../../core/styles/icons.dart';
import '../../../widgets/req_listview.dart';
import '../../donation_Request/Requests/view/Requests_screen.dart';
import '../controller/acceptation_controller.dart';
class Acceptation_Screen extends StatelessWidget {
  const Acceptation_Screen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    var width=size.width;
    var height=size.height;
    Acceptation_controller controller=Get.put(Acceptation_controller());
    return SafeArea(
      child: GetBuilder<Acceptation_controller>(
        init: Acceptation_controller(),

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
                        "Provider.of<shared_pref_prov>(context,listen: false).user_data!.data!.image.toString()",
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
          body: con.Acceptedlist.length==0?Center(child: Text(
            "You have not previously donated blood."
          ),):SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(width/50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Previous times to donate blood.',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    'We hope for more.',
                    style: TextStyle(fontSize: 20, color: ColorsManager.red),
                  ),
                  SizedBox(
                    height: 15.0,
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


