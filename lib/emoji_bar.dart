// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class EmojiBar extends StatefulWidget {
  const EmojiBar({super.key});

  @override
  State<EmojiBar> createState() => _EmojiBarState();
}

class _EmojiBarState extends State<EmojiBar> {
  List<bool> toggle_list = [true, false, false];
  List<bool> tap = [false, false, false];
  List<double> size = [20, 20, 20];
  int ind = 0;
  @override
  Widget build(BuildContext context) {
    print("build() emojibar");
    // return Container(
    //   height: 50,
    //   child: ToggleButtons(
    //     tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    //     selectedColor: Colors.brown,
    //     fillColor: Color.fromARGB(23, 251, 170, 170),

    //     highlightColor: Color.fromARGB(11, 188, 177, 177),
    //     //constraints: BoxConstraints(minWidth: 50),
    //     borderWidth: 0,
    //     borderColor: Colors.transparent,
    //     isSelected: toggle_list,
    //     borderRadius: BorderRadius.circular(50),
    //     onPressed: (index) {
    //       setState(() {
    //         toggle_list = [false, false, false];
    //         toggle_list[index] = true;
    //       });
    //     },
    //     // ignore: prefer_const_literals_to_create_immutables
    //     children: [
    //       Icon(Icons.emoji_emotions_outlined),
    //       Icon(Icons.gif),
    //       Icon(Icons.sticky_note_2_sharp),
    //     ],
    //   ),
    // );
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF2F2F2),
      ),
      width: double.infinity,
      height: 60,
      child: Stack(
        children: [
          AnimatedPositioned(
            curve: Curves.bounceOut,
            left: (((MediaQuery.of(context).size.width - 90) / 4)) * (ind + 1) +
                30 * ind -
                15,
            top: 5,
            duration: Duration(milliseconds: 250),
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(89, 195, 186, 186),
                border: Border.all(width: 1, color: Colors.transparent),
                borderRadius: BorderRadius.circular(50),
              ),
              width: 60,
              height: 40,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Material(
                color: Colors.transparent,
                child: IconButton(
                  splashColor: Color.fromARGB(68, 208, 204, 204),
                  splashRadius: 20,
                  onPressed: () => setState(() {
                    ind = 0;
                    size = [30, 25, 20];
                    tap = [true, false, false];
                  }),
                  color: tap[0]
                      ? Color.fromARGB(255, 184, 113, 88)
                      : Colors.black45,
                  icon: tap[0]
                      ? Icon(Icons.emoji_emotions_outlined)
                      : Icon(Icons.emoji_emotions_rounded),
                  iconSize: size[0],
                ),
              ),
              Material(
                color: Colors.transparent,
                child: IconButton(
                  splashColor: Color.fromARGB(68, 208, 204, 204),
                  splashRadius: 20,
                  onPressed: () => setState(() {
                    ind = 1;
                    size = [20, 30, 20];
                    tap = [false, true, false];
                  }),
                  color: tap[1]
                      ? Color.fromARGB(255, 184, 113, 88)
                      : Colors.black45,
                  icon: tap[1] ? Icon(Icons.gif_sharp) : Icon(Icons.gif),
                  iconSize: size[1],
                ),
              ),
              Material(
                color: Colors.transparent,
                child: IconButton(
                  splashColor: Color.fromARGB(68, 208, 204, 204),
                  splashRadius: 20,
                  onPressed: () => setState(() {
                    ind = 2;
                    size = [20, 25, 30];
                    tap = [false, false, true];
                  }),
                  color: tap[2]
                      ? Color.fromARGB(255, 184, 113, 88)
                      : Colors.black45,
                  icon: tap[2]
                      ? Icon(Icons.sticky_note_2_outlined)
                      : Icon(Icons.sticky_note_2_rounded),
                  iconSize: size[2],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
