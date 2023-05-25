import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:user_tourist/Authentication/LoginPage.dart';
import 'package:user_tourist/utils/universal_variables.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 7), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => LoginPageContent()));
    });
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 247, 232, 217),
      body: Container(
        height: _size.height,
        width: _size.width,
        child: Column(
          children: [
            SizedBox(
              height: 150.0,
            ),
            Lottie.asset('assets/images/travel.json'),
            AnimatedTextKit(
              animatedTexts: [
                RotateAnimatedText(
                  'TRAVEL HERE',
                  textStyle: TextStyle(
                      fontStyle: FontStyle.italic,
                      letterSpacing: 4,
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffFDC858)),
                ),
                RotateAnimatedText('TOUR ALL TIME',
                    textStyle: TextStyle(
                        letterSpacing: 7,
                        fontStyle: FontStyle.normal,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 127, 106, 232))),
              ],
              // isRepeatingAnimation: true,
              // totalRepeatCount: 10,
              pause: Duration(milliseconds: 1000),
            ),

            // Text(
            //   'TRAVEL HERE',
            //   style: TextStyle(
            //     fontStyle: FontStyle.italic,
            //       fontSize: 30.0,
            //       fontWeight: FontWeight.bold,
            //       color: Color.fromARGB(255, 245, 158, 44)),
            // )
          ],
        ),
      ),
      // persistentFooterButtons: [
      //   Align(
      //     alignment: Alignment.center,
      //     child: Lottie.asset('assets/images/loadingblue.json',
      //         height: 80.0, width: 80.0),
      //   )
      // ],
    );
  }
}
