import 'package:flutter/material.dart';
import 'package:virtualbuild/models/bot_chats_model.dart';

class ChatMessageWidget extends StatelessWidget {
  final String message;
  final MessageBy messageBy;
  const ChatMessageWidget({
    super.key,
    required this.message,
    required this.messageBy,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: messageBy == MessageBy.bot
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.end,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: messageBy == MessageBy.bot
                ? Theme.of(context).canvasColor
                : Theme.of(context).primaryColor,
          ),
          child: Text(
            message,
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
