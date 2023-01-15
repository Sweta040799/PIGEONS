import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pigeons/components/my_button.dart';
import 'package:pigeons/components/my_textfield.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

// text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void registerUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 100),
              Text(
                'Create Account',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blueGrey[600], fontSize: 30),
              ),
              Image.asset('lib/images/pigeon.png', height: 100,alignment: Alignment.bottomRight,),
              const SizedBox(height: 30),
              //name
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      hintText: 'Name',
                      hintStyle: TextStyle(color: Colors.grey[500])),
                ),
              ),
              // name ends
              const SizedBox(height: 20,),
              MyTextField(
                  controller: usernameController,
                  hintText: 'Username',
                  obscureText: false),
              const SizedBox(height: 20),
              MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true),
              const SizedBox(height: 20),
              MyTextField(
                  controller: passwordController,
                  hintText: 'Confirm Password',
                  obscureText: true),
              const SizedBox(height: 30),
              MyButton(onTap: registerUserIn),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(width: 4),
                  TextButton(
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue),
                      ),
                      child: const Text('Sign In'),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }

// @override
// State<StatefulWidget> createState() {
//   // TODO: implement createState
//   throw UnimplementedError();
// }

}
