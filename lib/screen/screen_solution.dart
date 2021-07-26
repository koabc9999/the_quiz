import 'package:flutter/material.dart';
import 'package:the_quiz/screen/screen_home.dart';
import 'package:the_quiz/model/model_quiz.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SolutionScreen extends StatefulWidget {
  Quiz quiz;
  SolutionScreen({this.quiz});

  _SolutionScreenState createState()=> _SolutionScreenState();
}

class _SolutionScreenState extends State<SolutionScreen> {
  bool isChanged = false;// 추천 혹은 비추천을 누른적이 있는지 여부
  Color upColor = Colors.black;// 추천 아이콘의 색을 저장할 변수
  Color downColor = Colors.black;// 비추천 아이콘의 색을 저장할 변수

  _thumbUp() async {// http 통신을 통해서 현재 퀴즈 인스턴스의 up 변수의 값을 1 올린 후 update 해주는 메소드
    setState(() {
      isChanged = true;// 추천, 비추천에 변화가 있었음을 저장하는 변수
      widget.quiz.up++;// quiz 인스턴스의 up 값을 setState를 이용해서 1 올려준다
      upColor = Colors.blue;
    });

    var url = Uri.parse("https://the-quiz-backend.herokuapp.com/quiz/update-quiz/" + widget.quiz.index.toString() + "/");// 변경된 데이터를 서버에 적용하기 위한 코드 시작
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json; charset=utf-8"},
      body: json.encode({
        "index": widget.quiz.index.toString(),
        "title": widget.quiz.title,
        "question": widget.quiz.question,
        "solution": widget.quiz.solution,
        "up": widget.quiz.up.toString(),
        "down": widget.quiz.down.toString(),
      })
    );
  }
  _thumbDown() async {
    setState(() {
      isChanged = true;
      widget.quiz.down++;
      downColor = Colors.blue;
    });

    var url = Uri.parse("https://the-quiz-backend.herokuapp.com/quiz/update-quiz/" + widget.quiz.index.toString() + "/");// 변경된 데이터를 서버에 적용하는 부분
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json; charset=utf-8"},
      body: json.encode({
        "index": widget.quiz.index,
        "title": widget.quiz.title,
        "question": widget.quiz.question,
        "solution": widget.quiz.solution,
        "up": widget.quiz.up.toString(),
        "down": widget.quiz.down.toString()
      })
    );
  }

  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;// 화면 크기를 담는 변수
    double width = screenSize.width;
    double height = screenSize.height;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('정답'),
          backgroundColor: Colors.amber[600],
        ),
        body: Center(
          child: Container(// 내용들을 담아줄 박스 모양의 컨테이너
            decoration: BoxDecoration(// 박스 모양을 갖도록 해줌
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.black),// 박스 테두리에 색을 넣어줌
              color: Colors.yellow,
            ),
            width: width * 0.9,// 박스가 화면의 특정 비율을 차지하도록 함
            height: height * 0.78,

            child: Column(// 내부의 내용이 세로로 정렬되도록 함
              children: <Widget>[// 여러개의 위젯들을 넣을 수 있게 해줌
                Padding(padding: EdgeInsets.only(top: height * 0.03)),
                Container(
                  child: Text(
                    '#' + widget.quiz.index.toString() + '. ' + widget.quiz.title + ' 정답',
                    style: TextStyle(
                      fontSize: width * 0.06,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: height * 0.03)),
                Container(
                  child: AutoSizeText(
                    widget.quiz.solution,
                    textAlign: TextAlign.center,
                    maxLines: 7,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: width * 0.06,
                    )
                  ),
                ),

                Expanded(child: Container()),// 이후의 위젯들이 하단에 붙어서 생성됨

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.thumb_up),
                      iconSize: width * 0.1,
                      color: upColor,
                      onPressed: () {
                        if(isChanged == false) {// 한번도 변경되지 않았을 때
                          _thumbUp();// 추천을 눌렀을 때 일어나는 상황
                        }
                      },
                    ),
                    Text(
                      widget.quiz.up.toString(),
                      style: TextStyle(
                        color: upColor,
                        fontSize: width * 0.05,
                        fontWeight: FontWeight.bold,
                      )
                    ),
                    Padding(padding: EdgeInsets.fromLTRB(width * 0.05, 0, width * 0.05, 0)),
                    IconButton(
                      icon: Icon(Icons.thumb_down),
                      iconSize: width * 0.1,
                      color: downColor,
                      onPressed: () {
                        if(isChanged == false) {
                          _thumbDown();// 비추천을 눌렀을 때 일어나는 액션
                        }
                      },
                    ),
                    Text(
                      widget.quiz.down.toString(),
                      style: TextStyle(
                        color: downColor,
                        fontSize: width * 0.05,
                        fontWeight: FontWeight.bold,
                      )
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: height * 0.02)),

                ElevatedButton(
                  child: Text(
                    '홈으로 돌아가기',
                    style: TextStyle(
                      fontSize: width * 0.05,
                      fontWeight: FontWeight.bold,
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
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                ),
                Padding(padding: EdgeInsets.only(top: height * 0.035)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}