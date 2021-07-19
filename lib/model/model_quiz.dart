class Quiz {
  int index;// 문제 번호
  String title;// 문제의 제목
  String question;// 문제의 내용
  String solution;// 문제의 정답
  int up, down;// 추천과 비추천

  Quiz({this.index, this.title, this.question, this.solution, this.up, this.down});// 퀴즈 인스턴스를 생성해줄 때 초기화 해줄 생성자

  Quiz.fromMap(Map<String, dynamic> map)// map 형식의 데이터를 넘겨받아 quiz를 생성해주며 초기화 하는 메소드
    : index = map['index'],// 초기화 해주는 부분이기 때문에 Quiz의 인스턴스의 index 부분에 전달받은 데이터의 map 중에서 index를 찾아서 넣어줌
      title = map['title'],// 맵의 형식은 앞부분은 대부분 String 이지만 뒷 부분은 달라지기 때문데 Map<String, dynamic>을 사용함 다 같다면 dynamic이 아니여도 될 수 있음
      question = map['question'],
      solution = map['solution'],
      up = map['up'],
      down = map['down'];

  Quiz.fromJson(Map<String, dynamic> json)// 인자로 넘겨준 json 데이터 형식을 변환해서(내장 json 기능 사용) Dart의 Quiz 클래스 데이터 형식으로 변경
    : index = json['index'],
      title = json['title'],
      question = json['question'],
      solution = json['solution'],
      up = json['up'],
      down = json['down'];
}