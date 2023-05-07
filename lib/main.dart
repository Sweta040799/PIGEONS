// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pigeons/Gif.dart';
import 'package:pigeons/attachments_operations/recording.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pigeons/home.dart';
import 'package:pigeons/video_page.dart';
import 'firebase_options.dart';

import 'package:pigeons/community.dart';
import 'package:pigeons/emoji.dart';

import 'package:pigeons/end_drawer.dart';
import 'package:pigeons/explore.dart';
import 'package:pigeons/login_page.dart';
import 'package:pigeons/register.dart';
import './my_account.dart';
import './end_drawer.dart';
import 'create_community_screen.dart';
import './register.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: new MediaQueryData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );
  }
}
