import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';


import '../../core/Models/question_model.dart';
import '../../core/enums.dart';
import '../../core/networking/request_result.dart';

abstract class QuestionsBaseDataSource{
Future<RequestResult<List<QuestionModel>>> GetQuestions();
}
class QuestionsRemotedatabase implements QuestionsBaseDataSource{
  @override
  Future<RequestResult<List<QuestionModel>>> GetQuestions() async{
   try{

     final snapshot= await FirebaseFirestore.instance.collection('questions').get();
     final questions=snapshot.docs.map((doc) => QuestionModel.fromJson(doc.data())).toList();
     return RequestResult(
         requestState: RequestState.success,
         data:questions
     );
   }
   catch(e)
    {
      log('Error retrieving questions: $e');
      return RequestResult(requestState: RequestState.failed,errorMessage: e.toString());

    }
  }

}
