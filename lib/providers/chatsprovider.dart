
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:virtualbuild/models/chats_model.dart';

class ChatsProvider with ChangeNotifier {
  // final List<ChatsModel> _chats = [
  //   ChatsModel(
  //     message: "Hello Ganesh",
  //     time: DateTime.now(),
  //     read: true,
  //     sender: Sender.user,
  //   ),
  //   ChatsModel(
  //     message: "Hello Chirag",
  //     time: DateTime.now(),
  //     read: true,
  //     sender: Sender.architect,
  //   ),
  //   ChatsModel(
  //     message: "How are you?",
  //     time: DateTime.now(),
  //     read: true,
  //     sender: Sender.user,
  //   ),
  //   ChatsModel(
  //     message: "I am good.",
  //     time: DateTime.now(),
  //     read: true,
  //     sender: Sender.architect,
  //   ),
  // ];

  // Stream<ChatsModel> generateNumbers() async* {
  //   // await Future<void>.delayed(Duration(seconds: 2));

  //   for (int i = 0; i <= 4; i++) {
  //     await Future<void>.delayed(Duration(seconds: 1));
  //     yield chats[i];
  //   }
  //   notifyListeners();
  // }

  Stream<QuerySnapshot> getChatStream(String uniqueId) {
    return FirebaseFirestore.instance
        .collection("chats")
        .doc('UserIdArchitectId')
        .collection('messages')
        .orderBy('time')
        .snapshots();
  }

  void sendMessage(String message, bool read, Sender sender) {
    try {
      DocumentReference documentReference = FirebaseFirestore.instance
          .collection("chats")
          .doc('UserIdArchitectId')
          .collection('messages')
          .doc(DateTime.now().microsecondsSinceEpoch.toString());

      ChatsModel chatsModel = ChatsModel(
        message: message,
        time: DateTime.now(),
        read: read,
        sender: sender,
      );

      FirebaseFirestore.instance.runTransaction(
        (transaction) async {
          transaction.set(documentReference, chatsModel.toJson());
        },
      );
    } on FirebaseException catch (e) {
      print("Error ${e}");
    }
  }
}
