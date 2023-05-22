import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:permission_handler/permission_handler.dart';

class Recording extends StatelessWidget {
  const Recording({super.key});

  Future take_permission() async {
    await Permission.microphone.request();
    var permissionStatus = await Permission.camera.status;
  }

  @override
  Widget build(BuildContext context) {
    print("build() recording");
    return Container(
      height: 40,
      width: 20,
      color: Colors.black54,
    );
  }
}
