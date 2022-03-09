import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:quiz/pages/home.dart';
import 'package:quiz/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:ThemeData(primarySwatch: Colors.amber),
      home: SplashScreen(),
    );
  }
}
