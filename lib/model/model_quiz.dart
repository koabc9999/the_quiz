class Quiz {
  int index;// 문제 번호
  String title;// 문제의 제목
  String question;// 문제의 내용
  String solution;// 문제의 정답
  int up, down;// 추천과 비추천

  Quiz({this.index, this.title, this.question, this.solution, this.up, this.down});// 퀴즈 인스턴스를 생성해줄 때 초기화 해줄 생성자

  Quiz.fromMap(Map<String, dynamic> map)// map 형식의 데이터를 넘겨받아 quiz를 생성해주며 초기화 하는 메소드
    : index = map['index'],
      title = map['title'],
      question = map['question'],
      solution = map['solution'],
      up = map['up'],
      down = map['down'];
}