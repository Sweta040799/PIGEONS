// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

//implement draggable
// ignore: use_key_in_widget_constructors
class EndDrwaer extends StatefulWidget {
  //const EndDrwaer({super.key});

  @override
  State<EndDrwaer> createState() => _EndDrwaerState();
}

class _EndDrwaerState extends State<EndDrwaer> {
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
              color: Color.fromARGB(143, 161, 105, 105),
            ),
            width: w * 0.45,
            height: h,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Color.fromARGB(
                      100,
                      135,
                      80,
                      80,
                    ),
                  ),
                ),
                Text(
                  "Hi Abhishek",
                  style: TextStyle(fontSize: 20),
                ),
                Divider(
                  thickness: 5,
                ),
              ],
            ),
          ),
        ),
      ), //
    );
  }
}
