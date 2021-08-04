import 'package:flutter/material.dart';
import 'package:the_quiz/model/model_quiz.dart';
import 'package:the_quiz/screen/screen_all_question.dart';

class AllScreen extends StatelessWidget {
  List<Quiz> allQuizs = [];// 전체 퀴즈들이 담길 리스트

  AllScreen({this.allQuizs});
  
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("전체 문제 보기"),
          backgroundColor: Colors.amber[600],
        ),
        body: ListView.separated(
          itemCount: allQuizs.length,
          itemBuilder:(BuildContext context, int index) {
            return Container(
              height: 50,
              child: ListTile(
                title: Text(allQuizs[index].title),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AllQuestionScreen(
                        quiz: allQuizs[index],
                      ),
                    ),
                  );
                },
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) => const Divider(),
        ),
      ),
    );
  }
}