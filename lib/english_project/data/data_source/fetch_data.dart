import 'package:learnning_model_project/english_project/data/models/questions.dart';

abstract class FetchData {
  List<Question> getQuestion(List<Question> questionList);
}
