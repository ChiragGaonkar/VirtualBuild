import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:virtualbuild/models/users_model.dart';

class FireDatabase {
  Future<void> createUser({
    required String uid,
    required String name,
    required String phoneNumber,
    required String email,
    required String address,
  }) async {
    try {
      final docUser = FirebaseFirestore.instance.collection("users").doc(uid);
      final user = UserModel(
        uid: uid,
        name: name,
        address: address,
        email: email,
        phoneNumber: phoneNumber,
        imageUrl: 'assets/profile.png',
      );
      final json = user.toJson();
      await docUser.set(json);
    } on FirebaseException catch (e) {
      print("Error ${e}");
    }
  }

  static Future<void> addToken() async {
    late FirebaseMessaging messaging;
    
    try {
      final userId = FirebaseAuth.instance.currentUser!.uid;
      messaging = FirebaseMessaging.instance;
    //   final settings = await messaging.requestPermission(
    //     alert: true,
    //     announcement: false,
    //     badge: true,
    //     carPlay: false,
    //     criticalAlert: false,
    //     provisional: false,
    //     sound: true,
    // );
      var tokens = await messaging.getToken();
      print("token $tokens");
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get()
          .then((value) async {
        var list = value["token"] as List<dynamic>;
        print(list);
        if (list.contains(tokens.toString())) {
          return;
        }
        await FirebaseFirestore.instance.collection('users').doc(userId).set({
          "token": FieldValue.arrayUnion([tokens])
        }, SetOptions(merge: true));
      });
    } catch (e) {
      print(e);
    }
  }
}
