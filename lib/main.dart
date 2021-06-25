import 'package:flutter/material.dart';
import 'package:the_quiz/screen/screen_home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Quiz App',
      home: HomeScreen(),
    );
  }
}