import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class HomeNotifier extends ChangeNotifier {
  final BuildContext context;

  HomeNotifier({required this.context}) {
    getMessage();
  }

  int counter = 0;

  List<String> chats = [];
  TextEditingController chat = TextEditingController();
  addmessages() {
    chats.add(chat.text);
    notifyListeners();
  }

  List<ChatModel> listMessage = [];
  getMessage() async {
    final dio = Dio();

    final response = await dio.get("https://tegaldev.metimes.id/chat-sample");
    var result = jsonDecode(response.data);

    for (Map<String, dynamic> i in result['data']) {
      listMessage.add(ChatModel(
        posisi: i['posisi'],
        chat: i['chat'],
        createdDate: i['createdDate'],
        type: i["type"],
        status: i['status'],
      ));
    }
  }
}

class ChatModel {
  final String posisi;
  final String chat;
  final String createdDate;
  final String type;
  final String status;

  ChatModel(
      {required this.posisi,
      required this.chat,
      required this.createdDate,
      required this.type,
      required this.status});
}
