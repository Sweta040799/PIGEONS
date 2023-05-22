// ignore_for_file: constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

final db = FirebaseFirestore.instance;

enum Visibility { public, private, invite_only }

class CommunityBackend extends ChangeNotifier {
  String? name;
  String? genre;
  Visibility? visibility;
  int? maxMembers;
  bool? isAdminOnly;
  CommunityBackend(
      {this.genre,
      this.maxMembers,
      this.isAdminOnly,
      this.visibility,
      this.name});

  Future<void> addCommunity(String name, String genre, String visibility,
      int members, bool isAdminOnly) async {
    Visibility vis;
    switch (visibility) {
      case "public":
        vis = Visibility.public;
        break;
      case "private":
        vis = Visibility.private;
        break;
      default:
        vis = Visibility.invite_only;
        break;
    }

    CommunityBackend community = CommunityBackend(
        name: name,
        genre: genre,
        maxMembers: members,
        isAdminOnly: isAdminOnly,
        visibility: vis);

    var data = {
      "name": community.name,
      "genre": community.genre,
      "visibility": vis.toString(),
      "isAdminOnly": community.isAdminOnly,
      "maxMembers": community.maxMembers,
    };

    await db.collection("community").add(data);
  }

  Future<bool> validateCommunity(String name) async {
    final snap =
        await db.collection("community").where("name", isEqualTo: name).get();
    if (snap.docs.length == 0) {
      return true;
    } else {
      return false;
    }
  }

  // ignore: non_constant_identifier_names
  Future<CommunityBackend?> fetch_community_details(String aname) async {
    final snap =
        await db.collection("community").where("name", isEqualTo: aname).get();
    final doc = snap.docs[0];
    name = doc.data()["name"];
    genre = doc.data()["genre"];
    visibility = doc.data()["visibility"];
    isAdminOnly = doc.data()["isAdminOnly"];
    maxMembers = doc.data()["maxMembers"];
    return CommunityBackend(
        visibility: visibility,
        name: name,
        genre: genre,
        isAdminOnly: isAdminOnly,
        maxMembers: maxMembers);
  }
}
