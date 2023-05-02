import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:virtualbuild/models/architects_model.dart';

class ArchitectsProvider with ChangeNotifier {
  final List<ArchitectModel> _architects = [];

  Stream<List<ArchitectModel>> get getArchitects {
    var result =
        FirebaseFirestore.instance.collection("architects").snapshots().map(
              (snapshot) => snapshot.docs
                  .map((docs) => ArchitectModel.fromJson(docs.data()))
                  .toList(),
            );
    // add the entire list to the _architects list
    // result.listen((architects) {
    //   _architects.addAll(architects);
    // });

    return result;
  }

  Stream<List<ArchitectModel>> get getFavArchitects {
    try {
      var favArch = [];
      final userId = FirebaseAuth.instance.currentUser!.uid;
      FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get()
          .then((DocumentSnapshot documentSnapshot) async {
        if (documentSnapshot.exists) {
          var data = await documentSnapshot.data() as Map<String, dynamic>;
          favArch = data["archFav"];
          var result = FirebaseFirestore.instance
              .collection("architects")
              .where("architectID", whereIn: favArch)
              .snapshots()
              .map(
                (snapshot) => snapshot.docs
                    .map((docs) => ArchitectModel.fromJson(docs.data()))
                    .toList(),
              );
          return result;
        }else{
          return Stream.empty();
        }
      });
    } catch (e) {
      print(e);
      rethrow;
    }
    
  }

  // List<ArchitectModel> get myArchitects {
  //   getArchitects;
  //   return [..._architects];
  // }
}
