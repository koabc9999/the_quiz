import 'package:flutter/material.dart';
import 'package:the_quiz/screen/screen_home.dart';
import 'package:the_quiz/model/model_quiz.dart';
import 'package:auto_size_text/auto_size_text.dart';

class SolutionScreen extends StatefulWidget {
  Quiz quiz;
  SolutionScreen({this.quiz});

  _SolutionScreenState createState()=> _SolutionScreenState();
}

class _SolutionScreenState extends State<SolutionScreen> {
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
                      iconSize: width * 0.08,
                      onPressed: () {

                      },
                    ),
                    Text(
                      widget.quiz.up.toString(),
                      style: TextStyle(
                        fontSize: width * 0.03,
                        fontWeight: FontWeight.bold,
                      )
                    ),
                    Padding(padding: EdgeInsets.fromLTRB(width * 0.05, 0, width * 0.05, 0)),
                    IconButton(
                      icon: Icon(Icons.thumb_down),
                      iconSize: width * 0.08,
                      onPressed: () {

                      },
                    ),
                    Text(
                      widget.quiz.down.toString(),
                      style: TextStyle(
                        fontSize: width * 0.03,
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