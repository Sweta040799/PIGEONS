import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import './my_account.dart';

class NavBar extends StatefulWidget {
  // ignore: non_constant_identifier_names

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int? flag;
  void press_behaviour(int index) {
    setState(() {
      flag = index;
      print(flag);
    });

    print("pressed");
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0, left: 10, right: 10),
        child: Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(100, 135, 80, 80),
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  splashRadius: 1,
                  onPressed: () => press_behaviour(0),
                  icon: Icon(
                    flag != 0 ? Icons.home_outlined : Icons.home_filled,
                  ),
                ),
                IconButton(
                  splashRadius: 1,
                  onPressed: () => press_behaviour(1),
                  icon: Icon(
                    flag != 1 ? Icons.explore_outlined : Icons.explore,
                  ),
                ),
                IconButton(
                  splashRadius: 1,
                  onPressed: () => press_behaviour(2),
                  icon: Icon(
                    flag != 2 ? Icons.group_outlined : Icons.group,
                  ),
                ),
                GestureDetector(
                  onTap: () => press_behaviour(3),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                      border: Border.all(
                        color: flag != 3 ? Colors.transparent : Colors.black,
                        width: 2.0,
                      ),
                    ),
                    child: const CircleAvatar(
                      // ignore: sort_child_properties_last
                      backgroundImage: AssetImage("images/pigonsicon.png"),

                      radius: 11,
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
