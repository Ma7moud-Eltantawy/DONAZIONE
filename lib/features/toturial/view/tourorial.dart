import 'package:blood_donar/core/manager/colors_manager.dart';
import 'package:blood_donar/features/Auth/Signup/blood_group/view/blood_group.dart';
import 'package:blood_donar/features/toturial/Controller/toturial_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel(
      {required this.image, required this.title, required this.body});
}

List<BoardingModel> boarding = [
  BoardingModel(
      image: 'assets/images/tutorial/tot1.png',
      title: 'WELCOME IN DONAZIONE ',
      body:
      'This application provides you with the ability to request and donate blood to others with complete ease and safety.'),
  BoardingModel(
      image: 'assets/images/tutorial/tot2.png',
      title: 'APP Auth And Entring Data',
      body:
      'Create your account and enter your data so that you can deal with the application’s features.'),
  BoardingModel(
      image: 'assets/images/tutorial/tot3.png',
      title: 'Search For People',
      body:
      'Search for the closest donors who are similar to my blood type.'),
  BoardingModel(
      image: 'assets/images/tutorial/tot4.png',
      title: 'Send A Blood Request',
      body:
      'Send a request to the person you want to donate blood to you and wait for his acceptance or contact him via his personal numbers.'),
  BoardingModel(
      image: 'assets/images/tutorial/tot5.png',
      title: 'Communicate With Others',
      body:
      'When the donation request is approved, you can contact the person to complete the process.'),


];

class onBoarding_screen extends StatelessWidget {
   onBoarding_screen({Key? key}) : super(key: key);
  Tutorial_controller controller=Get.put(Tutorial_controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<Tutorial_controller>(
        builder:(con)=> AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark
          ),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                      style: ButtonStyle(
                        overlayColor:  MaterialStateProperty.all<Color>(Color.fromRGBO(255, 45, 45, .5).withOpacity(.2)),
                      ),
                      onPressed: (){},

                      child: Text(
                        'Skip',
                        style: TextStyle(

                          color: Color.fromRGBO(255, 45, 45, .5),
                          fontSize: 20,
                        ),
                      )),
                ),
                Expanded(
                  child: GetBuilder<Tutorial_controller>(
                    builder:(mycon)=> PageView.builder(
                      dragStartBehavior: DragStartBehavior.down,
                      reverse: false,
                      onPageChanged: (int index) {
                        if (index == boarding.length-1 ) {
                          con.cheklast(true);

                        } else {
                          con.cheklast(false);
                        }
                      },
                      controller: controller.boardController,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return buildBoardingItem(boarding[index]);
                      },
                      itemCount: boarding.length,
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 70),
                    child: SmoothPageIndicator(
                      controller: controller.boardController,
                      count: boarding.length,
                      effect: ExpandingDotsEffect(
                        dotColor: Colors.grey,
                        dotHeight: 10,
                        dotWidth: 10,
                        expansionFactor: 4,
                        spacing: 5,
                        activeDotColor: ColorsManager.red,
                      ),
                    ),
                  ),
                ),
                !con.isLast
                    ? Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 50.0),
                    child: TextButton(
                        onPressed: () {
                          controller.boardController.nextPage(
                              duration: Duration(milliseconds: 750),
                              curve: Curves.fastLinearToSlowEaseIn);
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Next',
                              style: TextStyle(
                                  color: Colors.grey, fontSize: 22),
                            ),
                            Baseline(
                                baseline: 33,
                                baselineType: TextBaseline.alphabetic,
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: Colors.grey,
                                  size: 30,
                                ))
                          ],
                        )),
                  ),
                )
                    : Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 50.0),
                    child: TextButton(
                        style: ButtonStyle(
                          overlayColor:  MaterialStateProperty.all<Color>(Color.fromRGBO(255 ,45 ,45, 1).withOpacity(.2)),
                        ),
                        onPressed: ()=>controller.Navigator(),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Get Started',
                              style: TextStyle(
                                  color: ColorsManager.red, fontSize: 22),
                            ),
                            Baseline(
                                baseline: 33,
                                baselineType: TextBaseline.alphabetic,
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: ColorsManager.red,
                                  size: 30,
                                ))
                          ],
                        )),
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

  Widget buildBoardingItem(BoardingModel model) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: Image.asset(
                '${model.image}',
                width: 280,
                height: 280,
              )),
          SizedBox(
            height: 30,
          ),
          Text(
            '${model.title}',
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.center,
            style: TextStyle(
             fontSize: 22, color: Colors.grey),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            '${model.body}',
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }


