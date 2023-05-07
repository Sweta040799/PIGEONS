// ignore_for_file: prefer_const_constructors
// check for error when appbar initialised outside build(navv_bar problem)
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pigeons/chat_bar.dart';
import 'package:pigeons/community_end_drawer.dart';
import 'package:pigeons/community_side_drawer.dart';
import 'package:pigeons/end_drawer.dart';
import 'package:pigeons/nav_bar.dart';

import 'emoji.dart';
import 'message.dart';

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

  double drag = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    take_permission();
  }

  void drawer_open() {
    setState(() {
      if (drag == 0 || drag == MediaQuery.of(context).size.width * 0.48) {
        drag = -60;
      } else {
        drag = 0;
      }
    });
  }

  void drawer_extend() {
    setState(() {
      if (drag == -60)
        drag = -MediaQuery.of(context).size.width * 0.48;
      else
        drag = -60;
    });
  }

  void nav_open() {
    setState(() {
      if (drag == 0 || drag == -60) {
        drag = MediaQuery.of(context).size.width * 0.48;
      } else {
        drag = 0;
      }
    });
  }

  Widget? chatBar;
  bool expanded = true;
  void toggle_ChatBar() {
    setState(() {
      expanded = !expanded;
    });
  }

  Widget? icon_switch;

  @override
  Widget build(BuildContext context) {
    icon_switch = (drag != -60)
        ? IconButton(
            key: ValueKey(1),
            onPressed: drawer_open,
            icon: Icon(Icons.menu),
            color: Colors.black,
          )
        : IconButton(
            key: ValueKey(2),
            onPressed: drawer_open,
            icon: Icon(Icons.history),
            color: Colors.black,
          );
    chatBar = expanded
        ? Container(
            child: Row(
            children: [
              ChatBar(
                controller: _controller,
                isEmoji: backpress,
              ),
            ],
          ))
        : NavBar(
            flag: 2,
          );
    double h = MediaQuery.of(context).size.height;
    final app_bar = AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      shadowColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark),

      // primary: false,
      leadingWidth: 60,
      leading: Padding(
        padding: const EdgeInsets.only(left: 2.5),
        child: Row(
          children: [
            AnimatedSwitcher(
              switchOutCurve: Curves.easeOut,
              switchInCurve: Curves.easeIn,
              transitionBuilder: (child, animation) {
                return FadeTransition(opacity: animation, child: child);
              },
              duration: Duration(milliseconds: 500),
              child: icon_switch,
            ),
            // Center(
            //   child: CircleAvatar(
            //     //radius: 25,
            //     backgroundImage: AssetImage('images/pigonsicon.png'),
            //     backgroundColor: Colors.white,
            //   ),
            // ),
          ],
        ),
      ),
      // ignore: prefer_const_literals_to_create_immutables
      actions: [
        IconButton(
          onPressed: () => print("object"),
          icon: Icon(Icons.search),
          color: Colors.black,
          splashRadius: 15,
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.add),
          color: Colors.black,
          splashRadius: 15,
        ),
        Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: nav_open,
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Icon(
                  Icons.people,
                  color: Colors.black,
                ),
              ),
            );
          },
        ),
      ],
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontFamily: 'Roboto', //need to add in pub
      ),

      title: Text("Community"),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: app_bar,
        body: Stack(
          children: [
            CommunityEndDrawer(),
            drag == -60
                ? CommunityDrawer(drawerExtend: drawer_extend)
                : CommunityDrawerExtended(
                    drawerExtend: drawer_extend,
                  ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 20),
              right: drag,
              child: Material(
                elevation: 100,
                child: Container(
                  height: h * 0.9,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Message(),
                      Container(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: AnimatedSwitcher(
                            switchOutCurve: Curves.fastOutSlowIn,
                            switchInCurve: Curves.linear,
                            duration: Duration(milliseconds: 200),
                            child: chatBar!),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              right: -10,
              bottom: 80,
              child: Container(
                height: 40,
                width: 40,
                child: FloatingActionButton(
                    elevation: 2,
                    backgroundColor: Color.fromARGB(82, 195, 76, 76),
                    onPressed: toggle_ChatBar,
                    child:
                        Icon(size: 20, !expanded ? Icons.message : Icons.home)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
