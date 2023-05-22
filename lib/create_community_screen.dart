// ignore: non_constant_identifier_names
// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pigeons/providers/community_backend.dart';
import 'package:provider/provider.dart';

class CreateCommunity extends StatefulWidget {
  const CreateCommunity({super.key});

  @override
  State<CreateCommunity> createState() => _CreateCommunityState();
}

class _CreateCommunityState extends State<CreateCommunity> {
  var isTap = false;
  final List<Color> _visibilitycolor = [
    Color.fromARGB(255, 245, 243, 243),
    Color.fromARGB(255, 245, 243, 243),
    Color.fromARGB(255, 245, 243, 243)
  ];

  var _isUnique = false;

  String? visChoice;

  String? communityname;
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () => _autoScroll());
  }

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

      setState(() {});
      if (page >= 2) {
        page = 0;
      }
      page_controller.animateToPage(
        page,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      Timer(Duration(seconds: 3), () => _autoScroll());
    }
    // Schedule the next auto-scroll
  }

  double _value = 0;
  var on = false;

  List dropdownitems = ["Pop", "Rock", "Music", "Other"];
  var load = false;
  PageController page_controller = PageController();
  String? dropdownValue = null;

  int page = 0;
  @override
  Widget build(BuildContext context) {
    var communitydata = Provider.of<CommunityBackend>(context);
    //if (load == false) dropdownValue = dropdownitems[0];
    final app_bar = AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      shadowColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontFamily: 'Roboto', //need to add in pub
      ),
      title: Text(
        "Create Community",
      ),
      // primary: false,
      leadingWidth: 60,
      leading: Padding(
        padding: const EdgeInsets.only(left: 5),
        child: Row(
          children: const [
            Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );

    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: app_bar,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Stack(
              children: [
                Center(
                  child: Container(
                      margin: EdgeInsets.only(top: 40),
                      color: Colors.transparent,
                      height: 270,
                      child: PageView(
                        controller: page_controller,
                        children: [
                          Column(
                            children: [
                              Container(
                                height: 180,
                                child: Image(
                                    image: AssetImage("images/community1.png")),
                              ),
                              FittedBox(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 20, right: 20),
                                  child: Text(
                                    "\"Create your own space, share your emotions!\" ",
                                    style: TextStyle(
                                        fontFamily: 'Arial',
                                        fontSize: 16,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                height: 180,
                                child: Image(
                                    image: AssetImage("images/community2.png")),
                              ),
                              FittedBox(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20.0, left: 20, right: 20),
                                  child: Text(
                                    "\"Still stay connected to the world\" ",
                                    style: TextStyle(
                                        fontFamily: 'Arial',
                                        fontSize: 16,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 2.7,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 18.0),
                              child: GestureDetector(
                                  onTap: () {
                                    page--;
                                    isTap = true;
                                    page = page % 2;
                                    print(page);
                                    setState(() {
                                      page_controller.animateToPage(page,
                                          curve: Curves.easeIn,
                                          duration:
                                              Duration(milliseconds: 500));
                                    });
                                  },
                                  child: CircleAvatar(
                                    backgroundColor:
                                        Color.fromARGB(133, 227, 227, 227),
                                    child: Center(
                                        child: Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Icon(
                                        Icons.arrow_back_ios,
                                        color:
                                            Color.fromARGB(255, 134, 132, 132),
                                      ),
                                    )),
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 18.0),
                              child: GestureDetector(
                                  onTap: () {
                                    page++;
                                    isTap = true;
                                    page = page % 2;
                                    print(page);

                                    setState(() {
                                      page_controller.animateToPage(page,
                                          curve: Curves.easeOut,
                                          duration:
                                              Duration(milliseconds: 500));
                                    });
                                  },
                                  child: CircleAvatar(
                                    backgroundColor:
                                        Color.fromARGB(133, 227, 227, 227),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 5.0),
                                      child: Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        color:
                                            Color.fromARGB(255, 134, 132, 132),
                                      ),
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(right: 4),
                              child: CircleAvatar(
                                  backgroundColor: Colors.brown,
                                  radius: page == 0 ? 7 : 5)),
                          CircleAvatar(
                              backgroundColor: Colors.brown,
                              radius: page == 1 ? 7 : 5),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            Spacer(),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 7,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  )
                ],
                gradient: LinearGradient(
                    end: Alignment.bottomCenter,
                    begin: Alignment.topCenter,
                    colors: const [
                      Color.fromARGB(214, 229, 175, 154),
                      // Color.fromARGB(255, 219, 158, 136),
                      Colors.white
                    ]),
                //border: Border.all(),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
              ),
              height: MediaQuery.of(context).size.height / 2,
              width: double.infinity,
              child: Form(
                child: Wrap(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 40, top: 40),
                              child: Text(
                                " Name:",
                                style: TextStyle(
                                  fontFamily: 'Arial',
                                  fontSize: 16,
                                  color: Color.fromARGB(223, 94, 93, 92),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 40, top: 40),
                              decoration: BoxDecoration(
                                  // color: Colors.brown,
                                  color: Color.fromARGB(225, 239, 216, 194),
                                  // border: Border.all(),
                                  borderRadius: BorderRadius.circular(15)),
                              width: MediaQuery.of(context).size.width / 2,
                              child: TextFormField(
                                autovalidateMode: AutovalidateMode.always,
                                validator: (value) {
                                  print(value);
                                  if (value == null) {
                                    return "Community name cannot be empty";
                                  }
                                  communitydata
                                      .validateCommunity(value)
                                      .then((val) {
                                    setState(() {
                                      _isUnique = val;
                                      communityname = value;
                                    });
                                  });
                                  if (!_isUnique) {
                                    return "Please enter unique community name";
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: InputDecoration(
                                  hintText: ' Unique',
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontFamily: "Arial"),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 40, left: 15),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color:
                                          _isUnique ? Colors.green : Colors.red,
                                      width: 3),
                                  borderRadius: BorderRadius.circular(
                                    300,
                                  )),
                              child: CircleAvatar(
                                backgroundColor: _isUnique
                                    ? Colors.lightGreen
                                    : Colors.red[200],
                                radius: 10,
                                child: _isUnique
                                    ? Icon(Icons.check,
                                        size: 15, color: Colors.white)
                                    : Icon(Icons.close,
                                        size: 15, color: Colors.white),
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 40, top: 20.0),
                              child: Center(
                                  child: Text(
                                "Genre:",
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontFamily: 'Arial',
                                  fontSize: 16,
                                  color: Color.fromARGB(223, 94, 93, 92),
                                ),
                              )),
                            ),
                            SizedBox(
                              width: 48,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Container(
                                height: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                                child: DropdownButton(
                                  dropdownColor:
                                      Color.fromARGB(255, 233, 230, 230),
                                  iconSize: 30,
                                  isExpanded: false,
                                  elevation: 0,
                                  underline: Container(),
                                  hint: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text("Choose"),
                                  ),
                                  style: TextStyle(
                                      fontFamily: 'Arial',
                                      color: Color.fromARGB(255, 57, 55, 55)),
                                  borderRadius: BorderRadius.circular(8),
                                  value: dropdownValue,
                                  onChanged: (itemvalue) {
                                    setState(() {
                                      load = true;
                                      dropdownValue = itemvalue!;
                                    });
                                  },
                                  items: dropdownitems
                                      .map<DropdownMenuItem<String>>((value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Padding(
                                          padding: EdgeInsets.only(left: 8),
                                          child: Text(value)),
                                    );
                                  }).toList(),
                                ),
                              ),
                            )
                          ],
                        ),
                        Divider(height: 30),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 40.0, top: 20),
                              child: Center(
                                  child: Text(
                                "Visibility: ",
                                style: TextStyle(
                                  fontFamily: 'Arial',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(223, 94, 93, 92),
                                ),
                              )),
                            ),
                            Spacer(),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 20.0, right: 10),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    visChoice = "Public";
                                    _visibilitycolor[0] =
                                        Color.fromARGB(179, 225, 143, 111);
                                    _visibilitycolor[1] =
                                        Color.fromARGB(255, 245, 243, 243);
                                    _visibilitycolor[2] =
                                        Color.fromARGB(255, 245, 243, 243);
                                  });
                                },
                                child: Chip(
                                  elevation: 2,
                                  label: Text("Public"),
                                  backgroundColor: _visibilitycolor[0],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 20.0, right: 10),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    visChoice = "Invite Only";
                                    _visibilitycolor[1] =
                                        Color.fromARGB(179, 225, 143, 111);
                                    _visibilitycolor[0] =
                                        Color.fromARGB(255, 245, 243, 243);
                                    _visibilitycolor[2] =
                                        Color.fromARGB(255, 245, 243, 243);
                                  });
                                },
                                child: Chip(
                                  elevation: 2,
                                  label: Text("Invite Only"),
                                  backgroundColor: _visibilitycolor[1],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 20.0, right: 10),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    visChoice = "private";
                                    _visibilitycolor[2] =
                                        Color.fromARGB(179, 225, 143, 111);
                                    _visibilitycolor[1] =
                                        Color.fromARGB(255, 245, 243, 243);
                                    _visibilitycolor[0] =
                                        Color.fromARGB(255, 245, 243, 243);
                                  });
                                },
                                child: Chip(
                                  elevation: 2,
                                  label: Text("Private"),
                                  backgroundColor: _visibilitycolor[2],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 40.0, top: 20),
                              child: Center(
                                  child: Text(
                                "Max members:",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Arial',
                                  fontSize: 16,
                                  color: Color.fromARGB(223, 94, 93, 92),
                                ),
                              )),
                            ),
                            Spacer(),
                            Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Slider(
                                activeColor: Color.fromARGB(255, 150, 110, 95),
                                value: _value,
                                onChanged: (newValue) {
                                  setState(() {
                                    _value = newValue;
                                  });
                                },
                                min: 0,
                                max: 100,
                                divisions: 100,
                                label: _value.round().toString(),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 10.0, top: 20),
                              child: Chip(
                                backgroundColor: Colors.brown,
                                label: Text(_value.floor().toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 40.0, top: 20),
                              child: Center(
                                  child: Text(
                                "Admin Only:",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Arial',
                                  fontSize: 16,
                                  color: Color.fromARGB(223, 94, 93, 92),
                                ),
                              )),
                            ),
                            Spacer(),
                            Container(
                              margin: EdgeInsets.only(top: 20, right: 10),
                              child: Switch(
                                  activeTrackColor:
                                      Color.fromARGB(255, 181, 139, 139),
                                  hoverColor: Colors.white,
                                  value: on,
                                  onChanged: ((value) {
                                    setState(() {
                                      on = value;
                                    });
                                  })),
                            )
                          ],
                        ),
                        ElevatedButton(
                            onPressed: () async {
                              await communitydata.addCommunity(
                                  communityname!,
                                  dropdownValue!,
                                  visChoice!,
                                  _value.round(),
                                  on);
                            },
                            child: Text("Create")),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
