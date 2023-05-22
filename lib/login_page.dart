import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';

//import 'register_page.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pigeons/AuthFuncs/email_signin.dart';
import 'package:pigeons/explore.dart';
import 'package:pigeons/providers/user.dart';
import 'package:pigeons/register.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  // LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Set the status bar color to white
      statusBarBrightness:
          Brightness.dark, // Set the status bar brightness to dark
      statusBarIconBrightness:
          Brightness.light, // Set the status bar icon brightness to dark
    ));
    var statusbarheight = MediaQuery.of(context).padding.top;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              child: const Image(
                fit: BoxFit.cover,
                image: AssetImage("images/night.png"),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(
                    child: Transform.rotate(
                        angle: 180 * 3.1416 / 180,
                        child: ClipPath(
                          clipper: MyCustomClipper(),
                          child: Container(
                              decoration: BoxDecoration(
                                //  border: Border.all(),
                                color: Color.fromARGB(238, 255, 255, 255),
                              ),
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height / 2.2,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [const login()],
                              )),
                        )),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 100, left: 20),
              // color: Colors.grey,
              height: MediaQuery.of(context).size.height / 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Get Started with ",
                    style: TextStyle(
                        fontFamily: 'Trochut',
                        fontSize: 50,
                        color: Colors.white54),
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Text(
                        "Pigeons",
                        style: TextStyle(
                            fontFamily: 'Trochut',
                            fontSize: 50,
                            color: Color.fromARGB(255, 217, 211, 159)),
                      ),
                      Positioned(
                        right: -30,
                        child: CircleAvatar(
                          radius: 15,
                          backgroundImage: AssetImage('images/pigonsicon.png'),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text("\"Combining Streaming with community!\"",
                      style: TextStyle(
                          fontFamily: 'PT Serif',
                          fontSize: 15,
                          color: Color.fromARGB(255, 255, 255, 255)))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class login extends StatefulWidget {
  const login({
    Key? key,
  }) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  var _emailCon = TextEditingController();
  var _passCon = TextEditingController();

  bool waitForSignIn = false;
  Future<String> signUp() async {
    try {
      print("${_emailCon.text} ${_passCon.text}");
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailCon.text,
        password: _passCon.text,
      );
      print(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      } else {
        print("unknown");
      }
      return e.code;
    } catch (e) {
      print("hi");
      print(e);
      return e.toString();
    }
    return "200";
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    final userdata = Provider.of<Users>(context, listen: false);
    return LayoutBuilder(builder: (context, cns) {
      return Transform.rotate(
        angle: 180 * 3.1416 / 180,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Row(
                    children: [
                      Text(
                        "First Time? ",
                        style: TextStyle(
                            fontFamily: 'Arial',
                            fontStyle: FontStyle.italic,
                            color: Colors.grey),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Register()));
                          },
                          child: Text(
                            " Register",
                            style: TextStyle(
                                color: Colors.indigo,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height / (2.5 * 1.5),
              width: cns.maxWidth - 50,
              decoration: const BoxDecoration(
                  //color: Colors.amber,
                  //border: Border.all(color: Colors.black),
                  ),
              alignment: Alignment.bottomCenter,
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                          left: 25, right: 25, bottom: 20),
                      //  decoration:
                      //  decoration: BoxDecoration(border: Border.all()),
                      //color: Color.fromARGB(87, 216, 209, 209),
                      child: TextFormField(
                        controller: _emailCon,
                        decoration: InputDecoration(
                          hintText: "Email/Phone",
                          hintStyle: const TextStyle(
                              color: Colors.grey, fontFamily: 'Arial'),
                          prefixIcon: const Icon(Icons.person),
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 77, 74, 74),
                              )),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 0,
                              ),
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 25, right: 25),
                      //  decoration:
                      //  decoration: BoxDecoration(border: Border.all()),
                      //color: Color.fromARGB(87, 216, 209, 209),
                      child: TextFormField(
                        controller: _passCon,
                        decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: const TextStyle(
                              color: Colors.grey, fontFamily: 'Arial'),
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: const Icon(Icons.visibility),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 0,
                              ),
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                      ),
                      margin: const EdgeInsets.only(
                          left: 25, right: 25, bottom: 0, top: 5),
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(255, 105, 10, 222)),
                        ),
                        onPressed: () async {
                          setState(() {
                            waitForSignIn = true;
                          });

                          final response = await EmailPassSignin(
                                  email: _emailCon.text,
                                  password: _passCon.text)
                              .signIn();
                          if (!(response == "200")) {
                            showDialog(
                                builder: (context) =>
                                    AlertDialog(title: Text(response)),
                                context: context);
                          } else {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Explore()),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("You are signed in")));
                          }
                          setState(() {
                            waitForSignIn = false;
                          });

                          // if (!(response == "200")) {
                          //   print("signing up");
                          //   final response = await EmailPassSignin(
                          //           email: _emailCon.text,
                          //           password: _passCon.text)
                          //       .signUp();
                        }
                        // final k = await signUp();
                        // print(k);
                        ,
                        child: waitForSignIn == false
                            ? Text(
                                "Sign In",
                                style: TextStyle(
                                    fontFamily: 'PT Serif', fontSize: 22),
                              )
                            : Container(
                                height: 25,
                                width: 25,
                                child: CircularProgressIndicator(
                                    color: Colors.white)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text(
                            "Forgot Password?",
                            style: TextStyle(fontFamily: 'Arial'),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 4,
                  height: 1,
                  color: Colors.grey,
                ),
                const FittedBox(
                  child: Text(
                    "Or Sign In With",
                    style: TextStyle(fontFamily: 'Arial'),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 4,
                  height: 1,
                  color: Colors.grey,
                ),
              ],
            ),
            //Spacer(),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () async {
                      print("object");
                      final cred = await signInWithGoogle();
                      if (cred.user! != null) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                                title: Text(
                                    "signed in as ${cred.user!.displayName!}"));
                          },
                        );
                        bool isPresent =
                            await userdata.checkUser(cred.user!.email!);
                        if (isPresent == false) {
                          await userdata.createNewUser(
                              cred.user!.displayName,
                              cred.user!.email,
                              cred.user!.phoneNumber,
                              cred.user!.photoURL,
                              false);
                        }

                        await userdata.fetchUserDetails(cred.user!.email!);

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => const Explore(),
                          ),
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                                title: Text("Some error occured"));
                          },
                        );
                      }
                      print(cred.user!.displayName!);
                    },
                    child: const CircleAvatar(
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage("images/google2.png"),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const CircleAvatar(
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage("images/fb.png"),
                  )
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width * 0.5, size.height);
    path.quadraticBezierTo(
        size.width * 0.8, size.height, size.width, size.height * 0.7);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
