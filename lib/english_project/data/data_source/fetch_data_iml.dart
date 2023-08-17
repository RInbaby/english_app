import 'dart:math';

import 'package:learnning_model_project/english_project/data/data_source/fetch_data.dart';
import 'package:learnning_model_project/english_project/data/models/questions.dart';

class SetDefault implements FetchData {
  @override
  List<Question> getQuestion(List<Question> questionList) {
    return questionList;
  }
}

class SetRanDom implements FetchData {
  @override
  List<Question> getQuestion(List<Question> questionList) {
    final List<Question> _list = questionList;
    var lengthList = questionList.length;
    questionList.clear();
    return questionList..add(_list[Random().nextInt(lengthList)]);
  }
}

class SaveSetting implements FetchData {
  @override
  List<Question> getQuestion(List<Question> questionList) {
    // TODO: implement getQuestion
    throw UnimplementedError();
  }
}
