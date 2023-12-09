import 'package:get/get.dart';

import '../../../core/Models/question_model.dart';
import '../../../core/enums.dart';
import '../../../core/utils/functions.dart';
import '../../../data/Data_source/questin_datasource.dart';


class questioncontroller extends GetxController{
  QuestionsBaseDataSource remotedatasource=QuestionsRemotedatabase();
  bool loading= true;
  changeLoadingValue(){
    loading = !loading;
    update();
  }
  List<QuestionModel> questions=[];
  GetQuestion() async
  {
    final result=await remotedatasource.GetQuestions();
    if(result.requestState==RequestState.success){
      changeLoadingValue();
      questions=result.data!;
    }
    else{
      changeLoadingValue();
      Get.back();
      snackBarError(result.errorMessage??"Error");
    }
  }
  @override
  void onInit() {
    GetQuestion();
    super.onInit();
  }

}