enum Sender { user, architect }

class ChatsModel {
  String message;
  DateTime time;
  bool read;
  Sender sender;
  ChatsModel({
    required this.message,
    required this.time,
    required this.read,
    required this.sender,
  });

  Map<String, dynamic> toJson() => {
        'message': message,
        'time': time,
        'read': read,
        'sender': sender == Sender.user ? "user" : "archiect",
      };

  static ChatsModel fromJson(Map<String, dynamic> json) => ChatsModel(
        message: json['message'],
        time: json['time'],
        read: json['read'],
        sender: json['sender'],
      );
}
