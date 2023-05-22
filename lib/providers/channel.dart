import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class Channel extends ChangeNotifier {
  String? id;
  String? name;
  String? logolink;
  DateTime? dateCreated;
  String? creatorName;
  String? useremail;
  final db = FirebaseFirestore.instance;
  Future<Channel> createChannel(
    String id,
    String logolink,
    DateTime date,
    String email,
    String name,
  ) async {
    Channel channel = Channel();
    channel.id = id;
    channel.logolink = logolink;
    channel.dateCreated = date;
    channel.creatorName = creatorName;
    channel.useremail = email;
    channel.name = name;
    await db.collection("channels").add({
      "id": id,
      "logolink": logolink,
      "dateCreated": date.toIso8601String(),
      "creatorName": creatorName,
      "email": email,
      "name": name,
    });
    return channel;
  }
}
