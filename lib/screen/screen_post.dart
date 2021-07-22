import 'package:flutter/material.dart';
import 'package:the_quiz/model/model_quiz.dart';
import 'package:the_quiz/screen/screen_home.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PostScreen extends StatefulWidget {
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  List<Quiz> quizs;
  Quiz latestQuiz;// 가장 나중에 추가된 퀴즈를 담는 변수
  Quiz postQuiz;// 서버에 추가해줄 데이터를 담을 변수

  final titleController = TextEditingController();// TextField의 내용에 접근할 수 있도록 해주는 컨트롤러
  final questionController = TextEditingController();
  final solutionController = TextEditingController();

  _getLatest() async {//일단 먼저 가장 나중에 추가된 퀴즈의 index를 알기 위해서 실행되는 함수
    var url = Uri.parse("https://the-quiz-backend.herokuapp.com/quiz/get-latest/");
    final response = await http.get(url);
    
    if(response.statusCode == 200) {// byte 단위로된 데이터를 무사히 서버에서 받아 왔다면
      setState(() {
        latestQuiz = Quiz.fromJson(json.decode(response.body));// dart convert 내부에 들어있는 utf instance를 사용했음
      });
    }
  }
  _postQuiz() async {
    var url = Uri.parse("https://the-quiz-backend.herokuapp.com/quiz/post-quiz/");
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json; charset=utf-8'},// media type error가 나지 않도록 어떤 타입의 데이터인지 명시해줘야함
      body: json.encode({
        "index": latestQuiz.index + 1,
        "title": titleController.text,
        "question": questionController.text,
        "solution": solutionController.text,
        "up": 0,
        "down": 0
      })
    );
    print(response.statusCode);
    print((latestQuiz.index + 1).toString() + titleController.text + " " + questionController.text);
  }

  Widget build(BuildContext build) {
    Size screenSize = MediaQuery.of(context).size;
    double height = screenSize.height;
    double width = screenSize.width;
    
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,// 하단에서 올라오는 키보드로 인한 overflow 예방
        appBar: AppBar(
          title: Text("문제 추가하기"),
          backgroundColor: Colors.amber[600],
        ),

        body: Padding(// 이런 방법으로 테두리에 여백을 줄 수 있고 Container 위젯의 margin 속성을 이용할 수도 있음
          padding: EdgeInsets.all(width * 0.03),
          child: Center(
            child: Column(
              children: <Widget>[
                TextField(
                  controller: titleController,// titleController.text로 textField의 데이터에 접근할 수 있게 해줌
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "제목",
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: height * 0.03)),
                TextField(
                  controller: questionController,// 컨트롤러 설정
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "문제",
                  ),
                  maxLines: 10,
                ),
                Padding(padding: EdgeInsets.only(top: height * 0.03)),
                TextField(
                  controller: solutionController,// 컨트롤러 설정
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "정답",
                  ),
                  maxLines: 10,
                ),
                Padding(padding: EdgeInsets.only(top: height * 0.03)),
                ElevatedButton(
                  child: Text(
                    "추가하기",
                    style: TextStyle(
                      fontSize: width * 0.05,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.amber[600],

                    padding: EdgeInsets.fromLTRB(width * 0.24, height * 0.028, width * 0.24, height * 0.028),
                  ),
                  onPressed: () {// 데이터를 미리 읽어두면 그 사이에 다른 데이터가 추가되면 index가 꼬일 확률이 높기 때문에 추가하기 직전에 index를 확인해줌
                    _getLatest();// 서버에서 제일 나중에 추가된 데이터를 읽어오면서 latestQuiz 변수에 넣어줬음
                    _postQuiz();// 새로 작성된 데이터를 서버에 추가해주는 코드. textField가 비어있는 케이스도 핸들 해주어야함
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}