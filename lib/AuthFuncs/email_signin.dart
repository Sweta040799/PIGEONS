import 'package:firebase_auth/firebase_auth.dart';

class EmailPassSignin {
  String email;
  String password;
  EmailPassSignin({required this.email, required this.password});

  Future<String> signUp() async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      return e.code;
    } catch (e) {
      print("hi");
      print(e);
      return e.toString();
    }
    return "200";
  }

  Future<String> signIn() async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return e.code;
    } catch (e) {
      print(e);
      return e.toString();
    }
    return "200";
  }
}
