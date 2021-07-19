import 'package:flutter/material.dart';
import 'package:the_quiz/model/model_quiz.dart';
import 'package:the_quiz/screen/screen_solution.dart';
import 'package:auto_size_text/auto_size_text.dart';

class QuestionScreen extends StatefulWidget {
  Quiz quiz;
  QuestionScreen({this.quiz});// 해당 클래스를 선언할 때 넣어준 첫번째 인자를 this.quiz에 넣어줌

  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {

  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    return SafeArea(
      child: Scaffold(// 안에 다수의 위젯이 쌓일 수 있게 해주는 위젯
        appBar: AppBar(
          title: Text('무작위 문제'),
          backgroundColor: Colors.amber[600],
        ),
        body: Center(// 위젯이 중심으로 가도록함
          child: Container(
            decoration: BoxDecoration(// 컨테이너가 박스 형태의 테두리를 갖도록 함
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.black),
              color: Colors.yellow,
            ),
            width: width * 0.9,
            height: height * 0.78,

            child: Column(// 내부의 내용을 세로로 정렬함
              children: <Widget>[// 여러개의 위젯을 넣을 수 있게 해줌
                Padding(padding: EdgeInsets.only(top: height * 0.03)),// 여백을 조금 넣어줌
                Container(// 문제의 제목 부분을 넣어줄 부분
                  child: Text(
                    '#' + widget.quiz.index.toString() + '. ' + widget.quiz.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: width * 0.06,
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: height * 0.03)),
                Container(
                  child: AutoSizeText(// 문제 내용이 들어가는 위젯. 문자 크기가 자동으로 조정될 수 있음
                    widget.quiz.question,
                    textAlign: TextAlign.center,
                    maxLines: 7,
                    style: TextStyle(
                      fontSize: width * 0.036,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(child: Container()),// 이후의 내용을 아래쪽부터 정렬되도록 함
                ElevatedButton(
                  child: Text(
                    '정답 보기',
                    style: TextStyle(
                      fontSize: width * 0.05,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.amber[600],
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    padding: EdgeInsets.fromLTRB(width * 0.22, height * 0.03, width *0.22, height * 0.03),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SolutionScreen(
                          quiz: widget.quiz,
                        ),
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