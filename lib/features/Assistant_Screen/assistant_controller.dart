import 'dart:async';

import 'package:blood_donar/data/Data_source/chatgpt.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MsgData {
  MsgData({required this.sendByMe, required this.msgTxt});
  final bool sendByMe;
  final String msgTxt;
}

class AssistantController extends GetxController {
  final TextEditingController msgController = TextEditingController();
  List<MsgData> msgs = [];
  BaseChatGptDataSource baseChatGptDataSource = RemoteChatGptDataSource();
  late ScrollController scrollController;

  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();
    update();
  }



  void dispose() {
    msgController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  void sendMsg() async {
    String msgsend= msgController.text.trim();
    print(msgController.text.toString());
    if (msgController.text.isNotEmpty) {
      msgs.add(MsgData(sendByMe: true, msgTxt: msgsend));
      update();
      scrollToEnd();
      msgController.clear();
      print(msgController.text.trim());
      await baseChatGptDataSource.Sendmsg(msg: msgsend).then((value) {
        msgs.add(MsgData(sendByMe: false, msgTxt: value.data.toString()));
        scrollToEnd();
        update();
      });

      update();
    }
  }

  Future<void> scrollToEnd() async {
    await Future.delayed(Duration(milliseconds: 100));
    if (scrollController.hasClients) {
      await scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }
}