import 'dart:convert';
import 'model_quiz.dart';// flutter/~ 형식이 아닌 이유는 모름

List<Quiz> parseQuizs(String responseBody) {// api 통신으로 전달받은 String 타입의 데이터를 넘겨주면
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();// Map 형식으로 cast 해준 뒤
  return parsed.map<Quiz>((json) => Quiz.fromJson(json)).toList();// Map 형식의 데이터를 .map 메소드가 가지고 있는 json 데이터 타입을 이용해서 Quiz 인스턴스들의 List로 변환해줌
}