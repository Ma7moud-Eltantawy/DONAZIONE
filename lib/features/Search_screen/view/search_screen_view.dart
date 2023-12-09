// main.dart

import 'package:blood_donar/core/manager/colors_manager.dart';
import 'package:blood_donar/features/donation_Request/Requests/view/Requests_screen.dart';
import 'package:blood_donar/widgets/Expanded_widget/expandel_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:googleapis/transcoder/v1.dart';

import '../../../core/constants.dart';
import '../../../core/styles/icons.dart';
import '../../../widgets/Expanded_widget/Expandle_widget.dart';
import '../../Donates/view/donates_screen.dart';
import '../Contaroller/search_controller.dart';



class Search_Screen extends StatelessWidget {
  final Search_Controller searchController = Get.put(Search_Controller());
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();





  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    final height=size.height;
    final width=size.width;
    Search_Controller controller=Get.put(Search_Controller());
    return GetBuilder<Search_Controller>(
      init: Search_Controller(),
      builder:(con)=> con.loadingstate==true?My_Shimmer(width: width, height: height):Scaffold(
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
              mainAxisAlignment: MainAxisAlignment.start,
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
                  'Find Donors',
                  style: TextStyle(fontSize: 20, color: ColorsManager.red),
                ),
                SizedBox(
                  height: 15.0,
                ),
                InkWell(
                  onTap: (){
                    Get.to(Search_Screen(),transition: kTransition2,duration: kTransitionDuration);
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
                          Expanded(
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: TextField(
                                textAlignVertical: TextAlignVertical.top,
                                textAlign: TextAlign.left,
                                cursorColor: ColorsManager.red,

                                decoration: InputDecoration(
                                  hintText: 'Search',hintStyle: TextStyle(

                                ),

                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(
                                    left: width/50,

                                  ),
                                ),
                                onChanged: (val) {
                                  con.GetSearch(Searchkey:val );
                                },
                              ),
                            ),
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

      ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: GetBuilder<Search_Controller>(
                    builder:(con)=> Container(
                      decoration: BoxDecoration(
                          color:Colors.transparent,
                          borderRadius: BorderRadius.circular(width/50)
                      ),
                      padding: EdgeInsets.symmetric(horizontal: width/100,vertical: height/150),
                      child: ExpansionTile(
                          backgroundColor: Colors.white,
                          collapsedBackgroundColor: Colors.white.withOpacity(.97),
                          iconColor: ColorsManager.red,
                          childrenPadding: EdgeInsets.only(
                              left: 15.0, right: 15.0, bottom: 15.0),
                          collapsedIconColor: ColorsManager.red,
                          tilePadding: EdgeInsets.symmetric(horizontal: 10.0),
                          controlAffinity: ListTileControlAffinity.trailing,
                          trailing:con.isTapped.isTrue?Icon(IconBroken.Arrow___Down_2):Icon(IconBroken.Arrow___Up_2),
                          title: Row(
                            children: [
                              Icon(IconBroken.Filter, color: ColorsManager.red,
                                size: 26,),
                              SizedBox(width: 10.0,),
                              Text(
                                "Select Filters",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                textDirection: TextDirection.ltr,

                                style: TextStyle(fontSize: 14,color: ColorsManager.black),
                              ),
                            ],
                          ),
                          children: [

                            DynamicFilters(),

                          ],
                          onExpansionChanged: (value) {
                            con.cahangeonTap();
                            con.onHighlightChanged(value);
                           // Provider.of<Settings_prov>(context,listen: false).faqstate(snapshot.data![index].id!, value);


                          },
                        ),
                    ),
                  ),

                ),
                con.usedusers.length==0?Center():ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: List.generate(
                    con.usedusers.length,
                        (index) => InkWell(
                      onTap: () {

                        // Handle onTap action
                        // Get.to(controller.Category_list[index].navscreen, transition: kTransition2, duration: kTransitionDuration);
                      },
                      child:Slidable(
                        startActionPane: ActionPane(
                          // A motion is a widget used to control how the pane animates.
                          motion: ScrollMotion(),

                          // All actions are defined in the children parameter.
                          children: [
                            // A SlidableAction can have an icon and/or a label.
                            SlidableAction(
                              onPressed:(BuildContext context)=>luncherfunc(context: context,phonenumber: "01015876911") ,
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
                                imageUrl:con.usedusers[index].pic.toString(),
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
                                  Text("${con.usedusers[index].name!}",style: TextStyle(
                                      fontSize: width/35,
                                      fontWeight: FontWeight.w300
                                  ),),
                                  Row(
                                    children: [
                                      Icon(IconBroken.Location,size: width/40,color: ColorsManager.red,),
                                      SizedBox(width: width/120,),
                                      Text("${con.usedusers[index].location!}",
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
                              child: Center(child: Text("${con.usedusers[index].bloodtype!}",textDirection: TextDirection.ltr,style: TextStyle(
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

              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DynamicFilters extends StatelessWidget {
  final Search_Controller searchController = Get.put(Search_Controller());

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    final height=size.height;
    final width=size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          'Blood Type:',
          textDirection: TextDirection.ltr,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: width/30),
        ),
        SizedBox(height: 10),
        Obx(() {
          return Wrap(
            alignment:WrapAlignment.end ,
            spacing: width/30,
            children: searchController.availableFilters.map((filter) {
              return FilterChip(
                labelStyle: TextStyle(
                  color: searchController.selectedFilters.contains(filter)?Colors.white:Colors.black
                ),

                label: Container(
                    width: width/10,
                    alignment: Alignment.center,
                    child: Text(filter,textDirection: TextDirection.ltr,style: TextStyle(
                    ),),),
                selected: searchController.selectedFilters.contains(filter),
                selectedColor: ColorsManager.red,
                checkmarkColor: Colors.white,


                onSelected: (selected) {
                  searchController.toggleFilter(filter);
                },
              );
            }).toList(),
          );
        }),
        SizedBox(height: height/15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: height/20,
              width: width/3.5,
              child: ElevatedButton(
                onPressed: () {
                  // Perform search based on selected filters

                  print("Performing search with filters: ${searchController.selectedFilters}");
                  searchController.Getfilter();
                },
                child: Text('Search'),
              ),
            ),

            Container(
              height: height/20,
              width: width/3.5,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:MaterialStateProperty.all(ColorsManager.red),
                ),
                onPressed: () {
                  // Perform search based on selected filters
                  searchController.clearFilters();
                },
                child: Text('Clear Filters',textDirection: TextDirection.ltr,),
              ),
            ),
          ],
        ),


      ],
    );
  }
}void doNothing(BuildContext context) {}
