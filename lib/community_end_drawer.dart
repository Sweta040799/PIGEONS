// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pigeons/account_view.dart';

//implement draggable
// ignore: use_key_in_widget_constructors
class CommunityEndDrawer extends StatefulWidget {
  //const EndDrwaer({super.key});

  @override
  State<CommunityEndDrawer> createState() => _CommunityEndDrawer();
}

class _CommunityEndDrawer extends State<CommunityEndDrawer> {
  List<Videos> videoList = [
    Videos(name: "Tom & Jerry", playedby: "Abhishek"),
    Videos(name: "Tom & Jerry", playedby: "Abhishek"),
    Videos(name: "Tom & Jerry", playedby: "Abhishek"),
    Videos(name: "Tom & Jerry", playedby: "Abhishek"),
  ];
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.transparent,
        body: Align(
          alignment: Alignment.centerRight,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.transparent,
              ),
              borderRadius: BorderRadius.all(Radius.circular(10)),
              // shape: BoxShape.circle,
              color: Color.fromARGB(193, 148, 93, 93),
            ),
            width: w * 0.45,
            height: h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 10),
                    child: CircleAvatar(
                      child: Image(
                        image: AssetImage("images/netflix.png"),
                      ),
                      radius: 30,
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    "Netflix",
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 20,
                    ),
                  ),
                ),
                Center(
                  child: FittedBox(
                    child: Text(
                      "Id: 256539466",
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontStyle: FontStyle.italic,
                        color: Color.fromARGB(255, 222, 217, 217),
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                Divider(
                  color: Color.fromARGB(205, 255, 253, 253),
                  thickness: 0.3,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.push_pin,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.alternate_email_sharp,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.share,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.settings,
                      color: Colors.white,
                    )
                  ],
                ),
                Divider(
                  color: Color.fromARGB(205, 255, 253, 253),
                  thickness: 0.3,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 10),
                  child: Text(
                    "ADMIN:",
                    style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'Arial',
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
                Wrap(direction: Axis.horizontal, children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 6),
                    child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (builder) {
                              return AccountView();
                            });
                      },
                      child: Text(
                        "Abhishek Paul",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Arial',
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(205, 255, 253, 253),
                        ),
                      ),
                    ),
                  ),
                ]),
                Divider(
                  color: Color.fromARGB(205, 255, 253, 253),
                  thickness: 0.3,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 10, bottom: 0),
                  child: Text(
                    "Videos Playing:",
                    style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'Arial',
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 3,
                  child: ListView.builder(
                      itemCount: videoList.length,
                      itemBuilder: ((context, index) {
                        //print(videoList[index].name);
                        return Padding(
                          padding: EdgeInsets.all(3.8),
                          child: Material(
                            borderRadius: BorderRadius.circular(7),
                            elevation: 5,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 238, 233, 233),
                                border: Border.all(
                                    width: 2, color: Colors.transparent),
                                borderRadius: BorderRadius.circular(7),
                              ),
                              height: 50,
                              child: Row(
                                children: [
                                  Image(
                                    height: 35,
                                    image: AssetImage("images/netflix.png"),
                                  ),
                                  Text(videoList[index].name),
                                ],
                              ),
                            ),
                          ),
                        );
                      })),
                ),
                Divider(
                  thickness: 0.5,
                  color: Color.fromARGB(205, 255, 253, 253),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Icon(
                          color: Colors.white,
                          Icons.cancel,
                        ),
                        Text(
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Arial',
                                fontWeight: FontWeight.bold),
                            "Leave"),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(
                          color: Colors.white,
                          Icons.archive_outlined,
                        ),
                        Text(
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Arial',
                                fontWeight: FontWeight.bold),
                            "Archive"),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(
                          color: Colors.white,
                          Icons.notifications_off,
                        ),
                        Text(
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Arial',
                                fontWeight: FontWeight.bold),
                            "Mute"),
                      ],
                    ),
                  ],
                ),
                Divider(
                  height: 50,
                  color: Colors.white,
                  thickness: 0.3,
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FittedBox(
                      child: Text(
                        "member since 13/3/2023",
                        style: TextStyle(
                            color: Colors.white60,
                            fontFamily: 'Arial',
                            fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ), //
    );
  }
}

class Videos {
  String name;
  String duration = "20";
  bool isPremium = false;
  String playedby;
  Videos({required this.name, required this.playedby});
}
