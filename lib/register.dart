import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pigeons/AuthFuncs/phone_Auth.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _phone = TextEditingController();
  final _username = TextEditingController();
  FocusNode f1 = FocusNode();
  FocusNode f2 = FocusNode();
  FocusNode f3 = FocusNode();
  FocusNode f4 = FocusNode();
  FocusNode f5 = FocusNode();
  FocusNode f6 = FocusNode();

  bool _unique = false;

  var page = 0;

  bool wait = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  TextEditingController t3 = TextEditingController();
  TextEditingController t4 = TextEditingController();
  TextEditingController t5 = TextEditingController();
  TextEditingController t6 = TextEditingController();
  final PageController p = PageController();

  @override
  Widget build(BuildContext context) {
    var contextreal = context;
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Set the status bar color to white
      statusBarBrightness:
          Brightness.dark, // Set the status bar brightness to dark
      statusBarIconBrightness:
          Brightness.light, // Set the status bar icon brightness to dark
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.indigo[400],
          child:
              const Text("Skip", style: TextStyle(fontWeight: FontWeight.bold)),
          onPressed: () {
            if (page < 3) page++;
            //print(page);
            p.animateToPage(page,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn);
          },
        ),
        resizeToAvoidBottomInset: false,
        body: PageView(
          onPageChanged: (value) {
            page = value;
          },
          controller: p,
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    Transform.rotate(
                        angle: 0 * 3.1416 / 180,
                        child: ClipPath(
                            clipper: SShapeClipper(),
                            child: Container(
                              height: 200,
                              width: double.infinity,
                              color: Colors.blue,
                              child: const Image(
                                image: AssetImage("images/night.png"),
                                fit: BoxFit.fitWidth,
                              ),
                            ))),
                    BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        color: Colors.transparent,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 200,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 25.0),
                              child: Text("Welcome",
                                  style: TextStyle(
                                      fontFamily: 'Trochut',
                                      fontSize: 50,
                                      color: Colors.indigo)),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 25.0, right: 15),
                              child: FittedBox(
                                child: Text(
                                    "To start with we need your phone number",
                                    style: TextStyle(
                                        fontFamily: 'PT Serif',
                                        fontSize: 20,
                                        color: Color.fromARGB(
                                            255, 148, 159, 223))),
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            Row(
                              children: [
                                Container(
                                    margin: const EdgeInsets.only(
                                        right: 5, left: 40),
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        // border: Border.all(),
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color.fromARGB(
                                            255, 228, 223, 223)),
                                    child: const Center(
                                      child: Text(
                                        "+91",
                                        style: TextStyle(fontSize: 20),
                                        textAlign: TextAlign.center,
                                      ),
                                    )),
                                Container(
                                  margin:
                                      const EdgeInsets.only(right: 5, left: 10),
                                  height: 50,
                                  width: 200,
                                  decoration: BoxDecoration(
                                      // border: Border.all(),
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color.fromARGB(
                                          255, 247, 244, 244)),
                                  child: Center(
                                    child: TextField(
                                      controller: _phone,
                                      keyboardType: TextInputType.number,
                                      maxLength: 10,
                                      maxLengthEnforcement:
                                          MaxLengthEnforcement.enforced,
                                      buildCounter: (BuildContext context,
                                              {int? currentLength,
                                              int? maxLength,
                                              bool? isFocused}) =>
                                          null,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        overflow: TextOverflow.clip,
                                        letterSpacing: 2.5,
                                        fontFamily: 'Roboto',
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Phone no.",
                                        hintStyle: TextStyle(
                                            fontFamily: 'PT Serif',
                                            letterSpacing: 0.5,
                                            fontSize: 17,
                                            color: Colors.grey),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  borderRadius: BorderRadius.circular(16),
                                  //customBorder: CircleBorder(),
                                  onTap: () async {
                                    setState(() {
                                      wait = true;
                                    });

                                    final response = await PhoneAuth(
                                            phoneNo: "+91${_phone.text}",
                                            smsCode: "")
                                        .validate();
                                    setState(() {
                                      wait = false;
                                    });
                                    print(response);
                                    //await sendOtp();
                                    response == "200"
                                        ? showModalBottomSheet(
                                            context: context,
                                            builder: (context) {
                                              return Container(
                                                // padding: EdgeInsets.only(
                                                //     bottom: MediaQuery.of(context)
                                                //         .viewInsets
                                                //         .bottom),
                                                height: MediaQuery.of(context)
                                                            .size
                                                            .height /
                                                        3 +
                                                    MediaQuery.of(context)
                                                        .viewInsets
                                                        .bottom,
                                                child: Otp(
                                                  t1: t1,
                                                  t2: t2,
                                                  t3: t3,
                                                  t4: t4,
                                                  t5: t5,
                                                  t6: t6,
                                                  f2: f2,
                                                  f3: f3,
                                                  f4: f4,
                                                  f1: f1,
                                                  f5: f5,
                                                  f6: f6,
                                                  pagecontroller: p,
                                                  context: context,
                                                  phoneNo: _phone.text,
                                                ),
                                              );
                                            })
                                        : showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                                  content: Text(response),
                                                ));
                                  },
                                  child: Container(
                                    // padding: EdgeInsets.all(5),
                                    margin: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      //border: Border.all(),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: wait
                                        ? SizedBox(
                                            height: 20,
                                            width: 20,
                                            child: CircularProgressIndicator(
                                                color: Colors.indigo))
                                        : Icon(
                                            Icons.send,
                                            color: Colors.indigo,
                                          ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
            Column(
              children: [
                Stack(
                  children: [
                    Transform.rotate(
                      angle: 0 * 3.1416 / 180,
                      child: ClipPath(
                        clipper: SShapeClipper(),
                        child: Container(
                          height: 200,
                          width: double.infinity,
                          color: Colors.blue,
                          child: const Image(
                            image: AssetImage("images/night.png"),
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    ),
                    BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        color: Colors.transparent,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 200,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 25.0),
                              child: Text("Your Nickname",
                                  style: TextStyle(
                                      fontFamily: 'Trochut',
                                      fontSize: 50,
                                      color: Colors.indigo)),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 25.0, right: 15),
                              child: FittedBox(
                                child: Text("Please choose a unique name.",
                                    style: TextStyle(
                                        fontFamily: 'PT Serif',
                                        fontSize: 20,
                                        color: Color.fromARGB(
                                            255, 148, 159, 223))),
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // padding: EdgeInsets.all(5),
                                  margin:
                                      const EdgeInsets.only(top: 30, left: 10),
                                  decoration: BoxDecoration(
                                    //border: Border.all(),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Icon(
                                    _unique
                                        ? Icons.done
                                        : Icons.cancel_outlined,
                                    color: _unique ? Colors.green : Colors.red,
                                  ),
                                ),
                                Column(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(
                                          right: 10, left: 25, top: 50),
                                      height: 50,
                                      width: 250,
                                      decoration: BoxDecoration(
                                          // border: Border.all(),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: const Color.fromARGB(
                                              255, 247, 244, 244)),
                                      child: Center(
                                        child: TextField(
                                          controller: _username,
                                          keyboardType: TextInputType.name,
                                          maxLength: 10,
                                          maxLengthEnforcement:
                                              MaxLengthEnforcement.enforced,
                                          buildCounter: (BuildContext context,
                                                  {int? currentLength,
                                                  int? maxLength,
                                                  bool? isFocused}) =>
                                              null,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            overflow: TextOverflow.clip,
                                            letterSpacing: 2.5,
                                            fontFamily: 'Roboto',
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          decoration: const InputDecoration(
                                              border: InputBorder.none,
                                              hintText: "test@123",
                                              hintStyle: TextStyle(
                                                  fontFamily: 'PT Serif',
                                                  letterSpacing: 0.5,
                                                  fontSize: 17,
                                                  color: Colors.grey)),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          left: 25, top: 5),
                                      width: 250,
                                      child: !_unique
                                          ? const Text("Name not available",
                                              style: TextStyle(
                                                  fontFamily: 'PT Serif',
                                                  fontSize: 14,
                                                  color: Color.fromARGB(
                                                      255, 248, 87, 47)))
                                          : null,
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 16),
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(10),
                                    //customBorder: CircleBorder(),
                                    onTap: _unique ? () {} : null,
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                          top: 5, right: 5),
                                      margin: const EdgeInsets.only(
                                          top: 0, left: 10),
                                      decoration: BoxDecoration(
                                        //border: Border.all(),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Icon(
                                        Icons.send,
                                        color: _unique
                                            ? Colors.indigo
                                            : Colors.grey,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Column(
              children: [
                Stack(children: [
                  Transform.rotate(
                    angle: 0 * 3.1416 / 180,
                    child: ClipPath(
                      clipper: SShapeClipper(),
                      child: Container(
                        height: 200,
                        width: double.infinity,
                        color: Colors.blue,
                        child: const Image(
                          image: AssetImage("images/night.png"),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 200,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 25.0),
                            child: Text(
                              "Profile Picture",
                              style: TextStyle(
                                  fontFamily: 'Trochut',
                                  fontSize: 50,
                                  color: Colors.indigo),
                            ),
                          ),
                          const Padding(
                            padding:
                                EdgeInsets.only(left: 25.0, right: 15, top: 10),
                            child: FittedBox(
                              child: Text(
                                "You can always change it in \"My Accounts\"",
                                style: TextStyle(
                                  fontFamily: 'PT Serif',
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 148, 159, 223),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(
                                bottom: 20, top: 40, left: 20, right: 20),
                            child: InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    builder: ((context) {
                                      return Container(
                                        height: 100,
                                        decoration: const BoxDecoration(
                                          color: Colors.transparent,
                                        ),
                                        //color: Colors.transparent,
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20),
                                            ),
                                            color: Color.fromARGB(
                                                255, 81, 94, 168),
                                          ),
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Material(
                                                  color: Colors.transparent,
                                                  child: InkWell(
                                                    onTap: _opencamera,
                                                    child: Row(
                                                      children: const [
                                                        SizedBox(width: 20),
                                                        Icon(
                                                          Icons.camera,
                                                          color: Color.fromARGB(
                                                              255,
                                                              247,
                                                              230,
                                                              174),
                                                        ),
                                                        SizedBox(width: 30),
                                                        Text("Take a photo",
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'Arial',
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .white60)),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Material(
                                                  color: Colors.transparent,
                                                  child: InkWell(
                                                    onTap: _opengallery,
                                                    child: Row(children: [
                                                      const SizedBox(width: 20),
                                                      const Icon(
                                                        Icons.photo_album,
                                                        color: Color.fromARGB(
                                                            255, 247, 230, 174),
                                                      ),
                                                      const SizedBox(width: 30),
                                                      const Text(
                                                          "Select from gallery",
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Arial',
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: Colors
                                                                  .white60)),
                                                    ]),
                                                  ),
                                                ),
                                              ]),
                                        ),
                                      );
                                    }));
                              },
                              child: CircleAvatar(
                                backgroundImage:
                                    image != null ? FileImage(image!) : null,
                                child: const Text("Click to Edit",
                                    style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                                radius: MediaQuery.of(context).size.width / 4,
                              ),
                            ),
                          ),
                          Center(
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.send,
                                  color: Colors.indigo,
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                ])
              ],
            )
          ],
        ),
      ),
    );
  }

  File? image;
  Future<void> _opencamera() async {
    final file = await ImagePicker().pickImage(source: ImageSource.camera);

    setState(() {
      image = File(file!.path);
    });
  }

  Future<void> _opengallery() async {
    final file = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      image = File(file!.path);
    });
  }
}

class Otp extends StatefulWidget {
  String phoneNo = "";

  Otp({
    Key? key,
    required this.t1,
    required this.t2,
    required this.t3,
    required this.t4,
    required this.t5,
    required this.t6,
    required this.f1,
    required this.f2,
    required this.f3,
    required this.f4,
    required this.f5,
    required this.f6,
    required this.phoneNo,
    required this.context,
    required this.pagecontroller,
  }) : super(key: key);

  final TextEditingController t1;
  final TextEditingController t2;
  final TextEditingController t3;
  final TextEditingController t4;
  final TextEditingController t5;
  final TextEditingController t6;
  final FocusNode f1;
  final FocusNode f2;
  final FocusNode f3;
  final FocusNode f4;
  final FocusNode f5;
  final FocusNode f6;
  var context;
  final PageController pagecontroller;
  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  var otpWait = false;
  int p = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20, bottom: 20, top: 20),
          child: const Text(
            "Enter Otp",
            style: TextStyle(
              fontFamily: 'Arial',
              fontSize: 18,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: widget.t1,
                  onChanged: ((value) {
                    print("object");
                    if (value != "") {
                      print("change");
                      FocusScope.of(context).requestFocus(widget.f2);
                    }
                  }),
                  focusNode: widget.f1,
                  keyboardType: TextInputType.number,
                  maxLength: 1,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  buildCounter: (BuildContext context,
                          {int? currentLength,
                          int? maxLength,
                          bool? isFocused}) =>
                      null,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    overflow: TextOverflow.clip,
                    letterSpacing: 2.5,
                    fontFamily: 'Roboto',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  focusNode: widget.f2,
                  onChanged: ((value) {
                    print("object");
                    if (value != null) {
                      print("change");
                      FocusScope.of(context).requestFocus(widget.f3);
                    }
                  }),
                  controller: widget.t2,
                  keyboardType: TextInputType.number,
                  maxLength: 1,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  buildCounter: (BuildContext context,
                          {int? currentLength,
                          int? maxLength,
                          bool? isFocused}) =>
                      null,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    overflow: TextOverflow.clip,
                    letterSpacing: 2.5,
                    fontFamily: 'Roboto',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  focusNode: widget.f3,
                  onChanged: ((value) {
                    print("object");
                    if (value != null) {
                      print("change");
                      FocusScope.of(context).requestFocus(widget.f4);
                    }
                  }),
                  controller: widget.t3,
                  keyboardType: TextInputType.number,
                  maxLength: 1,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  buildCounter: (BuildContext context,
                          {int? currentLength,
                          int? maxLength,
                          bool? isFocused}) =>
                      null,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    overflow: TextOverflow.clip,
                    letterSpacing: 2.5,
                    fontFamily: 'Roboto',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  focusNode: widget.f4,
                  controller: widget.t4,
                  onChanged: ((value) {
                    print("object");
                    if (value != null) {
                      print("change");
                      FocusScope.of(context).requestFocus(widget.f5);
                    }
                  }),
                  keyboardType: TextInputType.number,
                  maxLength: 1,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  buildCounter: (BuildContext context,
                          {int? currentLength,
                          int? maxLength,
                          bool? isFocused}) =>
                      null,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    overflow: TextOverflow.clip,
                    letterSpacing: 2.5,
                    fontFamily: 'Roboto',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  focusNode: widget.f5,
                  controller: widget.t5,
                  onChanged: ((value) {
                    print("object");
                    if (value != null) {
                      print("change");
                      FocusScope.of(context).requestFocus(widget.f6);
                    }
                  }),
                  keyboardType: TextInputType.number,
                  maxLength: 1,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  buildCounter: (BuildContext context,
                          {int? currentLength,
                          int? maxLength,
                          bool? isFocused}) =>
                      null,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    overflow: TextOverflow.clip,
                    letterSpacing: 2.5,
                    fontFamily: 'Roboto',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  focusNode: widget.f6,
                  controller: widget.t6,
                  onChanged: (value) async {
                    print(value);
                    String? enteredOtp =
                        "${widget.t1.text}${widget.t2.text}${widget.t3.text}${widget.t4.text}${widget.t5.text}${widget.t6.text}";
                    print(enteredOtp);
                    setState(() {
                      otpWait = true;
                    });

                    final response = await PhoneAuth(
                            phoneNo: "+91${widget.phoneNo}",
                            smsCode: enteredOtp)
                        .signInWIthPhone();
                    setState(() {
                      otpWait = false;
                    });

                    widget.t1.clear();
                    widget.t2.clear();
                    widget.t3.clear();
                    widget.t4.clear();
                    widget.t5.clear();
                    widget.t6.clear();
                    if (response == "200") {
                      Navigator.of(context).pop();
                      FocusScopeNode currentFocus = FocusScope.of(context);
                      // If the current focus scope is not null, close the keyboard
                      if (!currentFocus.hasPrimaryFocus) {
                        currentFocus.unfocus();
                      }
                      ScaffoldMessenger.of(widget.context)
                          .showSnackBar(SnackBar(
                        content: Text("Signed in as ${widget.phoneNo}"),
                        duration: Duration(seconds: 4),
                      ));
                      widget.pagecontroller.jumpToPage(1);
                    } else {
                      showDialog(
                          context: context,
                          builder: ((context) => AlertDialog(
                                content: Text("$response"),
                              )));
                      widget.t1.clear();
                      widget.t2.clear();
                      widget.t3.clear();
                      widget.t4.clear();
                      widget.t5.clear();
                      widget.t6.clear();
                    }
                  },
                  keyboardType: TextInputType.number,
                  maxLength: 1,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  buildCounter: (BuildContext context,
                          {int? currentLength,
                          int? maxLength,
                          bool? isFocused}) =>
                      null,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    overflow: TextOverflow.clip,
                    letterSpacing: 2.5,
                    fontFamily: 'Roboto',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              if (otpWait)
                SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(),
                ),
            ],
          ),
        ),
        const Spacer(
          flex: 10,
        ),
        Row(
          children: [
            const Spacer(),
            const Padding(
              padding: EdgeInsets.only(right: 18.0, top: 8),
              child: Text(
                "Did not receive otp?",
                style: TextStyle(fontFamily: 'Arial', fontSize: 15),
              ),
            ),
            if (p < 10) Text((10 - (p++)).toString()),
          ],
        ),
        const Spacer(),
        Row(children: [
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextButton(
              onPressed: p < 10
                  ? null
                  : (() async {
                      setState(() {});
                      final response = await PhoneAuth(
                              phoneNo: "+91" + widget.phoneNo, smsCode: "")
                          .sendOtpAgain();
                      p = 0;
                      if (response == "200") {
                        widget.t1.clear();
                        widget.t2.clear();
                        widget.t3.clear();
                        widget.t4.clear();
                        widget.t5.clear();
                        widget.t6.clear();
                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("otp resent"),
                        ));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(response),
                        ));
                        widget.t1.clear();
                        widget.t2.clear();
                        widget.t3.clear();
                        widget.t4.clear();
                        widget.t5.clear();
                        widget.t6.clear();
                      }
                      print("send again");
                    }),
              child: FittedBox(
                child: Text(
                  otpWait ? "please wait" : "Send Again",
                  style: const TextStyle(
                      fontFamily: 'Baloo Tammudu 2',
                      fontSize: 16,
                      color: Colors.indigo),
                ),
              ),
            ),
          )
        ]),
      ],
    );
  }
}

class SShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();

    path.lineTo(0, size.height * 0.5);

    final double xControlPoint = size.width * 0.25;
    final double yControlPoint = size.height * 0.25;
    final Offset controlPoint = Offset(xControlPoint, yControlPoint);
    final double xEndPoint = size.width * 0.5;
    final double yEndPoint = size.height * 0.5;
    final Offset endPoint = Offset(xEndPoint, yEndPoint);

    path.quadraticBezierTo(
      controlPoint.dx,
      controlPoint.dy,
      endPoint.dx,
      endPoint.dy,
    );

    final double xControlPoint2 = size.width * 0.75;
    final double yControlPoint2 = size.height * 0.75;
    final Offset controlPoint2 = Offset(xControlPoint2, yControlPoint2);
    final double xEndPoint2 = size.width;
    final double yEndPoint2 = size.height * 0.5;
    final Offset endPoint2 = Offset(xEndPoint2, yEndPoint2);

    path.quadraticBezierTo(
      controlPoint2.dx,
      controlPoint2.dy,
      endPoint2.dx,
      endPoint2.dy,
    );

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
