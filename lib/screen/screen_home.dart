// 앱의 메인 화면을 담당하는 파일
import 'package:flutter/material.dart';
import 'package:the_quiz/model/model_quiz.dart';
import 'package:the_quiz/model/api_adapter.dart';
import 'package:the_quiz/screen/screen_question.dart';
import 'package:the_quiz/screen/screen_post.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();// 스낵바를 꺼내기 위해서 필요한 글로벌 키 변수

  List<Quiz> quizs = [];// Quiz를 형식으로 가지는 List 변수를 선언해줌
  Quiz firstQuiz;
  bool isLoading = false;

  _fetchQuizs() async {
    var url = Uri.parse('https://the-quiz-backend.herokuapp.com/quiz/1/');// Uri.parse 메소드를 사용해서 String 데이터를 Uri 타입으로 바꿔줌
    final response = await http.get(url);
    if(response.statusCode == 200) {// 통신이 문제없이 잘 완료돼었을 경우
      setState(() {
        quizs = parseQuizs(utf8.decode(response.bodyBytes));// response.bodyBytes 메소드로 받은 데이터를 String형식으로 parseQuizs 메소드로 넣어줌
        firstQuiz = quizs[0];// 전달받아서 만들어낸 List<Quiz>에서 0번째 데이터를 별도의 변수에 넣어줌
      });
    } else {
      throw Exception('failed to load data');
    }
  }

  // _postQuiz() async {// 데이터를 서버에 post 해주는 함수
  //   setState(() {
  //     isLoading = true;
  //   });
  //   var url = Uri.parse('https://the-quiz-backend.herokuapp.com/quiz/post-quiz/');
  //   final response = await http.post(url,
  //     body: jsonEncode({// body 부분은 json 형태여야 함으로 dart:convert의 jsonEncode 함수를 사용해서 바꾸어줌
  //       "index": 77,
  //       "title": "flutter titlie",
  //       "question": "flutter question",
  //       "solution": "flutter solution",
  //       "up": 4,
  //       "down": 9
  //     }),
  //     headers: {"Content-Type": "application/json"},
  //   );
  // }

  // Quiz quiz = Quiz.fromMap({// map 형식의 데이터를 받아서 Quiz타입 변수에 넣어주는 부분
  //   'index': 1,
  //   'title': '스위치 - 전구',
  //   'question': ' 스위치 3개가 다른 방의 전구 3개와 각각 연결되어 있다.\n 스위치는 ON/OFF 조작을 자유롭게 할 수 있으며 초기에는 꺼져있다.\n 단 한 번만 다른 방으로 이동해서 전구의 상태를 확인할 수 있다고 할 때 각각의 스위치가 연결된 전구를 알아낼 수 있는 방법을 구하시오.',
  //   'solution': ' 첫 번째 스위치는 켜고 두 번째 스위치는 끈다.\n 세 번째 스위치는 켜고 충분히 기다린 뒤 끈다.\n 그리고 다른 방으로 이동하면 켜져 있는 전구는 첫 번째 스위치와 연결된 것을 알 수 있다.\n 꺼져있는 두 개의 전구는 뜨거운 정도로 구분할 수 있다. 꺼져있지만 뜨거운 전구가 세 번째 스위치와 연결된 전구이다.',
  //   'up': 0,
  //   'down': 0
  // });
  /*
    줄 세우기",
    "임의의 수의 사람들이 2가지 색 중 하나의 색의 모자를 쓰고 있다.\\n 사람들은 자신이 어떤 색의 모자를 쓰고 있는지 알 수 없다.\\n 다른 사람의 모자 색에 대해서 말해주거나 어떠한 신호도 주고받을 수 없다.\\n 사람들은 두 가지 색이 섞이지 않도록 하면서 한 줄로 서야 한다.\\n 사람의 수, 모자 색의 비율에 상관없이 늘 올바른 줄을 설 수 있는 전략을 구하시오.",
    "한 명씩 줄에 추가되면서 2가지 규칙을 따르면 된다.\\n 줄에 합류하는데 한 가지 색상만 줄에 존재할 경우에는 한쪽 끝으로 가서 줄에 합류한다.\\n 두 가지 색이 존재할 경우에는 그 경계 사이로 가서 합류한다.\\n 이 방법대로 한 명씩 차례대로 줄을 서면 자신의 모자 색을 몰라도 두 가지 색이 섞이지 않고 줄을 설 수 있다."
  */


  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double height = screenSize.height;// 활용할 화면 크기를 담은 변수
    double width = screenSize.width;

    return WillPopScope(
      onWillPop: () async => false,// 안드로이드가 지원하는 뒤로가기 버튼을 끔
      child: SafeArea(
        child: Scaffold(
          key: _scaffoldKey,// 스낵바 사용을 위해서 스캐폴드의 key 속성을 넣어줌
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
                  'images/cat.jpg',// 픽셀이 깨지는걸 방지해서 본래 크기보다 이미지가 커지지는 않고 차지하는 범위가 늘어남
                  width: width * 0.92,
                  height: height * 0.35,
                ),
              ),
              Padding(padding: EdgeInsets.only(top: height * 0.02)),
              Text(
                '퀴즈 앱 홈',
                style: TextStyle(
                  fontSize: width * 0.075,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(padding: EdgeInsets.only(top: height * 0.03)),
              ElevatedButton(// RaisedButton에서 ElevatedButton으로 넘어옴
                child: Text(
                  '문제  풀기',
                  style: TextStyle(
                    fontSize: width * 0.05,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(// 새로운 버튼 위젯의 스타일 사용방법
                  primary: Colors.amber[600],
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  padding: EdgeInsets.fromLTRB(width * 0.22, height * 0.03, width * 0.22, height * 0.03),
                ),
                onPressed: () {// 문제 풀기 버튼이 눌렸으 때 실행되는 내용
                  _scaffoldKey.currentState.showSnackBar(// fetchQuizs 함수가 실행이 완료돼서 화면이 전환되기 전까지 화면의 아래에 새 스낵바를 띄워서 보여주도록 함
                    SnackBar(
                      content: Row(// 위젯들이 가로로 정렬될 수 있도록 하는 컨테이너
                        children: <Widget>[
                          CircularProgressIndicator(),// 빙글빙글 도는 위젯
                          Padding(padding: EdgeInsets.only(left: width * 0.036)),
                          Text("서버를 깨우는 중입니다!"),
                        ],
                      ),
                    ),
                  );
                  _fetchQuizs().whenComplete(() {
                    return Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuestionScreen(
                          quiz: firstQuiz,
                        ),
                      ),
                    );
                  });
                },
              ),

              Padding(padding: EdgeInsets.only(top: height * 0.035)),

              ElevatedButton(//문제를 추가하기 위한 화면으로 전환하는 버튼. 전체 오브젝트 수를 알기 위해서 GET의 필요성이 생김
                child: Text(
                  '문제 추가',
                  style: TextStyle(
                    fontSize: width * 0.05,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.amber[600],
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  padding: EdgeInsets.fromLTRB(width * 0.22, height * 0.03, width * 0.22, height * 0.03),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PostScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}