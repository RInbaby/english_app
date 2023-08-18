import 'package:learnning_model_project/english_project/data/models/questions.dart';

abstract class FetchData {
  Future<List<Question>> getQuestion();
}
