import 'package:blood_donar/core/constants.dart';
import 'package:blood_donar/features/Auth/Signup/blood_group/view/blood_group.dart';
import 'package:blood_donar/features/Auth/login/login_screen.dart';
import 'package:blood_donar/features/Splash_screen/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../toturial/view/tourorial.dart';
class Splash_screen extends StatefulWidget {
  const Splash_screen({Key? key}) : super(key: key);

  @override
  State<Splash_screen> createState() => _Splash_screenState();
}

class _Splash_screenState extends State<Splash_screen> with TickerProviderStateMixin {
  final Splash_Controller controller=Get.put(Splash_Controller());
  AnimationController? logocontrol,progresscontrol;
  Animation? Logo_animate,progress_animate;
  bool? seen;

  @override
  void initState() {
    super.initState();
    controller.onInit();
    logocontrol=AnimationController(vsync: this,duration: Duration(seconds: 5));
    Logo_animate=Tween<double>(begin: 0,end: 1).animate(CurvedAnimation(parent: logocontrol!, curve: Curves.easeInOutCubicEmphasized));
    Logo_animate!.addListener(()=>setState(() {}));
    progresscontrol=AnimationController(vsync: this,duration: Duration(seconds: 2));
    progress_animate=Tween<double>(begin: 0,end: 1).animate(CurvedAnimation(parent: logocontrol!, curve: Curves.easeInOutCubicEmphasized));
    progress_animate!.addListener(()=>setState(() {}));

    logocontrol!.forward().then((value){
      progresscontrol!.forward().then((value)async{
        Future.delayed(Duration(milliseconds: 500)).then((value){
          controller.Navigation();
        });
      });
    });





  }
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    var height=size.height;
    var width=size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(255, 55, 55, 1),

        body: Stack(

          children: [
            Container(
              alignment: Alignment.center,
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Opacity(
                    opacity: Logo_animate!.value,
                    child: Center(
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(vertical: height/40),
                              height: height/10,
                              width: width/3,
                              child: SvgPicture.asset("assets/images/logowhite.svg")),
                          Text("DONAZIONE",style: TextStyle(color: Colors.white,fontSize: height/30),),


                        ],
                      ),
                    ),
                  ),
                  ShaderMask(


                    shaderCallback: (bounds) {
                      return RadialGradient(
                        center: Alignment.topLeft,
                        radius: 2,
                        colors: [Color.fromRGBO(255, 55, 55, 1), Color.fromRGBO(255,255 ,255, 1),Color.fromRGBO(255,55 ,55, 1)],
                        tileMode: TileMode.repeated,
                      ).createShader(bounds);
                    },
                    child:   Container(
                      margin: EdgeInsets.all(width/20),
                      padding: EdgeInsets.all(width/20),

                      child: Opacity(
                          opacity:progress_animate!.value ,
                          child: Container(
                            height: height/8,
                            width: width/4,
                            child: Opacity(
                              opacity: .9,
                              child: LoadingIndicator(
                                  indicatorType: Indicator.ballPulseRise, /// Required, The loading type of the widget
                                  colors: const [Colors.white],       /// Optional, The color collections
                                  strokeWidth: 1,

                                  backgroundColor: Colors.transparent,      /// Optional, Background of the widget
                                  pathBackgroundColor: Colors.transparent   /// Optional, the stroke backgroundColor
                              ),
                            ),
                          )
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
/*
Widget controlView() {/*
  if (DB_Helper.getUserToken() == null) {
    return LoginScreen();
  } else {
    return const HomeScreen();
  }
*/}*/

