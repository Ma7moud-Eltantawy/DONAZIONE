import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


import '../../../core/manager/colors_manager.dart';
import '../../../core/manager/lottie_manager.dart';

class NoQuestions extends StatelessWidget {
  const NoQuestions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Lottie.asset(
          LottieManager.chatBG,
          filterQuality: FilterQuality.low,
        ),
        Container(
          color: Colors.white.withOpacity(.9),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "لا يوجد بيانات حتى الان",
                style: TextStyle(color: ColorsManager.primary, fontSize: 20),
              ),
              SizedBox(height: 10),
              Text(
                "قم بالدخول مرة اخرى في وقت لاحق",
                style: TextStyle(
                  color: ColorsManager.grey,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
