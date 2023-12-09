


import 'package:dio/dio.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'dart:convert';

import '../../core/enums.dart';
import '../../core/networking/request_result.dart';
import 'package:path/path.dart' as path;

abstract class BaseChatGptDataSource{
   Future<RequestResult<String>> Sendmsg({required String msg});

}
class RemoteChatGptDataSource implements BaseChatGptDataSource{
  @override
  Future<RequestResult<String>> Sendmsg({required String msg}) async {
     var dio = Dio();
     var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer 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',
        'Cookie': '__cf_bm=IxRdrxi3Rh_W.7XewovJCvi.C3.lV_PaVl5ioX83Qr8-1702005011-0-AZHx4wXCGSiImNhAmUqSYm4SispTTYnR1Qe51i+8PDu3WE3rjqncWgCjsph6uYWo291cDHBjk06dGs+MOEGxJCU=; _cfuvid=Eh2KUZmhcSPUFIVIuu.nAIWhgiq.8fZvRqCP.bLEVh4-1702005011325-0-604800000'
     };
     try {
        var response = await dio.post(
           'https://api.openai.com/v1/chat/completions',
           options: Options(headers: headers),
           data: {
              "model": "gpt-3.5-turbo",
              "messages": [
                 {
                    "role": "user",
                    "content": "$msg"
                 }
              ],
              "temperature": 1,
              "top_p": 1,
              "n": 1,
              "stream": false,
              "max_tokens": 250,
              "presence_penalty": 0,
              "frequency_penalty": 0,
           },
        );
        print(await response.data.toString());
        String msgdata=await response.data["choices"][0]["message"]["content"].toString();

        print(msgdata);
        print("---------");
        return RequestResult(requestState:RequestState.success,data:msgdata);
     } catch (e) {
        return RequestResult(requestState:RequestState.success,errorMessage: e.toString());
     }
  }


}