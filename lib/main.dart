import 'package:flutter/material.dart';
import 'package:the_news/view/splash_screnn.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.light, primaryColor: Colors.amber[800]),
      home: const splashScreenWidget(),
    );
  }
}
