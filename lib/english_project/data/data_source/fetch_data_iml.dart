import 'dart:async';
import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:learnning_model_project/english_project/data/data_source/fetch_data.dart';
import 'package:learnning_model_project/english_project/data/models/questions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';

class SetDefault implements FetchData {
  @override
  Future<List<Question>> getQuestion() {
    return _loadData();
  }

// SetDefault(List<Question> question) {
//   question = _loadData();
//   return _loadData();
// }
}

class SetRanDom implements FetchData {
  @override
  Future<List<Question>> getQuestion() async {
    final List<Question> questionList = await _loadData();
    return questionList..shuffle();
  }

// SetRanDom(List<Question> questionList) {
//   final List<Question> _list = questionList;
//   var lengthList = questionList.length;
//   questionList.clear();
//   return questionList..add(_list[Random().nextInt(lengthList)]);
// }
}

class AppSetting {
  AppSetting._();
  static final AppSetting instance = AppSetting._();

  void saveQuestionSetting(int value) {
    // dung share pref de luu
  }

  int getQuestionSetting() {
    // dung share pref de lay
    return 0;
  }
}

Future<List<Question>> _loadData() async {
  final prefs = await SharedPreferences.getInstance();

  final json = jsonDecode(prefs.get(Constants.question)!.toString());
  return (json as List).map((e) => Question.fromJson(e as Map<String, dynamic>)).toList();
}
