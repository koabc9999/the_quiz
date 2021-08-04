import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:the_quiz/model/model_quiz.dart';
import 'package:the_quiz/screen/screen_home.dart';

class AllQuestionScreen extends StatelessWidget {
  final Quiz quiz;

  AllQuestionScreen({this.quiz});

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(quiz.title),
          backgroundColor: Colors.amber[600],
        ),
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.yellow,
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(20),
            ),
            height: height * 0.78,
            width: width * 0.9,

            child: Column(
              children: <Widget>[
                Padding(padding: EdgeInsets.only(top: height * 0.03)),
                Text(
                  '#' + quiz.index.toString() + '. ' + quiz.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: width * 0.06,
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: height * 0.03)),
                AutoSizeText(
                  quiz.question,
                  textAlign: TextAlign.center,
                  maxLines: 7,
                  style: TextStyle(
                    fontSize: width * 0.036,
                    fontWeight: FontWeight.bold,
                  )
                ),
                Expanded(child: Container()),
                ElevatedButton(
                  child: Text(
                    '홈으로 돌아가기',
                    style: TextStyle(
                      fontSize: width * 0.05,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.amber[600],
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    padding: EdgeInsets.fromLTRB(width * 0.14, height * 0.015, width * 0.14, height * 0.015),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                    );
                  },
                ),
                Padding(padding: EdgeInsets.only(top: height * 0.04)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}