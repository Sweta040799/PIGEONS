import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pigeons/nav_bar.dart';
import 'package:provider/provider.dart';

import 'providers/user.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  int page = 0;

  bool isTap = false;
  PageController t = PageController();

  int tpage = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(const Duration(seconds: 3), () => _autoScroll());
  }

  final PageController page_controller = PageController();
  Future<void> _autoScroll() async {
    print(isTap);
    if (isTap == true) {
      {
        await Future.delayed(const Duration(seconds: 5), (() {}));
        isTap = false;
        print("$isTap");
        _autoScroll();
      }
    } else {
      page++;
      tpage++;
      print(page);
      setState(() {});
      if (page >= 2) {
        page = 0;
      }
      if (tpage >= 4) {
        tpage = 0;
      }
      t.animateToPage(tpage,
          duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
      page_controller.animateToPage(
        page,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      Timer(const Duration(seconds: 3), () => _autoScroll());
    }
    // Schedule the next auto-scroll
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Set the status bar color to white
      statusBarBrightness:
          Brightness.dark, // Set the status bar brightness to dark
      statusBarIconBrightness:
          Brightness.light, // Set the status bar icon brightness to dark
    ));
    var userData = Provider.of<Users>(
      context,
      listen: true,
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  child: PageView(
                    controller: page_controller,
                    onPageChanged: (value) {
                      page = value;
                    },
                    children: [
                      Stack(
                        children: [
                          Container(
                            //margin: EdgeInsets.only(top: 100),
                            height: MediaQuery.of(context).size.height / 2,
                            width: double.infinity,
                            child: Image.asset(
                              filterQuality: FilterQuality.high,
                              "images/night.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height / 2,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  Colors.white,
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          Container(
                            //margin: EdgeInsets.only(top: 100),
                            height: MediaQuery.of(context).size.height / 2,
                            width: double.infinity,
                            child: Image.asset(
                              filterQuality: FilterQuality.high,
                              "images/R.jfif",
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height / 2,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  Colors.white,
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 2 + 40,
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        CircleAvatar(
                          radius: page == 0 ? 6 : 4,
                          backgroundColor: page == 0
                              ? Colors.indigo
                              : const Color.fromARGB(255, 207, 205, 205),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        CircleAvatar(
                          radius: page == 1 ? 6 : 4,
                          backgroundColor: page == 1
                              ? Colors.indigo
                              : const Color.fromARGB(255, 207, 205, 205),
                        ),
                        const Spacer(),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: const Text(
                        "Picks for you!",
                        style: TextStyle(
                            letterSpacing: 2,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Trochut',
                            fontSize: 30,
                            color: Colors.indigo),
                      ),
                    ),
                    Container(
                      height: 170,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 170,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blue,
                            ),
                            margin: const EdgeInsets.only(
                                left: 20, top: 20, bottom: 20, right: 20),
                            width: MediaQuery.of(context).size.width / 1.5 - 40,
                            child: index % 2 == 0
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    clipBehavior: Clip.hardEdge,
                                    child: const Image(
                                      fit: BoxFit.fill,
                                      image: AssetImage("images/R.jpg"),
                                    ),
                                  )
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: const Image(
                                      fit: BoxFit.fill,
                                      image: AssetImage("images/R.jfif"),
                                    ),
                                  ),
                          );
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20, bottom: 20),
                      child: const Text(
                        "Trending",
                        style: TextStyle(
                            letterSpacing: 2,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Trochut',
                            fontSize: 30,
                            color: Colors.indigo),
                      ),
                    ),
                    Container(
                      height: 200,
                      child: PageView(
                        controller: t,
                        onPageChanged: (value) {
                          tpage = value;
                        },
                        children: [
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey.withOpacity(0.3),
                                ),
                                width: MediaQuery.of(context).size.width - 40,
                                height: 190,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: const Image(
                                      image:
                                          AssetImage("images/community1.png"),
                                    )),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey.withOpacity(0.3),
                                ),
                                width: MediaQuery.of(context).size.width - 40,
                                height: 190,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: const Image(
                                      image:
                                          AssetImage("images/community1.png"),
                                    )),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey.withOpacity(0.3),
                                ),
                                width: MediaQuery.of(context).size.width - 40,
                                height: 190,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: const Image(
                                      image:
                                          AssetImage("images/community1.png"),
                                    )),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey.withOpacity(0.3),
                                ),
                                width: MediaQuery.of(context).size.width - 40,
                                height: 190,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: const Image(
                                      image:
                                          AssetImage("images/community1.png"),
                                    )),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20, bottom: 0),
                      child: const Text(
                        "Continue Watching",
                        style: TextStyle(
                            letterSpacing: 2,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Trochut',
                            fontSize: 30,
                            color: Colors.indigo),
                      ),
                    ),
                    Container(
                      height: 170,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blue,
                            ),
                            margin: const EdgeInsets.only(
                                left: 20, top: 20, bottom: 20, right: 20),
                            width: MediaQuery.of(context).size.width / 1.5 - 40,
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                index % 2 == 0
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        clipBehavior: Clip.hardEdge,
                                        child: const Image(
                                          fit: BoxFit.fill,
                                          image: AssetImage("images/R.jpg"),
                                        ),
                                      )
                                    : ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: const Image(
                                          fit: BoxFit.fill,
                                          image: AssetImage("images/R.jfif"),
                                        ),
                                      ),
                                Positioned(
                                    bottom: 5,
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      height: 5,
                                      width: MediaQuery.of(context).size.width /
                                              1.5 -
                                          50,
                                      child: LinearProgressIndicator(
                                        value: 0.2 + index / 20,
                                        color: const Color.fromARGB(
                                            255, 101, 117, 204),
                                        backgroundColor: Colors.white,
                                      ),
                                    ))
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20, bottom: 0),
                      child: const Text(
                        "Catch out LIVE!",
                        style: TextStyle(
                            letterSpacing: 2,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Trochut',
                            fontSize: 30,
                            color: Colors.indigo),
                      ),
                    ),
                    Container(
                      height: 170,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blue,
                            ),
                            margin: const EdgeInsets.only(
                                left: 20, top: 20, bottom: 20, right: 20),
                            width: MediaQuery.of(context).size.width / 1.5 - 40,
                            child: Stack(
                              clipBehavior: Clip.none,
                              fit: StackFit.expand,
                              children: [
                                index % 2 == 0
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        clipBehavior: Clip.hardEdge,
                                        child: const Image(
                                          fit: BoxFit.fill,
                                          image: AssetImage("images/R.jpg"),
                                        ),
                                      )
                                    : ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: const Image(
                                          fit: BoxFit.fill,
                                          image: AssetImage("images/R.jfif"),
                                        ),
                                      ),
                                Positioned(
                                  top: -15,
                                  right: -5,
                                  child: Chip(
                                    backgroundColor: Colors.red[100],
                                    label: const Icon(
                                      Icons.live_tv,
                                      color: Colors.redAccent,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20, bottom: 0),
                      child: const Text(
                        "Filtered For You!",
                        style: TextStyle(
                            letterSpacing: 2,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Trochut',
                            fontSize: 30,
                            color: Colors.indigo),
                      ),
                    ),
                    Container(
                      height: 170,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blue,
                            ),
                            margin: const EdgeInsets.only(
                                left: 20, top: 20, bottom: 20, right: 20),
                            width: MediaQuery.of(context).size.width / 1.5 - 40,
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                index % 2 == 0
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        clipBehavior: Clip.hardEdge,
                                        child: const Image(
                                          fit: BoxFit.fill,
                                          image: AssetImage("images/R.jpg"),
                                        ),
                                      )
                                    : ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: const Image(
                                          fit: BoxFit.fill,
                                          image: AssetImage("images/R.jfif"),
                                        ),
                                      ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20, bottom: 0),
                      child: const Text(
                        "Must Watch Minis",
                        style: TextStyle(
                            letterSpacing: 2,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Trochut',
                            fontSize: 30,
                            color: Colors.indigo),
                      ),
                    ),
                    Container(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Material(
                            color: Colors.white,
                            //borderRadius: ,
                            elevation: 5,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(),
                                color: const Color.fromARGB(236, 82, 35, 237),
                              ),
                              margin: const EdgeInsets.only(
                                  left: 20, top: 20, bottom: 20, right: 20),
                              padding: const EdgeInsets.all(5),
                              width:
                                  MediaQuery.of(context).size.width / 2.6 - 40,
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  index % 2 == 0
                                      ? ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          clipBehavior: Clip.hardEdge,
                                          child: const Image(
                                            fit: BoxFit.fill,
                                            image: AssetImage("images/R.jpg"),
                                          ),
                                        )
                                      : ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: const Image(
                                            fit: BoxFit.fill,
                                            image: AssetImage("images/R.jfif"),
                                          ),
                                        ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 70,
                  left: 20,
                  child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    width: MediaQuery.of(context).size.width / 2,
                    child: Text(
                      "Good Morning ${userData.name}",
                      style: const TextStyle(
                          letterSpacing: 2,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Trochut',
                          fontSize: 25,
                          color: Colors.white),
                    ),
                  ),
                ),

                // Container(
                //   height: MediaQuery.of(context).size.height / 1.5,
                //   decoration: BoxDecoration(
                //     // border: Border.all(),
                //     gradient: LinearGradient(
                //       begin: Alignment.topCenter,
                //       end: Alignment.bottomCenter,
                //       colors: [
                //         Colors.transparent,
                //         Colors.white,
                //       ],
                //     ),
                //   ),
                // ),
                // Container(
                //   height: MediaQuery.of(context).size.height / 2,
                //   decoration: BoxDecoration(
                //     // border: Border.all(),
                //     gradient: LinearGradient(
                //       begin: Alignment.topCenter,
                //       end: Alignment.bottomCenter,
                //       colors: [
                //         Colors.white,
                //         Colors.transparent,
                //       ],
                //     ),
                //   ),
                // ),
                // Positioned.fill(
                //   child: Align(
                //     alignment: Alignment.bottomCenter,
                //     child: Container(
                //       width: double.infinity,
                //       height: 80,
                //       decoration: BoxDecoration(
                //         gradient: LinearGradient(
                //           begin: Alignment.bottomCenter,
                //           end: Alignment.topCenter,
                //           colors: [
                //             Colors.black.withOpacity(0.5),
                //             Colors.transparent,
                //           ],
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
          NavBar(flag: 1)
        ],
      ),
    );
  }
}
