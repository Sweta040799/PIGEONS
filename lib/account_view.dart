// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pigeons/providers/user.dart';
import 'package:provider/provider.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    final userdata = Provider.of<Users>(context);
    var h = MediaQuery.of(context).size.height;
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      child: Container(
        height: h / 3,
        decoration: BoxDecoration(
          color: Colors.white,

          // borderRadius: BorderRadius.circular(20),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              LayoutBuilder(builder: (context, constraints) {
                return Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: constraints.maxWidth,
                      height: 150,
                      child: Image(
                          fit: BoxFit.fill, image: AssetImage("images/R.jpg")),
                    ),
                    Positioned(
                      left: 20,
                      bottom: -40,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage("images/pigonsicon.png"),
                      ),
                    )
                  ],
                );
              }),
              SizedBox(height: 50),
              Container(
                margin: EdgeInsets.only(left: 10, right: 10, bottom: 15),
                width: double.infinity,
                //height: 100,
                decoration: BoxDecoration(
                  color: Color.fromARGB(120, 241, 220, 220),
                  border: Border.all(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Container(
                        //  color: Color.fromARGB(120, 188, 164, 164),
                        child: Text(
                          userdata.name!,
                          style: TextStyle(fontFamily: 'Arial', fontSize: 22),
                        ),
                      ),
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 10, bottom: 4),
                              child: CircleAvatar(
                                backgroundColor: Color.fromARGB(34, 96, 41, 41),
                                child: Material(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.transparent,
                                  child: InkWell(
                                    // splashFactory: ,
                                    splashColor: Colors.grey,
                                    onTap: () {
                                      print("object");
                                    },
                                    child: Icon(
                                        color: Color.fromARGB(223, 96, 41, 41),
                                        Icons.person_add_alt_1_rounded),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Text(
                                "Add Friend",
                                style: TextStyle(
                                    fontFamily: 'Arial', fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 10, bottom: 4),
                              child: CircleAvatar(
                                backgroundColor: Color.fromARGB(34, 96, 41, 41),
                                child: Material(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.transparent,
                                  child: InkWell(
                                    // splashFactory: ,
                                    splashColor: Colors.grey,
                                    onTap: () {
                                      print("object");
                                    },
                                    child: Icon(
                                        color: Color.fromARGB(223, 96, 41, 41),
                                        Icons.message),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Text(
                                "Message",
                                style: TextStyle(
                                    fontFamily: 'Arial', fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 10, bottom: 4),
                              child: CircleAvatar(
                                backgroundColor: Color.fromARGB(34, 96, 41, 41),
                                child: Material(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.transparent,
                                  child: InkWell(
                                    // splashFactory: ,
                                    splashColor: Colors.grey,
                                    onTap: () {
                                      print("object");
                                    },
                                    child: Icon(
                                        color: Color.fromARGB(223, 96, 41, 41),
                                        Icons.call),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Text(
                                "Call",
                                style: TextStyle(
                                    fontFamily: 'Arial', fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 10, bottom: 4),
                              child: CircleAvatar(
                                backgroundColor: Color.fromARGB(34, 96, 41, 41),
                                child: Material(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.transparent,
                                  child: InkWell(
                                    // splashFactory: ,
                                    splashColor: Colors.grey,
                                    onTap: () {
                                      print("object");
                                    },
                                    child: Icon(
                                        color: Color.fromARGB(223, 96, 41, 41),
                                        Icons.video_call),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Text(
                                "Video call",
                                style: TextStyle(
                                    fontFamily: 'Arial', fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10, right: 10, bottom: 15),
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  color: Color.fromARGB(120, 241, 220, 220),
                  border: Border.all(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            "Invite to community",
                            style: TextStyle(fontFamily: 'Arial', fontSize: 16),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 18.0),
                          child: Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 15,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            "Mutual friends",
                            style: TextStyle(fontFamily: 'Arial', fontSize: 16),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 18.0),
                          child: Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 15,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            "Mutual communities",
                            style: TextStyle(fontFamily: 'Arial', fontSize: 16),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 18.0),
                          child: Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 15,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
