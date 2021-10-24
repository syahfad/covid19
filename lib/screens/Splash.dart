import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Start.dart';

class SplashScreen extends StatefulWidget{
  _SplashScreen createState()=> _SplashScreen();
}

class _SplashScreen extends State<SplashScreen>{
  void initState(){
    super.initState();
    splashscreenStart();
  }
  splashscreenStart() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, (){
      Get.off(Start());
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/icon.png',
              height: 220,
              width: 220,
            ),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}