// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CommunityDrawer extends StatelessWidget {
  Function drawerExtend;
  CommunityDrawer({super.key, required this.drawerExtend});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      child: Container(
        width: 50,
        height: MediaQuery.of(context).size.height * 0.85,
        decoration: BoxDecoration(),
        // kandre ekh bole koooo, hat die gunechi, chap diye angul a
        //3 4 diye mobile chulam ka bolechi
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 5, bottom: 5),
                  child: Stack(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('images/pigonsicon.png'),
                      ),
                      Positioned(
                        right: 0,
                        child: Container(
                          height: 20,
                          width: 20,
                          child: Container(
                            child: CircleAvatar(
                              backgroundColor: Colors.green,
                              child: FittedBox(
                                  child: Text("20",
                                      style: TextStyle(
                                          fontFamily: 'Arial',
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold))),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5, bottom: 5),
                  child: CircleAvatar(),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5, bottom: 5),
                  child: CircleAvatar(),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5, bottom: 5),
                  child: CircleAvatar(),
                ),
              ],
            ),
            GestureDetector(
              child: Icon(Icons.arrow_forward_ios),
              onTap: (() {
                drawerExtend();
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class CommunityDrawerExtended extends StatelessWidget {
  Function drawerExtend;
  CommunityDrawerExtended({super.key, required this.drawerExtend});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.45,
        height: MediaQuery.of(context).size.height * 0.85,
        child: Column(
          children: [
            Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        children: [
                          Padding(
                              padding: EdgeInsets.only(left: 13, right: 20),
                              child: CircleAvatar(
                                radius: 15,
                              )),
                          Text(
                              style:
                                  TextStyle(fontFamily: 'Arial', fontSize: 17),
                              "Amazon"),
                          Chip(label: Text(5.toString())),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        children: [
                          Padding(
                              padding: EdgeInsets.only(left: 13, right: 20),
                              child: CircleAvatar(
                                radius: 15,
                              )),
                          Text(
                              style:
                                  TextStyle(fontFamily: 'Arial', fontSize: 17),
                              "Amazon"),
                          Chip(label: Text(5.toString())),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        children: [
                          Padding(
                              padding: EdgeInsets.only(left: 13, right: 20),
                              child: CircleAvatar(
                                radius: 15,
                              )),
                          Text(
                              style:
                                  TextStyle(fontFamily: 'Arial', fontSize: 17),
                              "Amazon"),
                          Chip(label: Text(5.toString())),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        children: [
                          Padding(
                              padding: EdgeInsets.only(left: 13, right: 20),
                              child: CircleAvatar(
                                radius: 15,
                              )),
                          Text(
                              style:
                                  TextStyle(fontFamily: 'Arial', fontSize: 17),
                              "Amazon"),
                          Chip(label: Text(5.toString())),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon((Icons.search)),
                Text("Search community",
                    style: TextStyle(fontFamily: 'Arial', fontSize: 16)),
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  drawerExtend();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
