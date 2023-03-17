import 'package:flutter/material.dart';
import 'package:virtualbuild/screens/chats/chat_detail.dart';

class ChatList extends StatefulWidget {
  final String name;
  final String message;
  final String imageUrl;
  final String time;
  // String status;
  final int unreadCount;
  final bool isRead;
  const ChatList({
    super.key,
    required this.name,
    required this.message,
    required this.imageUrl,
    required this.time,
    required this.unreadCount,
    // required this.status,
    required this.isRead,
  });
  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(ChatDetail.routeName, arguments: {
          'name': widget.name,
          'imageUrl': widget.imageUrl,
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(widget.imageUrl),
                    maxRadius: 30,
                  ),
                  SizedBox(
                    width: size.width * 0.05,
                  ),
                  SizedBox(
                    width: size.width * 0.4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.name,
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        Text(
                          widget.message,
                          overflow: TextOverflow.ellipsis,
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    fontWeight: widget.isRead
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Text(
              widget.time,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ],
        ),
      ),
    );
  }
}
