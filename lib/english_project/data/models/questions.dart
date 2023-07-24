import 'dart:convert';

class Question {
  int id;
  String question;
  List<String> answers;
  num correctIndex;

  Question({required this.id,required this.question, required this.answers, required this.correctIndex});

  Question.fromJson(Map<String, dynamic> json)
      : question = json['question'] as String,
        answers = (json['answers'] as List).map((e) => e.toString()).toList(),
        correctIndex = json['correctIndex'],
        id = json['id'] as int;

  Map<String, dynamic> toJson() => {
        "question": question,
        "answers": answers,
        "correctIndex": correctIndex,
        "id": id,
      };

  static List<Question> decode(String musics) =>
      (json.decode(musics) as List<dynamic>).map<Question>((item) => Question.fromJson(item)).toList();
}
