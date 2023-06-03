import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDataProvide with ChangeNotifier {
  String name = "";
  String email = "";
  String address = "";
  String number = "";
  Map<String, dynamic> data = {
    "name": "",
    "email": "",
    "address": "",
    "phoneNumber": ""
  };

  Future<Map<String, dynamic>> getData() async {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .get()
        .then((DocumentSnapshot documentSnapshot) async {
      if (documentSnapshot.exists) {
        data = await documentSnapshot.data() as Map<String, dynamic>;
        extractData();
      }
    });
    return data;
  }

  void extractData() async {
    final prefeb = await SharedPreferences.getInstance();
    name = data["name"];
    await prefeb.setString('name', name);
    address = data["address"];
    await prefeb.setString('address', address);
    number = data["phoneNumber"];
    await prefeb.setString('phoneNumber', number);
    email = data["email"];
    await prefeb.setString('email', email);
  }

  Future<void> updateData(String name, String address, String phone) async {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .update({"name": name, "address": address, "phoneNumber": phone});
  }

  void setData(
    String name,
    String email,
    String address,
    String number,
  ) {
    this.name = name;
    this.address = address;
    this.number = number;
    this.email = email;
  }
}
