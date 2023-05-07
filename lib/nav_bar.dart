import 'package:flutter/material.dart';
import 'package:pigeons/explore.dart';
import './my_account.dart';
import 'community.dart';

class NavBar extends StatefulWidget {
  int flag;
  NavBar({required this.flag});
  // ignore: non_constant_identifier_names

  @override
  State<NavBar> createState() => _NavBarState(flag: flag);
}

class _NavBarState extends State<NavBar> {
  var pages = [Community(), Explore(), Community(), MyAccount()];
  int flag;
  _NavBarState({required this.flag});
  void press_behaviour(int index) {
    Offset end = Offset(1.0, 0.0), begin = Offset(1.0, 0.0);
    if (flag != index) {
      setState(() {
        if (index > flag) {
          begin = Offset(1.0, 0.0);
          end = Offset.zero;
        } else if (flag > index) {
          end = Offset(0, 0);
          begin = Offset(-1.0, 0);
        }

        flag = index;
        Navigator.pushReplacement(
            context,
            PageRouteBuilder(
                transitionDuration: Duration(milliseconds: 150),
                transitionsBuilder:
                    ((context, animation, secondaryAnimation, child) {
                  var curve = Curves.ease;

                  var tween = Tween(begin: begin, end: end)
                      .chain(CurveTween(curve: curve));
                  return SlideTransition(
                    position: animation.drive(tween),
                    child: child,
                  );
                }),
                pageBuilder: (context, animation, secondaryAnimation) =>
                    pages[index]));
        // Navigator.of(context)
        //     .push(MaterialPageRoute(builder: (context) => pages[index]));
      });
    }
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
