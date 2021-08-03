import 'package:flutter/material.dart';
import 'package:the_quiz/model/model_quiz.dart';

class AllScreen extends StatelessWidget {
  List<Quiz> allQuizs = [];// 전체 퀴즈들이 담길 리스트

  AllScreen({this.allQuizs});

  List<Widget> _toListTile() {
    List<ListTile> list = [];
    for(int i = 0; i < allQuizs.length; i++){

    }
  }
  
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double height = size.height;
    final double width = size.width;

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