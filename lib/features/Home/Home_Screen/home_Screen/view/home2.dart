import 'dart:ui';

import 'package:blood_donar/core/constants.dart';
import 'package:blood_donar/features/Campaign/view/campaign_screen.dart';
import 'package:blood_donar/features/Category/view/Category.dart';
import 'package:blood_donar/features/Donates/view/donates_screen.dart';
import 'package:blood_donar/features/Faqs/view/QuestionsScreen.dart';
import 'package:blood_donar/features/Home/Home_Screen/home_Screen/controller/homescreen_controller.dart';
import 'package:blood_donar/features/Report_screen/view/report_screen_view.dart';
import 'package:blood_donar/features/Search_screen/view/search_screen_view.dart';
import 'package:blood_donar/features/donation_Request/Requests/view/Requests_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../../core/manager/colors_manager.dart';
import '../../../../../core/styles/icons.dart';
import '../../../../Assistant_Screen/view/Assistant_screen.dart';
import 'homescreen_view.dart';
class homeui extends StatefulWidget {
  const homeui({Key? key}) : super(key: key);

  @override
  State<homeui> createState() => _homeuiState();
}

class _homeuiState extends State<homeui> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<double> _animation2;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller=AnimationController(vsync: this,duration: Duration(seconds: 1));
    _animation=Tween<double>(begin: 0,end: 1).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut))..addListener(() {
      setState(() {

      });
    });
    _animation2 = Tween<double>(begin: -30, end: 0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _controller.forward();
    _controller.forward();

  }



  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context)  {
    double _w = MediaQuery.of(context).size.width;
    return GetBuilder<HomeScreen_Controller>(
      init: HomeScreen_Controller(),
      builder:(con)=> Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            /// ListView
            ListView(
              physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(_w / 17, _w / 20, 0, _w / 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'DONAZIONE',
                        style: TextStyle(
                          fontSize: 27,
                          color: ColorsManager.red,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: _w / 35),
                      Text(
                        'Together, we are the \nlifeline of Egypt',
                        style: TextStyle(
                          fontSize: 19,
                          color: ColorsManager.black.withOpacity(.5),
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),


                MyCarouselslider(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: _w/60,vertical: _w/40) ,
                  child: InkWell(
                    onTap: (){
                      //Navigator.of(context).pushNamed(Search_screen.scid);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: _w/80) ,
                      margin: EdgeInsets.symmetric(horizontal: _w/80),
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
                ),

                homePageCardsGroup(
                  Color(0xfff37736),
                  Icons.search,
                  'Find Donors',
                  context,
                        ()=>Get.to(Search_Screen(),transition: kTransition2,duration: kTransitionDuration),
                  Color(0xffFF6D6D),
                  Icons.bloodtype_outlined,
                  'Donates',
                        ()=>Get.to(Donates_Screen(),transition: kTransition2,duration: kTransitionDuration),
                ),
                homePageCardsGroup(
                    Colors.lightGreen,
                    Icons.bloodtype_sharp,
                    'Order Bloods',
                    context,
                        ()=>Get.to(Requests_Screen(),transition: kTransition2,duration: kTransitionDuration),
                    Color(0xffffa700),
                    Icons.add_chart,
                    'Report',
                      ()=>Get.to(Report_screen(),transition: kTransition2,duration: kTransitionDuration),),
                homePageCardsGroup(
                    Color(0xff63ace5),
                    Icons.campaign_outlined,
                    'Campaigns',
                    context,
                    ()=>Get.to(Campaign_Screen(),transition: kTransition2,duration: kTransitionDuration),
                    Color(0xfff37736),
                    Icons.question_mark,
                    'Assistant',
                      ()=>Get.to(Assistant_screen(),transition: kTransition2,duration: kTransitionDuration),),
                SizedBox(height: _w / 7),
              ],
            ),

            /// SETTING ICON
            Padding(
              padding: EdgeInsets.fromLTRB(0, _w / 9.5, _w / 15, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () {
                      HapticFeedback.lightImpact();
                      Get.to(Categories_Screen(),transition: kTransition2,duration: kTransitionDuration);
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(99)),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
                        child: Container(
                          height: _w / 8.5,
                          width: _w / 8.5,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(.05),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Icon(
                              IconBroken.Category,
                              size: _w / 17,
                              color: Colors.black.withOpacity(.6),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Blur the Status bar
            blurTheStatusBar(context),
          ],
        ),
      ),
    );
  }

  Widget homePageCardsGroup(
      Color color,
      IconData icon,
      String title,
      BuildContext context,
      Function func1,
      Color color2,
      IconData icon2,
      String title2,
      Function func2) {
    double _w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(bottom: _w / 17),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          homePageCard(color, icon, title, context, func1),
          homePageCard(color2, icon2, title2, context, func2),
        ],
      ),
    );
  }

  Widget homePageCard(Color color, IconData icon, String title,
      BuildContext context, Function func) {
    double _w = MediaQuery.of(context).size.width;
    return Opacity(
      opacity: _animation.value,
      child: Transform.translate(
        offset: Offset(0, _animation2.value),
        child: InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {
            HapticFeedback.lightImpact();
            func();
          },
          child: Container(
            padding: EdgeInsets.all(15),
            height: _w / 2.5,
            width: _w / 2.4,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(.15),
                  blurRadius: 99,
                ),
              ],
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(),
                Container(
                  height: _w / 8,
                  width: _w / 8,
                  decoration: BoxDecoration(
                    color: color.withOpacity(.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    icon,
                    color: color.withOpacity(.6),
                  ),
                ),
                Text(
                  title,
                  maxLines: 4,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black.withOpacity(.5),
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget blurTheStatusBar(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
        child: Container(
          height: _w / 18,
          color: Colors.transparent,
        ),
      ),
    );
  }
}

