import 'package:blood_donar/core/constants.dart';
import 'package:blood_donar/core/manager/colors_manager.dart';
import 'package:blood_donar/core/styles/icons.dart';
import 'package:blood_donar/features/Campaign/controller/campaign.dart';
import 'package:blood_donar/features/Category/controller/category_controller.dart';
import 'package:blood_donar/features/Profile/view/profile_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Campaign_Screen extends StatefulWidget {
  const Campaign_Screen({Key? key}) : super(key: key);

  @override
  State<Campaign_Screen> createState() => _Categories_ScreenState();
  static const scid="Categories_Screen";
}

class _Categories_ScreenState extends State<Campaign_Screen> {
  @override
  Widget build(BuildContext context) {
    Campaign_controoler controller=Get.put(Campaign_controoler());
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
              Get.to(My_profile(),transition: kTransition1,duration: kTransitionDuration);

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
        physics: const NeverScrollableScrollPhysics(),

        child: Padding(
          padding: EdgeInsets.all(width/50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Many campaigns',
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                'Explore campaigns',
                style: TextStyle(fontSize: 20, color: ColorsManager.red),
              ),



              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate:SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: width/2,
                    childAspectRatio: width*1.95 / height,
                    crossAxisSpacing: width/30,
                    mainAxisSpacing: width/30
                ) , itemBuilder: (context,index)=>InkWell(

                onTap: (){
                  final selectedFunction = controller.campaignCategory_list[index].func;
                  if (selectedFunction != null) {
                    selectedFunction();
                  } else {
                    print('Function not found for categoryp');
                  }

                },
                child: Container(

                  decoration: BoxDecoration(
                      color: Colors.grey[50],
                      borderRadius: BorderRadius.circular(8)
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,

                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Image.asset( "${controller.campaignCategory_list[index].img}",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Expanded(
                          flex:1 ,

                          child: Container(
                            alignment: Alignment.center,
                            width: width/2.5,
                            child: Text(
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              controller.campaignCategory_list[index].Title,
                              maxLines: 2,
                              style: TextStyle(
                                //overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ),

                      ],

                    ),
                  ),
                ),
              ),
                itemCount: controller.campaignCategory_list.length,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
