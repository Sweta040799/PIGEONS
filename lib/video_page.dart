import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pigeon Live Streaming',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final liveIDController = TextEditingController(
      //text: "10",
      );

  @override
  Widget build(BuildContext context) {
    var buttonStyle = ElevatedButton.styleFrom(
      backgroundColor: const Color(0xff034ada),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ), // RoundRectangleBorder
    );

    return Scaffold(
      body: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/night.png',
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height * 0.5,
              ),
              Text('Your UserId:'),
              const SizedBox(
                height: 20,
              ), //SizedBox
              Text('Please test with two or more devices'),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                onChanged: (value) {
                  print(value);
                },
                controller: liveIDController,
                decoration: InputDecoration(
                  labelText: 'Join or Start a Live by Input an ID',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ), //SizedBox
              ElevatedButton(
                style: buttonStyle,
                child: const Text('Start a Live'),
                onPressed: () {},
              ), //ElevatedButton
              SizedBox(
                height: 16,
              ), //SizedBox
              ElevatedButton(
                style: buttonStyle,
                child: const Text('Join a Live'),
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }

  jumpToLivePage(BuildContext context,
      {required String liveID, required bool isHost}) {}
}
