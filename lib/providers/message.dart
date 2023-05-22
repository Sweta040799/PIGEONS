import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';

class Messages extends ChangeNotifier {
  var db = FirebaseDatabase.instance.ref();

  //var str = FirebaseDatabase.instance.ref().child("chat").onChildAdded;
  //var str = FirebaseDatabase.instance.ref().child("chat").onChildAdded;

  // void listenText() {
  //   print("called");
  //   StreamSubscription<DatabaseEvent> str =
  //       db.child("chat").onChildAdded.listen(
  //     (event) {
  //       print(event.snapshot.value);
  //     },
  //   );
  // }

  Future<void> addText(String text, String email, String name) async {
    try {
      await db.child("chat").push().set(
        {
          'email': email,
          "message": text,
          "name": name,
        },
      );
    } catch (e) {
      print(e.toString());
    }
  }

  Future<String> fetchNme(String email) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    final CollectionReference usersCollection = firestore.collection('users');
    QuerySnapshot snap =
        await usersCollection.where("email", isEqualTo: email).get();
    return snap.docs[0].get("name");
  }
}
