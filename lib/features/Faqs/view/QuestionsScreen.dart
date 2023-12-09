import 'package:blood_donar/core/manager/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/styles/icons.dart';
import '../../../widgets/loading/main_loading.dart';
import '../controller/question_controller.dart';
import '../widgets/no_questions.dart';
import '../widgets/questions_list.dart';
class QuestionsScreen extends StatelessWidget {
  const QuestionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    final height=size.height;
    final width=size.width;
    return GetBuilder<questioncontroller>(
        init: questioncontroller(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
                leading: IconButton(
                  onPressed: (){
                    Get.back();
                  },
                  icon: Icon(
                    IconBroken.Arrow___Left_2,
                    color: Colors.black38,
                  ),
                ),
              title: const Text('Faqs'),
              titleTextStyle: TextStyle(
                color: ColorsManager.red,
                fontWeight: FontWeight.bold,
                fontSize: width/22
              ),
            ),
            body: controller.loading
                ? const MainLoading()
                : controller.questions.isEmpty
                ? const NoQuestions()
                : QuestionsList(
              questions: controller.questions,
            ),
          );
        });
  }
}
