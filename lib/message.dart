// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Message extends StatelessWidget {
  const Message({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: 25,
              width: 25,
              child: CircleAvatar(
                backgroundImage: AssetImage('images/pigonsicon.png'),
              )),
          Container(
            //decoration: BoxDecoration(border: Border.all(width: 2)),
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 5, bottom: 2),
                  child: Text(
                    "Abhishek Paul",
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Wrap(
                    children: [
                      Container(
                        child: Text(
                          "Hey whatsupp,how are you doing baby, do you miss me?",
                          style: TextStyle(
                            color: Color.fromARGB(255, 31, 30, 30),
                            fontFamily: 'Roboto',
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
