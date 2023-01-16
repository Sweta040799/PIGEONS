// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import './my_account.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: new MediaQueryData(),
      child: MaterialApp(
        home: MyAccount(),
      ),
    );
  }
}
