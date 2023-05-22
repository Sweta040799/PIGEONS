import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:video_player/video_player.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

@override
class Video extends StatefulWidget {
  Video({super.key});
  final _videoPlayerController =
      VideoPlayerController.asset("images/V.mp4.mp4");
  VideoPlayerController videoPlayerController = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');
  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  late final ChewieController _chewieController;

  @override
  void initState() {
    _chewieController = ChewieController(
      allowFullScreen: true,
      autoInitialize: true,
      videoPlayerController: widget._videoPlayerController,
      aspectRatio: 75 / 40, // Set the aspect ratio of the video
      autoPlay: false, // Auto-play the video when it's loaded
      looping: false, // Loop the video when it's finished
    );

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    widget._videoPlayerController.dispose();
    _chewieController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: null,
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: Stack(
                    // fit: StackFit.expand,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.indigo,
                              Colors.indigo[300]!,
                              Colors.indigo[100]!,
                              // Colors.indigo[100]!,

                              Colors.indigo[100]!,
                              Colors.white,
                              Colors.white,
                              Colors.white,
                              Colors.white,
                              Colors.white,
                            ],
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          //Text("hi"),
                          Container(
                            height: 300,
                            decoration:
                                BoxDecoration(border: Border.all(width: 0)),
                            child: Stack(
                              // fit: StackFit.expand,
                              children: [
                                Chewie(
                                  controller: _chewieController,
                                ),
                                GestureDetector(
                                  onDoubleTapDown: (details) {
                                    if (details.localPosition.dx >
                                        MediaQuery.of(context).size.width / 2) {
                                      print("right tap");
                                      widget._videoPlayerController.seekTo(
                                          widget._videoPlayerController.value
                                                  .position +
                                              const Duration(seconds: 10));
                                    } else {
                                      widget._videoPlayerController.seekTo(
                                          widget._videoPlayerController.value
                                                  .position -
                                              const Duration(seconds: 10));
                                    }
                                  },
                                  behavior: HitTestBehavior.translucent,
                                  child: Container(
                                    height: 350,

                                    //color: Colors.grey,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(width: 20),
                                VideoDetails(
                                    title: "Vivus",
                                    subtitle: "India creates history"),
                                const Spacer(),
                                Material(
                                  color: Color.fromARGB(255, 233, 236, 255),
                                  elevation: 5,
                                  child: Container(
                                    width: 100,
                                    color: Colors.transparent,
                                    child: Column(children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Icon(
                                            Icons.visibility_rounded,
                                            size: 20,
                                            color: Color.fromARGB(
                                                255, 61, 87, 234),
                                          ),
                                          Icon(
                                            MdiIcons.fire,
                                            color: Colors.orange,
                                          ),
                                          Icon(
                                            Icons.comment_bank_rounded,
                                            size: 20,
                                            color: Color.fromARGB(
                                                255, 178, 136, 121),
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text("1.2K+",
                                              style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 11,
                                                  fontFamily: 'Pt Serif',
                                                  fontWeight: FontWeight.w900)),
                                          Text("100+",
                                              style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 11,
                                                  fontFamily: 'Pt Serif',
                                                  fontWeight: FontWeight.w900)),
                                          Text("50+",
                                              style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 11,
                                                  fontFamily: 'Pt Serif',
                                                  fontWeight: FontWeight.w900))
                                        ],
                                      ),
                                    ]),
                                  ),
                                )
                              ]),
                          const Divider(
                            color: Colors.grey,
                            height: 40,
                            thickness: 0.7,
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Chip(
                                  backgroundColor:
                                      Color.fromARGB(255, 227, 230, 243),
                                  //label: ,
                                  label: Icon(Icons.thumb_up_alt_outlined,
                                      color: Color.fromARGB(255, 65, 63, 181)),
                                ),
                                Chip(
                                  backgroundColor:
                                      Color.fromARGB(255, 227, 230, 243),
                                  //label: ,
                                  label: Icon(Icons.comment,
                                      color: Color.fromARGB(255, 65, 63, 181)),
                                ),
                                Chip(
                                  backgroundColor:
                                      Color.fromARGB(255, 227, 230, 243),
                                  //label: ,
                                  label: Icon(MdiIcons.share,
                                      color: Color.fromARGB(255, 65, 63, 181)),
                                ),
                                Chip(
                                  backgroundColor:
                                      Color.fromARGB(255, 227, 230, 243),
                                  //label: ,
                                  label: Icon(Icons.download,
                                      color: Color.fromARGB(255, 65, 63, 181)),
                                ),
                                Chip(
                                  backgroundColor:
                                      Color.fromARGB(255, 227, 230, 243),
                                  //label: ,
                                  label: Icon(Icons.watch_later_outlined,
                                      color: Color.fromARGB(255, 65, 63, 181)),
                                ),
                              ],
                            ),
                          ),
                          const Divider(
                            color: Colors.grey,
                            height: 40,
                            thickness: 0.7,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 7, vertical: 3),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    20), // Defines the border radius of the card
                              ),
                              color: Color.fromARGB(255, 242, 244, 255),
                              elevation: 2,
                              child: ListTile(
                                title: Row(
                                  children: [
                                    Text("Comments",
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontFamily: "Arial",
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)),
                                    Icon(Icons.keyboard_arrow_down),
                                  ],
                                ),
                                subtitle: Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 7,
                                        backgroundImage:
                                            AssetImage("images/R.jpg"),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text("Superbly Done !",
                                          style: TextStyle(
                                              color: Colors.black45,
                                              fontFamily: "Arial",
                                              fontWeight: FontWeight.normal,
                                              fontSize: 15)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 7, vertical: 3),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    20), // Defines the border radius of the card
                              ),
                              color: Color.fromARGB(255, 242, 244, 255),
                              elevation: 2,
                              child: ListTile(
                                title: Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage:
                                          AssetImage("images/pigonsicon.png"),
                                    ),
                                    SizedBox(width: 10),
                                    Text("Social-Entrepreneurship",
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontFamily: "Arial",
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15)),
                                    Spacer(),
                                    Text("Follow",
                                        style: TextStyle(
                                            color: Colors.indigo,
                                            fontFamily: "Arial",
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15)),
                                    // Icon(Icons.keyboard_arrow_down),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const Divider(
                            color: Colors.grey,
                            height: 40,
                            thickness: 0.4,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text("More ",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 65, 63, 181),
                                        fontFamily: "Arial",
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20)),
                                Text("From This Channel ",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 65, 63, 181),
                                        fontFamily: "Arial",
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15)),
                              ],
                            ),
                          ),
                          Container(
                            height: 170,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 10,
                              itemBuilder: (context, index) {
                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.blue,
                                  ),
                                  margin: EdgeInsets.only(
                                      left: 20, top: 20, bottom: 20, right: 20),
                                  width:
                                      MediaQuery.of(context).size.width / 1.5 -
                                          40,
                                  child: index % 2 == 0
                                      ? ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          clipBehavior: Clip.hardEdge,
                                          child: Image(
                                            fit: BoxFit.fill,
                                            image: AssetImage("images/R.jpg"),
                                          ),
                                        )
                                      : ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image(
                                            fit: BoxFit.fill,
                                            image: AssetImage("images/R.jfif"),
                                          ),
                                        ),
                                );
                              },
                            ),
                          ),
                          Row(
                            children: [
                              SizedBox(width: 15),
                              Text("You ",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 65, 63, 181),
                                      fontFamily: "Arial",
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20)),
                              Text("may like...",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 65, 63, 181),
                                      fontFamily: "Arial",
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15)),
                            ],
                          ),
                          Container(
                            height: 170,
                            child: AnimatedList(
                              //controller: ,
                              scrollDirection: Axis.horizontal,
                              initialItemCount: 10,
                              itemBuilder: (context, index, animation) {
                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.blue,
                                  ),
                                  margin: EdgeInsets.only(
                                      left: 20, top: 20, bottom: 20, right: 20),
                                  width:
                                      MediaQuery.of(context).size.width / 1.5 -
                                          40,
                                  child: index % 2 == 0
                                      ? ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          clipBehavior: Clip.hardEdge,
                                          child: Image(
                                            fit: BoxFit.fill,
                                            image: AssetImage("images/R.jpg"),
                                          ),
                                        )
                                      : ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image(
                                            fit: BoxFit.fill,
                                            image: AssetImage("images/R.jfif"),
                                          ),
                                        ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Spacer(),
                          Container(
                              margin: EdgeInsets.only(top: 50, right: 5),
                              child: const CircleAvatar(
                                  backgroundColor:
                                      Color.fromRGBO(68, 67, 67, 0.352),
                                  child: Icon(
                                    Icons.more_vert,
                                    color: Colors.white,
                                  ))),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class VideoDetails extends StatelessWidget {
  final String title;
  final String subtitle;

  VideoDetails({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              FittedBox(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Icon(Icons.keyboard_arrow_down_outlined),
            ],
          ),
          const SizedBox(height: 8.0),
          FittedBox(
            // fit: B,
            child: Text(
              subtitle,
              style: const TextStyle(
                fontSize: 15.0,
                color: Colors.black87,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
