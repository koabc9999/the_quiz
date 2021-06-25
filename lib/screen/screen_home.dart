import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            Center(
              child: Image.asset(
                'images/pepe.jpg',// 픽셀이 깨지는걸 방지해서 본래 크기보다 이미지가 커지지는 않고 차지하는 범위가 늘어남
                width: width * 0.8,
                height: height * 0.4,
              ),
            ),
            Text(
              '퀴즈 앱 홈',
              style: TextStyle(
                fontSize: width * 0.065,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton(// RaisedButton에서 ElevatedButton으로 넘어옴
              style: ElevatedButton.styleFrom(// 새로운 버튼 위젯의 스타일 사용방법
                primary: Colors.amber[600],
              ),
              
              onPressed: () => {},
              child: Text('문제 풀기'),
            ),
          ]
        )
      ),
    );
  }
}