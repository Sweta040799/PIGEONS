import 'dart:convert';
import 'dart:core';
import 'Videos.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Videos extends ChangeNotifier {
  final db = FirebaseFirestore.instance;
  String? id;
  String? name;
  String? authorName;
  String? authorMail;
  String? details;
  double? likes;
  double? comments;
  double? share;
  double? downloads;
  double? length;
  double? views;
  DateTime? datePublished;
  String? videoLink;

  Future<Videos> fetchVideo(String videoId) async {
    final videoDetails =
        await db.collection("videos").where("id", isEqualTo: videoId).get();
    final data = videoDetails.docs;
    final video = data[0];
    Videos vid = Videos();
    vid.id = videoId;
    vid.name = video["name"];
    vid.length = video["length"];
    vid.datePublished = video["date"];
    vid.authorMail = video["authorMail"];
    vid.authorName = video["authorName"];
    vid.likes = video["likes"];
    vid.comments = video["comments"];
    vid.share = video["share"];
    vid.downloads = video["downloads"];
    vid.details = video["description"];
    vid.views = video["views"];
    vid.videoLink = video["link"];
    return vid;
  }

  Future<Videos> createvideo(
    String id,
    String name,
    String authorName,
    String? authorMail,
    String? details,
    double? likes,
    double? comments,
    double? share,
    double? downloads,
    double? length,
    double? views,
    DateTime? datePublished,
    String? videoLink,
  ) async {
    await db.collection("videos").add({
      "name": name,
      "id": id,
      "length": length,
      "authorName": authorName,
      "likes": likes,
      "comments": comments,
      "share": share,
      "downloads": downloads,
      "description": details,
      "link": videoLink,
      "date": datePublished?.toIso8601String(),
    });
    Videos vid = Videos();
    vid.id = id;
    vid.name = name;
    vid.length = length;
    vid.datePublished = datePublished;
    vid.authorMail = authorMail;
    vid.authorName = authorName;
    vid.likes = likes;
    vid.comments = comments;
    vid.share = share;
    vid.downloads = downloads;
    vid.details = details;
    vid.views = views;
    vid.videoLink = videoLink;
    vid.details = details;
    return vid;
  }
}
