// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, duplicate_ignore, non_constant_identifier_names, avoid_print, unused_local_variable, avoid_types_as_parameter_names

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pigeons/end_drawer.dart';
import './nav_bar.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({super.key});

  @override
  State<MyAccount> createState() => _MyAccountState();
}

int? flag;
int shift = -1;

class _MyAccountState extends State<MyAccount> {
  void printter() {
    // ignore: avoid_print
    print(1);
  }

  bool filter = false;

  double drag = 0;
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;

    void nav_open() {
      setState(() {
        if (drag == 0) {
          drag = MediaQuery.of(context).size.width * 0.48;
        } else {
          drag = 0;
        }
      });
    }

    final app_bar = AppBar(
      elevation: 0,
      // primary: false,
      leadingWidth: 60,
      leading: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Center(
          child: CircleAvatar(
            //radius: 25,
            backgroundImage: AssetImage('images/pigonsicon.png'),
            backgroundColor: Colors.white,
          ),
        ),
      ),
      // ignore: prefer_const_literals_to_create_immutables
      actions: [
        Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: nav_open,
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Icon(
                  Icons.menu_outlined,
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

      title: Text("My Account"),
      backgroundColor: Colors.white,
    );

    return MediaQuery(
      data: const MediaQueryData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Pigeons",
        home: Stack(
          children: [
            Scaffold(
              //endDrawer: EndDrwaer(),
              //drawer: Drawer(),
              backgroundColor: Colors.white,
              appBar: app_bar,
              body: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: EndDrwaer(),
                  ),
                  AnimatedPositioned(
                    right: drag,
                    duration: Duration(milliseconds: 20),
                    child: Material(
                      elevation: 100,
                      child: GestureDetector(
                        onTap: () {
                          if (filter == true)
                            setState(() {
                              filter = false;
                            });
                        },
                        onHorizontalDragUpdate: (DragUpdateDetails) {
                          setState(() {
                            print(drag);
                            if (drag < 0) {
                              drag = 0;
                            } else if (drag >
                                MediaQuery.of(context).size.width * 0.48) {
                              drag = MediaQuery.of(context).size.width * 0.48;
                            } else {
                              drag -= DragUpdateDetails.primaryDelta!;
                            }
                          });
                        },
                        onHorizontalDragEnd: (DragEndDetails) {
                          setState(() {
                            print("velocity ${DragEndDetails.primaryVelocity}");
                            if (DragEndDetails.primaryVelocity! < -800) {
                              drag = MediaQuery.of(context).size.width * 0.48;
                              // print("velocfity${DragEndDetails.velocity}");
                            } else if (DragEndDetails.primaryVelocity! > 800) {
                              drag = 0;
                            } else if (drag <
                                MediaQuery.of(context).size.width * 0.48 / 2) {
                              drag = 0;
                              // bring all the conditions here from drag update
                            } else if (drag >
                                MediaQuery.of(context).size.width * 0.48 / 2) {
                              drag = MediaQuery.of(context).size.width * 0.48;
                            }
                          });
                          // drag = 0;
                        },
                        child: Container(
                          height: h * 0.9,
                          width: MediaQuery.of(context).size.width,
                          child: Stack(
                            children: [
                              SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          height: h * 0.20,
                                          // color: Colors.black,
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            image: DecorationImage(
                                              image: AssetImage("images/R.jpg"),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          height: h * 0.25,
                                          color: Colors.transparent,
                                          child: Row(
                                            // ignore: prefer_const_literals_to_create_immutables
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  GestureDetector(
                                                    onLongPress: () {
                                                      print("long");
                                                      setState(() {
                                                        print("long");
                                                        filter = true;
                                                      });
                                                    },
                                                    onLongPressEnd: (_) {
                                                      print("long canceled");
                                                      setState(() {
                                                        filter = false;
                                                      });
                                                    },
                                                    onTap: (() {
                                                      showModalBottomSheet(
                                                          context: context,
                                                          builder: (context) {
                                                            return Container(
                                                              color: Colors
                                                                  .transparent,
                                                              height: 150,
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: [
                                                                  Padding(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .only(
                                                                      left: 10,
                                                                      bottom: 8,
                                                                    ),
                                                                    child: Row(
                                                                      children: [
                                                                        Icon(Icons
                                                                            .edit),
                                                                        Padding(
                                                                          padding:
                                                                              const EdgeInsets.only(left: 8.0),
                                                                          child:
                                                                              Text(
                                                                            "Change ",
                                                                            style:
                                                                                TextStyle(
                                                                              fontFamily: 'Arial',
                                                                              fontSize: 18,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .only(
                                                                      left: 10,
                                                                      bottom: 8,
                                                                    ),
                                                                    child:
                                                                        GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        Navigator.pop(
                                                                            context);
                                                                        setState(
                                                                            () {
                                                                          filter =
                                                                              true;
                                                                        });
                                                                      },
                                                                      child:
                                                                          Row(
                                                                        children: [
                                                                          Icon(Icons
                                                                              .photo),
                                                                          Padding(
                                                                            padding:
                                                                                const EdgeInsets.only(left: 8.0),
                                                                            child:
                                                                                Text(
                                                                              "View ",
                                                                              style: TextStyle(
                                                                                fontFamily: 'Arial',
                                                                                fontSize: 18,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .only(
                                                                      left: 10,
                                                                      bottom: 8,
                                                                    ),
                                                                    child: Row(
                                                                      children: [
                                                                        Icon(
                                                                            Icons
                                                                                .cancel,
                                                                            color:
                                                                                Colors.red),
                                                                        Padding(
                                                                          padding:
                                                                              const EdgeInsets.only(left: 8.0),
                                                                          child:
                                                                              Text(
                                                                            "Remove ",
                                                                            style:
                                                                                TextStyle(
                                                                              color: Colors.redAccent,
                                                                              fontFamily: 'Arial',
                                                                              fontSize: 18,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                          });
                                                    }),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8.0),
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          boxShadow: [
                                                            BoxShadow(
                                                                blurRadius: 5,
                                                                spreadRadius: 1,
                                                                color:
                                                                    Colors.grey,
                                                                offset: Offset(
                                                                    4, 4)),
                                                          ],
                                                        ),
                                                        child: CircleAvatar(
                                                          backgroundImage:
                                                              AssetImage(
                                                                  "images/pigonsicon.png"),
                                                          radius: h * 0.08,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                // ignore: prefer_const_literals_to_create_immutables
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "Abhishek Paul",
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Text(
                                                          "#1423",
                                                          style: TextStyle(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      thickness: 5,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 14.0,
                                          right: 14,
                                          top: 7,
                                          bottom: 7),
                                      child: Container(
                                        width: double.infinity,
                                        height: 150,
                                        decoration: BoxDecoration(
                                          color: Color.fromARGB(
                                              120, 241, 220, 220),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(15),
                                          ),
                                        ),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Row(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 15,
                                                              left: 10,
                                                              bottom: 5,
                                                              right: 15),
                                                      child: Icon(
                                                        Icons.person,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    top: 10,
                                                  ),
                                                  child: Text(
                                                    "Account Settings",
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 12,
                                                            left: 20,
                                                            right: 10),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        Icon(
                                                          Icons.chevron_right,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 50),
                                              child: Divider(
                                                thickness: 1,
                                              ),
                                            ),
                                            Expanded(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 50.0),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          "Lorem Ipsum",
                                                          style: TextStyle(
                                                            fontFamily: 'Arial',
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  // SizedBox(
                                                  //   height: h * 0.015,
                                                  // ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 50.0),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          "Lorem Ipsum",
                                                          style: TextStyle(
                                                            fontFamily: 'Arial',
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 50.0),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          "more ...",
                                                          style: TextStyle(
                                                            fontFamily: 'Arial',
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            // SizedBox(
                                            //   height: h * .015,
                                            // ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 14.0,
                                          right: 14,
                                          top: 7,
                                          bottom: 7),
                                      child: Container(
                                          width: double.infinity,
                                          height: 150,
                                          decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                120, 241, 220, 220),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(15),
                                            ),
                                          ),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 15,
                                                            left: 10,
                                                            bottom: 5,
                                                            right: 15),
                                                    child: Icon(
                                                      Icons.ondemand_video,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      top: 10,
                                                    ),
                                                    child: Text(
                                                      "Stream Settings",
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w900,
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 12,
                                                                  left: 20),
                                                          child: Icon(
                                                            Icons.chevron_right,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 50),
                                                child: Divider(
                                                  thickness: 1,
                                                ),
                                              ),
                                              Expanded(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 50.0),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            "Lorem Ipsum",
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Arial',
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    // SizedBox(
                                                    //   height: h * 0.015,
                                                    // ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 50.0),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            "Lorem Ipsum",
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Arial',
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 50.0),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            "more ...",
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Arial',
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              // SizedBox(
                                              //   height: h * .015,
                                              // ),
                                            ],
                                          )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 14.0,
                                          right: 14,
                                          top: 7,
                                          bottom: 7),
                                      child: Container(
                                          width: double.infinity,
                                          height: 150,
                                          decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                120, 241, 220, 220),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(15),
                                            ),
                                          ),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 15,
                                                            left: 10,
                                                            bottom: 5,
                                                            right: 15),
                                                    child: Icon(
                                                      Icons.app_settings_alt,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      top: 10,
                                                    ),
                                                    child: Text(
                                                      "App Settings",
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w900,
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 12,
                                                                  left: 20,
                                                                  right: 10),
                                                          child: Icon(
                                                            Icons.chevron_right,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 50),
                                                child: Divider(
                                                  thickness: 1,
                                                ),
                                              ),
                                              Expanded(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 50.0),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            "Lorem Ipsum",
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Arial',
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    // SizedBox(
                                                    //   height: h * 0.015,
                                                    // ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 50.0),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            "Lorem Ipsum",
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Arial',
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 50.0),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            "more ...",
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Arial',
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              // SizedBox(
                                              //   height: h * .015,
                                              // ),
                                            ],
                                          )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 14.0,
                                          right: 14,
                                          top: 7,
                                          bottom: 60),
                                      child: Container(
                                          width: double.infinity,
                                          height: 150,
                                          decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                120, 241, 220, 220),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(15),
                                            ),
                                          ),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 15,
                                                            left: 10,
                                                            bottom: 5,
                                                            right: 15),
                                                    child: Icon(
                                                      Icons.card_travel,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      top: 10,
                                                    ),
                                                    child: Text(
                                                      "Subscriptions ",
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w900,
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 12,
                                                                  left: 20,
                                                                  right: 10),
                                                          child: Icon(
                                                            Icons.chevron_right,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 50),
                                                child: Divider(
                                                  thickness: 1,
                                                ),
                                              ),
                                              Expanded(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 50.0),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            "Lorem Ipsum",
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Arial',
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    // SizedBox(
                                                    //   height: h * 0.015,
                                                    // ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 50.0),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            "Lorem Ipsum",
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Arial',
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 50.0),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            "more ...",
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Arial',
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              // SizedBox(
                                              //   height: h * .015,
                                              // ),
                                            ],
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                              NavBar(
                                flag: 3,
                              ), // nav bar imported
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (filter == true)
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Center(
                  child: CircleAvatar(
                    backgroundImage: AssetImage('images/pigonsicon.png'),
                    radius: MediaQuery.of(context).size.width * 0.3,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
