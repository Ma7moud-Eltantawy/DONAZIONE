import 'package:blood_donar/core/manager/colors_manager.dart';
import 'package:blood_donar/core/styles/icons.dart';
import 'package:blood_donar/features/Profile/view/profile_screen.dart';
import 'package:blood_donar/features/Report_screen/view/report_screen_view.dart';
import 'package:blood_donar/features/Search_screen/view/search_screen_view.dart';
import 'package:blood_donar/features/donation_Request/Requests/view/Requests_screen.dart';
import 'package:blood_donar/features/Home/Home_Screen/home_Screen/view/home2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../mainscreen/controller/Mainscreen_controller.dart';
import 'home_Screen/view/homescreen_view.dart';
List<Widget> screens=[homeui(),Search_Screen(),Report_screen(),My_profile()];

class MainScreen extends StatefulWidget {



  @override
  _MainScreen createState() =>
      _MainScreen();
}

class _MainScreen
    extends State<MainScreen> with TickerProviderStateMixin {

  int currentValue = 0;

  AnimationController? _controller;
  Animation<double>? _animation;

  AnimationController?_controller2;
  Animation<double>? _animation2;

  AnimationController? _controller3;
  Animation<double>? _animation3;

  AnimationController ?_controller4;
  Animation<double> ?_animation4;

  AnimationController? _controller5;
  Animation<double> ?_animation5;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animation = Tween<double>(begin: 25, end: 33).animate(CurvedAnimation(
        parent: _controller!,
        curve: Curves.fastLinearToSlowEaseIn,
        reverseCurve: Curves.easeIn))
      ..addListener(() {
        setState(() {});
      });

    _controller2 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animation2 = Tween<double>(begin: 25, end: 33).animate(CurvedAnimation(
        parent: _controller2!,
        curve: Curves.fastLinearToSlowEaseIn,
        reverseCurve: Curves.easeIn))
      ..addListener(() {
        setState(() {});
      });

    _controller3 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animation3 = Tween<double>(begin: 25, end: 33).animate(CurvedAnimation(
        parent: _controller3!,
        curve: Curves.fastLinearToSlowEaseIn,
        reverseCurve: Curves.easeIn))
      ..addListener(() {
        setState(() {});
      });

    _controller4 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animation4 = Tween<double>(begin: 25, end: 33).animate(CurvedAnimation(
        parent: _controller4!,
        curve: Curves.fastLinearToSlowEaseIn,
        reverseCurve: Curves.easeIn))
      ..addListener(() {
        setState(() {});
      });

    _controller5 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animation5 = Tween<double>(begin: 25, end: 33).animate(CurvedAnimation(
        parent: _controller5!,
        curve: Curves.fastLinearToSlowEaseIn,
        reverseCurve: Curves.ease))
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller!.dispose();
    _controller2!.dispose();
    _controller3!.dispose();
    _controller4!.dispose();
    _controller5!.dispose();
    super.dispose();
  }
  MainScreen_Controller controller=Get.put(MainScreen_Controller());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var width=size.width;
    var height=size.height;
    return GetBuilder<MainScreen_Controller>(
      builder:(con)=> con.allusers.length==0?My_Shimmer(width: size.width, height: size.height):Scaffold(
        backgroundColor: Colors.transparent,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton:Padding(
          padding: EdgeInsets.only(bottom: height/25),
          child: Container(
            height: height/17,
            width: width/4,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red,

            ),

            child: Container(
                margin: EdgeInsets.symmetric(vertical: width/50,horizontal: width/10),
                child: SvgPicture.asset("assets/images/logowhite.svg",width:width/50,height: height/50,)) //icon inside button

          ),
        ),

        body: Stack(
          children: [
            // HOME PAGE
            SizedBox(
              height: size.height,
              width: size.width,
              child:screens[currentValue] ,
            ),

            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                height: size.width * .14,
                width: size.width,
                margin: EdgeInsets.all(size.width * .04),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      icon: Icon(
                        IconBroken.Home,
                        color: currentValue == 0 ? ColorsManager.red : Colors.black38,
                        size: _animation!.value,
                      ),
                      onPressed: () {
                        setState(() {
                          currentValue = 0;
                          _controller!.forward();
                          _controller2!.reverse();
                          _controller3!.reverse();
                          _controller4!.reverse();
                          _controller5!.reverse();
                          HapticFeedback.lightImpact();
                        });
                      },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                    ),
                    IconButton(
                      icon: Icon(
                        IconBroken.Search,
                        color: currentValue == 1 ? ColorsManager.red : Colors.black38,
                        size: _animation2!.value,
                      ),
                      onPressed: () {
                        setState(() {
                          currentValue = 1;
                          _controller2!.forward();
                          _controller!.reverse();
                          _controller3!.reverse();
                          _controller4!.reverse();
                          _controller5!.reverse();
                          HapticFeedback.lightImpact();
                        });
                      },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                    ),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 20)),
                    IconButton(
                      icon: Icon(
                        IconBroken.Chart,
                        color: currentValue == 2 ? ColorsManager.red : Colors.black38,
                        size: _animation4!.value,
                      ),
                      onPressed: () {
                        setState(() {
                          currentValue = 2;
                          _controller4!.forward();
                          _controller!.reverse();
                          _controller2!.reverse();
                          _controller3!.reverse();
                          _controller5!.reverse();
                          HapticFeedback.lightImpact();
                        });
                      },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                    ),
                    IconButton(
                      icon: Icon(
                        IconBroken.Profile,
                        color: currentValue == 3 ? ColorsManager.red : Colors.black38,
                        size: _animation5!.value,
                      ),
                      onPressed: () {
                        setState(() {
                          currentValue = 3;
                          _controller5!.forward();
                          _controller!.reverse();
                          _controller2!.reverse();
                          _controller3!.reverse();
                          _controller4!.reverse();
                          HapticFeedback.lightImpact();
                        });
                      },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}