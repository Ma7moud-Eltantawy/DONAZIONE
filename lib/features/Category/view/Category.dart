import 'package:blood_donar/core/constants.dart';
import 'package:blood_donar/core/manager/colors_manager.dart';
import 'package:blood_donar/core/styles/icons.dart';
import 'package:blood_donar/features/Category/controller/category_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Categories_Screen extends StatefulWidget {
  const Categories_Screen({Key? key}) : super(key: key);

  @override
  State<Categories_Screen> createState() => _Categories_ScreenState();
  static const scid="Categories_Screen";
}

class _Categories_ScreenState extends State<Categories_Screen> {
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
                //Navigator.of(context).pushNamed(Myprofile_screen.scid);

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
                  'miscellaneous categories',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  'Select Category',
                  style: TextStyle(fontSize: 20, color: ColorsManager.red),
                ),
                SizedBox(
                  height: 15.0,
                ),
                InkWell(
                  onTap: (){
                    //Navigator.of(context).pushNamed(Search_screen.scid);
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
                            'Search...',
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
                              IconBroken.Search,
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
                    'Categories:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),

                GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 7 / 10,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10
                  ) , itemBuilder: (context,index)=>InkWell(

                        onTap: (){
                          Get.to(controller.Category_list[index].navscreen,transition: kTransition2,duration: kTransitionDuration);

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
                                child: Image.asset( "${controller.Category_list[index].img}",
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
                                  controller.Category_list[index].Title,
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
                    itemCount: controller.Category_list.length,
                  ),

              ],
            ),
          ),
        ),
      );
  }
}
