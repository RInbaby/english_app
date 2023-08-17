import 'dart:convert';
import 'dart:math';

import 'package:learnning_model_project/english_project/data/data_source/fetch_data.dart';
import 'package:learnning_model_project/english_project/data/models/questions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';

class SetDefault implements FetchData {
  @override
  List<Question> getQuestion;

  SetDefault(List<Question> question) {
    question = _loadData();
    return _loadData();
  }
}

class SetRanDom implements FetchData {
  @override
  List<Question> getQuestion;

  SetRanDom(List<Question> questionList) {
    final List<Question> _list = questionList;
    var lengthList = questionList.length;
    questionList.clear();
    return questionList..add(_list[Random().nextInt(lengthList)]);
  }
}

class SaveSetting implements FetchData {
  @override
  List<Question> getQuestion;
}

Future<List<Question>> _loadData() async {
  final prefs = await SharedPreferences.getInstance();

  final json = jsonDecode(prefs.get(Constants.question)!.toString());
  return (json as List).map((e) => Question.fromJson(e as Map<String, dynamic>)).toList();
}
