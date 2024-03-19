// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, camel_case_types

// import 'dart:async';
import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:the_news/view/home.dart';

class splashScreenWidget extends StatefulWidget {
  const splashScreenWidget({super.key});

  @override
  State<splashScreenWidget> createState() => _splashScreenWidgetState();
}

class _splashScreenWidgetState extends State<splashScreenWidget> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeWidget()));
    });
  }

  double getSmallDiameter(BuildContext context) => MediaQuery.of(context).size.width * 2 / 3;
  double getBigDiameter(BuildContext context) => MediaQuery.of(context).size.height * 7 / 8;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Align(
        alignment: Alignment.center,
        child: Stack(
          children: [
            Positioned(
              left: -getSmallDiameter(context) / 2,
              top: -getSmallDiameter(context) / 3,
              child: Container(
                width: getSmallDiameter(context),
                height: getSmallDiameter(context),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.amber.withOpacity(0.4),
                      blurRadius: 200.0,
                      spreadRadius: 100.0, // Adjust spreadRadius for the desired shadow spread
                    ),
                  ],
                ),
                child: ClipOval(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                    child: Container(
                      color: Colors.transparent,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              right: -getSmallDiameter(context) / 2,
              bottom: -getSmallDiameter(context),
              child: Container(
                width: getSmallDiameter(context),
                height: getSmallDiameter(context),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.amber.withOpacity(0.4),
                      blurRadius: 200.0,
                      spreadRadius: 100.0, // Adjust spreadRadius for the desired shadow spread
                    ),
                  ],
                ),
                child: ClipOval(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                    child: Container(
                      color: Colors.transparent,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              child: Align(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      child: Image.asset(
                        'Assets/splashscreen.png',
                        height: getBigDiameter(context),
                        width: getBigDiameter(context),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
                child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: getBigDiameter(context) / 2,
                  ),
                  Text(
                    'TOP HEADLINES',
                    style: GoogleFonts.lora(letterSpacing: .6, color: Colors.grey.shade700, fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'News for you from around the world',
                    style: GoogleFonts.lora(letterSpacing: .6, color: Colors.grey.shade400, fontSize: 18),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SpinKitChasingDots(
                    color: Colors.amber[700],
                    size: 40,
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
