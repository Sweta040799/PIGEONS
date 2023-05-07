import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pigeons/nav_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final app_bar = AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    shadowColor: Colors.transparent,
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white, statusBarIconBrightness: Brightness.dark),

    // primary: false,
    leadingWidth: 60,
    leading: Padding(
      padding: const EdgeInsets.only(left: 2.5),
      child: Row(
        children: [
          AnimatedSwitcher(
            switchOutCurve: Curves.easeOut,
            switchInCurve: Curves.easeIn,
            transitionBuilder: (child, animation) {
              return FadeTransition(opacity: animation, child: child);
            },
            duration: Duration(milliseconds: 500),
            child: null,
          ),
          // Center(
          //   child: CircleAvatar(
          //     //radius: 25,
          //     backgroundImage: AssetImage('images/pigonsicon.png'),
          //     backgroundColor: Colors.white,
          //   ),
          // ),
        ],
      ),
    ),
    // ignore: prefer_const_literals_to_create_immutables
    actions: [
      IconButton(
        onPressed: () => print("object"),
        icon: Icon(Icons.search),
        color: Colors.black,
        splashRadius: 15,
      ),
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.add),
        color: Colors.black,
        splashRadius: 15,
      ),
      Builder(
        builder: (BuildContext context) {
          return GestureDetector(
            onTap: null,
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Icon(
                Icons.people,
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

    title: Text("Home"),
  );

  bool nav_visibility = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scroll.addListener(() {
      if (scroll.position.userScrollDirection == ScrollDirection.reverse) {
        setState(() {
          nav_visibility = false;
        });
      } else if (scroll.position.userScrollDirection == ScrollDirection.forward)
        setState(() {
          nav_visibility = true;
        });
    });
  }

  var scroll = ScrollController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: nav_visibility ? app_bar : null,
        body: Stack(
          children: [
            Container(
              child: ListView(
                controller: scroll,
                children: [
                  HomeTile(),
                  HomeTile(),
                  HomeTile(),
                  HomeTile(),
                  HomeTile(),
                  HomeTile(),
                  HomeTile(),
                  HomeTile(),
                  HomeTile(),
                ],
              ),
            ),
            nav_visibility ? NavBar(flag: 0) : Container(),
          ],
        ),
      ),
    );
  }
}

class HomeTile extends StatelessWidget {
  const HomeTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color.fromARGB(255, 238, 235, 235),
      ),
      margin: const EdgeInsets.only(bottom: 10, right: 3, left: 3),
      height: 300,
      child: Column(
        children: [
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                "images/R.jpg",
                fit: BoxFit.cover,
              ),
            ),
            height: 250,
            color: Colors.transparent,
          ),
        ],
      ),
    );
  }
}
