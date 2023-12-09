import 'package:blood_donar/core/manager/colors_manager.dart';
import 'package:blood_donar/core/styles/icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';


import '../../../core/Models/question_model.dart';
import '../../../core/manager/lottie_manager.dart';
import '../../../widgets/animated_column.dart';
import '../../../widgets/network_images_slider.dart';

class AnswerDetailsScreen extends StatelessWidget {
  final QuestionModel question;

  AnswerDetailsScreen({required this.question});


  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    final height=size.height;
    final width=size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Get.back();
          },
          icon: Icon(
              IconBroken.Arrow___Right,
            color: Colors.black38,
          ),
        )),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child:Stack(
              alignment: Alignment.center,
              children: [
                Opacity(
                  opacity: 0.4,
                  child: Lottie.asset(
                    LottieManager.bloodback,

                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:  EdgeInsets.all(width/20),
                      child: AnimatedColumn(
                        children: [
                          Text(
                            question.q,
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                              color: ColorsManager.red,
                              fontSize: width/22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                           SizedBox(height: height/20),
                          Text(
                            question.a,
                            textDirection: TextDirection.ltr,
                            style:  TextStyle(
                              fontSize: width/25,
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
