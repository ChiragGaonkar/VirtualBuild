import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:virtualbuild/models/chats_model.dart';
import '../firebase/authentication.dart';
import '../models/chats_arch_list.dart';
import 'package:timeago/timeago.dart' as timeago;

class ChatsProvider with ChangeNotifier {
  final List<ChatArchitectsListModel> _chatArchitectsList = [];

  List<ChatArchitectsListModel> get getArchitectsList {
    return [..._chatArchitectsList];
  }

  Future<List<dynamic>> getMessagedArchitectsID() async {
    final User? user = Auth().currentUser;
    var userId = user!.uid;
    final CollectionReference usersCollection =
        FirebaseFirestore.instance.collection("users");
    DocumentSnapshot documentSnapshot = await usersCollection.doc(userId).get();
    if (documentSnapshot.exists) {
      return documentSnapshot.get("hiredArchitects");
    } else {
      print('Document does not exists on the Database');
      return [];
    }
  }

  Future<List<ChatArchitectsListModel>> getMessagedArchitectsDetails() async {
    final User? user = Auth().currentUser;
    var userId = user!.uid;
    List<dynamic> architectIdArray = await getMessagedArchitectsID();
    List<Future<void>> futures = architectIdArray.map((architectId) async {
      //Write Code to retrieve and update List
      String chatId = userId + architectId;
      final CollectionReference architectsCollection =
          FirebaseFirestore.instance.collection("architects");
      DocumentSnapshot docArchitectSnapshot =
          await architectsCollection.doc(architectId).get();
      if (docArchitectSnapshot.exists) {
        final CollectionReference chatsCollection =
            FirebaseFirestore.instance.collection("chats");
        DocumentSnapshot docChatsSnapshot = await chatsCollection
            .doc(chatId)
            .collection('messages')
            .orderBy('time', descending: true)
            .limit(1)
            .get()
            .then((querySnapshot) => querySnapshot.docs.first);
        if (docChatsSnapshot.exists) {
          bool isPresentInList = false;
          for (int i = 0; i < _chatArchitectsList.length; i++) {
            if (_chatArchitectsList[i].chatId == chatId) {
              isPresentInList = true;
              _chatArchitectsList[i].message = docChatsSnapshot.get('message');
              _chatArchitectsList[i].time =
                  convertTimeStampToDate(docChatsSnapshot.get('time'));
              _chatArchitectsList[i].isRead = docChatsSnapshot.get('read');
              break;
            }
          }
          if (isPresentInList == false) {
            _chatArchitectsList.add(
              ChatArchitectsListModel(
                name: docArchitectSnapshot.get('architectName'),
                message: docChatsSnapshot.get('message'),
                imageURL: docArchitectSnapshot.get('architectImageUrl'),
                time: convertTimeStampToDate(docChatsSnapshot.get('time')),
                isRead: docChatsSnapshot.get('read'),
                unreadCount: 1,
                chatId: chatId,
              ),
            );
          }
        }
      }
      // print("Hello ${docArchitectSnapshot.get('architectName')}");
    }).toList();
    await Future.wait(futures);
    return [..._chatArchitectsList];
  }

  String convertTimeStampToDate(timestamp) {
    return timeago.format(timestamp.toDate(), locale: 'en_short');
  }

  Stream<QuerySnapshot> getChatStream(String uniqueId) {
    return FirebaseFirestore.instance
        .collection("chats")
        .doc(uniqueId)
        .collection('messages')
        .orderBy('time')
        .snapshots();
  }

  void sendMessage(
      String message, bool read, Sender sender, String architectId) {
    try {
      //Get the Users Id
      final User? user = Auth().currentUser;
      var userId = user!.uid;

      //Add to the hiredArchitects array
      FirebaseFirestore.instance.collection("users").doc(userId).update({
        "hiredArchitects": FieldValue.arrayUnion([architectId])
      }).then(
        (value) => print("Connection Established Sucessfully."),
        onError: (e) => print("Cant Establish Connection"),
      );

      DocumentReference documentReference = FirebaseFirestore.instance
          .collection("chats")
          .doc(userId + architectId)
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
