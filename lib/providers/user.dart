import 'dart:convert';
import 'dart:core';
import 'Videos.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import 'channel.dart';

class Users extends ChangeNotifier {
  String? name;
  String? email;
  String? PhoneNo;
  String? dp;
  bool? isCreator;
  List<Channel>? subscription;
  final db = FirebaseFirestore.instance;
  Future<bool> checkUser(String email) async {
    final result =
        await db.collection("users").where("email", isEqualTo: email).get();

    // ignore: unrelated_type_equality_checks
    print(result.size);
    return result.size == 0 ? false : true;
  }

  Future<Users> createNewUser(String? name, String? email, String? phoneNo,
      String? dp, bool isCreator) async {
    //add a user to firebase
    Users a = Users();
    a.name = name;
    a.email = email;
    a.PhoneNo = phoneNo;
    a.dp = dp;
    a.isCreator = isCreator;
    print("called");
    //add user to firebase.
    await db.collection("users").add({
      "name": a.name,
      "email": a.email,
      "phoneNo": a.PhoneNo,
      "dpLink": a.dp,
      "isCreator": a.isCreator,
      "subscriptions": [],
    });
    return a;
  }

  Future<void> fetchUserDetails(String email) async {
    final userdetails =
        await db.collection("users").where("email", isEqualTo: email).get();
    final userdata = userdetails.docs;
    print(userdata[0].data()["name"]);

    //fetch and update user details
    //Users a = Users();
    name = userdata[0].data()["name"];
    email = userdata[0].data()["email"];

    //a.name = userdetails.name;
    notifyListeners();
  }

  Future<List<dynamic>> fetchUserSubscription() async {
    final userDetails =
        await db.collection("users").where("email", isEqualTo: email).get();
    final data = userDetails.docs;
    if (!data.isEmpty)
      final List<dynamic> subscriptionList = data[0].data()["subscriptions"];
    return [];
  }

  Future<List<Videos>> fetchVideoList(subscriptionlist) async {
    var videosId = [];
    for (int i = 0; i < subscriptionlist.length; i++) {
      final userDetails = await db
          .collection("channels")
          .where("id", isEqualTo: subscriptionlist[i])
          .get();
      final data = userDetails.docs;
      final List<String> videoIdList = data[0].data()["videos"];
      videosId.addAll(videoIdList);
    }
    List<Videos> videos = [];
    for (int i = 0; i < videosId.length; i++) {
      Videos video = await Videos().fetchVideo(videosId[i]);
      videos.add(video);
    }
    return videos;
  }

  Future<bool> checkCreator(email) async {
    final userdata = await db
        .collection("users")
        .where("email", isEqualTo: email.toString())
        .get();
    print(email);
    var data = userdata.docs[0];
    if (data.exists && data["isCreator"]) {
      return true;
    }

    return false;
  }
}
