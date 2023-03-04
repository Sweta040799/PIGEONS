// ignore_for_file: prefer_const_constructors

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pigeons/chat_bar.dart';

import 'emoji.dart';

class Community extends StatefulWidget {
  const Community({super.key});

  @override
  State<Community> createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  int _change = 0;
  Future<bool> take_permission() async {
    await Permission.microphone.request();
    await Permission.storage.request();
    await Permission.camera.request();
    var permissionStatus = await Permission.microphone.status;
    print(permissionStatus);
    if (permissionStatus == permissionStatus.isGranted) return true;
    return false;
  }

  final TextEditingController _controller = TextEditingController();
  //bool emojiOpen = false;
  // bool returnEmoji() {
  //   emojiOpen = ChatBar(
  //     controller: _controller,
  //   ).emojiOpen;
  //   return emojiOpen;
  // }
  bool isEmojiOpen = false;
  backpress(bool isEmojiOpen) {
    this.isEmojiOpen = isEmojiOpen;
    print("called fuction of backpress$isEmojiOpen");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    take_permission();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: //WillPopScope(
          // onWillPop: () async {
          //   if (isEmojiOpen) {
          //   setState(() {
          //     send a controller logic to communicate when backpressed
          //   });

          //     return false;
          //   } else {
          //       return true;
          //     ;
          //   }
          // },
          Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          shadowColor: Colors.transparent,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            ////if (isEmojiOpen)
            ChatBar(controller: _controller, isEmoji: backpress),
          ],
        ),
      ),
    );
  }
}
