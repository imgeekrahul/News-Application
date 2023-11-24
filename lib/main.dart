import 'package:flutter/material.dart';
import 'package:news_application_mvc/view/home.dart';
import 'package:news_application_mvc/view/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  bool showingSplash = true;
  LoadHome() {
    Future.delayed(Duration(seconds: 3), () {
      showingSplash = false;
    });
    showingSplash = false;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LoadHome();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News Snack',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: showingSplash ? SplashScreen() : HomeScreen(),
    );
  }
}
