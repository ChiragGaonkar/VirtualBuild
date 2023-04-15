class ChatArchitectsListModel {
  String name;
  String message;
  String imageURL;
  String time;
  bool isRead;
  int unreadCount;
  String chatId;
  ChatArchitectsListModel({
    required this.name,
    required this.message,
    required this.imageURL,
    required this.time,
    required this.isRead,
    required this.unreadCount,
    required this.chatId,
  });
}
