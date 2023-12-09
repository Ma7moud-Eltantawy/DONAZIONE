import 'package:blood_donar/features/Faqs/widgets/question_card.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../core/Models/question_model.dart';
import '../../../core/manager/lottie_manager.dart';


class QuestionsList extends StatelessWidget {
  const QuestionsList({Key? key, required this.questions}) : super(key: key);

  final List<QuestionModel> questions;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [

        Lottie.asset(
          LottieManager.bloodback,

        ),
        Container(color: Colors.white.withOpacity(.8)),
        ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: questions.length,
          itemBuilder: (c, i) => QuestionCard(question: questions[i]),
        ),
      ],
    );
  }
}
