// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({super.key});

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  // ignore: override_on_non_overriding_member
  void printter() {
    // ignore: avoid_print
    print(1);
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;

    return MediaQuery(
      data: const MediaQueryData(),
      child: MaterialApp(
          title: "Pigeons",
          home: Scaffold(
              endDrawer: Drawer(),
              //drawer: Drawer(),
              backgroundColor: Colors.white,
              appBar: AppBar(
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
                        onTap: Scaffold.of(context).openEndDrawer,
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
                // leading: Builder(
                //   builder: (BuildContext context) {
                //     return GestureDetector(
                //       onTap: Scaffold.of(context).openEndDrawer,
                //       child: Icon(
                //         Icons.menu_outlined,
                //         color: Colors.black,
                //       ),
                //     );
                //   },
                // ),
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto', //need to add in pub
                ),

                title: Text("My Account"),
                backgroundColor: Colors.white,
              ),
              body: const Center(
                child: Text(
                  "data",
                  style: TextStyle(fontSize: 20),
                ),
              ))),
    );
  }
}
