import 'package:cloud_firestore/cloud_firestore.dart';
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
      );
      final json = user.toJson();
      await docUser.set(json);
    } on FirebaseException catch (e) {
      print("Error ${e}");
    }
  }

  Future<bool> checkEmailAlreadyInUse({required String email}) async {
    final listOfUsers =
        FirebaseFirestore.instance.collection("users").snapshots().map(
              (snapshot) => snapshot.docs
                  .map((doc) => UserModel.fromJson(doc.data()))
                  .toList(),
            );
    listOfUsers.listen((users) {
      print(users); // List of UserModel objects
    });
    return true;
  }
}
