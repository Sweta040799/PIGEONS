import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:pigeons/register.dart';

class PhoneAuth {
  String phoneNo;

  String smsCode = "";

  static String ver = "";
  static int? resendToken;
  PhoneAuth({required this.phoneNo, required this.smsCode});

  Future<String> validate() async {
    var error = "200";

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNo,
      verificationCompleted: (PhoneAuthCredential credential) async {
        print("You are verified");
        await FirebaseAuth.instance.signInWithCredential(credential);
        print(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        error = e.code;
        //  print(error);
        // print(e.code);
      },
      codeSent: (String verificationId, int? resendToken) {
        ver = verificationId;
        print("id $ver");
        resendToken = resendToken;

        // Sign the user in (or link) with the credential
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
    print(error);
    return error;
  }

  Future<String> signInWIthPhone() async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: ver,
        smsCode: smsCode,
      );
      print("start signin");
      await FirebaseAuth.instance.signInWithCredential(credential);
      // User is signed in
    } catch (e) {
      // Handle sign-in error

      return e.toString();
    }
    return "200";
  }

  Future<String> sendOtpAgain() async {
    String error = "200";
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNo,
        forceResendingToken: resendToken,
        verificationCompleted: (PhoneAuthCredential credential) async {
          print("You are verified");
          await FirebaseAuth.instance.signInWithCredential(credential);
          print(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          error = e.code;
          print(e.code);
        },
        codeSent: (String verificationId, int? resendToken) {
          ver = verificationId;
          print("id $ver");

          // Sign the user in (or link) with the credential
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      error = e.toString();
    }
    return error;
  }
}
