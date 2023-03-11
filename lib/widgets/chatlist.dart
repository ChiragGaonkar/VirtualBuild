import 'package:flutter/material.dart';
import 'package:virtualbuild/screens/chats/chat_detail.dart';

// ignore: must_be_immutable
class ChatList extends StatefulWidget {
  // ChatList({super.key});
  String name;
  String message;
  String imageUrl;
  String time;
  // String status;
  int unreadCount;
  bool isRead;
  ChatList(
      {super.key,
      required this.name,
      required this.message,
      required this.imageUrl,
      required this.time,
      required this.unreadCount,
      // required this.status,
      required this.isRead});
  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const ChatDetail();
        }));
      },
      child: Container(
        padding: EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage(widget.imageUrl),
                    maxRadius: 30,
                  ),
                  const SizedBox(
                    // height: size.height * 0.05,
                    width: 20,
                    // height: 10
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.name,
                            style: TextStyle(
                                fontSize: 16, color: Colors.orange[900]),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            widget.message,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 13,
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontWeight: widget.isRead
                                    ? FontWeight.bold
                                    : FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              widget.time,
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight:
                      widget.isRead ? FontWeight.bold : FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }
}
