import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
    runApp( MyApp());
}

class MyApp extends StatelessWidget{

    @override
    Widget build(BuildContext context){
        return MaterialApp(
            title: 'Pigeon Live Streaming',
            home: HomePage(),
        ); 
        }
    }

   class HomePage extends StatelessWidget{
    HomePage ({super.key});
    
   final liveIDController=TextEditingController(
    text: Random().nextInt(900000+100000).toString(),
   );

    @override
    Widget build(BuildContext context){
        var buttonStyle=ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff034ada),
            shape:RoundedRectangleBorder(
                borderRadius:BorderRadius.circular(10),
            ),// RoundRectangleBorder
        );

        return Scaffold(
            body: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal:24,
                ),
                child:Column(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        SvgPicture.asset(
                            'assets/header_illustraion.svg',width:MediaQuery.of(context).size.width*0.7,
                        ), 
                    Text('Your UserId:'),
                      const SizedBox(
                        height:20,
                        ),//SizedBox
                     Text('Please test with two or more devices'),
                const SizedBox(
                        height:30,
                        ),
                        TextFormField(
                            controller: liveIDController,
                            decoration: InputDecoration(
                                labelText: 'Join or Start a Live by Input an ID',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  
                                  
                                    Radius.circular(10)
                                    ),
                            ),
                            ),
                        ),
                        const SizedBox(
                            height: 20,
                        ),//SizedBox
                        ElevatedButton(
                            style: buttonStyle,
                            child:const Text('Start a Live'),
                            onPressed:(){},
                        ),//ElevatedButton
                        SizedBox(
                            height:16,
                        ), //SizedBox
                        ElevatedButton(
                            style:buttonStyle,
                            child:const Text('Join a Live'),
                            onPressed:(){},
                        )
                    ],
                ),
                ),
                );
        }

        jumpToLivePage(BuildContext context,{required String liveID, required bool isHost}){
    
    }
}