import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pigeons/attachments_operations/poll.dart';

class ChatAttachment extends StatefulWidget {
  Function attachment;
  ChatAttachment({super.key, required this.attachment});

  @override
  State<ChatAttachment> createState() =>
      _ChatAttachmentState(attachment: attachment);
}

class _ChatAttachmentState extends State<ChatAttachment> {
  Function attachment;
  _ChatAttachmentState({required this.attachment});
  // ignore: empty_constructor_bodies

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.only(bottom: 12),
        child: Container(
          decoration: BoxDecoration(
              // border: Border.all(
              //  width: 2,
              ),
          //).
          margin: EdgeInsets.all(10),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 10, left: 10),
                child: Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: Text(
                          "Location",
                          style: TextStyle(
                            fontFamily: 'Arial',
                          ),
                        ),
                      ),
                      Material(
                        borderRadius: BorderRadius.circular(30),
                        elevation: 4,
                        child: CircleAvatar(
                          backgroundColor: Color.fromARGB(105, 246, 126, 126),
                          radius: 25,
                          child: Icon(
                              size: 26,
                              color: Colors.white,
                              Icons.location_pin),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 10, left: 10),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(bottom: 5),
                          child: Text(
                            "Camera",
                            style: TextStyle(
                              fontFamily: 'Arial',
                            ),
                          )),
                      Material(
                        borderRadius: BorderRadius.circular(30),
                        elevation: 4,
                        child: CircleAvatar(
                          backgroundColor: Color.fromARGB(105, 246, 126, 126),
                          radius: 25,
                          child:
                              Icon(size: 26, color: Colors.white, Icons.camera),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 10, left: 10),
                child: Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: Text(
                          "Poll",
                          style: TextStyle(
                            fontFamily: 'Arial',
                          ),
                        ),
                      ),
                      Material(
                        borderRadius: BorderRadius.circular(30),
                        elevation: 4,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(30),
                          onTap: (() {
                            print("poll");
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return Poll();
                                });
                            attachment();
                          }),
                          child: CircleAvatar(
                            backgroundColor: Color.fromARGB(105, 246, 126, 126),
                            radius: 25,
                            child: Icon(
                                size: 26,
                                color: Colors.white,
                                Icons.poll_rounded),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 10, left: 10),
                child: Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: Text(
                          "Audio",
                          style: TextStyle(
                            fontFamily: 'Arial',
                          ),
                        ),
                      ),
                      Material(
                        borderRadius: BorderRadius.circular(30),
                        elevation: 4,
                        child: CircleAvatar(
                          backgroundColor: Color.fromARGB(105, 246, 126, 126),
                          radius: 25,
                          child: Icon(
                              size: 26, color: Colors.white, Icons.headphones),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 10, left: 10),
                child: Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: Text(
                          "Contact",
                          style: TextStyle(
                            fontFamily: 'Arial',
                          ),
                        ),
                      ),
                      Material(
                        borderRadius: BorderRadius.circular(30),
                        elevation: 4,
                        child: CircleAvatar(
                          backgroundColor: Color.fromARGB(105, 246, 126, 126),
                          radius: 25,
                          child: Icon(
                              size: 26, color: Colors.white, Icons.contacts),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 10, left: 10),
                child: Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: Text(
                          "Docuument",
                          style: TextStyle(
                            fontFamily: 'Arial',
                          ),
                        ),
                      ),
                      Material(
                        borderRadius: BorderRadius.circular(30),
                        elevation: 4,
                        child: CircleAvatar(
                          backgroundColor: Color.fromARGB(105, 246, 126, 126),
                          radius: 25,
                          child: Icon(
                              size: 26, color: Colors.white, Icons.file_open),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
