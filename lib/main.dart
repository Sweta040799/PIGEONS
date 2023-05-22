// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pigeons/Gif.dart';
import 'package:pigeons/Video.dart';
import 'package:pigeons/attachments_operations/recording.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pigeons/home.dart';
import 'package:pigeons/providers/channel.dart';
import 'package:pigeons/providers/community_backend.dart';
import 'package:pigeons/providers/message.dart';
import 'package:pigeons/video_page.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import './providers/user.dart';
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
import 'providers/Videos.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<Users>(
            create: ((context) => Users()),
          ),
          ChangeNotifierProvider<Messages>(
            create: ((context) => Messages()),
          ),
          ChangeNotifierProvider<CommunityBackend>(
            create: ((context) => CommunityBackend()),
          ),
          ChangeNotifierProvider<Videos>(
            create: ((context) => Videos()),
          ),
          ChangeNotifierProvider<Channel>(
            create: ((context) => Channel()),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: LoginPage(),
        ));
  }
}
