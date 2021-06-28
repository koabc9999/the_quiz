import 'package:flutter/material.dart';
import 'package:the_quiz/model/model_quiz.dart';
import 'package:the_quiz/screen/screen_question.dart';

class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Quiz quiz = Quiz.fromMap({// map 형식의 데이터를 받아서 Quiz타입 변수에 넣어주는 부분
    'index': 1,
    'title': '스위치 - 전구',
    'question': '스위치 3개가 다른 방의 전구 3개와 각각 연결되어 있다.\n 스위치는 ON/OFF 조작을 자유롭게 할 수 있으며 초기에는 꺼져있다.\n 단 한 번만 다른 방으로 이동해서 전구의 상태를 확인할 수 있다고 할 때 각각의 스위치가 연결된 전구를 알아낼 수 있는 방법을 구하시오.',
    'solution': '정답이 들어가는 부분입니다.',
    'up': 0,
    'down': 0
  });


  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double height = screenSize.height;// 활용할 화면 크기를 담은 변수
    double width = screenSize.width;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('The Quiz App'),
          backgroundColor: Colors.amber[600],
          leading: Container(),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: height * 0.07),// .all 메소드를 사용하면 4방향에 여백이 넣어져서 여백이 2배가 됨
            ),
            Center(
              child: Image.asset(
                'images/pepe.jpg',// 픽셀이 깨지는걸 방지해서 본래 크기보다 이미지가 커지지는 않고 차지하는 범위가 늘어남
                width: width * 0.8,
                height: height * 0.4,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: height * 0.02)),
            Text(
              '퀴즈 앱 홈',
              style: TextStyle(
                fontSize: width * 0.065,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: height * 0.03)),
            ElevatedButton(// RaisedButton에서 ElevatedButton으로 넘어옴
              child: Text(
                '문제  풀기',
                style: TextStyle(
                  fontSize: width * 0.06,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(// 새로운 버튼 위젯의 스타일 사용방법
                primary: Colors.amber[600],
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                padding: EdgeInsets.fromLTRB(width * 0.22, height * 0.03, width * 0.22, height * 0.03),
              ),
              onPressed: () {// 문제 풀기 버튼이 눌렸으 때 실행되는 내용
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuestionScreen(
                      quiz: quiz,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}