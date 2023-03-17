import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserDataProvide with ChangeNotifier{
  String name = "";
  String email = "";
  String address = "";
  String number = "";
  Map<String, dynamic> data = {};

  Future<void> getData() async {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
         data = documentSnapshot.data() as Map<String, dynamic>;
         extractData();
      }
    });
  }

  void extractData(){
    name = data["name"];
    address = data["address"];
    number = data["phoneNumber"];
    email = data["email"];
  }

}