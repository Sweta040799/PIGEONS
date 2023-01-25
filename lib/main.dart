// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pigeons/end_drawer.dart';
import './my_account.dart';
import './end_drawer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: new MediaQueryData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyAccount(),
      ),
    );
  }
}
