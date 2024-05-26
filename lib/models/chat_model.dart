import 'dart:convert';

ChatModel chatModelFromJson(String str) => ChatModel.fromJson(json.decode(str));

String chatModelToJson(ChatModel data) => json.encode(data.toJson());

class ChatModel {
  final int id;
  final String posisi;
  final String chat;
  final String createdDate;
  final String type;
  final String status;

  ChatModel(
      {required this.id,
      required this.posisi,
      required this.chat,
      required this.createdDate,
      required this.type,
      required this.status});

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
      id: json['id'] as int,
      posisi: json['posisi'].toString(),
      chat: json['chat'].toString(),
      createdDate: json['createdDate'].toString(),
      type: json['type'].toString(),
      status: json['status'].toString());

  Map<String, dynamic> toJson() => {
        'id': id,
        'posisi': posisi,
        'chat': chat,
        'createdDate': createdDate,
        'type': type,
        'status': status
      };
}
