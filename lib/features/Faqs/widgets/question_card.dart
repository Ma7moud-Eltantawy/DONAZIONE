import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../core/Models/question_model.dart';
import '../../../core/constants.dart';
import '../view/answer_details_screen.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({Key? key, required this.question}) : super(key: key);

  final QuestionModel question;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(
              () => AnswerDetailsScreen(question: question),
          transition: kTransition1,
          duration: kTransitionDuration,
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.5),
          border: Border.all(width: .3),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
            bottomLeft: Radius.circular(25),
          ),
        ),
        child: Text(question.q,style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),

      ),
    );
  }
}
