import 'dart:convert';

import 'package:learnning_model_project/english_project/data/data_source/fetch_data.dart';
import 'package:learnning_model_project/english_project/data/data_source/fetch_data_iml.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/questions.dart';

enum SettingQuestion { defaultList, randomList }

extension SettingQuestionExt on SettingQuestion {
  String get nameDisplay {
    switch (this) {
      case SettingQuestion.defaultList:
        return "Mặc định";
      case SettingQuestion.randomList:
        return "Sắp xếp theo độ khó";
    }
  }

  int get getId {
    switch (this) {
      case SettingQuestion.defaultList:
        return 0;
      case SettingQuestion.randomList:
        return 1;
    }
  }

  FetchData get fetchData {
    switch (this) {
      case SettingQuestion.defaultList:
        return SetDefault();
      case SettingQuestion.randomList:
        return SetRanDom();
    }
  }

  static SettingQuestion getSettingFromValue(int value) {
    switch (value) {
      case 0:
        return SettingQuestion.defaultList;
      case 1:
        return SettingQuestion.randomList;
      default:
        return SettingQuestion.defaultList;
    }
  }
}
