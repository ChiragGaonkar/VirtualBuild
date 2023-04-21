enum MessageBy { user, bot }

class ChatBotMessage {
  String text;
  final MessageBy messageBy;
  ChatBotMessage({
    required this.text,
    required this.messageBy,
  });
}
