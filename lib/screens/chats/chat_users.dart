// import 'package:flutter/material.dart';

class ChatUsers {
  String name;
  String message;
  String imageURL;
  String time;
  bool isRead;
  int unreadCount;
  ChatUsers({
    required this.name,
    required this.message,
    required this.imageURL,
    required this.time,
    required this.isRead,
    required this.unreadCount,
  });
}
