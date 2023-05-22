import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pigeons/nav_bar.dart';
import 'package:pigeons/providers/Videos.dart';
import 'package:pigeons/providers/channel.dart';
import 'package:pigeons/providers/user.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController videoNameC = TextEditingController();
  TextEditingController descriptionC = TextEditingController();
  TextEditingController videoLinkC = TextEditingController();
  bool nav_visibility = true;
  List<dynamic> subscriptionlist = [];
  late Users user;

  var videoList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scroll.addListener(() {
      if (scroll.position.userScrollDirection == ScrollDirection.reverse) {
        setState(() {
          nav_visibility = false;
        });
      } else if (scroll.position.userScrollDirection == ScrollDirection.forward)
        setState(() {
          nav_visibility = true;
        });
    });
    Future.delayed(
      Duration(seconds: 0),
      () {
        user = Provider.of<Users>(context, listen: false);
      },
    ).then((_) {
      user.fetchUserSubscription().then((value) {
        setState(() {
          subscriptionlist = value;
        });
      }).then((_) {
        user.fetchVideoList(subscriptionlist).then((value) {
          setState(() {
            videoList = value;
          });
        });
      });
    });
  }

  var scroll = ScrollController();
  @override
  Widget build(BuildContext context) {
    final channelData = Provider.of<Channel>(context, listen: false);
    final videodata = Provider.of<Videos>(context, listen: false);
    final app_bar = AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      shadowColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
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
              child: null,
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
          onPressed: () {},
          icon: Icon(Icons.search),
          color: Colors.black,
          splashRadius: 15,
        ),
        IconButton(
          onPressed: () async {
            await showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                      title: Text('Upload Video'),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormField(
                            controller: videoNameC,
                            decoration: InputDecoration(
                              labelText: 'Video Name',
                            ),
                          ),
                          SizedBox(height: 16),
                          TextFormField(
                            controller: videoLinkC,
                            decoration: InputDecoration(
                              labelText: 'Video Link',
                            ),
                          ),
                          SizedBox(height: 16),
                          TextFormField(
                            controller: descriptionC,
                            decoration: InputDecoration(
                              labelText: 'Description',
                            ),
                            maxLines: 3,
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () async {
                            // Perform upload action
                            final userCreatorDetails = await user.checkCreator(
                                FirebaseAuth.instance.currentUser!.email);

                            var cchannelId = Uuid().v4();
                            if (!userCreatorDetails) {
                              await channelData.createChannel(
                                  cchannelId,
                                  "logolink",
                                  DateTime.now(),
                                  user.email.toString(),
                                  "name");
                            }
                            var uuid = Uuid();
                            final id = uuid.v4();

                            final videodetails = await videodata.createvideo(
                                id,
                                videoNameC.text,
                                user.name.toString(),
                                user.email.toString(),
                                descriptionC.text,
                                0,
                                0,
                                0,
                                0,
                                0,
                                0,
                                DateTime.now(),
                                videoLinkC.text);
                            Navigator.pop(context);
                          },
                          child: Text('Upload'),
                        ),
                        TextButton(
                          onPressed: () {
                            // Cancel dialog
                            Navigator.pop(context);
                          },
                          child: Text('Cancel'),
                        )
                      ]);
                });
          },
          icon: Icon(Icons.add),
          color: Colors.black,
          splashRadius: 15,
        ),
        Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: null,
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

      title: Text("Home"),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: nav_visibility ? app_bar : null,
        body: Stack(
          children: [
            Container(
              child: ListView.builder(
                itemCount: videoList.isEmpty ? 1 : videoList.length,
                controller: scroll,
                itemBuilder: (context, index) {
                  return videoList.isEmpty
                      ? Column(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              child: CircularProgressIndicator(),
                            ),
                            Text(
                                "Please prefer subscribing some channels, \nor go to Explore"),
                          ],
                        )
                      : HomeTile();
                },
              ),
            ),
            nav_visibility ? NavBar(flag: 0) : Container(),
          ],
        ),
      ),
    );
  }
}

class HomeTile extends StatelessWidget {
  const HomeTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color.fromARGB(255, 238, 235, 235),
      ),
      margin: const EdgeInsets.only(bottom: 10, right: 3, left: 3),
      height: 300,
      child: Column(
        children: [
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                "images/R.jpg",
                fit: BoxFit.cover,
              ),
            ),
            height: 250,
            color: Colors.transparent,
          ),
        ],
      ),
    );
  }
}
