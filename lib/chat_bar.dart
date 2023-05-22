// ignore_for_file: avoid_unnecessary_containers, void_checks, prefer_const_constructors

import 'dart:io';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pigeons/chatbox_attachment.dart';
import 'package:pigeons/emoji_bar.dart';

import 'package:path_provider/path_provider.dart';
import 'package:image_picker/image_picker.dart';

class ChatBar extends StatefulWidget {
  var controller;
  void Function(bool) isEmoji;
  bool emojiOpen = false;
  void Function(String) send;
  ChatBar({
    super.key,
    this.controller,
    required this.isEmoji,
    required this.send,
  });

  // isEmoji=isEmoji;
  @override
  // ignore: no_logic_in_create_state
  State<ChatBar> createState() {
    var obj = _ChatBarState(controller: controller, isEmoji: isEmoji);
    return obj;
  }
}

// FlutterSoundRecorder? flutterSoundRecorder;
// @override
// void initState() {
//   flutterSoundRecorder = FlutterSoundRecorder();
// }

File? image;
String _recordFilePath = '';

class _ChatBarState extends State<ChatBar> {
  Future<void> click() async {
    final file = await ImagePicker().pickImage(source: ImageSource.camera);

    setState(() {
      image = File(file!.path);
    });
  }

  File? galleryimage;
  Future<void> open_gallery() async {
    final file = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      galleryimage = File(file!.path);
    });
  }

  // Future<void> start_recording() async {
  //   Directory docDir = await getApplicationDocumentsDirectory();

  //   String docPath = docDir.path;
  //   String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
  //   _recordFilePath = '/storage/emulated/0/Download/recording_$timestamp.wav';
  //   print(_recordFilePath);
  //   await flutterSoundRecorder?.openRecorder();
  //   print("object");
  //   await flutterSoundRecorder?.startRecorder(
  //     codec: Codec.aacADTS,
  //     toFile: _recordFilePath,
  //   );
  // }

  // Future stop_recording() async {
  //   print("stopped");
  //   await flutterSoundRecorder?.stopRecorder().then((value) => print(value));

  //   await flutterSoundRecorder?.closeRecorder();
  //   print("");
  // }

  var controller;
  void Function(bool) isEmoji;
  bool emojiOpen = false;

  bool attachment = false;

  _ChatBarState({this.controller, required this.isEmoji});
  // ignore: avoid_init_to_null
  var text = null;
  final TextEditingController _con = TextEditingController();
  var height = 40.0;
  int k = 0;
  //implement change height properly.
  void changeHeight(String text) {
    int nlines = '\n'.allMatches(text).length + 1;
    setState(() {
      height = (40.0 + 20.0 * nlines);
    });
  }

  int label = 0;
  int _change = 0;
  int _end = 1;
  bool expanded = true;
  @override
  Widget build(BuildContext context) {
    print("build() chatBar");
    return WillPopScope(
      onWillPop: () async {
        if (emojiOpen) {
          setState(() {
            emojiOpen = !emojiOpen;
          });
          return false;
        }
        return true;
      },
      child: Expanded(
        child: Column(
          children: [
            Visibility(
              visible: attachment,
              child: ChatAttachment(
                attachment: open_attachment,
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(right: 5, left: 5, bottom: 12),
                child: Row(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Material(
                      borderRadius: BorderRadius.circular(20),
                      elevation: 3,
                      child: AnimatedContainer(
                        onEnd: () {
                          if (_change == 0)
                            // ignore: curly_braces_in_flow_control_structures
                            setState(() {
                              _end *= -1;
                            });
                        },
                        decoration: BoxDecoration(
                          // ignore: prefer_const_literals_to_create_immutables

                          color: const Color.fromARGB(154, 236, 208, 208),
                          border: Border.all(
                            color: Colors.transparent,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        width: _change == 0
                            ? MediaQuery.of(context).size.width * 0.7
                            : MediaQuery.of(context).size.width * 0.9,
                        constraints: const BoxConstraints(
                          maxHeight: 100,
                        ),
                        // height: 40,
                        duration: Duration(milliseconds: 100),
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                child: IconButton(
                                  iconSize: 25,
                                  splashRadius: 20,
                                  onPressed: changeEmojiTab,
                                  color:
                                      const Color.fromARGB(255, 157, 115, 115),
                                  icon:
                                      const Icon(Icons.emoji_emotions_outlined),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  // height: 40,
                                  //  constraints:
                                  // BoxConstraint
                                  // constraints: BoxConstraints(maxHeight: 100),
                                  //width: 200,
                                  // ignore: prefer_const_constructors
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      right: 5,
                                      //left: 5,
                                    ),
                                    // ignore: prefer_const_constructors
                                    child: TextField(
                                      onTap: keyboard_dismiss,

                                      controller: controller,

                                      // maxLength: 10,
                                      maxLines: null,
                                      onChanged: (value) {
                                        text = value;
                                        changeHeight(value);
                                        if (value.isNotEmpty && _change == 0) {
                                          setState(
                                            () {
                                              _end = -1;
                                              _change = 1;
                                            },
                                          );
                                        } else if (value.isEmpty) {
                                          setState(
                                            () {
                                              _change = 0;
                                            },
                                          );
                                        }
                                      },
                                      // maxLines: null,
                                      minLines: null,
                                      //expands: true,

                                      style: const TextStyle(
                                          fontSize: 20, fontFamily: "Arial"),
                                      // ignore: prefer_const_constructors
                                      decoration: InputDecoration(
                                        counterText: "",
                                        hintText: "Type...",
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.never,
                                        contentPadding:
                                            const EdgeInsets.only(bottom: 0),
                                        border: InputBorder.none,
                                      ),
                                      cursorHeight: 24,
                                    ),
                                  ),
                                ),
                              ),
                              // ignore: prefer_const_constructors
                              InkWell(
                                onTap: () {
                                  open_attachment();
                                },
                                borderRadius: BorderRadius.circular(5),
                                splashColor: Colors.brown[50],
                                child: const Icon(
                                    color: Color.fromARGB(255, 157, 115, 115),
                                    Icons.attach_file_outlined),
                              ),
                              // ignore: prefer_const_constructors
                              if (_change != 0)
                                // ignore: prefer_const_constructors
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 7.0, right: 8),
                                  child: Material(
                                    elevation: 3,
                                    borderRadius: BorderRadius.circular(20),
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(10),
                                      onTap: () {
                                        print(text);
                                      },
                                      splashColor: Colors.brown[50],
                                      ////splashFactory: ,
                                      child: Container(
                                        height: 35,
                                        width: 35,
                                        padding: EdgeInsets.only(left: 5),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 1,
                                              color: Colors.transparent),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color:
                                              Color.fromARGB(212, 134, 60, 60),
                                        ),
                                        child: GestureDetector(
                                          onTap: () => widget.send(text),
                                          child: Icon(
                                              size: 23,
                                              color: Colors.white,
                                              Icons.send_rounded),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    if (_end == 1)
                      InkWell(
                        onTap: click,
                        child: const Icon(
                            color: Color.fromARGB(215, 106, 49, 49),
                            Icons.camera_alt_rounded),
                      ),
                    _end == 1
                        ? GestureDetector(
                            onTap: () {
                              open_gallery();
                            },
                            child: Icon(
                                color: const Color.fromARGB(215, 106, 49, 49),
                                Icons.photo_album_rounded),
                          )
                        : Icon(
                            color: const Color.fromARGB(215, 106, 49, 49),
                            Icons.emoji_emotions_rounded),
                    if (_end == 1)
                      InkWell(
                        child: GestureDetector(
                          onLongPressDown: (details) async {
                            if (await Permission.microphone.status ==
                                PermissionStatus.granted) {
                              // start_recording();
                            }
                            print(details);
                          },
                          onLongPressUp: (() {
                            // stop_recording();
                            print("released");
                          }),
                          child: const Icon(
                              color: Color.fromARGB(215, 106, 49, 49),
                              Icons.mic),
                        ),
                      )
                  ],
                ),
              ),
            ),
            Visibility(
              visible: emojiOpen,
              child: EmojiTabOpener(),
            ),
            Visibility(
              maintainState: true,
              visible: emojiOpen,
              child: EmojiBar(),
            ),
          ],
        ),
      ),
    );
  }

  void open_attachment() {
    setState(() {
      attachment = !attachment;
    });
  }

  Container EmojiTabOpener() {
    return Container(
        decoration: const BoxDecoration(
            //// border: Border.all(width: 4, color: Colors.grey),
            ),
        height: 200,
        child: EmojiPicker(
          onEmojiSelected: (category, emoji) {},
          onBackspacePressed: () {},
          textEditingController: controller,
          // ignore: prefer_const_constructors
          config: Config(
            columns: 9,
            // Issue: https://github.com/flutter/flutter/issues/28894
            emojiSizeMax: 24,

            horizontalSpacing: 1,
            gridPadding: EdgeInsets.zero,
            initCategory: Category.RECENT,
            bgColor: const Color(0xFFF2F2F2),
            indicatorColor: Color.fromARGB(255, 137, 96, 68),
            iconColor: Colors.grey,
            iconColorSelected: Color.fromARGB(255, 137, 96, 68),
            backspaceColor: Colors.black,
            skinToneDialogBgColor: Colors.white,
            skinToneIndicatorColor: Colors.grey,
            enableSkinTones: true,
            showRecentsTab: true,
            recentsLimit: 36,
            replaceEmojiOnLimitExceed: true,
            noRecents: const Text(
              'No Recents',
              style: TextStyle(fontSize: 20, color: Colors.black26),
              textAlign: TextAlign.center,
            ),
            loadingIndicator: const SizedBox.shrink(),
            tabIndicatorAnimDuration: kTabScrollDuration,
            categoryIcons: const CategoryIcons(),
            buttonMode: ButtonMode.MATERIAL,
            checkPlatformCompatibility: true,
          ),
        ));
  }

  void changeEmojiTab() {
    FocusManager.instance.primaryFocus?.unfocus();

    setState(() {
      emojiOpen = !emojiOpen;
      isEmoji(emojiOpen);
      print(emojiOpen);
    });
  }

  void keyboard_dismiss() {
    if (emojiOpen) {
      setState(() {
        emojiOpen = !emojiOpen;
      });
    }
  }
}
